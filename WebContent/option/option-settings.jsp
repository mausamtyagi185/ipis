<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <TITLE>Personal Announcement</TITLE>
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
	<li><a href="../cctv/led-lcd-display.jsp" <s:if test='%{#session["user"].cctv==false}'> class="not-active-privilege" </s:if> style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;">CCTV</a></li> 
	<li><a href="../announcement/personalAnc" <s:if test='%{#session["user"].personalAnc==false}'> class="not-active-privilege" </s:if> style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;">PA</a></li>
	<li><a href="../message/getBoardMessageList" <s:if test='%{#session["user"].message==false}'> class="not-active-privilege" </s:if> style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;">Message</a></li>
	<li><a href="../setup/setup.jsp" <s:if test='%{#session["user"].setup==false}'> class="not-active-privilege" </s:if> style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;">Setup</a></li>
    <li><a  class="active" href="optionSettings" style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;">Interface</a></li>
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
<form method="post" action="saveOptions" id="interfaceForm">
<s:if test="%{option.id!=0}">
<input type="hidden" name="option.id" value='<s:property value="option.id"/>'>
</s:if>
<table class="table1" style="width:500px; background-color: white;">
<thead>
<tr>
<th>Select</th>
<th>Interface Setting</th>
</tr></thead>
<tr>
<td><input type="checkbox" style="width: 25px;height: 20px" name="option.platformAnc" value='true' <s:if test="%{option.platformAnc==true}">checked</s:if> ></td>
<td>Deactivate Platform Anc</td>
</tr>
<!-- <tr>
<td><input type="checkbox" id="setResetState" style="width: 25px;height: 20px" name="option.reset" value='true' <s:if test="%{option.reset==true}">checked</s:if> ></td>
<td>Set Reset State</td>
</tr>
<tr>
<td><input type="checkbox" id="clearState" style="width: 25px;height: 20px" name="option.clearReset" value='true' <s:if test="%{option.clearReset==true}">checked</s:if> ></td>
<td>Clear Reset State</td>
</tr> -->
<tr>
<td><input type="checkbox" id="taddb" style="width: 25px;height: 20px" name="option.taddb" value='true' <s:if test="%{option.taddb==true}">checked</s:if> ></td>
<td>Deactivate TADDB</td>
</tr>
<tr>
<td><input type="checkbox" id="cgdb" style="width: 25px;height: 20px" name="option.cgdb" value='true' <s:if test="%{option.cgdb==true}">checked</s:if> ></td>
<td>Deactivate CGDB</td>
</tr>
<tr>
<td><input type="checkbox" id="tvDisplay" style="width: 25px;height: 20px" name="option.tvDisplay" value='true' <s:if test="%{option.tvDisplay==true}">checked</s:if> ></td>
<td>Deactivate TV Display</td>
</tr>
</table>
<br>
<button id="save" class="btn orange">Save</button>
<br><br>
</form>
</div> 
<br>
<span style="color:green;"><s:property value="result"/></span>

</center>


<!-- ----------------------------------------------------- -->

<script type="text/javascript" src="../js/jquery.min.js"></script>
<script src="../sweetalert-master/dist/sweetalert-dev.js"></script>
<script type="text/javascript" src="../js/blockUI.js"></script> 
 <script type="text/javascript">
 $( document ).ready(function() {
	  var clearReset='<s:property value="option.clearReset"/>'; 	 
	 
	 $("#setResetState").change(function(){
		 var clearState=$("#clearState").is(':checked');
		 if(clearState==true){
			 document.getElementById("clearState").checked=false;
		 }
	 });
	 $("#clearState").change(function(){
		 var setReset=$("#setResetState").is(':checked');
		 if(setReset==true){
			 document.getElementById("setResetState").checked=false;
		 }
	 });
	   $("#save").click(function(event){
		  var setReset=$("#setResetState").is(':checked');
		  var clearState=$("#clearState").is(':checked');
		  if(setReset==true){
			  event.preventDefault();
			    swal({
			        title: "Confirmation?",
			        text: "Are You Sure, you want to Reset all the Boards",
			        type: "warning",
			        showCancelButton: true,
			        confirmButtonColor: '#03A9F4',
			        confirmButtonText: 'Yes, I am sure!',
			        cancelButtonText: "No, cancel it!",
			        closeOnConfirm: true
			    },function(){
			    	$("#interfaceForm").attr("action","saveOptions");
			    	 $("#interfaceForm").submit();
			    	  
			    });  
		  }
		  else if(clearState==true && clearReset.indexOf("true")>-1){
		
			  event.preventDefault();
			    swal("System is already in Clear Reset State!");
			    $("#interfaceForm").attr("action","saveOptions");
			    $("#interfaceForm").submit();
			  
		  }
		  else if(clearState==true && clearReset==false){
			  $("#interfaceForm").attr("action","saveOptions");
		    	 $("#interfaceForm").submit();
		  }
		  
	   });

	   
	   });
   
 </script>
 
 <!-- ----------------------------------------------------- -->
 <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> 
 <div id="footer"><p>&copy; 2016 Dan Electronic System Pvt. Ltd.<p></div>
 <script type="text/javascript" src="../js/time.js"></script>  
</body>
</html>