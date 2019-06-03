	var xmlHttp;
	//获取用户输入的关联信息的函数
	function getMoreContens() {
		//获取用户输入
		var content = document.getElementById("keyWords").value;
		if (content == "") {
			clearContent();
			return;
		}
		xmlHttp = createXmlHttp();
		//给服务器发送数据
		var url = "/view/shuaxin?keyword=" + encodeURI(content);
		xmlHttp.open("GET", url, true);
		xmlHttp.onreadystatechange = //回调函数
		function callback() {
			if (xmlHttp.readyState == 4) {
				if (xmlHttp.status == 200) {
					var result = decodeURIComponent(xmlHttp.responseText);
					var json = eval("(" + result + ")");
					clearContent(json);
					intelliSense(json);
				}
			}
		};
		/*
		    xmlhttp的send是传递参数用的,但是只有在使用post方式提交请求的时候才有用
		    如下:
		    xmlhttp.open("post",url,true); 
		    ...
		    xmlhttp.send("data=data&data2=data2");
		     
		    用get的话一般就是：
		    xmlhttp.open("get",url,true); 
		    ...
		    xmlhttp.send(null);
		 */
		xmlHttp.send(null);
	}

	//创建XMLHttpRequest
	function createXmlHttp() {
		var xmlHttp;
		if (window.XMLHttpRequest) {
			xmlHttp = new XMLHttpRequest();
			//兼容某些Mozilla浏览器的响应头，强制设置为text/xml，具体参看：http://www.cnblogs.com/perseverancevictory/p/3690769.html
			if (xmlHttp.overrideMimeType) {
				xmlHttp.overrideMimeType("text/xml");
			}
		}
		//兼容IE
		else if (window.ActiveXObject) {
			xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
			if (!xmlHttp) {
				xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
			}
		}
		return xmlHttp;
	}

	function clearContent() {
		var contentTableBody = document.getElementById("content_table_body");
		var size = contentTableBody.childNodes.length;
		for (var i = size - 1; i > 0; i--) {
			contentTableBody.removeChild(contentTableBody.childNodes[i]);
		}
	}
	function intelliSense(json) {
		//获取关联数据的长度
		var size = json.length;
		for (var i = 0; i < size; i++) {
			var nextNode = json[i];
			var tr = document.createElement("tr");
			var td = document.createElement("td");
			tr.setAttribute("border", "0");
			tr.setAttribute("bgcolor", "#FFFFFF");
			td.setAttribute("width", "272px");
			td.onmouseover = function() {
				this.className = 'mouseOver';
			}
			td.onmouseout = function() {
				this.className = 'mouseOut';
			}
			td.onclick = function() {
				document.getElementById("keyWords").value = this.innerText;
			}
			var text = document.createTextNode(nextNode);
			td.appendChild(text);
			tr.appendChild(td);
			document.getElementById("content_table_body").appendChild(tr);
		}
	}