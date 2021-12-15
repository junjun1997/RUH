<%@page import="org.springframework.beans.factory.annotation.Autowired"%>
<%@page import="com.hk.ruh.service.IUsersService"%>
<%@page import="com.hk.ruh.daos.IUsersDao"%>
<%@page import="com.hk.ruh.dtos.UsersDto"%>
<%@page import="com.hk.ruh.daos.UsersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<%
 	String isS="n";	//사용여부를 나타내는 isS 정의(n는 사용가능, y은 사용못함)
	String resultId=(String)request.getAttribute("resultId");
	if(resultId!=null){
		isS="y";
	}
%>
<meta charset="UTF-8">
<title></title>

<script type="text/javascript">
function confirm(isS){
	if(isS=="y"){ // 중복된 아이디
		//operner->home.jsp
		var inputId=opener.document.getElementsByName("idr")[0];  //id입력박스
		inputId.value=""; //회원가입폼에 아이디 입력박스를 ""으로 초기화
		inputId.focus(); //사용자가 바로 입력할 수 있게 커서를 넣어준다.
	}else{// 사용가능 id
		opener.document.getElementsByName("idr")[0].title="n";
		opener.document.getElementsByName("pw")[1].focus();
		opener.document.getElementById('successidchk').checked=true;

	}
	self.close();//자신의 창을 닫는다.
}
</script>
</head>
<body>
<table border="1">
	<tr>
		<th>아이디</th>
<%-- 		<td><%=id %></td> --%>
	</tr>
	<tr>
		<th>사용가능여부</th>
		<td><%=isS.equals("n")?"사용가능합니다.":"중복된아이디입니다." %></td>
	</tr>
	<tr>
		<td colspan="2">
			<button onclick="confirm('<%=isS%>')">확인</button>
		</td>
	</tr>
</table>
</body>
</html>