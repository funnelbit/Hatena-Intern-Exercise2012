package TemplateEngine;
use strict;
use warnings;
#use Cwd;
use IO::File;
#use Data::Dumper;
use FindBin::libs;
#use utf8;
our $path = "";
binmode STDIN,  ":utf8";
binmode STDOUT, ":utf8";
sub new{
	my $this = shift;
	my ($title,$getpath) = @_;
	$path =  "$FindBin::RealBin/".$getpath;
	return $this;
#
	#my ($class) = @_;
	#my $data_structure = {
	#	values => [],
	#};
	#my $self = bless $data_structure, $class;
	#return $self;

}
sub render{
	#my @allString;
	my $allStrings;
	my $ref_array = shift;
	my %hash = %{shift()};
	my @keys = keys %hash;
	my $io = IO::File->new();
    $io->open($path , 'r') or die $!;
	while(not $io->eof){
		my $line = $io->getline;
		if($line =~ /{%.*%}/){
			foreach my $keyStr (@keys){
				if($line =~ /{% $keyStr %}/){
					my $valueStr = $hash{$keyStr};
						$valueStr =~ s/&/&amp;/go;
						$valueStr =~ s/</&lt;/go;
						$valueStr =~ s/>/&gt;/go;
						$valueStr =~ s/"/&quot;/go;
						$valueStr =~ s/'/&#39;/go;
					$line =~ s/{% $keyStr %}/$valueStr/;
				}
			}
		}
		#push @allString, $line;
		$allStrings = $allStrings.$line;
	}
    $io->close;
	#return @allString;#配列じゃテスト通らない
	return $allStrings;
}
1;
