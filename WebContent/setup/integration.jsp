<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@taglib uri="/struts-tags" prefix="s" %>
<html>

<head>
	<meta charset='UTF-8'>
	
	<title>Station Master</title>
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<link rel="stylesheet" href="../css/integration.css">
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
<script type="text/javascript">
$( document ).ready(function() {
	
	
	
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
				<li style=" float: left;" class="active"><a  style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;" href="../setup/setup.jsp">Setup</a></li>
                <li style=" float: left;"><a style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;" <s:if test='%{#session["user"].interfaces==false}'> class="not-active-privilege" </s:if> href="../option/optionSettings">Interface</a></li>
				<li style=" float: left;"><a style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;" <s:if test='%{#session["user"].user==false}'> class="not-active-privilege" </s:if> href="../user/userSetting">User</a></li>
				<li style=" float: left;"><a style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;" href="../train/help.jsp">Help</a></li>
                <li style="float: right"><a style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;" href="../logout">Logout</a></li>
                <li style="float: right"><a style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;" href="../user/changePassword"><s:property value="#session['user'].userId" /></a></li>
                	<li style="float: right"><span style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;" id="time"></span></li>                
</ul>
</div>
<div style="width: 100%;  color: white;">
<ul style=" background-color: #222213">
<li style="display: block;color: white;text-align: center;padding: 3px 20px;text-decoration: none;float: left;" ><img src="../images/arrow.PNG" style="margin-bottom: -5px">Setup</li>
<li style="display: block;color: white;text-align: center;padding: 3px 20px;text-decoration: none;float: left;" ><img src="../images/arrow.PNG" style="margin-bottom: -5px">Master</li>
<li style="display: block;color: white;text-align: center;padding: 3px 20px;text-decoration: none;float: left;" ><img src="../images/arrow.PNG" style="margin-bottom: -5px">Integration / NTES</li>
</ul>
</div>
		
<div id="nav">
<div id='cssmenu'>
<ul>
   <li><a href='getStationDetail'>Station Master</a></li>
   <li class='active'><a href='getIntegration'>Integration / NTES</a></li>
   <li><a href='getServerDetail'>Server Master</a></li>
      <li><a href='getLanguageList'>Language Master</a></li>
   <li><a href='getTrainStatusList'>Status Master</a></li>
    <li><a href='../train/getAllTrainList'>Train Master</a></li>
   <li><a href='../train/coachEntry'>Coach Position</a></li>
    <li><a href='setup.jsp'>Back</a></li>
</ul>
</div>
</div>
<div  class="right" style="background: rgba(0, 0, 0, 0.68);width: 80%;height:60%">
<br>
<br>
<fieldset>
<legend>Third Party Integration</legend>
<form method="post" action="updateIntegration" enctype="multipart/form-data">
<table>
<tr>
<td rowspan=2>
<input type="checkbox" value="true" <s:if test='%{station.enableIntegration==true}'>checked</s:if> name="station.enableIntegration" style="width:30px; height:16px">
<label>Enable Integration</label>
</td>
<td>
<input type="radio" name="station.masterSystemEnabled" value="true" <s:if test='%{station.masterSystemEnabled==true}'>checked</s:if> style="margin-left:30px;width: 16px;height: 15px;" >
<label style="font-size:20px">Master System</label>
</td>
<td>
 <label style="font-size:20px;margin-left:30px;">Text File Location</label>
</td>
</tr>
<tr>
<td>
<input type="radio" name="station.masterSystemEnabled" value="false" <s:if test='%{station.masterSystemEnabled==false}'>checked</s:if> style="margin-left:30px; width: 16px;height: 15px;" >
<label style="font-size:20px">Secondary System</label>
</td>
<td>
<input type="text" name="station.filePath" value="<s:property value='station.filePath'/>" style="margin-left:30px;" />
 <input type="file" name="fileUpload" id="fileLocation"/>
</td>
</tr>
</table>
<br>
<div id="buttons" style="text-align: center">
<button class="btn orange" id="save">Submit</button>
</div>

</form>

</fieldset>

<br>
<br>
<br>

<fieldset>
<legend>NTES</legend>

<table>
<tr>
<td rowspan=4>
<input type="checkbox" value="false" style="width:30px; height:16px">
<label>NTES Update Enable </label>
</td>
<td>
<label style="font-size:20px;margin-left: 35px;">NTES Update Time (in Minutes)</label>
</td>
<td>
<input type="number" min=0 >
</td>

</tr>
<tr>
<td>
<label style="font-size:20px;margin-left: 35px;">NTES Port Type</label>
</td>
<td>
<select  name="station">
<option value="Ethernet">Ethernet</option>
<option value="Serial">Serial</option>
</select>
</td>
</tr>

<tr>
<td>
<label style="font-size:20px;margin-left: 35px;">Baud Rate</label>
</td>
<td>
<select  name="station">
<option value="9600">9600</option>
<option value="19200">19200</option>
<option value="57600">57600</option>
</select>
</td>
</tr>

<tr>
<td>
<label style="font-size:20px;margin-left: 35px;">Port Number</label>
</td>
<td>
<select  name="station">
<option value="COM 1">COM 1</option>
<option value="COM 2">COM 2</option>
<option value="COM 3">COM 3</option>
<option value="COM 4">COM 4</option>
</select>
</td>
</tr>
</table>


</fieldset>


<%-- <form id="stationDetailForm" action="#" method="post" enctype="multipart/form-data" style="text-align: center;">
<input type="hidden" name="station.id" value="<s:if test="%{station.id!=0}"><s:property value='station.id'/></s:if>">
<div class="left" >
<table cellspacing="10">
<tr><td><label>Station Name</label></td><td><input type="text" name="station.stationName" value="<s:property value='station.stationName'/>"></td></tr>
<tr><td><label>Station Code</label></td><td><input type="text" class="toUpper" id="stationcode" name="station.stationCode" value="<s:property value='station.stationCode'/>"></td></tr>
<tr><td><label>Division Code</label></td><td><input type="text" class="toUpper" id="divisioncode" name="station.divisionCode" value="<s:property value='station.divisionCode'/>"></td></tr>
<tr><td><label>Railway Zone</label></td><td><input type="text" class="toUpper" id="railwayZone" name="station.railwayZone" value="<s:property value='station.railwayZone'/>"></td></tr>
</table>
</div>
<div class="right" style="margin-left: 5%">
<table cellspacing="10">
<tr><td>
<label>First Language</label>
</td><td>
<select name="station.firstLanguage">
<option value="<s:property value='station.firstLanguage'/>"><s:property value='station.firstLanguage'/></option>
<s:iterator value="languageList"> 
<option value="<s:property value="languageName"/>"><s:property value="languageName"/></option>
</s:iterator>
</select>
</td>
<td>
<s:select list="languageList" listValue="languageName" name="station.firstLanguage" label="First Language" listKey="languageName"/>
</td>
</tr>

<tr><td>
<label>Second Language</label>
</td><td>
<select name="station.secondLanguage">
<option value="<s:property value='station.secondLanguage'/>"><s:property value='station.secondLanguage'/></option>
<s:iterator value="languageList">
<option value="<s:property value="languageName"/>"><s:property value="languageName"/></option>
</s:iterator>
</select>
</td>
<td>
<s:select list="languageList" listValue="languageName" name="station.secondLanguage" label="Second Language" listKey="languageName"/>
</td>
</tr>

<tr><!-- <td>
<label>Third Language</label>
</td> -->
<select id="thirdLang" name="station.thirdLanguage">
<option type="hidden" value="<s:property value='station.thirdLanguage'/>"><s:property value='station.thirdLanguage'/></option>
<s:iterator value="languageList">
<option value="<s:property value="languageName"/>"><s:property value="languageName"/></option>
</s:iterator>
</select> 
<td>
<s:select list="languageList" listValue="languageName" name="station.thirdLanguage" label="Third Language" listKey="languageName"/>
</td></tr>
</table>
</div>
<br>
<div >
 <label>Auto Train Load Time</label>
<select name="station.autoTrainLoadTime" style="width: 50px; height: 30px">
<option value="<s:property value='station.autoTrainLoadTime'/>"><s:property value='station.autoTrainLoadTime'/></option>
<script>
for(var i=0; i<=6;i++)
document.write("<option value="+i+">"+i+"</option>");
</script>
</select>  <label>(In Minute)</label><br><br>
</div>


<!--  <input type="radio" value="1" name="station.integration">Main System
<label>Text File Location</label>

<input type="radio" value="2" name="station.integration">Secondary System
 <input type="file" id="fileUpload" name="station.textFile" class="upload" />  -->


<label>Number of Platform</label> &nbsp;&nbsp;
<select id="platformNo" name="station.numberOfPlateform" style="width: 50px; height: 30px">
<script>

var platformNo=<s:property value='station.numberOfPlateform'/>;
for(var i=1;i<=24;i++){
	 var option = document.createElement("option");
	 option.text =i;
	 option.value=i;
	 if(platformNo==i)
		 {
		 option.selected=true;
		 }
   document.getElementById("platformNo").appendChild(option);
}
</script>
</select>



<input type="hidden" id="platformNos" name="station.platformNos" value="<s:property value="station.platformNos"/>"/>
<table style="margin-left: 25%" cellspacing="10">
<tr><td><input id="1" type="text" disabled="disabled" maxlength="3"></td><td><input id="2" type="text" disabled="disabled" maxlength="3"></td><td><input id="3" type="text" disabled="disabled" maxlength="3"></td><td><input id="4" type="text" disabled="disabled" maxlength="3"></td><td><input id="5" type="text" disabled="disabled" maxlength="3"></td><td><input id="6" type="text" disabled="disabled" maxlength="3"></td><td><input id="7" type="text" disabled="disabled" maxlength="3"></td><td><input id="8" type="text" disabled="disabled" maxlength="3"></td></tr>
<tr><td><input id="9" type="text" disabled="disabled" maxlength="3"></td><td><input id="10" type="text" disabled="disabled" maxlength="3"></td><td><input id="11" type="text" disabled="disabled" maxlength="3"></td><td><input id="12" type="text" disabled="disabled" maxlength="3"></td><td><input id="13" type="text" disabled="disabled" maxlength="3"></td><td><input id="14" type="text" disabled="disabled" maxlength="3"></td><td><input id="15" type="text" disabled="disabled" maxlength="3"></td><td><input id="16" type="text" disabled="disabled" maxlength="3"></td></tr>
<tr><td><input id="17" type="text" disabled="disabled" maxlength="3"></td><td><input id="18" type="text" disabled="disabled" maxlength="3"></td><td><input id="19" type="text" disabled="disabled" maxlength="3"></td><td><input id="20" type="text" disabled="disabled" maxlength="3"></td><td><input id="21" type="text" disabled="disabled" maxlength="3"></td><td><input id="22" type="text" disabled="disabled" maxlength="3"></td><td><input id="23" type="text" disabled="disabled" maxlength="3"></td><td><input id="24" type="text" disabled="disabled" maxlength="3"></td></tr>
</table>

<div id="buttons" style="text-align: center">
<button class="btn orange" id="save">Submit</button>
</div>
<br>
<span style="color:green;"><s:property value='result'/></span>
<br><br> 
</form> --%>
</div>

 
	
<div id="footer"><p>&copy; 2016 Dan Electronic System Pvt. Ltd.<p></div>
<script type="text/javascript" src="../js/time.js"></script>  

</body>

</html>