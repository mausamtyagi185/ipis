<%-- <%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <TITLE>Personal Announcement</TITLE>
    <META http-equiv=Content-Type content="text/html; charset=utf-8"> 
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" type="text/css" href="../css/component.css" />
<!-- --Css for Menu-- -->
<style>

ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color: #335996;
    
}

li {
    float: left;
    
}

li a {
    display: block;
    color: white;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
}
.active {
    background-color: #03A9F4;
    color: white;
    }


 .vert {
 width: 20px;
 height: 200px;
 -webkit-appearance: slider-vertical;
 }
 
.not-active-privilege {
   pointer-events: none;
   cursor: default;
   opacity: 0.3;
}
 
</style>
<!-- --Css for Page-- -->

<!-- ------XXX------- -->
</head>
<body><div style="background: #111">
   <img src="../images/header2.PNG" width="100%" height="100" alt="header2"/>
<ul>

	<li><a href="../train/trainRunningInfo" style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;">Online Train</a></li>
	<li style=" float: left;"><a style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;" <s:if test='%{#session["user"].status==false}'> class="not-active-privilege" </s:if> href="../device/deviceStatus">Status</a></li>
	<li style="float: left;"><a href="../device/deviceConfig" <s:if test='%{#session["user"].display==false}'> class="not-active-privilege" </s:if> style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;">Display</a></li>
	<li style="float: left;"><a href="../device/deviceIntensity" <s:if test='%{#session["user"].intensity==false}'> class="not-active-privilege" </s:if> style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;">Intensity</a></li>
	<li style="float: left;"><a href="../log-report/logReport" <s:if test='%{#session["user"].logReport==false}'> class="not-active-privilege" </s:if> style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;">Log Report</a></li>
<!-- 	<li><a class="active" href="#" style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;">CCTV</a></li> -->
	<li><a href="../announcement/personalAnc" <s:if test='%{#session["user"].personalAnc==false}'> class="not-active-privilege" </s:if> style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;">PA</a></li>
	<li><a href="../message/getBoardMessageList" <s:if test='%{#session["user"].message==false}'> class="not-active-privilege" </s:if> style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;">Message</a></li>
	<li><a href="../setup/setup.jsp" <s:if test='%{#session["user"].setup==false}'> class="not-active-privilege" </s:if> style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;">Setup</a></li>
    <li><a href="../option/optionSettings" style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;">Interface</a></li>
	<li><a href="../user/userSetting" <s:if test='%{#session["user"].user==false}'> class="not-active-privilege" </s:if> style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;">User</a></li>
	<li><a href="#" style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;">Help</a></li>
	<li style="float: right"><a href="../logout" style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;">Logout</a></li>
	<li style="float: right"><a href="../user/changePassword" style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;"><s:property value="#session['user'].userId" /></a></li>
                                
</ul>
</div>
<center>
<br>
<div style="background: rgba(0, 0,0, 0.68);width: 40%">
<form method="get" action="">
<br>
<h2>LED/LCD Display Setting:</h2>
<br>
<label style="color:white;">No. of Line to be Displayed</label>
<select style="width:50px;">
<option value="3">3</option>
<option value="4">4</option>
<option value="5">5</option>
</select>
<br><br>
<button class="btn orange">Start LED TV</button> 
<button class="btn orange" style="background: #ce4c4a;">Close LED TV</button>
<br><br><br><br>
</form>
</div> 
<br>
<span style="color:green;"><s:property value="result"/></span>

</center>


<!-- ----------------------------------------------------- -->

<script type="text/javascript" src="../js/jquery.min.js"></script>

 <script type="text/javascript">
   $( document ).ready(function() {
   
   });
   
 </script>
 
 <!-- ----------------------------------------------------- -->
 <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> 
 <div id="footer"><p>&copy; 2016 Dan Electronic System Pvt. Ltd.<p></div>
</body>
</html> --%>

<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <TITLE>Personal Announcement</TITLE>
    <META http-equiv=Content-Type content="text/html; charset=utf-8"> 
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" type="text/css" href="../css/component.css" />
<!-- --Css for Menu-- -->
<style>

ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color: #335996;
    
}

