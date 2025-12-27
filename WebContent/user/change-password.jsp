<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <TITLE>User Settings</TITLE>
    <META http-equiv=Content-Type content="text/html; charset=utf-8"> 
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" type="text/css" href="../css/component.css" />
    <link rel="stylesheet" href="../sweetalert-master/dist/sweetalert.css">
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
    padding: 5px 16px;
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
</style>
<style type="text/css">
input[type="checkbox"]{
  width: 20px; /*Desired width*/
  height: 20px; /*Desired height*/
}

.not-active-privilege {
   pointer-events: none;
   cursor: default;
   opacity: 0.3;
}

#oldPassword{
 border:2px solid red;
}

</style>
</head>
<body>
     <div style="background: #111">
   <img src="../images/header2.png" width="100%" height="100" alt="header2"/>
<ul>

<li><a href="../train/trainRunningInfo">Online Train</a></li>
<li><a href="../device/deviceStatus" <s:if test='%{#session["user"].status==false}'> class="not-active-privilege" </s:if> >Status</a></li>
<li><a href="../device/deviceConfig" <s:if test='%{#session["user"].display==false}'> class="not-active-privilege" </s:if> >Display</a></li>
<li><a href="../device/deviceIntensity" <s:if test='%{#session["user"].intensity==false}'> class="not-active-privilege" </s:if> >Intensity</a></li>
<li><a href="../log-report/logReport" <s:if test='%{#session["user"].logReport==false}'> class="not-active-privilege" </s:if> >Log Report</a></li>
<li><a href="../cctv/led-lcd-display.jsp" <s:if test='%{#session["user"].cctv==false}'> class="not-active-privilege" </s:if>>CCTV</a></li>
<li><a href="../announcement/personalAnc" <s:if test='%{#session["user"].personalAnc==false}'> class="not-active-privilege" </s:if> >PA</a></li>
                      
<li><a href="../message/getBoardMessageList" <s:if test='%{#session["user"].message==false}'> class="not-active-privilege" </s:if> >Message</a></li>
<li><a href="../setup/setup.jsp" <s:if test='%{#session["user"].setup==false}'> class="not-active-privilege" </s:if> >Setup</a></li>
<li><a href="../option/optionSettings" <s:if test='%{#session["user"].interfaces==false}'> class="not-active-privilege" </s:if> >Interface</a></li>
<li><a href="userSetting" <s:if test='%{#session["user"].user==false}'> class="not-active-privilege" </s:if> >User</a></li>
<li><a href="../train/help.jsp">Help</a></li>
<li style="float: right"><a href="../logout">Logout</a></li>
<li style="float: right"><a class="active" href="#"><s:property value="#session['user'].userId" /></a></li>
<li style="float: right"><span style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;" id="time"></span></li>                               
</ul>
</div>

<div id="page-wrap" style="width: 45%; margin-top:7%; text-align: center"><br>
<h2 style="text-align: center">Change Password</h2>
<hr style="width: 100%">

<form id="changePasswordForm" method="post">  
<div class="left" style="color: white; font-size: large">
<input type="hidden" id="id" name="id" value='<s:property value="#session['user'].userId" />' >
<table cellspacing="10">
 <tr><td><label>*Old Password</label></td><td><input type="password" id="oldPassword" class="required" name="oldPassword" placeholder="Enter Old Password"></td></tr>
 <tr><td><label>*New Password</label></td><td><input type="password" id="password" class="required" name="newPassword" placeholder="Enter Password"></td></tr>
 <tr><td><label>*Confirm Password</label></td><td><input type="password" id="confirmPassword" class="required" placeholder="Confirm Password"></td></tr>
</table>
</div>
 <br><button id="changePassword" class="btn orange">Save</button>
</form> 
<br> 
</div>
	
<!-- ----------------------------------------------------- -->

<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/blockUI.js"></script> 
<script src="../sweetalert-master/dist/sweetalert-dev.js"></script>

 <script type="text/javascript">
   $( document ).ready(function() {
	  
	   //----------------------validate Form before submit-------------------------------
	   
	   $("#changePassword").click(function(e){
		   e.preventDefault();
		   
           var emptyFields = 0;
		   
		   $('.required').each(function() {
			   if($(this).val() == ""){
			    	emptyFields++;
			    }
			});
		   
			if (emptyFields == 0) {
				if( $("#password").val()==$("#confirmPassword").val()){
					$("#changePasswordForm").attr("action","changeUserPassword").submit();
				}else{
					swal("Password mismatched");
					$("#confirmPassword").removeAttr("value");
					$("#confirmPassword").focus();
				}
				
			} else {
				swal("Please fill in all the required fields (indicated by *)");
			   return false;
			}
			
	   });
	 
	   
   });
   
 </script>
 <script type="text/javascript" src="../js/time.js"></script>  
 <!-- ----------------------------------------------------- -->
 
 
</body>
</html>