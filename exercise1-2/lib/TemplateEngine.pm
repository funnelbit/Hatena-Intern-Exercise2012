package TemplateEngine;
use strict;
use warnings;
#use Cwd;
use IO::File;
use Data::Dumper;
use FindBin::libs;
#use utf8;
our $path = "";
our $mainPath = "";
binmode STDIN,  ":utf8";
binmode STDOUT, ":utf8";
sub new{
	my $this = shift;
	my %arg = @_;
	my ($getPath,$getContentPath) = @arg{'main_file','content_file'};
	$path =  "$FindBin::RealBin/".$getContentPath;
	$mainPath = "$FindBin::RealBin/".$getPath;
	return $this;
}
#画像を表示できるようにしました
#main.htmlにcontent.htmlを入れるようにしました。そのため、TemplateEngineを呼び出す引数のハッシュは２つになりました
#content.htmlは、複数の値がこられても大丈夫にしました
sub render{
	my $this = shift;
	return &mainLoader(&contentLoader(@_));
}
#content.htmlを読み込んで値を置き換えるサブルーチン
sub contentLoader{
	my $allContentStrings;
	my $count = 0;
	my @allContentArray = @_;
	for my $i(@allContentArray){
	my $io = IO::File->new();
    $io->open($path , 'r') or die $!;
	while(not $io->eof){
		my $line = $io->getline;
		if($line =~ /{%.*%}/){
			for my $keys (keys %{$i}){
				if($line =~ /{% $keys %}/){
					my $valueStr = ${$allContentArray[$count]}{$keys};
					$valueStr =~ s/&/&amp;/go;
					$valueStr =~ s/</&lt;/go;
					$valueStr =~ s/>/&gt;/go;
					$valueStr =~ s/"/&quot;/go;
					$valueStr =~ s/'/&#39;/go;
					if($line =~ /{% img %}/){
						$line =~ s/{% img %}/<img class='content_img' src='$valueStr'><\/img>/;
					}
					$line =~ s/{% $keys %}/$valueStr/;
				}
			}
			$allContentStrings = $allContentStrings.$line;
		}else{
			$allContentStrings = $allContentStrings.$line;
		}
	}
    $io->close;
	$count++;
	}
	return $allContentStrings;
}
#main.htmlを読み込んでコンテンツを配置するサブルーチン
sub mainLoader{
	#main_file
	my ($allContentStrings) = @_;
	my $mainString = "";
	my $io_Main = IO::File->new();
	$io_Main->open($mainPath , 'r') or die $!;
	while(not $io_Main->eof){
		my $mainLine = $io_Main->getline;
		if($mainLine =~ /{% input_content %}/){
			$mainLine =~ s/{% input_content %}/$allContentStrings/go;	
		}
		$mainString = $mainString.$mainLine;
	}
	$io_Main->close;
	return $mainString;
}
1;
