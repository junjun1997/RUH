<%@page import="javax.servlet.jsp.tagext.TryCatchFinally"%>
<%@page import="java.util.List"%>
<%@page import="com.hk.ruh.dtos.ReviewDto"%>
<%@page import="com.hk.ruh.dtos.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
<%response.setContentType("text/html; charset=UTF-8");%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
     




<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta http-equiv="X-UA-Compatible" content="IE=edge">
 <meta name="viewport" content="width=device-width, initial-scale=1">
<title></title>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.js"></script>
<%
UsersDto udto = (UsersDto)session.getAttribute("usersDto");
%>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

<link rel="apple-touch-icon" sizes="180x180" href="assets/img/favicons/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="assets/img/favicons/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="assets/img/favicons/favicon-16x16.png">
    <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicons/favicon.ico">
    <link rel="manifest" href="assets/img/favicons/manifest.json">
    <meta name="msapplication-TileImage" content="assets/img/favicons/mstile-150x150.png">
    <meta name="theme-color" content="#ffffff">
      <link href="assets/css/theme.css" rel="stylesheet" />
<style type="text/css">
.buttons {
	padding: 0px 200px;
	width: 900px;
}
.bigImage {
	width: 200px;
	height: 200px;
}
.abody {
 	height:30px; 
	background-color: #FFB30E;	
}
.bbody {
 	height: 800px; 
	background-color: white;
}
.info {
	position:absolute;
	left:50px;
	top:150px;
	width: 300px;
	height: 500px;
	text-align: center;
}
.infoo {
	display: inline-block;
	margin: 10px 0px;
	width: 90px;
}
.chk {
	position: absolute;
	left: 1300px;
	top: 200px;
	align: center;
}
.resp{
	position: absolute;
 	left: 450px; 
 	top: 220px; 
	align: center;
}
.resp_table{
	position:absolute;
	width: 800px;
	border-radius: 10px;
}
.nav1{
	position: absolute;
	left:330px;
	top:500px;
}
.btndeco{
	border-radius: 10px;
	background-color:  #FFB30E;
	border-color: white;
	color:white;
	opacity: 0.7;
}
</style>
</head>
<script type="text/javascript">
function showPopup() {
	   window.open("nowlocation.do?id=${usersDto.id}","위치설정팝업" , "width=600, height=500, left=100, top=50");
	};
	//전체 체크박스 기능
	function allSel(bool){//bool은 체크여부를 받는다(true/false)
		var chks=document.getElementsByName("chk");//chks[chk,chk,chk,chk..]
		for (var i = 0; i < chks.length; i++) {
			chks[i].checked=bool;//각각의 체크박스에 체크여부(true/false)를 적용
		}
	}
	
	function isEmpty() {
		var chks=document.getElementsByName("chk");//chks[chk,chk,chk,chk..] seq seq
		
		var count=0;
		for (var i = 0; i < chks.length; i++) {
			if(chks[i].checked==true){
				count=count+1;
			}
		}
		
		if(count>0){
			return true;
		}else{
			alert("하나 이상 체크하세요");
			return false;
		}
	
	}
