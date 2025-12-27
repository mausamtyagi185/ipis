<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@taglib uri="/struts-tags" prefix="s" %>
<html>

<head>
	<meta charset='UTF-8'>
	
	<title>Station Master</title>
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="../css/style.css">
	<link rel="stylesheet" href="../sweetalert-master/dist/sweetalert.css">
	
 <style>

ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color: #335996;
    
}


li a {
    display: block;
    color: white;
 
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
    -webkit-appearance: slider-vertical;}
</style>
<style type="text/css">
table tr td input{
width:50px;

}
table tr td select{
width:150px;
height: 35px;
    
}
.left table tr td input{
width:100%;
}
.left{
display: inline-block;
}
.right{
margin-left:20px;
color:white;
display: inline-block;
}

.not-active-privilege {
   pointer-events: none;
   cursor: default;
   opacity: 0.3;
}

</style>
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script src="../sweetalert-master/dist/sweetalert-dev.js"></script>
<script type="text/javascript">
$( document ).ready(function() {
	
	$( "#validateUser" ).click(function() {
		$.getJSON("setupMaster",function(data){
			
			if(data==1){
				window.location.href="getStationDetail";
			}else{
				$( "#page-wrap" ).css("display","block");
			}
			
        });
		
		
		
	});
	
	/* var userType='<s:property value="user.userType"/>';
	alert(userType); */
	
	
	
	document.addEventListener("keypress", function(e){
		  if(e.keyCode==13) {
			  $("#login").click();
			  }
		
	}, false);
	
	$( "#login" ).click(function() {
		
		var id=$( "#userId" ).val();
		var password=$( "#password" ).val();
		
		//============call ajax to validate user again================
		
		$.getJSON("reValidateUser?id="+id+"&password="+password,function(data){
			
			if(data.result=="valid"){
				window.location.href="getStationDetail";
			}else{
				swal("Invalid userId and Password");
				$( "#password" ).val("");
			}
			
        });
			
		
		
	});
	
});

</script>
</head>

<body>
      <div style="background: #111">
   <img src="../images/header2.png" width="100%" height="100" alt="header2"/>
<ul>
	
 				<li style=" float: left;"><a style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;" href="../train/trainRunningInfo">Online Train</a></li>
 				<li style=" float: left;"><a style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;" <s:if test='%{#session["user"].status==false}'> class="not-active-privilege" </s:if> href="../device/deviceStatus">Status</a></li>
				<li style=" float: left;"><a style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;" <s:if test='%{#session["user"].display==false}'> class="not-active-privilege" </s:if> href="../device/deviceConfig">Display</a></li>
				<li style=" float: left;"><a style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;" <s:if test='%{#session["user"].intensity==false}'> class="not-active-privilege" </s:if> href="../device/deviceIntensity">Intensity</a></li>
				<li style=" float: left;"><a style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;" <s:if test='%{#session["user"].logReport==false}'> class="not-active-privilege" </s:if> href="../log-report/logReport">Log Report</a></li>
 				<li style=" float: left;"><a style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;" <s:if test='%{#session["user"].cctv==false}'> class="not-active-privilege" </s:if> href="../cctv/led-lcd-display.jsp">CCTV</a></li> 
				<li style=" float: left;"><a style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;" <s:if test='%{#session["user"].personalAnc==false}'> class="not-active-privilege" </s:if> href="../announcement/personalAnc">PA</a></li>
                          
				<li style=" float: left;"><a style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;" <s:if test='%{#session["user"].message==false}'> class="not-active-privilege" </s:if> href="../message/getBoardMessageList">Message</a></li>
				<li style=" float: left;" class="active" ><a  style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;" href="../setup/setup.jsp">Setup</a></li>
                <li style=" float: left;"><a style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;" <s:if test='%{#session["user"].interfaces==false}'> class="not-active-privilege" </s:if> href="../option/optionSettings">Interface</a></li>
				<li style=" float: left;"><a style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;" <s:if test='%{#session["user"].user==false}'> class="not-active-privilege" </s:if> href="../user/userSetting">User</a></li>
				<li style=" float: left;"><a style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;" href="../train/help.jsp">Help</a></li>
                <li style="float: right"><a style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;" href="../logout">Logout</a></li>
                <li style="float: right"><a style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;" href="../user/changePassword"><s:property value="#session['user'].userId" /></a></li>
                	<li style="float: right"><span style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;" id="time"></span></li>                
</ul>
</div>

		
<div id="nav">
<div id='cssmenu'>
<ul>
<!--     <li class='active'><a id="validateUser" href='getStationDetail'>Master</a></li> -->
    <li class='active'><a id="validateUser" href='#'>Master</a></li>
    <li><a href='getDivertedStationList'>Caption</a></li>
    <li><a href='getSystemFont'>Board Setup</a></li>
   
</ul>
</div>
</div>
<div style="height: 540px">
 
<div id="page-wrap" style="width: 40%; margin-top:7%; text-align: center; display:none;"><br>
<h2 style="text-align: center">User Login</h2>
<hr style="width: 100%">

<div class="left" style="color: white; font-size: large">
<input type="hidden" id="id" name="id" value='<s:property value="#session['user'].userId" />' >
<table cellspacing="10">
 <tr><td><label>User Id</label></td><td><input type="text" id="userId" placeholder="Enter User Id"></td></tr>
 <tr><td><label>Password</label></td><td><input type="password" id="password" placeholder="Enter Password"></td></tr>
</table>
</div>
 <br><a id="login" class="btn orange">Login</a>
<br><br><br>
</div>
 
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br></div>	
<div id="footer"><p>&copy; 2016 Dan Electronic System Pvt. Ltd.<p></div>
<script type="text/javascript" src="../js/time.js"></script>  

</body>

</html>