<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>



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
.person{
	position: absolute;
	left:43%;
	top:100px;
}
.bbody {
    height: 800px; 
/*    width:600px; */
   background-color: white;
/*    position: absolute; */
/*    left: 200px; */
    top: 300px; 
   
}
.resp_table{
   position:absolute;
   left:28%;
   top:230px;
/*    border: 1px solid black; */
   width: 700px;
   height:350px;
   border-radius: 20px;
   background-color: #FFB30E;
}
.idpass{
	width:700px;
	height:350px;
	background-color: white;
	opacity:0.8;
 	position: absolute; 
 	border-radius: 20px;
 	left:-15px; 
 	top:-15px; 
}
.idpass-inner{
	width:300px;
	height:250px;
	background-color: none;
 	position: absolute; 
 	left:160px; 
 	top:100px; 
}
.btn-login{
position: absolute; 
 	left:500px; 
 	top:100px;
	width:130px;
	color: #FFFEFE;
  background-color: #F17228;
  border-color: #F17228;
  font-weight: 700;
  line-height: 2;
  text-align: center;
  vertical-align: middle;
  cursor: pointer;
  padding: 10px 10px;
  margin:10px 10px;
  font-size: 30px;
  border-radius: 20px 20px 20px 20px;
}

.cbody{
position: absolute;
top:1200px;
height:1000px;
}
.resp_table-a{
   position:absolute;
   left:500px;
   top:50px;
/*    border: 1px solid black; */
   width: 700px;
   height:750px;
   border-radius: 20px;
   background-color: #FFB30E;
}
.idpass-a{
	width:700px;
	height:750px;
	background-color: white;
	opacity:0.8;
 	position: absolute; 
 	border-radius: 20px;
 	left:-15px; 
 	top:-15px; 
}
.idpass-inner-a{
	width:300px;
	height:250px;
	background-color: none;
 	position: absolute; 
 	left:190px; 
 	top:50px; 
}

.btndeco{
	border-radius: 10px;
	background-color:  #FFB30E;
	border-color: white;
	color:white;
	opacity: 0.7;
}

