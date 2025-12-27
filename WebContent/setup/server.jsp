<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

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
    color: white;}
  
</style>
<style type="text/css">
.left{
display: inline-block;
vertical-align: top;
}
.right{
display: inline-block;
margin-left: 20px;
}
table td{
height:30px;
}
select{
width:150px;
}
#lefPosition{
width:25px;
}
#topPosition{
width:25px;
}
.vert {
-webkit-appearance: slider-vertical;
}
</style>
<style type="text/css">
fieldset{
width:300px;
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

	
if($(".serverIp1").val()!=""){
  $("#save").attr("disabled","disabled")
}

$('#edit').click(function() {
	$(".serverIp1").removeAttr("disabled");
    $(".subnetMask1").removeAttr("disabled");
    $(".serverType1").removeAttr("disabled"); 
    $(".serverIp2").removeAttr("disabled");
    $(".configServer").removeAttr("disabled");
    $("#save").removeAttr("disabled");
    return false;
});

$( ".subnetMask1" ).blur(function() {
	$( ".subnetMask2" ).val($( ".subnetMask1" ).val());
});

$("#save").click(function(e){
	e.preventDefault();
	var configPath=$("#configPath").val();
	if(configPath==""){
		swal("Please Enter the path of MySqlServer");
	}
	else{
		 $('.tab').addClass("not-active-privilege");
		 $.post("saveServerDetail",$( "#serverDetailForm" ).serialize(),function(data){
			 
	    	if(data!=null){
	    		 var jsonData=JSON.parse(data);
		    		$("#binPos").val(jsonData[0]);
		    		$("#logPos").val(jsonData[1]);
	    	}	
			
	    	 });
	}
	
});

$("#reset").click(function(e){
	e.preventDefault();
	var configPath=$("#configPath").val();
	if(configPath==""){
		swal("Please Enter the path of MySqlServer");
	}
	else{
		
		 $.post("resetServer",$( "#serverDetailForm" ).serialize(),function(data){
	    	if(data!=null){
				
	    	}	
			
	    	 });
	}
	
});

$( ".serverType1" ).change(function() {
  $( ".serverType2" ).empty();
  if(this.value==2){
  $(".serverType2").append('<option value="1">Primary</option><option value="2">Secondary</option>');
  }else{
	 $(".serverType2").append('<option value="2">Secondary</option><option value="1">Primary</option>');  
  }
});



});
</script>
</head>
<body>
<div style="background: #111">
   <img src="../images/header2.png" width="100%" height="100" alt="header2"/>
<ul>

	<li style=" float: left;"><a class="tab" style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;" href="../train/trainRunningInfo">Online Train</a></li>
	<li style=" float: left;"><a class="tab" style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;" <s:if test='%{#session["user"].status==false}'> class="not-active-privilege" </s:if> href="../device/deviceStatus">Status</a></li>
	<li style=" float: left;"><a class="tab" style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;" <s:if test='%{#session["user"].display==false}'> class="not-active-privilege" </s:if> href="../device/deviceConfig">Display</a></li>
	<li style=" float: left;"><a class="tab" style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;" <s:if test='%{#session["user"].intensity==false}'> class="not-active-privilege" </s:if> href="../device/deviceIntensity">Intensity</a></li>
	<li style=" float: left;"><a class="tab" style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;" <s:if test='%{#session["user"].logReport==false}'> class="not-active-privilege" </s:if> href="../log-report/logReport">Log Report</a></li>
 	<li style=" float: left;"><a class="tab" style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;" <s:if test='%{#session["user"].cctv==false}'> class="not-active-privilege" </s:if> href="../cctv/led-lcd-display.jsp">CCTV</a></li> 
	<li style=" float: left;"><a class="tab" style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;" <s:if test='%{#session["user"].personalAnc==false}'> class="not-active-privilege" </s:if> href="../announcement/personalAnc">PA</a></li>
	                      
	<li style=" float: left;"><a class="tab" style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;" <s:if test='%{#session["user"].message==false}'> class="not-active-privilege" </s:if> href="../message/getBoardMessageList">Message</a></li>
	<li style=" float: left;" class="active tab" ><a  style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;" href="../setup/setup.jsp">Setup</a></li>
	<li style=" float: left;"><a class="tab" style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;" <s:if test='%{#session["user"].interfaces==false}'> class="not-active-privilege" </s:if> href="../option/optionSettings">Interface</a></li>
	<li style=" float: left;"><a class="tab" style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;" <s:if test='%{#session["user"].user==false}'> class="not-active-privilege" </s:if> href="../user/userSetting">User</a></li>
	<li style=" float: left;"><a class="tab" style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;" href="../train/help.jsp">Help</a></li>
	<li style="float: right"><a class="tab" style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;" href="../logout">Logout</a></li>
	<li style="float: right"><a class="tab" style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;" href="../user/changePassword"><s:property value="#session['user'].userId" /></a></li>
    <li style="float: right"><span style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;" id="time"></span></li>                            
