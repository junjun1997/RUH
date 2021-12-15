<%@page import="com.hk.ruh.service.IUsersService"%>
<%@page import="com.hk.ruh.dtos.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
   UsersDto udto = (UsersDto)session.getAttribute("usersDto");
String id =udto.getId();
%>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript">

function setLocation() {
	var si=document.getElementById("setsi").options[document.getElementById("setsi").selectedIndex].value;
	var gu=document.getElementById("setgu").options[document.getElementById("setgu").selectedIndex].value;
	
	if(si != "X"&& gu!="X"){
		$.ajax({
			url: "updatelocation.do",
			data: {"id" : <%=id%>, "si": si , "gu": gu },		
			method:"POST",
			dataType: "Text",
			success: function(returns) {	// val=foodname
				alert(returns);
			    location.href="nowlocation.do?id="+<%=id%>;
			}
			})
	}else{
		alert("시와 구를 올바르게 설정하세요~");
	}
	
}
// $(document).ready(function(){
// 	  //실행내용
// 	  console.log("${si}");
<%-- 	location.href="nowlocation.do?id="+<%=id%>; --%>
// 	})
	
// function nowlocation() {
<%-- 	location.href="nowlocation.do?id="+<%=id%>;  --%>
 //}

</script>
<body>
<div style="height: 100px;">
	<h3><%=udto.getId() %>님의 현재 설정된 위치</h3>
	<h5>시: ${si} 구:${gu}</h5>
</div>

<div>
			위치 설정하기
</div>
<div>
	<select name="setsi" id="setsi" style="width: 100px;">
		<option value="X" >시</option>
		<option value="서울특별시">서울특별시</option>
	</select>
	<select name="setgu" id="setgu">
		<option value="X">구</option>
		<option value="강남구">강남구</option>
		<option value="강동구">강동구</option>
		<option value="강북구">강북구</option>
		<option value="강서구">강서구</option>
		<option value="관악구">관악구</option>
		<option value="광진구">광진구</option>
		<option value="구로구">구로구</option>
		<option value="금천구">금천구</option>
		<option value="노원구">노원구</option>
		<option value="도봉구">도봉구</option>
		<option value="동대문구">동대문구</option>
		<option value="동작구">동작구</option>
		<option value="마포구">마포구</option>
		<option value="서대문구">서대문구</option>
		<option value="서초구">서초구</option>
		<option value="성동구">성동구</option>
		<option value="성북구">성북구</option>
		<option value="송파구">송파구</option>
		<option value="양천구">양천구</option>
		<option value="영등포구">영등포구</option>
		<option value="용산구">용산구</option>
		<option value="은평구">은평구</option>
		<option value="종로구">종로구</option>
		<option value="중구">중구</option>
		<option value="중량구">중량구</option>
	</select>
</div>
<div>
<button type="button" onclick="setLocation()">위치 저장하기</button>
</div>

</body>
</html>