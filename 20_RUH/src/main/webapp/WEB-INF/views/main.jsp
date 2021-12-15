<%@page import="com.hk.ruh.dtos.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

  <%
   UsersDto udto = (UsersDto)session.getAttribute("usersDto");
%>	




<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
<title>Insert title here</title>
<link rel="apple-touch-icon" sizes="180x180" href="assets/img/favicons/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="assets/img/favicons/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="assets/img/favicons/favicon-16x16.png">
    <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicons/favicon.ico">
    <link rel="manifest" href="assets/img/favicons/manifest.json">
    <meta name="msapplication-TileImage" content="assets/img/favicons/mstile-150x150.png">
    <meta name="theme-color" content="#ffffff">
      <link href="assets/css/theme.css" rel="stylesheet" />

<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.js"></script>

<script type="text/javascript">
var imgArray = new Array();
var randomNum;
for (var i = 0; i < 38; i++) {
	imgArray.push("img/rouletteimg/"+i+".JPG");
}
//index -> 음식이름 		사전
var matchjson =  {	"0" : "LA갈비",	 "1" : "갈비찜",	 "2" : "김밥",	"3" : "김치찌개",	"4" : "꿔바로우",			
		"5" : "나베",		"6" : "냉면",		"7" : "닭강정",		"8" : "닭발",		"9" : "덮밥",		"10" : "돈까스",
		"11" : "된장찌개",		"12" : "떡볶이",		"13" : "리조또",		"14" : "마라탕",		"15" : "만두",		
		"16" : "보쌈",		"17" : "삼겹살",		"18" : "샌드위치",		"19" : "샐러드",		"20" : "소바",
		"21" : "스테이크",		"22" : "양장피",		"23" : "오돌뼈",		"24" : "족발",		"25" : "짜장면",		
		"26" : "짬뽕",		"27" : "쭈꾸미",		"28" : "초밥",		"29" : "치킨",		"30" : "칼국수",
		"31" : "콩국수",		"32" : "탕수육",		"33" : "토스트",		"34" : "파스타",		"35" : "피자",
		"36" : "해물찜",		"37" : "햄버거",		"38" : "회" };		

function recomm(){
   randomNum =Math.floor(Math.random()*38);
   var objImg = document.getElementById("introImg");
   objImg.src = imgArray[randomNum];
   
   let x = document.getElementsByClassName("quiz-text")[0];
      x.innerText="Javascript";    
      x.innerHTML="오늘의 추천 메뉴 : "+ matchjson[""+randomNum+""]+ "입니다";
};

function insertChosen() {
	var foodname=matchjson[""+randomNum+""];
	alert(foodname);
	$.ajax({
		url: "insertchosen.do",
		data: {"foodname" : foodname },		
		method:"POST",
		dataType: "Text",
		success: function(returns) {	// val=foodname
			alert(returns);
		}
		})
}



function showPopup() {
   alert("hi");
   window.open("nowlocation.do?id=${usersDto.id}"   , "위치설정 팝업", "width=600, height=500, left=100, top=50");
};


</script>
<style type="text/css">
.buttons {
   padding: 0px 200px;
   width: 900px;
}

.bigImage {
   width: 200px;
   height: 200px;
}



.bbody {
    height: 800px; 
/*    width:600px; */
   background-color: white;
/*    position: absolute; */
/*    left: 200px; */
/*    top: 300px; */
   
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
   left: 1400px;
   top: 200px;
   align: center;
}
.randplay{
       position: absolute;
        left: 500px;
        top: 50px;
        align:center;
}
.btnbg1{
   background-color:transparent;
   border: 0;
   outline: 0;
   position: absolute;
   left: 290px;
   top: 550px;
}

.btnbg2{
   background-color:transparent;
   border: 0;
   outline: 0;
   position: absolute;
   left: 640px;
   top: 550px;
}
.btnbg3{
   background-color:transparent;
   border: 0;
   outline: 0;
   position: absolute;
   left: 1000px;
   top: 550px;
}
.resp_table{
   position:absolute;
   left:450px;
   top:220px;
/*    border: 1px solid black; */
   width: 800px;
   height:350px;
   border-radius: 10px;
}
.td1{
   width:300px;
   padding:20px;
   }
   
.td2{
   width:500px;
   }
   .b1{
	position: absolute;
	left:310px;
	top:740px;
   }
