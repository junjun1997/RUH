<%@page import="org.springframework.ui.Model"%>
<%@page import="com.hk.ruh.daos.UsersDao"%>
<%@page import="com.hk.ruh.service.IUsersService"%>
<%@page import="org.springframework.beans.factory.annotation.Autowired"%>
<%@page import="com.hk.ruh.daos.IUsersDao"%>
<%@page import="java.util.List"%>
<%@page import="com.hk.ruh.dtos.RestlistDto"%>
<%@page import="com.hk.ruh.dtos.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>

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
<script asyn defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCePJSFCOeZEfNI7b31h51yWJw4HXTgDT8&callback=initMap&region=kr"></script>
<%
	UsersDto udto = (UsersDto)session.getAttribute("usersDto");


	
String id=udto.getId();
String si= request.getAttribute("si").toString();
String gu= request.getAttribute("gu").toString();	

	float jlat=0;
	float jing=0;
	
	if(gu.equals("영등포구")){//37.52232661754723, 126.90954913816017
		jlat=37.52232661754723F;
		jing=126.90954913816017F;
	}else if(gu.equals("양천구")){	//37.524777230367214, 126.85478916209071
		jlat=37.524777230367214F;
		jing=126.85478916209071F;
	}else if(gu.equals("동작구")){	//37.49881310611938, 126.95175927277141
		jlat=37.49881310611938F;
		jing=126.95175927277141F;
	}
	
%>
<script type="text/javascript">
var map;		//페이지 로드시 map 객체	사용자 주소
var map1;	//식당 주소 객체

var selectedGu = new Array();


function initMap() {    //페이지 로드시
	var myLoca = { lat: <%=(float)jlat %> ,lng: <%=(float)jing %>};
	
    map = new google.maps.Map(
      document.getElementById('map'), {
        zoom: 15,
        center: myLoca
      });
  }
function initMaps(x,y) {		//0번째 식당위치를 센터로 잡는다
	var firstRest = { lat: x ,lng: y };
    map1 = new google.maps.Map(
      document.getElementById('map'), {
        zoom: 15,
        center: firstRest
      });
  }
  
var foodname;
var sameFood;		//중복체크 
var markers=[];

function showPopup() {
	   window.open("nowlocation.do?id=${usersDto.id}","위치설정팝업" , "width=600, height=500, left=100, top=50");
	};

function selectFood() {
	$.ajax({
		url: "MapController.do",
		data: {"command": "selectfood"},
		method:"POST",
		dataType: "Text",
		success: function(val) { //val은 db에서 select한 foodname
			var doc=document.getElementById("rcmimg");
//		 	String foodname=val.toString();
		doc.src="img/"+val+".JPG";
		foodname=val;
		initMap();
		
		}
	})
}


