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
<li><a class="active"  href="userSetting">User</a></li>
<li><a href="../train/help.jsp">Help</a></li>
<li style="float: right"><a href="../logout">Logout</a></li>
<li style="float: right"><a href="../user/changePassword"><s:property value="#session['user'].userId" /></a></li>
 <li style="float: right"><span style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;" id="time"></span></li>                              
</ul>
</div>

<div id="page-wrap" style="width: 75%"><br>
<h2 style="text-align: center">User Settings</h2>
<hr style="width: 100%">

<form id="userSettingForm" method="post">  
<div class="left" style="margin-left: 12%;color: white; font-size: large">
<input type="hidden" id="id" name="user.id" <s:if test="%{user.id!=0}"> value='<s:property value="user.id"/>' </s:if> >
<input type="hidden" id="createdAt" <s:if test="%{user.createdAt!=null}"> name="user.createdAt" value='<s:property value="user.createdAt"/>' </s:if> >
<table cellspacing="10">
 <tr><td>
<label>Select User</label>
</td><td>
<select id="userList">
    <s:if test='%{user.userId!=""}'>
     <option value='<s:property value="user.userId"/>' style="display: none;"><s:property value="user.userId"/></option>
    </s:if>
    <option value="">New</option>
    <s:iterator value="userList">
    <option value='<s:property value="userId"/>'><s:property value="userId"/></option>
    </s:iterator>
</select>
</td></tr>   
   
<tr><td><label>*User ID</label></td><td><input type="text" class="required" id="userId" name="user.userId" value='<s:property value="user.userId"/>' placeholder="Enter User Id"></td></tr>
<tr><td><label>*Password</label></td><td><input type="password" id="password" class="required" name="user.password" value='<s:property value="user.password"/>' placeholder="Enter Password"></td></tr>

</table>
</div>

<div class="right" style="margin-left: 5%;color: white; font-size: large">
<table cellspacing="10">
   
    <tr><td>
<label>*User Type</label>
</td><td>
<select name="user.userType" id="userType" class="required">
    <option selected="selected" value='<s:property value="user.userType"/>' style="display: none;"><s:property value="user.userType"/></option>
    <option value="Administrator">Administrator</option>
    <option value="Supervisor">Supervisor</option>
    <option value="Operator">Operator</option>
</select>
</td></tr>
    <tr><td><label>*Confirm Password</label></td><td><input type="password" id="confirmPassword" class="required" value='<s:property value="user.password"/>' placeholder="Confirm Password"></td></tr>


</table>
</div>
        <br>
        
<fieldset style="width: 75%;margin-left:14%; ">
<legend style="margin-left: 10%; color: white; font-size: large">Select Privileges</legend>
<div class="container" style="margin-left: 10%; color: white; font-size: larger; line-height: 2;">
     <div style="width: 11em; float: left;"><br>
     <input  type="checkbox"  name="user.status" value="true" <s:if test="%{user.status==true}">checked</s:if> />Status<br>
     <input  type="checkbox"  name="user.display" value="true" <s:if test="%{user.display==true}">checked</s:if> />Display<br>
     <input  type="checkbox"  name="user.intensity" value="true" <s:if test="%{user.intensity==true}">checked</s:if> />Intensity<br>
     <input  type="checkbox"  name="user.logReport" value="true" <s:if test="%{user.logReport==true}">checked</s:if> />Log Report<br>
</div><br>
   
 <div style="width: 11em; float: left;">
    <input  type="checkbox"  name="user.cctv" value="true" <s:if test="%{user.cctv==true}">checked</s:if> />CCTV<br>
	<input  type="checkbox"  name="user.personalAnc" value="true" <s:if test="%{user.personalAnc==true}">checked</s:if> />Personal Anc<br>
	<input  type="checkbox"  name="user.message" value="true" <s:if test="%{user.message==true}">checked</s:if> />Message<br>
	<input  type="checkbox"  name="user.setup" value="true" <s:if test="%{user.setup==true}">checked</s:if> />Setup<br>
</div>

<div style="width: 11em; float: left;">
    <input  type="checkbox"  name="user.interfaces" value="true" <s:if test="%{user.interfaces==true}">checked</s:if> />Interfaces<br>
    <input  type="checkbox"  name="user.user" value="true" <s:if test="%{user.user==true}">checked</s:if> />User<br>
<br></div>

</div></fieldset>
<br>
           
 <div id="buttons" style="text-align: center">
          
    <button id="saveOrUpdate" class="btn orange">Save</button>
    <button id="delete" class="btn purple">Delete</button>

  </div>
   <br>
</form> 
   
</div>
	


<!-- ----------------------------------------------------- -->

<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/blockUI.js"></script> 
<script src="../sweetalert-master/dist/sweetalert-dev.js"></script>

 <script type="text/javascript">
   $( document ).ready(function() {
	   
	   var userList=[];
	   var status='<s:property value="result"/>';
	   if(status==1)
		   {
		   swal("Data Saved Sucessfully");
		   }
	   
	   $("#userList option").each(function(){
		  if($(this).text()!="New"){
			  userList.push($(this).text()); 
		  }
	   });
	   
	   $("#userList").change(function(){
		  
		   if($('#userList option:selected').text()=="New"){
			   
			   $("#id").removeAttr("value");
			   $("#createdAt").removeAttr("value");
			   $("#userId").removeAttr("value");
			   $("#password").removeAttr("value");
			   $("#confirmPassword").removeAttr("value");
			   $("#userType option:first").attr("value","");
			   $("#userType option:first").text("");
			   $("#userId").focus();

			   $('input[type=checkbox]').each(function() {
				   $(this).attr('checked', false);
			   });
			   
		   }else{
			   var id=$('#userList option:selected').val();
			   window.location.href="getUserDetail?id="+id;
		   }
		   
	   });
	   
	 //----------------------check duplicate user-------------------------------
	   
	   $("#userId").blur(function(){
		   
		   if($("#userList option:selected").text()=="New"){
		       
			   var duplicate=0;
			   for(var i=0;i<userList.length;i++){
				   if(userList[i]==this.value){
					   duplicate++;  
				   }
			   }
			   
			   if(duplicate!=0){
				   swal("User Id already Exist");
				   $("#userId").removeAttr("value");
				   $("#userId").focus();
			   }
		   
		   }
		   
	   });
	   
	   //----------------------validate Form before submit-------------------------------
	   
	   $("#saveOrUpdate").click(function(e){
		   e.preventDefault();
		   
		   var emptyFields = 0;
		   
		   $('.required').each(function() {
			   if($(this).val() == ""){
			    	emptyFields++;
			    }
			});
		   
			if (emptyFields == 0) {				
				if( $("#password").val()==$("#confirmPassword").val()){
					
					$("#userSettingForm").attr("action","saveOrUpdateUser").submit();
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
	   
	 //----------------------delete user-------------------------------
	 
	   $("#delete").click(function(e){
			  
		   e.preventDefault();
		   
		   if($('#userList option:selected').text()!="New"){
			  
			   var id=$('#userList option:selected').val();
			   window.location.href="deleteUser?id="+id;
		   
	      }else{
	    	  
	    	  swal("Please select user");
	      }
		   
	   });

   
   });
   
 </script>
 
 <!-- ----------------------------------------------------- -->
 
 <script type="text/javascript" src="../js/time.js"></script>  
</body>
</html>