</script>
<body>
<c:set var="lists" value="${list}" />
  <main class="main" id="top">
      <nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top" data-navbar-on-scroll="data-navbar-on-scroll">     
        <div class="container"><a class="navbar-brand d-inline-flex" href="main.do"><img class="d-inline-block" src="assets/img/gallery/logo.svg" alt="logo" /><span class="text-1000 fs-3 fw-bold ms-2 text-gradient">RU Hungry</span></a>
          <div class="collapse navbar-collapse border-top border-lg-0 my-2 mt-lg-0" id="navbarSupportedContent">         
            <div class="mx-auto pt-5 pt-lg-0 d-block d-lg-none d-xl-block">
            </div>           
          </div>
        </div>
      </nav>
      
		<section class="py-5 overflow-hidden bg-primary" id="home">
			<!-- 배경색 노랑-->
			
			<div class="info">
				<img
					src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTFGMboZCO9t-ZUJA9cIEJaLXfp67qJmS2hHRcvDldP2L8eCedaRVpI05anMy8TANCPk6w&usqp=CAU"
					width="150px" height="150px"> <br />
				<h1 class="text-800 mb-5 fs-4">
					ID:<%=udto.getId()%></h1>
				<button class="btn1" type="button" onclick="showPopup()">location</button>
				<br />
				

				<button class="btn1" type="submit"
					onclick="location.href='logout.do'">LogOut</button>
				<br />
				</div>
			<div class="abody"></div>
			<div class="bbody">
			<div class="resp">
			<form action="delreview.do" method="post" onsubmit="return isEmpty()" >
				<input type="hidden" name="command" value="muldel" />
				<div class="container">
				<table class="resp_table table table-striped" id="review" >
					<tr>
						<th style="width:70px;"><input type="checkbox" name="all"
							onclick="allSel(this.checked)" />번호</th>
						<th>카테고리</th>
						<th>식당이름</th>
						<th>작성자</th>
						<th>작성일</th>
					</tr>
 						<c:choose>     <%--  choose 안 when otherwise --%>
							<c:when test="${empty lists}"> <%--  if절 --%>
								<tr>
									<td colspan="5">----글이 없습니다.----</td>
								</tr>
							</c:when>   
							<c:otherwise>   
								<c:forEach var="dto" items="${list}">
									<tr>
										<td><input type="checkbox" name="chk" value="${dto.seq}"/>${dto.seq}</td>
										<td>${dto.category}</td>
										<td><a href="detailreview.do?&seq=${dto.seq}">${dto.title}</a></td>										
										<td>${dto.id}</td>
										<td><fmt:formatDate value="${dto.regdate}" pattern="yyyy.MM.dd hh시:mm분" /></td>
									</tr>
								</c:forEach>		
							</c:otherwise>
						</c:choose>
					<tr>
						<td colspan="7">
							<a href="addreview.do?">
							<button type="button" class="btndeco">글쓰기</button></a> 
							
							<input type="submit" class="btndeco" value="글삭제" />
						<a href="main.do?"><button class="btndeco" type="button">메인</button></a>
						</td>
					</tr>
				</table>
				</div>
				<nav class="nav1"> 
				<ul class="pagination justify-content-center"> 
				<li class="page-item"><a class="page-link" href="">◀</a></li> 
				<li class="page-item"><a class="page-link" href="">1</a></li> 
				<li class="page-item"><a class="page-link" href="">2</a></li> 
				<li class="page-item"><a class="page-link" href="">3</a></li> 
				<li class="page-item"><a class="page-link" href="">▶</a></li> 
				</ul> 
				</nav>
 
			</form>
			</div>
			</div>
		<div class="chk">
			<form action='categoryfilter.do' method="post">음식<br>
			<input type='checkbox' class='food'name="category" value='한식' />한식<br> 
			<input type='checkbox' class='food'name="category" value='중식' />중식<br> 
			<input type='checkbox' class='food'name="category" value='일식' />일식<br> 
			<input type='checkbox' class='food'name="category" value='분식' />분식 <br>
			<input type='checkbox' class='food'name="category" value='양식' />양식 <br> 
			<input type='checkbox' class='food'name="category" value='패스트푸드' />패스트푸드 <br> 
			<input type='submit' value="확인" >
			확인:<b id="sss"></b>
			</form>
			<script type="text/javascript">
			$(function(){
					$(".food").click(function(){
						var category=[];					
						$(".food").each(function(){
							if($(this).is(":checked"))
								category.push($(this).val());
						});
						var test=document.getElementById('sss').innerHTML=category;
					});
				});
				
			</script>
		</div>
		</section>
		</main>
		
		
	<script src="vendors/@popperjs/popper.min.js"></script>
    <script src="vendors/bootstrap/bootstrap.min.js"></script>
    <script src="vendors/is/is.min.js"></script>
    <script src="https://polyfill.io/v3/polyfill.min.js?features=window.scroll"></script>
    <script src="vendors/fontawesome/all.min.js"></script>
    <script src="assets/js/theme.js"></script>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script> <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script> <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

    <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@200;300;400;600;700;900&amp;display=swap" rel="stylesheet">
</body>
</html>