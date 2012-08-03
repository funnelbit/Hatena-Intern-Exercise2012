use strict;
use warnings;
use utf8;
use FindBin::libs;

use TemplateEngine;

my $template = TemplateEngine->new( main_file => 'templates/main.html' , content_file => 'templates/content.html');
my @allContentArray = (
	{
		title   => 'タイトル',
		content => 'これはコンテンツです',
		img => 'img/img0.jpg',},
	{
		title   => 'タsトル',
		content => 'これはコンンああああああああああああああああああああああああああああああああすがあああああああああああ',
		img => 'img/img0.jpg',},
	{
		title   => 'タsトル',
		content => 'これはコンン',
		img => 'img/img0.jpg',},
	{
		title   => 'タsトル',
		content => 'これはコンン',
		img => 'img/img0.jpg',},
	{
		title   => 'タsトル',
		content => 'これはコンン',
		img => 'img/img0.jpg',},
	{
		title   => 'タsトル',
		content => 'これはコンン',
		img => 'img/img0.jpg',},
	{
		title   => 'タsトル',
		content => 'これはコンン',
		img => 'img/img0.jpg',},
	{
		title   => 'タsトル',
		content => 'これはコンン',
		img => 'img/img0.jpg',},
	{	
		title   => 'タsトル',
		content => 'これはコンン',
		img => 'img/img0.jpg',},

);
print $template->render(@allContentArray); 