</ul>
</div>
<div style="width: 100%;  color: white;">
<ul style=" background-color: #222213">
<li style="display: block;color: white;text-align: center;padding: 3px 20px;text-decoration: none;float: left;" ><img src="../images/arrow.PNG" style="margin-bottom: -5px">Setup</li>
<li style="display: block;color: white;text-align: center;padding: 3px 20px;text-decoration: none;float: left;" ><img src="../images/arrow.PNG" style="margin-bottom: -5px">Master</li>
<li style="display: block;color: white;text-align: center;padding: 3px 20px;text-decoration: none;float: left;" ><img src="../images/arrow.PNG" style="margin-bottom: -5px">Server Master</li>
</ul>
</div>
<div id="nav">
<div id='cssmenu'>
<ul>
   <li><a class="tab" href='getStationDetail'>Station Master</a></li>
    <li><a class="tab" href='getIntegration'>Integration / NTES</a></li>
   <li class='active'><a class="tab" href='getServerDetail'>Server Master</a></li>
      <li><a class="tab" href='getLanguageList'>Language Master</a></li>
   <li><a class="tab" href='getTrainStatusList'>Status Master</a></li>
        <li><a class="tab" href='../train/getAllTrainList'>Train Master</a></li>
   <li><a class="tab" href='../train/coachEntry'>Coach Position</a></li>
    <li><a class="tab" href='setup.jsp'>Back</a></li>
</ul>
</div>
</div>
<div id="displaynew">
<form method="post" action="saveServerDetail" id="serverDetailForm" style="text-align: center;"><br>
<fieldset style="margin-right: 10px">
<legend>PC1</legend>
<input type="hidden" name="server1.id" value="<s:property value="serverDetailList[0].id"/>">
<table cellspacing="10">
<tr><td><label>IP Address</label></td><td><input name="server1.serverIp" class="serverIp1" type="text" value="<s:property value="serverDetailList[0].serverIp"/>" disabled></td></tr>
<tr><td><label>Subnet Mask</label></td><td><input name="server1.subnetMask" class="subnetMask1" type="text" value="<s:property value="serverDetailList[0].subnetMask"/>" disabled></td></tr>
<tr><td>
<label>Server Type</label>
</td><td>
<select name="server1.serverType" class="serverType1" disabled>
<s:if test="%{serverDetailList[0].serverType==2}">
<option value="2">Secondary</option>
<option value="1">Primary</option>
</s:if>
<s:else>
<option value="1">Primary</option>
<option value="2">Secondary</option>
</s:else>
</select>
</td></tr>
</table>
</fieldset  >
<fieldset style="margin-left: 10px">
<legend>PC2</legend>
<input type="hidden" name="server2.id" value="<s:property value="serverDetailList[1].id"/>">
<table cellspacing="10">
<tr><td><label>IP Address</label></td><td><input name="server2.serverIp" class="serverIp2" type="text" value="<s:property value="serverDetailList[1].serverIp"/>" disabled></td></tr>
<tr><td><label>Subnet Mask</label></td><td><input name="server2.subnetMask" class="subnetMask2" type="text" value="<s:property value="serverDetailList[1].subnetMask"/>" disabled></td></tr>
<tr><td>
<label>Server Type</label>
</td><td>
<select name="server2.serverType" class="serverType2" disabled>
<s:if test="%{serverDetailList[1].serverType==1}">
<option value="1">Primary</option>
<option value="2">Secondary</option>
</s:if>
<s:else>
<option value="2">Secondary</option>
<option value="1">Primary</option>
</s:else>
</select>
</td></tr>
</table>
</fieldset>
<br> 
<br>
<table style="margin-left: 215px;">
<tr>
<td>
<label>Server Config</label>
</td>
<td>  
<select name="server1.configServer"  style="width:100px" class="configServer" disabled>
<option value="1" <s:if test="%{serverDetailList[0].configServer==1}">selected</s:if>>Primary</option>
<option value="2" <s:if test="%{serverDetailList[0].configServer==2}">selected</s:if>>Secondary</option>
</select>
</td>
</tr>
<tr>
<td>
<label>MySQl Config Path</label>
</td>
<td>
<input type="text" id="configPath" name="server1.configPath" value="<s:property value="serverDetailList[0].configPath"/>"/>
</td>
</tr>

<tr>
<td>
<label>Log Position</label>
</td>
<td>
<input type="text" name="server1.logPosition" id="logPos" value="<s:property value="serverDetailList[0].logPosition"/>"/>
</td>
</tr>

<tr>
<td>
<label>MySQL Position</label>
</td>
<td>
<input type="text" name="server1.binPosition" id="binPos" value="<s:property value="serverDetailList[0].binPosition"/>"/>
</td>
</tr>

</table>
<div id="buttons" style="text-align: center"><br>
  <button class="btn orange" id="save">Save</button>
  <button class="btn purple" id="edit">Edit</button>
  <button class="btn orange" id="reset">Reset</button>
 </div>
<br><span style="color:green;"><s:property value="result"/></span>
</form></div><br><br><br><br><br><br><br><br><br><br>
<div id="footer"><p>&copy; 2016 Dan Electronic System Pvt. Ltd.<p></div>
<script type="text/javascript" src="../js/time.js"></script>  
</body>
</html>