function chooseRest() {
// 	&& foodname != sameFood
	if(foodname!=null ){
		deleteMarkers();
//		clearElements();
		if(selectedGu.length==0)	{	//구 설정을 안할시 설정된 위치(구) 로
			var myGU="";
			myGU="<%=gu%>";
			var segu=[];
			segu.push(myGU);
		}
		
		$.ajax({
			url: "MapController.do",
			traditional:true,
			data: {"command": "chooserest", "foodname":foodname , "gu":(selectedGu.length!=0) ? selectedGu: segu },		
			method:"POST",
			dataType: "JSON",
			success: function(map) { //map은 db에서 select한 dto 리스트를 담는 map(json)  
				var doc=document.querySelectorAll("#reslist tbody")[0];
				doc.innerHTML="";
				var firstLat;
				var firstIng;
				
					if(map["restlist"].length==0){
						console.log("null입니다");
						doc.innerHTML="<tr><th>"+"x" +"</th><th>"+"찾는 식당이없음" +"</th><th>"+"" +"</th><th>"+""+"다른 음식과"+"" +"</th><th>"+" 위치를 시도해보세요~" +"</th><th></th></tr>";
					}
// 					console.log(map["restlist"][0]["name"]);

				for (var i = 0; i < map["restlist"].length; i++) {
					var name=map["restlist"][i]["name"];
					var foodname=map["restlist"][i]["foodname"];
					var address=map["restlist"][i]["address"];
					var phone=map["restlist"][i]["phone"];
					var breakstart=map["restlist"][i]["breakstart"];
					var breakend=map["restlist"][i]["breakend"];
					var open=map["restlist"][i]["open"];
					var close=map["restlist"][i]["close"];
					var parking=map["restlist"][i]["parking"];
					var si=map["restlist"][i]["si"];
					var gu=map["restlist"][i]["gu"];
					var lat=map["restlist"][i]["lat"];
					var ing=map["restlist"][i]["ing"];
				
					if(i==0){		//첫번째 결과의 위도경도를 저장
						firstLat=parseFloat(lat);
						firstIng=parseFloat(ing);
					}
					doc.innerHTML += "<tr><th>"+i +"</th><th>"+name +"</th><th>"+foodname +"</th><th>"+open+"~"+close +"</th><th>"+address +"</th><th><a href='ReviewController.do?command=reviewlist2&title="+name+"'>더보기</a></th></tr>";
					makemark(i,lat,ing);	//마커스 배열에 저장 푸쉬
				}
					
				initMaps(firstLat,firstIng);
				setMarkOnMap(map1);	//마커 배열을 지도에 표시
			}
		})
	
	}
	else if(sameFood==foodname){
		alert("방금전 같은 음식을 선택하셨잖아요ㅡㅡ");
	}
	sameFood=foodname;
	foodname=null;
}

function makemark(i,x,y) {
	 var markposi={ lat: x ,lng: y };
	 
	 var marker=new google.maps.Marker({
	     position: markposi,
	     map: map1,
	     label: i.toString()
	   });
	 markers.push(marker);	
}

function setMarkOnMap(map1) {
	for (var i = 0; i < markers.length; i++) {
		markers[i].setMap(map1);
	}
}

function clearMarkers(){  //마커를 지운다 하지만 마커 배열에 는 유지된다
	 setMarkOnMap(null);
}

function deleteMarkers() { // 마커를 지우고 배열도 비운다
	clearMarkers();
	markers=[];
}

$(document).ready(function initmap() {			//페이지를 다 띄우면 온로드
	 var myposi = { lat: <%=(float)jlat %> ,lng: <%=(float)jing %> };		//사용자의 위도 경도 
	 map = new google.maps.Map( document.getElementById('map'), {
	     zoom: 15,
	     center: myposi
	   });
	});

	function mulgu() {
		var doc=document.getElementById("selgu");
		if(doc.value!="X" && selectedGu.length<3){
			selectedGu.push(doc.value);
			var doc1=document.getElementById("viewgu");
			doc1.innerHTML+=" ▶ "+doc.value;
		}
		console.log(selectedGu);
		console.log(selectedGu.length);
	}
	
	function resetGu() {
		selectedGu=[];
		var doc1=document.getElementById("viewgu");
		doc1.innerHTML="";
		var doc=document.getElementById("selgu");
		doc.options[0].selected=true;
	}
	
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
    height: 830px; 
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
.t1{
	position: absolute;
	left:350px;
	top:280px;
}
.t2{
	width:850px;
	position: absolute;
	left:780px;
	top:100px;
	border-radius: 10px;
}
.t3{
	width:400px;
	height:150px;
	position: absolute;
	left:350px;
	top:100px;
	text-align: center;
}
.t4{
	width:850px;
	height:312px;
	position: absolute;
	left:780px;
	top:530px;
	border-color: blue;
	border-radius: 10px;
}
.td1{
   width:400px;
   height:310px;
   padding:20px;
   }
   
   
.td2{
   width:400px;
   }
