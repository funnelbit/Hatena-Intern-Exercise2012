var main = function() {

    var source = document.getElementById('template').innerHTML;
    var template = new Template({
        source: source,
    });

    document.getElementById('result').innerHTML = template.render({
		id_2012625:{
        	title: '6月25日の日記',
        	content: 'ランチを食べすぎました',
			img: '0987643uijhg.jpg'
		},
		id_2012624:{
        	title: '6月24日記',
        	content: 'uooooooooooooo負ける気がしねえええええええええ',
			img: 'DSC_0137.JPG'
		},
		id_2012623:{
        	title: '6月23日記',
        	content: 'くにのみやつこ。この響き好き。国造。'
		},
		id_2012622:{
        	title: '6月22日記',
        	content: '<script type="text/javascript">alert("わるいことしたい");</script>'
		}
    });
};

document.addEventListener('DOMContentLoaded', main);
