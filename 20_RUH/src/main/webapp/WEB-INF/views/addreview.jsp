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
    
<title></title>
<link rel="apple-touch-icon" sizes="180x180" href="assets/img/favicons/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="assets/img/favicons/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="assets/img/favicons/favicon-16x16.png">
    <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicons/favicon.ico">
    <link rel="manifest" href="assets/img/favicons/manifest.json">
    <meta name="msapplication-TileImage" content="assets/img/favicons/mstile-150x150.png">
    <meta name="theme-color" content="#ffffff">
      <link href="assets/css/theme.css" rel="stylesheet" />
<style type="text/css">
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
.resp_table{
/* 	border:3px solid #F17228; */
   position:absolute;
   left:-10px;
   top:-10px;
/*    border: 1px solid black; */
   background-color:white;

   width: 800px;
   height:500px;
   border-radius: 30px; 
	
}
.resp{
/* 	border:3px solid #F17228; */
   position:absolute;
   left:450px;
   top:220px;
   background-color:#F17228;
/*    border: 1px solid black; */
   width: 800px;
   height:500px;
   border-radius: 30px; 
}
th{
padding:20px;
text-align: center;
}
.td1,.td2,.td3,.td4{
/* text-align: center; */
}
.btndeco{
	border-radius: 10px;
	background-color:  #FFB30E;
	border-color: white;
	color:white;
	opacity: 0.7;
}
.input1,.input2,.input3 {
	border:5px solid #616161;
	border-radius: 5px;
}
textarea{
	background-color: #f0f0f0;
	border:none;
	border-radius: 5px;
	color: black;
}
</style>
</head>
<%
	UsersDto udto = (UsersDto)session.getAttribute("usersDto");
%>
<script type="text/javascript">
	function caChk(){
		alert("hi");
		window.open("selectName.do", "위치설정 팝업", "width=400, height=400, left=100, top=50");
	}
	
	
	function showPopup() {
		   window.open("nowlocation.do?id=${usersDto.id}","위치설정팝업" , "width=600, height=500, left=100, top=50");
		};
</script>
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
	<br />

	<div class="bbody">
		 <div class="resp">
		
		<div class="buttons">
			<form action="insertreview.do" method="post">
				
				<table class="resp_table shadow-lg" style="border:1px">
					
					<tr>
						<th>카테고리</th>
						<td class="td1"><input class="input1" type="text" readonly="readonly" name="category" required="required" />
						
						</td>
						
					</tr>
					<tr>
						<th>제목</th>
						<td class="td2"> <input class="input2" type="text" readonly="readonly" name="title" required="required"/>
						<button type="button" class="btnok" onclick="caChk()">검색</button><br/>
						</td>
					</tr>
					
					<tr>
						<th>작성자</th>
						<td class="td3"><input class="input3" type="text" name="id" value="<%=udto.getId()%>" readonly="readonly" required="required"/></td>
					</tr>
					<tr>
						<th>내용</th>
						<td class="td4"><textarea rows="10" cols="60" name="content" required="required"></textarea></td>
					</tr>
					<tr>
						<td colspan="2" style="padding-bottom: 15px;text-align: center;">
							<input class="btndeco" type="submit" value="등록" />
							<input class="btndeco" type="button" value="목록" onclick="location.href='UsersController.do?command=choice'" />
						</td>
					</tr>
				</table>
			</form>
		</div>
		</div>
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