.resp_table{
/*    position:absolute; */
/*    left:450px; */
/*    top:220px; */
/*    border: 1px solid black; */
/*     width: 400px;  */
/*    height:350px; */
   border-radius: 10px;
}   
#rcmimg{
	border-radius: 10px 10px 0px 0px;
}
.btndeco{
	border-radius: 10px;
	background-color: #FFB30E;
	border-color: white;
	color:white;
/* 	opacity: 0.7; */
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
            <h1 class="text-800 mb-5 fs-4">ID:<%=udto.getId()%></h1>
          <button class="btn1" type="button" onclick="showPopup()" >location</button>
        
         <br /> 
      
         <button class="btn1" type="submit" onclick="location.href='logout.do'">LogOut</button>
         <br />
            </div>
          <div class="bbody">
          	<table class="t1 resp_table shadow-lg">
 			  <tr>
 			  <td class="td2">
 			  <img class=" " alt="추천이미지" id = "rcmimg" width="400px" height="250px" border="0" 
 			     src=" img/추천해주세요.png">
 			  </td>
 			  </tr>
 			  <tr>
 			  <td class="td1">
 			  <h3 class="card-title mt-xl-5 mb-4"> Today Food recommendations<span class="text-primary"> for you!</span></h3>
 			  <h6><span class="quiz-text"></span></h6>
 			  <div class="d-grid bottom-0"><button class="btn btn-lg btn-primary mt-xl-4" onclick="selectFood()">선호 기반 추천받기</button></div>
 			  <div class="d-grid bottom-0"><button class="btn btn-lg btn-primary mt-xl-2" onclick="chooseRest()">음식이 맘에들어~</button></div>
 			  </td>
 			  </tr>
 			  </table>
 			  
 			  
 			  <table class="t2 resp_table shadow-lg">
 			  <tr>
 			  <td>
 			  <div style="border-radius: 10px; width: 850px; height: 400px; " id="map" ></div>
 			  </td>
 			  </tr>
 			  </table>
			
			
			<table class="t3 resp_table shadow-lg">
			<tr>
			<td>
			<div><h5 class="card-title mt-xl-2 mb-4"> 현재 나의 위치: <%=si %> - <%=gu %></h5> <h6>  구 미설정시 현재 위치 기반으로 설정합니다</h6></div>
		<div>
		<select id="selgu"  onchange="mulgu()">
			<option value="X" id="X">구를 선택하세요(최대 3개)</option>
			<option value="강남구"  >강남구</option>
			<option value="강동구"  >강북구</option>
			<option value="강동구" >강동구</option>
			<option value="강서구" >강서구</option>
			<option value="관악구" >관악구</option>
			<option value="광진구" >광진구</option>
			<option value="구로구" >구로구</option>
			<option value="금천구" >금천구</option>
			
			<option value="노원구" >노원구</option>
			
			<option value="도봉구" >도봉구</option>
			<option value="동대문구" >동대문구</option>
			<option value="동작구" >동작구</option>
			
			<option value="마포구" >마포구</option>
			
			<option value="서대문구" >서대문구</option>
			<option value="서초구" >서초구</option>
			<option value="성동구" >성동구</option>
			<option value="성북구" >성북구</option>
			<option value="송파구" >송파구</option>

			<option value="양천구" >양천구</option>
			<option value="영등포구" >영등포구</option>
			<option value="용산구" >용산구</option>
			<option value="은평구" >은평구</option>

			<option value="종로구" >종로구</option>
			<option value="중구" >중구</option>
			<option value="중량구" >중량구</option>
		</select>
		<button class="btndeco" type="button" onclick="resetGu()">되돌리기</button> <br><b>선택 구:</b> <b class="text-primary" id="viewgu"></b>
 		</div>
 		</td>
 		</tr>
			</table>
<!-- 			<div style="overflow: scroll; ;  height: 500px;  "> -->
			<table style="display: block; overflow:auto; text-align: center;"  id="reslist" class="t4 resp_table shadow-lg table-striped" >
				<col width="40px">
				<col width="200px">
				<col width="80px">
				<col width="120px">
				<col width="290px">
				<col width="120px">
			<thead>
				<tr id="trlist" style="text-align: center;">
					<th>번호</th>
					<th>식당이름</th>
					<th>음식</th>
					<th>영업시간</th>
					<th>주소</th>
					<th>리뷰보기</th>
				</tr>
				</thead>
				<tbody></tbody>
			
			</table>
<!-- 			</div> -->
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