var Template = function(input) {
    // この関数を実装してください
	this.allGetInput = new Array();
	var getInput = new Array();
	for(keys in input){
		getInput = input[keys].split("\n");
		this.allGetInput[keys] = getInput;
	}
};

Template.prototype = {
    render: function(variables) {
	// この関数を実装してください
	//改良点・・・画像を表示できるようにしました。
	//複数の記事（配列）が来られても大丈夫なようにしました。
	//あと直接関係ないですがレイアウトをちょっとだけ変えました。
		var dispStr = "";
		for(m_keys in variables){//1
			for(array_keys in this.allGetInput){
				for(var i = 0; i<this.allGetInput[array_keys].length; i++){
					if(this.allGetInput[array_keys][i].match(/{%\s/) && this.allGetInput[array_keys][i].match(/\s%}/)){
							for(keys in variables[m_keys]){//2
								var tagNames = "{%"+' '+keys+' '+"%}";
								var reg = new RegExp(tagNames,'gi');
								if(this.allGetInput[array_keys][i].match(tagNames)){
									var getValue = variables[m_keys][keys];
                              		getValue = getValue.replace('&',"&amp");
                              		getValue = getValue.replace('<',"&lt;");
                              		getValue = getValue.replace('>',"&gt;");
                              		getValue = getValue.replace('"',"&quot");
                              		getValue = getValue.replace("'","&#39");
									if(keys == "img"){//画像だったら
										dispStr += this.allGetInput[array_keys][i].replace(reg,"<img class='img' src='img/"+getValue+"'></img>");
									}else{//テキストのみ
										dispStr += this.allGetInput[array_keys][i].replace(reg,getValue);
									}
								}
							}
					}else{
						dispStr += this.allGetInput[array_keys][i];
					}
				}
    		}
		}
		return dispStr;
	}
};
