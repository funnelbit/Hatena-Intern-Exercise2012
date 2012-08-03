use strict;
use warnings;

use Test::More;
use FindBin::libs;
use_ok 'TemplateEngine';

my $template = TemplateEngine->new( file => '../templates/main.html' );
isa_ok $template, 'TemplateEngine';

my $expected = <<'HTML';
<html>
  <head>
    <title>タイトル</title>
  </head>
  <body>
    <p>これはコンテンツです。&amp;&lt;&gt;&quot;</p>
  </body>
</html>

HTML

chomp $expected;

#my $get = $template->render({
#      title   => 'title',
#      content => 'come&<>"',
# }); 
#chomp $get;
#print "\n";
#print $get;
#if($expected eq $get){
#	print "yes ok equase";
#}else{
#	print "not equase";
#}
cmp_ok $template->render({
    title   => 'タイトル',
    content => 'これはコンテンツです。&<>"',
}), 'eq', $expected; 

done_testing();