.sgn{
	position: absolute;
	left:35px;
}
.btn-a{
	position: absolute;
	left:500px;
	top:57px;
}
.btnok{
	position: absolute;
	left:518px;
	top:300px;
}
.btnsign{
position: absolute;
	left:90px;
}
</style>
</head>
<body>
	<main class="main" id="top">
      <nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top" data-navbar-on-scroll="data-navbar-on-scroll">
      
        <div class="container"><a class="navbar-brand d-inline-flex" href="index.jsp"><img class="d-inline-block" src="assets/img/gallery/logo.svg" alt="logo" /><span class="text-1000 fs-3 fw-bold ms-2 text-gradient">RU Hungry</span></a>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"> </span></button>
          <div class="collapse navbar-collapse border-top border-lg-0 my-2 mt-lg-0" id="navbarSupportedContent">
          
            <div class="mx-auto pt-5 pt-lg-0 d-block d-lg-none d-xl-block">
            </div>
           
          </div>
        </div>
      </nav>
	<section class="py-5 overflow-hidden bg-primary" id="home">
      	 <div class="info">
   <img class="person"
   src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTFGMboZCO9t-ZUJA9cIEJaLXfp67qJmS2hHRcvDldP2L8eCedaRVpI05anMy8TANCPk6w&usqp=CAU"
   width="150px" height="150px"> <br />
      	</div>
      	
      	
   <div class="bbody">
   <div class="resp">
   	
	
	<form id="login" action="getLogin.do" class="input-group" method="post">
	<div class="resp_table shadow-lg">   	
	<div class="idpass">
	<div class="idpass-inner">
   	<input type="text" name="id" class="form-control border-0 input-box bg-300 input-id" placeholder="Enter ID" required><br/>
	<input type="password" name="pw" class="form-control border-0 input-box bg-300 input-pass" placeholder="Enter Password" required><br/>
	
	<div class="sgn">	
	<span class="span">If you want to be with us,</span>
	<button type="button" class="btndeco" onclick="sgn()">Sign Up</button>
	</div>
				
   	</div>
	<button type="submit" class="submit btn-login">Login</button>
   	</div>
  	</div>
  	</form>
   </div>
   </div>
    
     
      
      
      </section>
      </main>
      
	<div class="cbody">
	<form id="register" action="getRegist.do" class="input-group"  onsubmit="return chkregister()">
    <div class="resp_table-a shadow-lg">   
    <div class="idpass-a">
    <div class="btn-a">
	<button type="button" class="" onclick="idChk()">id????????????</button> 
	<br/>
	</div>
	<button type="button" class="btnok" onclick="adChk()">??????</button><br/>
	<div class="idpass-inner-a">
	<input type="text" name="idr" class="form-control border-0 input-box bg-300" placeholder="ID??? ???????????????" required="required" ><br/>
	 <a>???????????? ??????</a><input type="checkbox"  id="successidchk"  required="required"  disabled="disabled"> <br/>
	<input type="password" name="pw" class="form-control border-0 input-box bg-300" placeholder="PW??? ???????????????" required="required"><br/> 
	<input type="text" name="name" class="form-control border-0 input-box bg-300" placeholder="????????? ???????????????" required="required"><br/>
			<select name="setsi" id="setsi" style="width: 145px;">
				<option value="X" >???</option>
				<option value="???????????????">???????????????</option>
			</select>
			<select name="setgu" id="setgu" style="width: 145px;">
				<option value="X">???</option>
				<option value="?????????">?????????</option>
		<option value="?????????">?????????</option>
		<option value="?????????">?????????</option>
		<option value="?????????">?????????</option>
		<option value="?????????">?????????</option>
		<option value="?????????">?????????</option>
		<option value="?????????">?????????</option>
		<option value="?????????">?????????</option>
		<option value="?????????">?????????</option>
		<option value="?????????">?????????</option>
		<option value="????????????">????????????</option>
		<option value="?????????">?????????</option>
		<option value="?????????">?????????</option>
		<option value="????????????">????????????</option>
		<option value="?????????">?????????</option>
		<option value="?????????">?????????</option>
		<option value="?????????">?????????</option>
		<option value="?????????">?????????</option>
		<option value="?????????">?????????</option>
		<option value="????????????">????????????</option>
		<option value="?????????">?????????</option>
		<option value="?????????">?????????</option>
		<option value="?????????">?????????</option>
		<option value="??????">??????</option>
		<option value="?????????">?????????</option>
			</select>
			<div style="height:25px;">
			
			</div>
 	<input type="text" name="si" id="si" class="form-control border-0 input-box bg-300" placeholder="'???'??? ???????????????" readonly="readonly" ><br/> 
	<input type="text" name="gu" id="gu" class="form-control border-0 input-box bg-300" placeholder="'???'??? ???????????????" readonly="readonly" > 
			<br/>
			
			<input type="radio" name="sexchk"  value="m"  required="required"/><label>???</label>
			<input type="radio" name="sexchk"  value="w" required="required" /><label>???</label>
			<br/> <hr/>
			
			<div>
			<h5>??????????????? ???????????????</h5>
			<input type="date"  name="birth" required="required">
			</div>
			
			<hr/>
			<input type="email" name="email" class="form-control border-0 input-box bg-300" placeholder="???????????? ???????????????"  required="required">
			<div style="height:25px;"></div>
			<button type="submit" class="submit btndeco btnsign"  >????????????</button>
    </div>
    </div>
   	</div>
   	</form>
    </div> 
		
		
	<script type="text/javascript">
		var x = document.getElementById("login");
		var y = document.getElementById("register");
		var z = document.getElementById("btn");
		function login() {
			x.style.left = "50px";
			y.style.left = "450px";
			z.style.left = "0";
		}
		function register() {
			x.style.left = "-400px";
			y.style.left = "50px";
			z.style.left = "110px";
			
		}
		function sgn(){
			
			window.scrollTo( 200, 1200 );
		}
		
		
		
		function idChk(){
			var id=document.getElementsByName("idr")[0].value;//????????? ????????? ??????
// 			console.log(id);
			if(id==null||id==""||id==undefined){
				alert("????????? ???????????? ???????????????");
			document.getElementsByName("id")[0].focus();
			}else{
				open("idchk.do?id="+id,"????????????","width=300px, height=300px,");
			}
		}
		
		function adChk(){
			 var si =document.getElementById("setsi").options[document.getElementById("setsi").selectedIndex].value;
			 var gu =document.getElementById("setgu").options[document.getElementById("setgu").selectedIndex].value;
			 var x= document.getElementById("si");
			 var y= document.getElementById("gu");
						
				 if(si=='X' || gu=='X'){
						alert("??????????????? ???, ??? ?????? ?????????????????????.");
 						//document.document.getElementsByName("si")[0].focus();
					}else{
						 x.value=si;
						 y.value=gu;

					}
				 
// 			console.log(si,gu);	 
		}
		
		
	</script>
	<script type="text/javascript">
	function chkregister() {
		var successidchk=document.getElementById("successidchk");
		var si=document.getElementById("si");
		var gu=document.getElementById("gu");
	
		if( (successidchk.checked==true)&& (si.value!="") &&(gu.value!="")  ){
			return true;
		}
		else{
			alert('plz full');
			return false;	
		}
		return false;
	}
	</script>
	 <script src="vendors/@popperjs/popper.min.js"></script>
    <script src="vendors/bootstrap/bootstrap.min.js"></script>
    <script src="vendors/is/is.min.js"></script>
    <script src="https://polyfill.io/v3/polyfill.min.js?features=window.scroll"></script>
    <script src="vendors/fontawesome/all.min.js"></script>
    <script src="assets/js/theme.js"></script>

    <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@200;300;400;600;700;900&amp;display=swap" rel="stylesheet">
   
</body>
</html>