.b2{
	position: absolute;
	left:675px;
	top:740px;
   }
.b3{
	position: absolute;
	left:1050px;
	top:740px;
   }

</style>
</head>

<body>

  <main class="main" id="top">
      <nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top" data-navbar-on-scroll="data-navbar-on-scroll">
      
        <div class="container"><a class="navbar-brand d-inline-flex" href="main.do"><img class="d-inline-block" src="assets/img/gallery/logo.svg" alt="logo" /><span class="text-1000 fs-3 fw-bold ms-2 text-gradient">RU Hungry</span></a>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"> </span></button>
          <div class="collapse navbar-collapse border-top border-lg-0 my-2 mt-lg-0" id="navbarSupportedContent">
          
            
          </div>
        </div>
      </nav>
        <section class="py-5 overflow-hidden bg-primary" id="home">   <!-- 배경색 노랑-->>
          <div class="info">         
         <img
            src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTFGMboZCO9t-ZUJA9cIEJaLXfp67qJmS2hHRcvDldP2L8eCedaRVpI05anMy8TANCPk6w&usqp=CAU"
            width="150px" height="150px"> <br />
            <h1 class="text-800 mb-5 fs-4">
            ID:<%=udto.getId()%>
            </h1>
          <button class="btn1" type="button" onclick="showPopup()" >location</button>
            <br />
         
         
         <button class="btn1" type="submit" onclick="location.href='logout.do'">LogOut</button>
         <br />
            
         
      </div>

      
   <br />

   <div class="bbody">
   <div class="resp">
   <table class="resp_table shadow-lg">
   <tr>
   <td class="td1">
   <h3 class="card-title mt-xl-5 mb-4"> Today Food recommendations<span class="text-primary"> for you!</span></h3>
   <h6><span class="quiz-text"></span></h6>
   <div class="d-grid bottom-0"><button type="button" class="btn btn-lg btn-primary mt-xl-4" onclick="recomm()">Click!</button></div>
   <div class="d-grid bottom-0"><button type="button" class="btn btn-lg btn-primary mt-xl-2"  onclick="insertChosen()">I like it!</button></div>
   </td>
   <td class="td2">
   <img class=" rounded-top rounded-md-end rounded-md-top-0" id = "introImg" width="500px" height="350px" border="0" 
      src="randimg/Q.png">
   </td>
   </tr>
   </table>
   </div>
      <section class="py-0 bg-primary-gradient">
      <div class="container">
          <div class="row justify-content-center g-0">
            <div class="col-xl-9">
            
              <div class="row">
              <div class="col-sm-6 col-md-3 mb-6">
                  <div class="text-center">
         <button type="button" class="btnbg1">
            <img class="shadow-icon" src="assets/img/gallery/meals.png" height="180" alt="..."  onclick="location.href='worldcup.jsp'"/>
         </button>
         <h4><span class="b1 text-primary">Food WorldCup</span></h4>
         </div>
         </div>
         <div class="col-sm-6 col-md-3 mb-6">
                  <div class="text-center">
         <button type="button" class="btnbg2">
            <img class="shadow-icon" src="assets/img/gallery/order.png" height="180" alt="..."  onclick="location.href='review.do'"/>
         </button>
           <h4><span class="b2 text-primary">Review</span></h4>
         </div>
         </div>
           <div class="row">
         <div class="col-sm-6 col-md-3 mb-6">
           <div class="text-center">
         <button type="button" class="btnbg3">
            <img class="shadow-icon" src="assets/img/gallery/location.png" height="180" alt="..." onclick="location.href='map.do'"/>
         </button>
         <h4><span class="b3 text-primary">Map</span></h4>
         </div>
         </div>
         </div>
      </div>
   </div>
   </div>
   </div>
   </section>
   </div>
      
   </section>
      </main>
   <script src="vendors/@popperjs/popper.min.js"></script>
    <script src="vendors/bootstrap/bootstrap.min.js"></script>
    <script src="vendors/is/is.min.js"></script>
    <script src="https://polyfill.io/v3/polyfill.min.js?features=window.scroll"></script>
    <script src="vendors/fontawesome/all.min.js"></script>
    <script src="assets/js/theme.js"></script>

    <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@200;300;400;600;700;900&amp;display=swap" rel="stylesheet">
   
</body>
</html>