li {
    float: left;
    
}

li a {
    display: block;
    color: white;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
}
.active {
    background-color: #03A9F4;
    color: white;
    }


 .vert {
 width: 20px;
 height: 200px;
 -webkit-appearance: slider-vertical;
 }
 
.not-active-privilege {
   pointer-events: none;
   cursor: default;
   opacity: 0.3;
}
 
</style>
<!-- --Css for Page-- -->

<!-- ------XXX------- -->
</head>
<body><div style="background: #111">
   <img src="../images/header2.png" width="100%" height="100" alt="header2"/>
<ul>

	<li><a href="../train/trainRunningInfo" style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;">Online Train</a></li>
	<li style=" float: left;"><a style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;" <s:if test='%{#session["user"].status==false}'> class="not-active-privilege" </s:if> href="../device/deviceStatus">Status</a></li>
	<li style="float: left;"><a href="../device/deviceConfig" <s:if test='%{#session["user"].display==false}'> class="not-active-privilege" </s:if> style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;">Display</a></li>
	<li style="float: left;"><a href="../device/deviceIntensity" <s:if test='%{#session["user"].intensity==false}'> class="not-active-privilege" </s:if> style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;">Intensity</a></li>
	<li style="float: left;"><a href="../log-report/logReport" <s:if test='%{#session["user"].logReport==false}'> class="not-active-privilege" </s:if> style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;">Log Report</a></li>
	<li><a class="active" href="#" style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;">CCTV</a></li> 
	<li><a href="../announcement/personalAnc" <s:if test='%{#session["user"].personalAnc==false}'> class="not-active-privilege" </s:if> style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;">PA</a></li>
	<li><a href="../message/getBoardMessageList" <s:if test='%{#session["user"].message==false}'> class="not-active-privilege" </s:if> style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;">Message</a></li>
	<li><a href="../setup/setup.jsp" <s:if test='%{#session["user"].setup==false}'> class="not-active-privilege" </s:if> style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;">Setup</a></li>
    <li><a href="../option/optionSettings" style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;">Interface</a></li>
	<li><a href="../user/userSetting" <s:if test='%{#session["user"].user==false}'> class="not-active-privilege" </s:if> style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;">User</a></li>
	<li><a href="../train/help.jsp" style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;">Help</a></li>
	<li style="float: right"><a href="../logout" style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;">Logout</a></li>
	<li style="float: right"><a href="../user/changePassword" style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;"><s:property value="#session['user'].userId" /></a></li>
    	<li style="float: right"><span style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;" id="time"></span></li>                            
</ul>
</div>
<center>
<br>
<div style="background: rgba(0, 0,0, 0.68);width: 40%">
<form method="get" action="">
<br>
<h2>LED/LCD Display Setting:</h2>
<br>
<!-- <label style="color:white;">No. of Line to be Displayed</label> -->
<%-- <select style="width:50px;">
<option value="3">3</option>
<option value="4">4</option>
<option value="5">5</option>
</select>
<br><br> --%>
<!-- <button class="btn orange" id="startLEDTV">Start LED TV</button>  -->
<button class="btn orange" id="configureLedTV" >Configure LED TV</button>
<br><br><br><br> -->
</form>
</div> 
<br>
<span style="color:green;"><s:property value="result"/></span>

</center> 

<!-- <div id="cctvData">
</div> -->
<!-- ----------------------------------------------------- -->

<script type="text/javascript" src="../js/jquery.min.js"></script>

 <script type="text/javascript">
   $( document ).ready(function() {
	  $('#startLEDTV').click(function(){
		  window.open('http://192.168.1.146/ipis/mode1', '_blank');	
		  	
	  });
	  
	  
	  $('#configureLedTV').click(function(){
		  window.open('http://localhost:8080/ipis/cctv/savepage', '_blank'); 
	  });
	   
   });
	   
   
 </script>
 
 <!-- ----------------------------------------------------- -->
 <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> 
 <div id="footer"><p>&copy; 2016 Dan Electronic System Pvt. Ltd.<p></div>
 <script type="text/javascript" src="../js/time.js"></script>  
</body>
</html>