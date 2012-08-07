use strict;
use warnings;

use Test::More;
use FindBin::libs;
use_ok 'TemplateEngine';

my $template = TemplateEngine->new( main_file => '../templates/main.html' , content_file => '../templates/content.html');
isa_ok $template, 'TemplateEngine';

my $expected = <<'HTML';
<html>
  <head>
	<meta charset="utf-8">
	<style>
	body{
		background:#f3f3f3;
		margin:0px;
	}
	#fundation{
		width:1000px;
		margin-left:auto;
		margin-right:auto;
	}
	.content_cell{
		float:left;
		width:240px;
		height:240px;
		text-align:center;
		border-radius:5px;
		background:#ffffff;
		margin-top:10px;
		margin-left:10px;
		box-shadow:0px 0px 5px 0px #aaaaaa;
		overflow:hidden;
	}
	.content_cell:hover{
		box-shadow:0px 0px 10px 3px #007bbb;
	}
	.content_title{
		width:100%;
		background:#262626;
		color:#ffffff;
		border-bottom:solid 1px #007bbb;
	}
	.content_img{
		max-width:240px;
		max-height:240px;
	}
	</style>
  </head>
  <body>
	<div id="fundation"><div class="content_cell">
	<div class="content_title">タイトル</div>
    <p>これはコンテンツです</p>
    <div><img class='content_img' src='img/img0.jpg'></img></div>
</div>
<div class="content_cell">
	<div class="content_title">タsトル</div>
    <p>これはコンンああああああああああああああああああああああああああああああああすがあああああああああああ</p>
    <div><img class='content_img' src='img/img0.jpg'></img></div>
</div>
<div class="content_cell">
	<div class="content_title">タsトル</div>
    <p>これはコンン</p>
    <div><img class='content_img' src='img/img0.jpg'></img></div>
</div>
<div class="content_cell">
	<div class="content_title">タsトル</div>
    <p>これはコンン</p>
    <div><img class='content_img' src='img/img0.jpg'></img></div>
</div>
<div class="content_cell">
	<div class="content_title">タsトル</div>
    <p>これはコンン</p>
    <div><img class='content_img' src='img/img0.jpg'></img></div>
</div>
<div class="content_cell">
	<div class="content_title">タsトル</div>
    <p>これはコンン</p>
    <div><img class='content_img' src='img/img0.jpg'></img></div>
</div>
<div class="content_cell">
	<div class="content_title">タsトル</div>
    <p>これはコンン</p>
    <div><img class='content_img' src='img/img0.jpg'></img></div>
</div>
<div class="content_cell">
	<div class="content_title">タsトル</div>
    <p>これはコンン</p>
    <div><img class='content_img' src='img/img0.jpg'></img></div>
</div>
<div class="content_cell">
	<div class="content_title">タsトル</div>
    <p>これはコンン</p>
    <div><img class='content_img' src='img/img0.jpg'></img></div>
</div>
</div>
  </body>
</html>

HTML

chomp $expected;

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

cmp_ok $template->render(@allContentArray), 'eq', $expected; 

done_testing();
