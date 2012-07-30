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
		var dispStr = "";
		for(array_keys in this.allGetInput){
			for(var i = 0; i<this.allGetInput[array_keys].length; i++){
				if(this.allGetInput[array_keys][i].match(/{%\s/) && this.allGetInput[array_keys][i].match(/\s%}/)){
					for(keys in variables){
						var tagNames = "{%"+' '+keys+' '+"%}";
						var reg = new RegExp(tagNames,'gi');
						if(this.allGetInput[array_keys][i].match(tagNames)){
							var getValue = variables[keys];
							getValue = getValue.replace('&',"&amp");
							getValue = getValue.replace('<',"&lt;");
							getValue = getValue.replace('>',"&gt;");
							getValue = getValue.replace('"',"&quot");
							getValue = getValue.replace("'","&#39");
							this.allGetInput[array_keys][i] = this.allGetInput[array_keys][i].replace(reg,getValue);
						}
					}
				}
				dispStr += this.allGetInput[array_keys][i];
			}
    	}
		return dispStr;
	}
};
