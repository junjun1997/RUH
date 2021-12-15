<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<div style="height: 100px;">
	
</div>

<div>
			식당 검색하기
</div>
<div>
	<input type="text" id="res" value=""/>
<div>
	<button type ="button"  onclick="setRes()"> 검색</button>
</div>
</div>
<table id="table">

</table>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript">
function setRes() {
	
	var doc = document.getElementById("res");
	var name = doc.value;
	alert(name);
	
	$.ajax({
		url: "selectres.do",
		data: {"title":name},
		method:"POST",
		dataType: "JSON",
		success: function(map) { //val은 db에서 select한 foodname
			var doc1 = document.getElementById("table");
		console.log(map["restlist"]);
			for (var i = 0; i < map["restlist"].length; i++) {
				var name=map["restlist"][i]["name"];
				var foodname=map["restlist"][i]["foodname"];
				var address=map["restlist"][i]["address"];
				var phone=map["restlist"][i]["phone"];

				var si=map["restlist"][i]["si"];
				var gu=map["restlist"][i]["gu"];
 				var lat=map["restlist"][i]["lat"];
 				var ing=map["restlist"][i]["ing"];
				var category=map["flist"][i]["category"];
				//alert("카테고리는"+category);
				doc1.innerHTML+=" <tr><td>"+ "<a href='#' onclick='openopen(this,\""+category+"\")' >"+name+"</a>"+"</td><td>"+foodname+"</td><td>"+address+"</td><td>"+phone+"</td><td>"+si+"</td><td>"+gu+"</td></tr>";
				
			}
		}
	})
	
}
function openopen(el,category) {
	//el1= <a hre ,... >
	var el1=el.textContent;
	
	opener.document.getElementsByName("title")[0].value=el1;
	opener.document.getElementsByName("category")[0].value=category;
	self.close();
}

</script>
</body>
</html>