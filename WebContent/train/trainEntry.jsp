<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Train Entry</title>

<link rel="stylesheet" href="../css/chosen.css">
<!-- <link rel="stylesheet" href="../chosen_v1.5.1/docsupport/style.css">
<link rel="stylesheet" href="../chosen_v1.5.1/docsupport/prism.css">
<link rel="stylesheet" href="../chosen_v1.5.1/chosen.css"> -->
<link rel="stylesheet" href="../css/train.css">
<link rel="stylesheet" href="../sweetalert-master/dist/sweetalert.css">
<style type="text/css" media="all">
<style type="text/css">
#trainEntry{
	border: 1px solid gray;
	padding: 10px;
}
#trainEntry table tr td{
padding: 5px;
}
#multi{
border: 1px solid gray;
padding: 10px;
width:700px;
}
#multi table tr td{
padding: 5px;
}
</style>

<style>

ul {
    list-style-type: none;
       overflow: hidden;
   
}

li a {
    display: block;
    color: white;

    padding: 5px 16px;
    text-decoration: none;
}
.active {
    background-color: #03A9F4;
    color: white;
}

li a:hover {
    background-color: #4CAF50;
}
</style>
</head>
<body>
<div style="background: #111">
   <img src="../images/header2.png" width="100%" height="100" alt="header2"/>
<ul style="list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color: #335996;">

<li style=" float: left;"><a href="trainRunningInfo">Online Train</a></li>
<li style=" float: left;"><a style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;" href="../device/deviceStatus">Status</a></li>
<li style=" float: left;"><a href="../device/deviceConfig">Display</a></li>
<li style=" float: left;"><a href="../device/deviceIntensity">Intensity</a></li>
<li style=" float: left;"><a href="../log-report/logReport">Log Report</a></li>
<li style=" float: left;"><a href="../cctv/led-lcd-display.jsp">CCTV</a></li>
<li style=" float: left;"><a href="../announcement/personalAnc">PA</a></li>                     
<li style=" float: left;"><a href="../message/getBoardMessageList">Message</a></li>
<li style=" float: left;" class="active" ><a href="../setup/setup.jsp">Setup</a></li>
<li style=" float: left;"><a href="../option/optionSettings">Interface</a></li>
<li style=" float: left;"><a href="../user/userSetting">User</a></li>
<li style=" float: left;"><a href="help.jsp">Help</a></li>
<li style="float: right"><a href="../logout">Logout</a></li>
<li style="float: right"><a href="../user/changePassword"><s:property value="#session['user'].userId" /></a></li> 
<li style="float: right"><span style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;" id="time"></span></li>
</ul>
</div>
<div style="width: 100%;  color: white;">
<ul style=" background-color: #222213; list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
   ">
<li style="display: block;color: white;text-align: center;padding: 3px 20px;text-decoration: none;float: left;" ><img src="../images/arrow.PNG" style="margin-bottom: -5px">Setup</li>
<li style="display: block;color: white;text-align: center;padding: 3px 20px;text-decoration: none;float: left;" ><img src="../images/arrow.PNG" style="margin-bottom: -5px">Master</li>
<li style="display: block;color: white;text-align: center;padding: 3px 20px;text-decoration: none;float: left;" ><img src="../images/arrow.PNG" style="margin-bottom: -5px">Train Master</li>
</ul>
</div>
<div id="nav">
<div id='cssmenu'>
<ul>
   <li><a href='../setup/getStationDetail'>Station Master</a></li>
    <li><a href='../setup/getIntegration'>Integration / NTES</a></li>
   <li><a href='../setup/getServerDetail'>Server Master</a></li>

   <li><a href='../setup/getLanguageList'>Language Master</a></li>
   <li><a href='../setup/getTrainStatusList'>Status Master</a></li>
   
      <li class='active'><a href='getAllTrainList'>Train Master</a></li>
   <li><a href='coachEntry'>Coach Position</a></li>
   <li><a href='../setup/setup.jsp'>Back</a></li>
</ul>
</div>
</div>
<div id="displaytrain" >
<center>
<form id="trainListForm" method="post" >
<br>
<label>Select Train</label>
<select  data-placeholder="Train No......"  class="chosen" multiple id="trainId"  name="train.id" >
<option style="display:none;">Select</option>
<option value="0">New</option>
<s:iterator value="trainList">
<option value='<s:property value="id"/>'><s:property value="trainNo"/></option>
</s:iterator>
</select>
<br><br>
</form>

<div id="trainEntry">
<form method="post" id="trainMasterForm">
<br>
<input type="hidden" id="hviaStation" name="stations"/>
<input type="hidden" id="hsunStation" name="sunStations"/>
<input type="hidden" id="hmonStation" name="monStations"/>
<input type="hidden" id="htueStation" name="tueStations"/>
<input type="hidden" id="hwedStation" name="wedStations"/>
<input type="hidden" id="hthuStation" name="thuStations"/>
<input type="hidden" id="hfriStation" name="friStations"/>
<input type="hidden" id="hsatStation" name="satStations"/>

<s:if test="%{train.id!=0}">
<input type="hidden" id="train_id" name="train.id" value="<s:property value="train.id"/>">
</s:if>

<table id="trainDetail">
<tr>
<td><label>*Train No </label></td>
<td>
<s:if test="%{train.id!=0}">
<input type="text" name="train.trainNo" id="trainNo" value='<s:if test="%{train.trainNo!=0}"><s:property value="train.trainNo"/></s:if>' readonly>
</s:if>
<s:else>
<input type="text" name="train.trainNo" id="trainNo" maxlength="5">
</s:else>
</td>
<td colspan="2">
<input type="radio" id="specialTrain" name="train.trainStatus" style="width: 20px; height: 20px" class="trainStatus" value="Special Train" <s:if test="%{train.trainStatus=='Special Train'}">checked</s:if> >
<label>Special</label>
<input type="radio" id="availableTrain" name="train.trainStatus" style="width: 20px; height: 20px" class="trainStatus" value="Available" <s:if test="%{train.trainStatus=='Available'}">checked</s:if> >
<label>Available Here</label>
</td>
<!-- <td colspan="2" align="center" style="color:orange;font-size: 22px;"> -->
<%-- <s:property value="result"/> --%>
<!-- </td> -->
</tr>

<tr><td>
<label>*Train Name  </label>
</td><td colspan="3">
<input type="text" name="train.trainName" id="trainName" value='<s:property value="train.trainName"/>' style="width:500px;"> 
</td>
<!-- <td> -->
<!-- <label>Train Name Hindi  </label> -->
<!-- </td> -->
<!-- <td> -->
<%-- <input type="text" name="train.trainNameHindi" id="trainNameHindi" value='<s:property value="train.trainNameHindi"/>'>  --%>
<!-- </td> -->
</tr>

<tr><td>
<label>*Train Category  </label>
</td><td>
<select name="train.trainCategory" id="trainCategory" style="width:200px;">
<option value='<s:property value="train.trainCategory"/>' style="display:none;"><s:property value="train.trainCategory"/></option>
<option value="Arrival">Arrival</option>
<option value="Departure">Departure</option>
</select>
</td>

<td>
<label>*Train Type</label>
</td><td>
<select name="train.trainType" id="trainType">
   <option value='<s:property value="train.trainType"/>' style="display:none;"><s:property value="train.trainType"/></option>
   <option value="Special">Special</option>
   <option value="Mail/Express/Superfast">Mail/Express/Superfast</option>
   <option value="Luxury Trains">Luxury Trains</option>
   <option value="Rajdhani">Rajdhani</option>
   <option value="Shatabdi">Shatabdi</option>
   <option value="Janshatabdi">Janshatabdi</option>
   <option value="Garibrath/Yuva">Garibrath/Yuva</option>
   <option value="Duronto">Duronto</option>
   <option value="Tourist Trains">Tourist Trains</option>
   <option value="Special Hill">Special Hill</option>
 </select>
</td></tr>

<tr><td>
<label>*Source Station</label>
</td><td>
<%-- <input type="text" name="train.sourceStation" id="sourceStation" value='<s:property value="train.sourceStation"/>'>  --%>
<select name="train.sourceStation" id="sourceStation" style="width:200px;">
   <option value='<s:property value="train.sourceStation"/>' selected><s:property value="train.sourceStation"/></option>
   <s:iterator value="divertedStationList">
   <option value='<s:property value="stationCode"/>'><s:property value="stationNameEnglish"/></option>
   </s:iterator>
 </select>
</td>

<td>
<label>*Destination Station</label>
</td><td>
<%-- <input type="text" name="train.destinationStation" id="destinationStation" value='<s:property value="train.destinationStation"/>'>  --%>
<select name="train.destinationStation" id="destinationStation" style="width:210px;">
   <option value='<s:property value="train.destinationStation"/>' selected><s:property value="train.destinationStation"/></option>
    <s:iterator value="divertedStationList">
     <option value='<s:property value="stationCode"/>'><s:property value="stationNameEnglish"/></option>
    </s:iterator>
 </select>
</td></tr>

<tr><td>
<label>*Schedule Arrival  </label>
</td><td>
<input type="text" placeholder=" HH : MM " name="train.scheduleArrival" id="scheduleArrival" value='<s:property value="train.scheduleArrival"/>' maxlength="5"> 
</td>

<td>
<label>*Schedule Departure  </label>
</td><td>
<input type="text" placeholder=" HH : MM " name="train.scheduleDeparture" id="scheduleDeparture" value='<s:property value="train.scheduleDeparture"/>' maxlength="5"> 
</td></tr>

<tr><td>
<label>*Default Platform </label>
</td><td>
<select name="train.defaultPlatform" id="defaultPlatform">
<s:if test="%{train.defaultPlatform!=''}">
<option value='<s:property value="train.defaultPlatform"/>' style="display:none;"><s:property value="train.defaultPlatform"/></option>
</s:if>
<s:else>
<option>Nil</option>
</s:else>
<script>
var pfNo=<s:property value="station.numberOfPlateform"/>;
var platformNos='<s:property value="station.platformNos"/>';
var platformNosArray=platformNos.split(",");
for(var i=1;i<=pfNo;i++){
	document.write('<option value="'+platformNosArray[i-1]+'">'+platformNosArray[i-1]+'</option>');	
}
</script>
</select>
</td>

<td>
<label>*Max Coach  </label>
</td><td>
<select name="train.maxCoach" id="maxCoach">
<s:if test="%{train.maxCoach!=0}">
<option value='<s:property value="train.maxCoach"/>' style="display:none;"><s:property value="train.maxCoach"/></option>
</s:if>
<s:else>
<option></option>
</s:else>
<script>
for(var i=1;i<=30;i++){
	document.write('<option value="'+i+'">'+i+'</option>');
}
</script>
</select>
</td></tr>

<tr><td> 
<label>Multi Via : </label>
</td><td>
<input type="checkbox" style="width: 20px; height: 20px" name="train.multiVia" id="multiVia" value="true" <s:if test="%{train.multiVia==true}">checked</s:if> >
</td>

<td>
<label>Multi Destination</label>
</td><td>
<input type="checkbox" style="width: 20px; height: 20px" name="train.multiDestination" id="multiDestination" value="true" <s:if test="%{train.multiDestination==true}">checked</s:if> >
</td></tr>
<tr>
<td>
<label>Enable Merge Train</label>
</td>
<td><input type="checkbox" style="width: 20px; height: 20px" name="train.enableMergeTrain" id="mergeTrain" value="true" <s:if test="%{train.enableMergeTrain==true}">checked</s:if>/>
</td>
<td>
<label>Select Train No</label>
</td>
<td>
<select name="train.mergeTrainNo" id="mergeTrainNo">
<option value="0">Select</option>
<s:iterator value="trainList">
<option value='<s:property value="trainNo"/>'  <s:if test="%{train.mergeTrainNo==trainNo}">selected</s:if>><s:property value="trainNo"/></option>
</s:iterator>
</select>
</td>
</tr>
<tr><td>
<label>Via Station</label>
</td>
<td colspan="3" id="singleVia">
 <select data-placeholder="Choose viaStation..."  class="chosen" multiple id="viaStation"  name="train.viaStation" style="width: 650px;">
   <%--  <s:if test="%{train.viaStation=''}"> --%>
    <s:iterator value="divertedStationList">
     <option value='<s:property value="stationCode"/>'><s:property value="stationCode"/></option>
    </s:iterator>
   <%--  </s:if> --%>
   <%--  <s:else>
  <option value='<s:property value="viaStation"/>'><s:property value=" "/></option>
    </s:else> --%>
 </select>

</td> 



<%-- <td colspan="3" id="singleVia">
<select data-placeholder="Choose via station..." class="chosen-select" multiple style="width:350px;" tabindex="4" name="train.viaStation" id="viaStation">
   <!-- <option value='<s:property value="train.viaStation"/>' selected><s:property value="train.viaStation"/></option> -->
    <s:iterator value="divertedStationList">
     <option value='<s:property value="stationCode"/>'><s:property value="stationCode"/></option>
    </s:iterator>
 </select>
</td> --%>



</tr>

<tr><td>
<label>Running Days</label> 
</td><td colspan="3">
<input type="checkbox" style="width: 20px; height: 20px" class="runningDay" name="train.runningDaySun" id="runningDaySun" value="true" <s:if test="%{train.runningDaySun==true}">checked</s:if> >
<label>Sun</label>

<input type="checkbox" style="width: 20px; height: 20px" class="runningDay" name="train.runningDayMon" id="runningDayMon" value="true" <s:if test="%{train.runningDayMon==true}">checked</s:if> >
<label>Mon</label>

<input type="checkbox" style="width: 20px; height: 20px" class="runningDay" name="train.runningDayTue" id="runningDayTue" value="true" <s:if test="%{train.runningDayTue==true}">checked</s:if> >
<label>Tue</label>

<input type="checkbox" style="width: 20px; height: 20px" class="runningDay" name="train.runningDayWed" id="runningDayWed" value="true" <s:if test="%{train.runningDayWed==true}">checked</s:if> >
<label>Wed</label>

<input type="checkbox" style="width: 20px; height: 20px" class="runningDay" name="train.runningDayThu" id="runningDayThu" value="true" <s:if test="%{train.runningDayThu==true}">checked</s:if> >
<label>Thu</label>

<input type="checkbox" style="width: 20px; height: 20px" class="runningDay" name="train.runningDayFri" id="runningDayFri" value="true" <s:if test="%{train.runningDayFri==true}">checked</s:if> >
<label>Fri</label>

<input type="checkbox" style="width: 20px; height: 20px" class="runningDay" name="train.runningDaySat" id="runningDaySat" value="true" <s:if test="%{train.runningDaySat==true}">checked</s:if> >
<label>Sat</label>

<input type="checkbox" style="width: 20px; height: 20px" id="runningDayAll">
<label>All</label>
</td></tr></table>

<br>

<div id="multi">
<table>
<tr><td><label>Days</label></td><td><label>Via Stations</label></td><td><label>Destination</label></td></tr>
<tr><td>
<input type="checkbox" style="width: 20px; height: 20px" name="train.mulSun" id="mulSun" value="true" <s:if test="%{train.runningDaySun==true}">checked</s:if> >
<label>Sun</label>
</td><td id="viaSun">
  <select data-placeholder="Choose viaStation..." name="train.mulViaSun" id="mulViaSun" class="chosen" multiple style="width: 350px;">
    <s:iterator value="divertedStationList">
     <option value='<s:property value="stationCode"/>'><s:property value="stationCode"/></option>
    </s:iterator>
 </select>
</td>
<td>
<%-- <input type="text" name="train.mulDesSun" id="mulDesSun" value='<s:property value="train.mulDesSun"/>'>  --%>
<select name="train.mulDesSun" id="mulDesSun" style="width:210px;">
   <!-- <option value='<s:property value="train.mulDesSun"/>' selected><s:property value="train.mulDesSun"/></option> -->
   <option value='' style="display:none;"></option>
    <s:iterator value="divertedStationList">
     <option value='<s:property value="stationCode"/>'><s:property value="stationNameEnglish"/></option>
    </s:iterator>
 </select>
 </td></tr>

<tr><td>
<input type="checkbox" style="width: 20px; height: 20px" name="train.mulMon" id="mulMon" value="true" <s:if test="%{train.runningDayMon==true}">checked</s:if> >
<label>Mon</label>
</td><td  id="viaMon">
<select data-placeholder="Choose viaStation..."  class="chosen" multiple style="width: 350px;" name="train.mulViaMon" id="mulViaMon" >
    <s:iterator value="divertedStationList">
     <option value='<s:property value="stationCode"/>'><s:property value="stationCode"/></option>
    </s:iterator>
 </select>
 </select>
</td><td>
<%-- <input type="text" name="train.mulDesMon" id="mulDesMon" value='<s:property value="train.mulDesMon"/>'>  --%>
<select name="train.mulDesMon" id="mulDesMon" style="width:210px;">
   <!-- <option value='<s:property value="train.mulDesMon"/>' selected><s:property value="train.mulDesMon"/></option> -->
    <option value='' style="display:none;"></option>
    <s:iterator value="divertedStationList">
     <option value='<s:property value="stationCode"/>'><s:property value="stationNameEnglish"/></option>
    </s:iterator>
 </select>
</td></tr>

<tr><td>
<input type="checkbox" style="width: 20px; height: 20px" name="train.mulTue" id="mulTue"  value="true" <s:if test="%{train.runningDayTue==true}">checked</s:if> >
<label>Tue</label>
</td><td  id="viaTue"> 
  <select data-placeholder="Choose viaStation..."  class="chosen" multiple style="width: 350px;" name="train.mulViaTue" id="mulViaTue" >
    <s:iterator value="divertedStationList">
     <option value='<s:property value="stationCode"/>'><s:property value="stationCode"/></option>
    </s:iterator>
 </select>
</td>
<td>
<%-- <input type="text" name="train.mulDesTue" id="mulDesTue" value='<s:property value="train.mulDesTue"/>'>  --%>
<select name="train.mulDesTue" id="mulDesTue" style="width:210px;">
   <!-- <option value='<s:property value="train.mulDesTue"/>' selected><s:property value="train.mulDesTue"/></option>  -->
    <option value='' style="display:none;"></option>
    <s:iterator value="divertedStationList">
     <option value='<s:property value="stationCode"/>'><s:property value="stationNameEnglish"/></option>
    </s:iterator>
 </select>
 </td></tr>

<tr><td>
<input type="checkbox" style="width: 20px; height: 20px" name="train.mulWed" id="mulWed" value="true" <s:if test="%{train.runningDayWed==true}">checked</s:if> >
<label>Wed</label>
</td><td  id="viaWed">
 <select data-placeholder="Choose viaStation..."  class="chosen" multiple style="width: 350px;" name="train.mulViaWed" id="mulViaWed" >
    <s:iterator value="divertedStationList">
     <option value='<s:property value="stationCode"/>'><s:property value="stationCode"/></option>
    </s:iterator>
 </select>
</td>
<td>
<%-- <input type="text" name="train.mulDesWed" id="mulDesWed" value='<s:property value="train.mulDesWed"/>'>  --%>
<select name="train.mulDesWed" id="mulDesWed" style="width:210px;">
   <!-- <option value='<s:property value="train.mulDesWed"/>' selected><s:property value="train.mulDesWed"/></option> -->
   <option value='' style="display:none;"></option>
    <s:iterator value="divertedStationList">
     <option value='<s:property value="stationCode"/>'><s:property value="stationNameEnglish"/></option>
    </s:iterator>
 </select>
</td></tr>

<tr><td>
<input type="checkbox" style="width: 20px; height: 20px" name="train.mulThu" id="mulThu" value="true" <s:if test="%{train.runningDayThu==true}">checked</s:if> >
<label>Thu</label>
</td>
<td id="viaThu">
  <select data-placeholder="Choose viaStation..."  class="chosen" multiple style="width: 350px;" name="train.mulViaThu" id="mulViaThu" >
    <s:iterator value="divertedStationList">
     <option value='<s:property value="stationCode"/>'><s:property value="stationCode"/></option>
    </s:iterator>
 </select>
 

</td>
<td>
<%-- <input type="text" name="train.mulDesThu" id="mulDesThu" value='<s:property value="train.mulDesThu"/>'>  --%>
<select name="train.mulDesThu" id="mulDesThu" style="width:210px;">
   <!-- <option value='<s:property value="train.mulDesThu"/>' selected><s:property value="train.mulDesThu"/></option> -->
    <option value='' style="display:none;"></option>
    <s:iterator value="divertedStationList">
     <option value='<s:property value="stationCode"/>'><s:property value="stationNameEnglish"/></option>
    </s:iterator>
 </select>
</td></tr>

<tr>
<td>
<input type="checkbox" style="width: 20px; height: 20px" name="train.mulFri" id="mulFri" value="true" <s:if test="%{train.runningDayFri==true}">checked</s:if> >
<label>Fri</label>
</td><td  id="viaFri">
   <select data-placeholder="Choose viaStation..."  class="chosen" multiple style="width: 350px;" name="train.mulViaFri" id="mulViaFri" >
    <s:iterator value="divertedStationList">
     <option value='<s:property value="stationCode"/>'><s:property value="stationCode"/></option>
    </s:iterator>
 </select>

</td><td>
<%-- <input type="text" name="train.mulDesFri" id="mulDesFri" value='<s:property value="train.mulDesFri"/>'>  --%>
<select name="train.mulDesFri" id="mulDesFri" style="width:210px;">
   <!-- <option value='<s:property value="train.mulDesFri"/>' selected><s:property value="train.mulDesFri"/></option> -->
    <option value='' style="display:none;"></option>
    <s:iterator value="divertedStationList">
     <option value='<s:property value="stationCode"/>'><s:property value="stationNameEnglish"/></option>
    </s:iterator>
 </select>
 </td></tr>

<tr><td>
<input type="checkbox" style="width: 20px; height: 20px" id="mulSat" <s:if test="%{train.runningDaySat==true}">checked</s:if> >
<label>Sat</label>
</td><td  id="viaSat">
    <select data-placeholder="Choose viaStation..."  class="chosen" multiple style="width: 350px;" name="train.mulViaSat" id="mulViaSat" >
    <s:iterator value="divertedStationList">
     <option value='<s:property value="stationCode"/>'><s:property value="stationCode"/></option>
    </s:iterator>
 </select>
</td>><td>
<%-- <input type="text" name="train.mulDesSat" id="mulDesSat" value='<s:property value="train.mulDesSat"/>'>  --%>
<select name="train.mulDesSat" id="mulDesSat" style="width:210px;">
   <!-- <option value='<s:property value="train.mulDesSat"/>' selected><s:property value="train.mulDesSat"/></option>-->
    <option value='' style="display:none;"></option>
    <s:iterator value="divertedStationList">
     <option value='<s:property value="stationCode"/>'><s:property value="stationNameEnglish"/></option>
    </s:iterator>
 </select>
</td></tr>
</table>
</div><br>
<div id="buttons" style="text-align: center">
  <button class="btn orange" id="save">Save</button>
  <a class="btn orange" id="edit">Edit</a>  
  <button class="btn purple" id="delete">Delete</button> 

<div style="float:right;margin-bottom:15px;">
<label><u style="color:white;">Station Code Reference</u></label><br>
<select multiple style="height:100px;margin-top:3px;border-width: 2px 2px 2px 2px;border-color:white;">
<s:iterator value="divertedStationList">
 <option><s:property value="stationNameEnglish"/> - <s:property value="stationCode"/></option>
</s:iterator>
</select>
</div>

</div>
 <!--       
 <input type="text" pattern="([01]?[0-9]{1}|2[0-3]{1}):[0-5]{1}[0-9]{1}" id="24h"/>
 <input type="text" pattern="([01]?[0-9]|2[0-3]):[0-5][0-9]" id="24h"/>
 --> 
   
</form>
<br>
</div>
</center>
</div>


<%--   <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js" type="text/javascript"></script> --%>
   <script src="../js/jquery-1.10.2.js" type="text/javascript"></script>
   <script type="text/javascript" src="../js/blockUI.js"></script> 
   <script type="text/javascript" src="../js/chosen.jquery.min.js"></script>
<script type="text/javascript" src="../js/chosen.order.jquery.min.js"></script>
<%--   <script src="../chosen_v1.5.1/chosen.jquery.js" type="text/javascript"></script>
  <script src="../chosen_v1.5.1/docsupport/prism.js" type="text/javascript" charset="utf-8"></script> --%>
  <script src="../sweetalert-master/dist/sweetalert-dev.js"></script>
  <script type="text/javascript">
     var config = {
      '.chosen'           : {display_selected_options:true},
      '.chosen'           : {max_selected_options:4},
      '.chosen-deselect'  : {allow_single_deselect:true},
      '.chosen-no-single' : {disable_search_threshold:10},
      '.chosen-no-results': {no_results_text:'Oops, nothing found!'},
      '.chosen-width'     : {width:"95%"},
    }
   for (var selector in config) {
      $(selector).chosen(config[selector]); 
    }  
  </script>
  
<script type="text/javascript">
$( document ).ready(function() {
	$('select.chosen').chosen();
	
	
	var value1='<s:property value="train.viaStation"/>';
	var value2='<s:property value="train.mulViaSun"/>';
	var value3='<s:property value="train.mulViaMon"/>';
	var value4='<s:property value="train.mulViaTue"/>';
	var value5='<s:property value="train.mulViaWed"/>';
	var value6='<s:property value="train.mulViaThu"/>';
	var value7='<s:property value="train.mulViaFri"/>';
	var value8='<s:property value="train.mulViaSat"/>';
	
	
	if(value1!="")
	{
		 var MY_SELECT = $('select[multiple]#viaStation').get(0);
			 ChosenOrder.setSelectionOrder(MY_SELECT,'<s:property value="train.viaStation"/>'.split(','), true); 
	}
	if(value2!="")
	{
		 var MY_SELECT = $('select[multiple]#mulViaSun').get(0);
			ChosenOrder.setSelectionOrder(MY_SELECT,'<s:property value="train.mulViaSun"/>'.split(','), true);
	}
	if(value3!="")
	{
		 var MY_SELECT = $('select[multiple]#mulViaMon').get(0);
			ChosenOrder.setSelectionOrder(MY_SELECT,'<s:property value="train.mulViaMon"/>'.split(','), true);
	}
	if(value4!="")
	{
		 var MY_SELECT = $('select[multiple]#mulViaTue').get(0);
			ChosenOrder.setSelectionOrder(MY_SELECT,'<s:property value="train.mulViaTue"/>'.split(','), true);
	}
	if(value5!="")
	{
		 var MY_SELECT = $('select[multiple]#mulViaWed').get(0);
			ChosenOrder.setSelectionOrder(MY_SELECT,'<s:property value="train.mulViaWed"/>'.split(','), true);
	}
	if(value6!="")
	{
		 var MY_SELECT = $('select[multiple]#mulViaThu').get(0);
			ChosenOrder.setSelectionOrder(MY_SELECT,'<s:property value="train.mulViaThu"/>'.split(','), true);
	}
	if(value7!="")
	{
		 var MY_SELECT = $('select[multiple]#mulViaFri').get(0);
			ChosenOrder.setSelectionOrder(MY_SELECT,'<s:property value="train.mulViaFri"/>'.split(','), true);
	}
	if(value8!="")
	{
		 var MY_SELECT = $('select[multiple]#mulViaSat').get(0);
			ChosenOrder.setSelectionOrder(MY_SELECT,'<s:property value="train.mulViaSat"/>'.split(','), true);
	}
	
	var source='<s:property value="train.sourceStation"/>';
	$('#sourceStation').val(source);
	var destination='<s:property value="train.destinationStation"/>';
	$('#destinationStation').val(destination);
	
	//------------------------------------------------------
	
	var des='<s:property value="train.mulDesSun"/>';
	$('#mulDesSun').val(des);
	var des='<s:property value="train.mulDesMon"/>';
	$('#mulDesMon').val(des); 
	var des='<s:property value="train.mulDesTue"/>';
	$('#mulDesTue').val(des);
	var des='<s:property value="train.mulDesWed"/>';
	$('#mulDesWed').val(des);
	var des='<s:property value="train.mulDesThu"/>';
	$('#mulDesThu').val(des);
	var des='<s:property value="train.mulDesFri"/>';
	$('#mulDesFri').val(des);
	var des='<s:property value="train.mulDesSat"/>';
	$('#mulDesSat').val(des);
	
	//-------------------------------------------------------------
	
	$("#viaStation").val('<s:property value="train.viaStation"/>'.replace(/ /gi,'').split(','));
	
	$("#mulViaSun").val('<s:property value="train.mulViaSun"/>'.replace(/ /gi,'').split(','));
	$("#mulViaMon").val('<s:property value="train.mulViaMon"/>'.replace(/ /gi,'').split(','));
	$("#mulViaTue").val('<s:property value="train.mulViaTue"/>'.replace(/ /gi,'').split(','));
	$("#mulViaWed").val('<s:property value="train.mulViaWed"/>'.replace(/ /gi,'').split(','));
	$("#mulViaThu").val('<s:property value="train.mulViaThu"/>'.replace(/ /gi,'').split(','));
	$("#mulViaFri").val('<s:property value="train.mulViaFri"/>'.replace(/ /gi,'').split(','));
	$("#mulViaSat").val('<s:property value="train.mulViaSat"/>'.replace(/ /gi,'').split(','));
	
	//---------------------------------------------------------------------------------------------
	
	 $('#trainId').change(function(){
	   $('#trainListForm').attr('action', 'getTrainDetail').submit();     
	 });
  
	//--------------------For Multiple Days----------------------------
	 var count=-1;
	$( ".runningDay" ).each(function( index ) {
		   if(this.checked==true){
			   count++;
		   }
		   if(count==6){
			   document.getElementById("runningDayAll").checked = true;
		   }

		  });
	
	
	 $("#runningDayAll").change(function(){
		  if(this.checked==true)
			  {
			  $( ".runningDay" ).each(function( index ) {
				 this.checked=true;
				 if(document.getElementById("multiVia").checked==true){
					 var mulCkId = this.id.replace(/runningDay/gi, "mul");
			          document.getElementById(mulCkId).checked = true;
				 }
				  });
			  }
		  else{
			  $( ".runningDay" ).each(function( index ) {
					 this.checked=false;	
					 var mulCkId = this.id.replace(/runningDay/gi, "mul");
			          document.getElementById(mulCkId).checked = false;
					  });
			  
				  }
	  }); 
	
  //-------------------------------------------------------------
   $("#viaSun").click(function(){
		  var val1=$("#save")[0].getAttribute("disabled");
		  if(val1=="disabled")
		 swal("Please Click on Edit Button to Change");
	  });
	  $("#viaMon").click(function(){
		  var val1=$("#save")[0].getAttribute("disabled");
		  if(val1=="disabled")
		 swal("Please Click on Edit Button to Change");
	  });
	  $("#viaTue").click(function(){
		  var val1=$("#save")[0].getAttribute("disabled");
		  if(val1=="disabled")
		 swal("Please Click on Edit Button to Change");
	  });
	  $("#viaWed").click(function(){
		  var val1=$("#save")[0].getAttribute("disabled");
		  if(val1=="disabled")
		 swal("Please Click on Edit Button to Change");
	  });
	  $("#viaThu").click(function(){
		  var val1=$("#save")[0].getAttribute("disabled");
		  if(val1=="disabled")
		 swal("Please Click on Edit Button to Change");
	  });
	  $("#viaFri").click(function(){
		  var val1=$("#save")[0].getAttribute("disabled");
		  if(val1=="disabled")
		 swal("Please Click on Edit Button to Change");
	  });
	  $("#viaSat").click(function(){
		  var val1=$("#save")[0].getAttribute("disabled");
		  if(val1=="disabled")
		 swal("Please Click on Edit Button to Change");
	  });
	  $("#singleVia").click(function(){
		  var val1=$("#save")[0].getAttribute("disabled");
		  if(val1=="disabled")
		 swal("Please Click on Edit Button to Change");
	  });
  if($("#trainNo").val()!=""){
	  
	  $("#trainDetail :input[type='text']").attr("readonly", "readonly");
	  
	  $("#trainDetail :input[type='radio']").attr("disabled", "disabled");
	  
	  $("#trainDetail :input[type='checkbox']").attr("disabled", "disabled");
	  
	  $("#trainDetail select").attr("disabled", "disabled");
	  
	  
	  $("#save").attr("disabled", "disabled");
	  
  }
  
 //------------------disable multi via & destination---------------------
  
  $("#multi :input[type='checkbox']").attr("disabled", "disabled");
 
  $("#multi select").attr("disabled", "disabled");
  
 
  //-----------------------------------------------------------------------
  
  $("#edit").click(function(){
  
	  $("#trainDetail :input[type='text']").removeAttr("readonly");
	  
	  if($("#trainNo").val()!="")$("#trainNo").attr("readonly","readonly");
	  
	  $("#trainDetail :input[type='radio']").removeAttr("disabled");
	  
	  $("#trainDetail :input[type='checkbox']").removeAttr("disabled");
	  
	  $("#trainDetail select").removeAttr("disabled");
	  
	  
	  $("#save").removeAttr("disabled");
	  
	  if(document.getElementById("multiVia").checked==true){  
		  $( ".runningDay" ).each(function( index ) {
		     if(this.checked==true){
		         var mulCkId = this.id.replace(/runningDay/gi, "mul");
		         $('#'+mulCkId).attr('checked',true);
		         
		         var mulViaId=this.id.replace(/runningDay/gi, "mulVia");
		        
		     }
		  });
	  }
	  
	  if(document.getElementById("multiDestination").checked==true){
		  $("#destinationStation").attr("disabled", "disabled");
		  $( ".runningDay" ).each(function( index ) {
		     if(this.checked==true){
		         var mulCkId = this.id.replace(/runningDay/gi, "mul");
		         $('#'+mulCkId).attr('checked',true);
		         
		         var mulDestId=this.id.replace(/runningDay/gi, "mulDes");
		         $("#"+mulDestId).removeAttr("disabled");
		     }
		  });
	  }
    
	  
  });
  
  
  
  
  
  
  //-----------------------------------------------------------------------
  
  $("#multiVia").change(function(){
	  
	  if(document.getElementById("multiVia").checked==true) {
		  

		  
		  $( ".runningDay" ).each(function( index ) {
			  if(this.checked==true){
		          var mulCkId = this.id.replace(/runningDay/gi, "mul");
		          document.getElementById(mulCkId).checked = true;
		     }
		  });
		  
	  }else if(document.getElementById("multiDestination").checked==false && document.getElementById("multiVia").checked==false){
		 
		  $('#multi input:checkbox').attr('checked',false);


		  
	  }  
  });
  
 //--------------------------------------------------------------- 

 $("#multiDestination").change(function(){
	  
	  if(document.getElementById("multiDestination").checked==true) {
		 
		  $("#destinationStation").attr("disabled", "disabled");
		  
		  $( ".runningDay" ).each(function( index ) {
		     if(this.checked==true){
		         var mulCkId = this.id.replace(/runningDay/gi, "mul");
		         $('#'+mulCkId).attr('checked',true);
		         
		         var mulDestId=this.id.replace(/runningDay/gi, "mulDes");
		         $("#"+mulDestId).removeAttr("disabled");
		     }
		  });
		  
	  }else if(document.getElementById("multiDestination").checked==false && document.getElementById("multiVia").checked==false){
		 
		  $('#multi input:checkbox').attr('checked',false);
		  $("#multi select").attr("disabled", "disabled");
		  $("#destinationStation").removeAttr("disabled");
		  
	  }else{
		  
		  $("#multi select").attr("disabled", "disabled");
		  $("#destinationStation").removeAttr("disabled");
		 
	  }  
  });
 
 //-------------------------------validate Train No---------------------
 
  //called when key is pressed in textbox
  $("#trainNo").keypress(function (e) {
    //if the letter is not digit then don't type anything
   /*  if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
       return false;
    } */
  });
  
 //-------------------------------------------------------------------------------------------
     
	 $("#scheduleArrival").keyup(function(){
		var str=$("#scheduleArrival").val();
		var pos = $("#scheduleArrival").getCursorPosition();
		   str=str.substr(0,pos);
		if(pos==2){
			$("#scheduleArrival").val(str+":");
	 	    setCaretToPos($("#scheduleArrival")[0], pos+1);
		}else{
			$("#scheduleArrival").val(str);
	 	    setCaretToPos($("#scheduleArrival")[0], pos);
		}
		
		var pos = $("#scheduleArrival").getCursorPosition();
		   str=str.substr(0,pos);
		if(pos==2){
			$("#scheduleArrival").val(str+":");
		    setCaretToPos($("#scheduleArrival")[0], pos+1);
		}else{
			$("#scheduleArrival").val(str);
		    setCaretToPos($("#scheduleArrival")[0], pos);
		}
	 
	 });	
 
	//-----------------------------------------------------------------------
	
	$("#scheduleDeparture").keyup(function(){
		var str=$("#scheduleDeparture").val();
		var pos = $("#scheduleDeparture").getCursorPosition();
		   str=str.substr(0,pos);
		if(pos==2){
			$("#scheduleDeparture").val(str+":");
		    setCaretToPos($("#scheduleDeparture")[0], pos+1);
		}else{
			$("#scheduleDeparture").val(str);
		    setCaretToPos($("#scheduleDeparture")[0], pos);
		}
		
		var pos = $("#scheduleDeparture").getCursorPosition();
		   str=str.substr(0,pos);
		if(pos==2){
			$("#scheduleDeparture").val(str+":");
		    setCaretToPos($("#scheduleDeparture")[0], pos+1);
		}else{
			$("#scheduleDeparture").val(str);
		    setCaretToPos($("#scheduleDeparture")[0], pos);
		}
 
	});
	
 //--------------------------------validate time format-----------------------------------------

    $("#scheduleArrival").blur(function(){
       
    	// regular expression to match required time format
   		re = /^(\d{1,2}):(\d{2})([ap]m)?$/;

   	    if($("#scheduleArrival").val() != '') {
   	      if(regs = $("#scheduleArrival").val().match(re)) {
   	        if(regs[3]) {
   	          // 12-hour value between 1 and 12
   	          if(regs[1] < 1 || regs[1] > 12) {
   	        	swal("Invalid value for hours: " + regs[1]);
   	            $("#scheduleArrival").removeAttr('value');
 	    	    $("#scheduleArrival").focus();
   	          }
   	        } else {
   	          // 24-hour value between 0 and 23
   	          if(regs[1] > 23) {
   	        	swal("Invalid value for hours: " + regs[1]);
   	            $("#scheduleArrival").removeAttr('value');
 	    	    $("#scheduleArrival").focus();
   	          }
   	        }
   	        // minute value between 0 and 59
   	        if(regs[2] > 59) {
   	          swal("Invalid value for minutes: " + regs[2]);
   	          $("#scheduleArrival").removeAttr('value');
	    	  $("#scheduleArrival").focus();
   	        }
   	      } else {
   	    	swal("Invalid time format: " + $("#scheduleArrival").val());
   	        $("#scheduleArrival").removeAttr('value');
	    	$("#scheduleArrival").focus();
  	            
   	      }
   	      
   	    }
   	    
    });  
 
 
    $("#scheduleDeparture").blur(function(){
    	 
   		// regular expression to match required time format
   		re = /^(\d{1,2}):(\d{2})([ap]m)?$/;

   	    if($("#scheduleDeparture").val() != '') {
   	      if(regs = $("#scheduleDeparture").val().match(re)) {
   	        if(regs[3]) {
   	          // 12-hour value between 1 and 12
   	          if(regs[1] < 1 || regs[1] > 12) {
   	        	swal("Invalid value for hours: " + regs[1]);
   	            $("#scheduleDeparture").removeAttr('value');
 	    	    $("#scheduleDeparture").focus();
   	          }
   	        } else {
   	          // 24-hour value between 0 and 23
   	          if(regs[1] > 23) {
   	        	swal("Invalid value for hours: " + regs[1]);
   	            $("#scheduleDeparture").removeAttr('value');
 	    	    $("#scheduleDeparture").focus();
   	          }
   	        }
   	        // minute value between 0 and 59
   	        if(regs[2] > 59) {
   	          swal("Invalid value for minutes: " + regs[2]);
   	          $("#scheduleDeparture").removeAttr('value');
	    	  $("#scheduleDeparture").focus();
   	        }
   	      } else {
   	    	swal("Invalid time format: " + $("#scheduleDeparture").val());
   	        $("#scheduleDeparture").removeAttr('value');
	    	$("#scheduleDeparture").focus();
  	            
   	      }
   	      
   	    }
   	    
    }); 
  		 
 //---------------------------------------------------------------------------------------------------//
 
 	   $('#runningDaySun').change(function(){
		   if(document.getElementById('runningDaySun').checked==true && document.getElementById('multiVia').checked==true && document.getElementById('multiDestination').checked==false){
			   
			   document.getElementById("mulSun").checked = true;
			   
			   checkRunningAll();
			   //var mulViaId=this.id.replace(/runningDay/gi, "mulVia");
		       
		   }else if(document.getElementById('runningDaySun').checked==true && document.getElementById('multiDestination').checked==true && document.getElementById('multiVia').checked==false){
			   
			   document.getElementById("mulSun").checked = true;
			   var mulDestId=this.id.replace(/runningDay/gi, "mulDes");
		       $("#"+mulDestId).removeAttr("disabled");
		       
		       checkRunningAll();
		       
		   }else if(document.getElementById('runningDaySun').checked==true && document.getElementById('multiVia').checked==true && document.getElementById('multiDestination').checked==true){
			  
			   document.getElementById("mulSun").checked = true;
			   checkRunningAll();
			   //var mulViaId=this.id.replace(/runningDay/gi, "mulVia");

		       
		       var mulDestId=this.id.replace(/runningDay/gi, "mulDes"); 
		       $("#"+mulDestId).removeAttr("disabled");
		       
		   }else if(document.getElementById('runningDaySun').checked==true){
			   checkRunningAll();
		   }else{
			          
			   $('#mulSun').removeAttr("checked"); 
		       $("#runningDayAll").removeAttr("checked");
		       
		       var mulDestId=this.id.replace(/runningDay/gi, "mulDes");
		       $("#"+mulDestId).attr("disabled","disabled");
		       
		       
		   } 
	   });
 
 	   $('#runningDayMon').change(function(){
		   if(document.getElementById('runningDayMon').checked==true && document.getElementById('multiVia').checked==true && document.getElementById('multiDestination').checked==false){
			   
			   document.getElementById("mulMon").checked = true;
			   //var mulViaId=this.id.replace(/runningDay/gi, "mulVia");
			   checkRunningAll();
		       
		   }else if(document.getElementById('runningDayMon').checked==true && document.getElementById('multiDestination').checked==true && document.getElementById('multiVia').checked==false){
			   
			   document.getElementById("mulMon").checked = true;
			   var mulDestId=this.id.replace(/runningDay/gi, "mulDes");
		       $("#"+mulDestId).removeAttr("disabled");
		       checkRunningAll();
		       
		   }else if(document.getElementById('runningDayMon').checked==true && document.getElementById('multiVia').checked==true && document.getElementById('multiDestination').checked==true){
			  
			   document.getElementById("mulMon").checked = true; 
			  // var mulViaId=this.id.replace(/runningDay/gi, "mulVia");

		       checkRunningAll();
		       var mulDestId=this.id.replace(/runningDay/gi, "mulDes"); 
		       $("#"+mulDestId).removeAttr("disabled");
		       
		   }else if(document.getElementById('runningDayMon').checked==true){
			   checkRunningAll();
		   }else{
			   
			   $('#mulMon').removeAttr("checked"); 
			   $("#runningDayAll").removeAttr("checked");
			
		       
		       var mulDestId=this.id.replace(/runningDay/gi, "mulDes");
		       $("#"+mulDestId).attr("disabled","disabled");
		       
		   }  
	   });
 	   
 	   $('#runningDayTue').change(function(){
		   if(document.getElementById('runningDayTue').checked==true && document.getElementById('multiVia').checked==true && document.getElementById('multiDestination').checked==false){
			   
			   document.getElementById("mulTue").checked = true;
			   //var mulViaId=this.id.replace(/runningDay/gi, "mulVia");
			   checkRunningAll();
		       
		   }else if(document.getElementById('runningDayTue').checked==true && document.getElementById('multiDestination').checked==true && document.getElementById('multiVia').checked==false){
			   
			   document.getElementById("mulTue").checked = true;
			   var mulDestId=this.id.replace(/runningDay/gi, "mulDes");
		       $("#"+mulDestId).removeAttr("disabled");
		       checkRunningAll();
		       
		   }else if(document.getElementById('runningDayTue').checked==true && document.getElementById('multiVia').checked==true && document.getElementById('multiDestination').checked==true){
			  
			   document.getElementById("mulTue").checked = true; 
			   var mulViaId=this.id.replace(/runningDay/gi, "mulVia");

		       
		       var mulDestId=this.id.replace(/runningDay/gi, "mulDes"); 
		       $("#"+mulDestId).removeAttr("disabled");
		       
		       checkRunningAll();
		       
		   }else if(document.getElementById('runningDayTue').checked==true){
			   checkRunningAll();
		   }else{
			   
			   $('#mulTue').removeAttr("checked"); 
			   $("#runningDayAll").removeAttr("checked");

		       
		       var mulDestId=this.id.replace(/runningDay/gi, "mulDes");
		       $("#"+mulDestId).attr("disabled","disabled");
		       
		   }  
	   });
 	   
 	  $('#runningDayWed').change(function(){
		   if(document.getElementById('runningDayWed').checked==true && document.getElementById('multiVia').checked==true && document.getElementById('multiDestination').checked==false){
			   
			   document.getElementById("mulWed").checked = true;
			   //var mulViaId=this.id.replace(/runningDay/gi, "mulVia");
			   checkRunningAll();

		       
		   }else if(document.getElementById('runningDayWed').checked==true && document.getElementById('multiDestination').checked==true && document.getElementById('multiVia').checked==false){
			   
			   document.getElementById("mulWed").checked = true;
			   var mulDestId=this.id.replace(/runningDay/gi, "mulDes");
		       $("#"+mulDestId).removeAttr("disabled");
		       checkRunningAll();
		       
		   }else if(document.getElementById('runningDayWed').checked==true && document.getElementById('multiVia').checked==true && document.getElementById('multiDestination').checked==true){
			  
			   document.getElementById("mulWed").checked = true;
			  // var mulViaId=this.id.replace(/runningDay/gi, "mulVia");

		       
		       var mulDestId=this.id.replace(/runningDay/gi, "mulDes"); 
		       $("#"+mulDestId).removeAttr("disabled");
		       checkRunningAll();
		       
		   }else if(document.getElementById('runningDayWed').checked==true){
			   checkRunningAll();
		   }else{
			   
			   $('#mulWed').removeAttr("checked"); 
			   $("#runningDayAll").removeAttr("checked");

		       
		       var mulDestId=this.id.replace(/runningDay/gi, "mulDes");
		       $("#"+mulDestId).attr("disabled","disabled");
		       
		   }  
	   });
 	  
 	   $('#runningDayThu').change(function(){
		   if(document.getElementById('runningDayThu').checked==true && document.getElementById('multiVia').checked==true && document.getElementById('multiDestination').checked==false){
			   
			   document.getElementById("mulThu").checked = true;
			   //var mulViaId=this.id.replace(/runningDay/gi, "mulVia");
			   checkRunningAll();
		       
		   }else if(document.getElementById('runningDayThu').checked==true && document.getElementById('multiDestination').checked==true && document.getElementById('multiVia').checked==false){
			   
			   document.getElementById("mulThu").checked = true; 
			   var mulDestId=this.id.replace(/runningDay/gi, "mulDes");
		       $("#"+mulDestId).removeAttr("disabled");
		       checkRunningAll();
		       
		   }else if(document.getElementById('runningDayThu').checked==true && document.getElementById('multiVia').checked==true && document.getElementById('multiDestination').checked==true){
			  
			   document.getElementById("mulThu").checked = true; 
			   //var mulViaId=this.id.replace(/runningDay/gi, "mulVia");

		       
		       var mulDestId=this.id.replace(/runningDay/gi, "mulDes"); 
		       $("#"+mulDestId).removeAttr("disabled");
		       checkRunningAll();
		       
		   }else if(document.getElementById('runningDayThu').checked==true){
			   checkRunningAll();
		   }else{
			   
			   $('#mulThu').removeAttr("checked"); 
			   $("#runningDayAll").removeAttr("checked");

		       
		       var mulDestId=this.id.replace(/runningDay/gi, "mulDes");
		       $("#"+mulDestId).attr("disabled","disabled");
		       
		   }  
	   });
 	   
 	   $('#runningDayFri').change(function(){
		   if(document.getElementById('runningDayFri').checked==true && document.getElementById('multiVia').checked==true && document.getElementById('multiDestination').checked==false){
			   
			   document.getElementById("mulFri").checked = true;
			   //var mulViaId=this.id.replace(/runningDay/gi, "mulVia");
			   checkRunningAll();
		       
		   }else if(document.getElementById('runningDayFri').checked==true && document.getElementById('multiDestination').checked==true && document.getElementById('multiVia').checked==false){
			   
			   document.getElementById("mulFri").checked = true; 
			   var mulDestId=this.id.replace(/runningDay/gi, "mulDes");
		       $("#"+mulDestId).removeAttr("disabled");
		       checkRunningAll();
		       
		   }else if(document.getElementById('runningDayFri').checked==true && document.getElementById('multiVia').checked==true && document.getElementById('multiDestination').checked==true){
			  
			   document.getElementById("mulFri").checked = true; 
			   //var mulViaId=this.id.replace(/runningDay/gi, "mulVia");

		       
		       var mulDestId=this.id.replace(/runningDay/gi, "mulDes"); 
		       $("#"+mulDestId).removeAttr("disabled");
		       checkRunningAll();
		       
		   }else if(document.getElementById('runningDayFri').checked==true){
			   checkRunningAll();
		   }else{
			   
			   $('#mulFri').removeAttr("checked"); 
			   $("#runningDayAll").removeAttr("checked");

		       
		       var mulDestId=this.id.replace(/runningDay/gi, "mulDes");
		       $("#"+mulDestId).attr("disabled","disabled");
		       
		   }  
	   });
	 
 	   
 	   $('#runningDaySat').change(function(){
		   if(document.getElementById('runningDaySat').checked==true && document.getElementById('multiVia').checked==true && document.getElementById('multiDestination').checked==false){
			   
			   document.getElementById("mulSat").checked = true; 
			   //var mulViaId=this.id.replace(/runningDay/gi, "mulVia");
			   checkRunningAll();
		       
		   }else if(document.getElementById('runningDaySat').checked==true && document.getElementById('multiDestination').checked==true && document.getElementById('multiVia').checked==false){
			   
			   document.getElementById("mulSat").checked = true; 
			   var mulDestId=this.id.replace(/runningDay/gi, "mulDes");
		       $("#"+mulDestId).removeAttr("disabled");
		       checkRunningAll();
		       
		   }else if(document.getElementById('runningDaySat').checked==true && document.getElementById('multiVia').checked==true && document.getElementById('multiDestination').checked==true){
			  
			   document.getElementById("mulSat").checked = true; 
			  // var mulViaId=this.id.replace(/runningDay/gi, "mulVia");

		       
		       var mulDestId=this.id.replace(/runningDay/gi, "mulDes"); 
		       $("#"+mulDestId).removeAttr("disabled");
		       checkRunningAll();
		       
		   }else if(document.getElementById('runningDaySat').checked==true){
			   checkRunningAll();
		   }else{
			   
			   $('#mulSat').removeAttr("checked"); 
			   $("#runningDayAll").removeAttr("checked");

		       
		       var mulDestId=this.id.replace(/runningDay/gi, "mulDes");
		       $("#"+mulDestId).attr("disabled","disabled");
		       
		   }  
	   });
 	  
 //---------------------------------------------------------------------------------------------------// 
 
  $('#save').click(function(e){
	  
	  e.preventDefault();
	  
	  
	  var MY_SELECT = $('select[multiple]#viaStation').get(0);
	  var selection = ChosenOrder.getSelectionOrder(MY_SELECT);
	  if(selection!=""){
	  selection=selection.toString();
	  $("#hviaStation").val(selection);
	  }
	  var MY_SELECT = $('select[multiple]#mulViaSun').get(0);
	  var sunselection = ChosenOrder.getSelectionOrder(MY_SELECT);
	  if(sunselection!=""){
	  sunselection=sunselection.toString();
	  $("#hsunStation").val(sunselection);
	  }
	  var MY_SELECT = $('select[multiple]#mulViaMon').get(0);
	  var monselection = ChosenOrder.getSelectionOrder(MY_SELECT);
	  if(monselection!=""){
	  monselection=monselection.toString();
	  $("#hmonStation").val(monselection);
	  }
	  var MY_SELECT = $('select[multiple]#mulViaTue').get(0);
	  var tueselection = ChosenOrder.getSelectionOrder(MY_SELECT);
	  if(tueselection!=""){
	  tueselection=tueselection.toString();
	  $("#htueStation").val(tueselection);
	  }
	  var MY_SELECT = $('select[multiple]#mulViaWed').get(0);
	  var wedselection = ChosenOrder.getSelectionOrder(MY_SELECT);
	  if(wedselection!=""){
	  wedselection=wedselection.toString();
	  $("#hwedStation").val(wedselection);
	  }
	  var MY_SELECT = $('select[multiple]#mulViaThu').get(0);
	  var thuselection = ChosenOrder.getSelectionOrder(MY_SELECT);
	  if(thuselection!=""){
	  thuselection=thuselection.toString();
	  $("#hthuStation").val(thuselection);
	  }
	  var MY_SELECT = $('select[multiple]#mulViaFri').get(0);
	  var friselection = ChosenOrder.getSelectionOrder(MY_SELECT);
	  if(friselection!=""){
	  friselection=friselection.toString();
	  $("#hfriStation").val(friselection);
	  }
	  var MY_SELECT = $('select[multiple]#mulViaSat').get(0);
	  var satselection = ChosenOrder.getSelectionOrder(MY_SELECT);
	  if(satselection!=""){
	  satselection=satselection.toString();
	  $("#hsatStation").val(satselection);
	  }
	  
    //--------------------------------------------------------------------------------------------------- 
	
	// regular expression to match required time format
 		var error1=null;
 		re = /^(\d{1,2}):(\d{2})([ap]m)?$/;

 	    if($("#scheduleArrival").val() != '') {
 	      if(regs = $("#scheduleArrival").val().match(re)) {
 	        if(regs[3]) {
 	          // 12-hour value between 1 and 12
 	          if(regs[1] < 1 || regs[1] > 12) {
 	            error1="Invalid value for hours: " + regs[1];
 	          }
 	        } else {
 	          // 24-hour value between 0 and 23
 	          if(regs[1] > 23) {
 	            error1="Invalid value for hours: " + regs[1];
 	          }
 	        }
 	        // minute value between 0 and 59
 	        if(regs[2] > 59) {
 	          error1="Invalid value for minutes: " + regs[2];
 	        }
 	      } else {
 	        error1="Invalid time format: " + $("#scheduleArrival").val();
	            
 	      }
 	      
 	    }
 	    
 	 //---------------------------------------------------------------------------------------------------// 
 	
 	 // regular expression to match required time format
   		var error2=null;
   		re = /^(\d{1,2}):(\d{2})([ap]m)?$/;

   	    if($("#scheduleDeparture").val() != '') {
   	      if(regs = $("#scheduleDeparture").val().match(re)) {
   	        if(regs[3]) {
   	          // 12-hour value between 1 and 12
   	          if(regs[1] < 1 || regs[1] > 12) {
   	            error2="Invalid value for hours: " + regs[1];
   	          }
   	        } else {
   	          // 24-hour value between 0 and 23
   	          if(regs[1] > 23) {
   	            error2="Invalid value for hours: " + regs[1];
   	          }
   	        }
   	        // minute value between 0 and 59
   	        if(regs[2] > 59) {
   	          error2="Invalid value for minutes: " + regs[2];
   	        }
   	      } else {
   	        error2="Invalid time format: " + $("#scheduleDeparture").val();    
   	      }
   	      
   	    }
   	    
   	    //-------------------------- Merge Train-------------------------------
   	    
   	    
   	 	if(document.getElementById('mergeTrain').checked==true && $("#mergeTrainNo").val()==0)
		{
		     swal("Please Select the Merge train No");
		}
   	 
 	 //---------------------------------------------------------------------------------------------------//
	  
 	 	else if($('#trainNo').val()=="" || $('#trainName').val()=="" || $('#trainCategory').val()=="" || $('#trainType').val()=="" || $('#sourceStation').val()=="" || $('#defaultPlatform').val()=="" || $('#maxCoach').val()==""){
			
	    	swal("Please fill out all required fields indicated with * symbol");
			
	    }else if(document.getElementById('specialTrain').checked==false && document.getElementById('availableTrain').checked==false){
	    
	    	swal("Please choose one option from Special or Available Train");
	    	
	    }else if(document.getElementById('runningDaySun').checked==false && document.getElementById('runningDayMon').checked==false && document.getElementById('runningDayTue').checked==false && document.getElementById('runningDayWed').checked==false && document.getElementById('runningDayThu').checked==false && document.getElementById('runningDayFri').checked==false && document.getElementById('runningDaySat').checked==false){
	    
	    	swal("Please select running day");
	    		
	    }else if(error1!=null){
	    	swal(error1);
	    	$("#scheduleArrival").removeAttr('value');
	    	$("#scheduleArrival").focus();
	    }else if(error2!=null){
	    	swal(error2);
	    	$("#scheduleDeparture").removeAttr('value');
	    	$("#scheduleDeparture").focus();
	    }/* else if(document.getElementById('runningDaySun').checked==true && document.getElementById('multiVia').checked==true && $("#mulViaSun").val()==null){
	    	swal("Multi Via Can't be blank");
	    	$("#mulViaSun").focus();
	    } else if(document.getElementById('runningDaySun').checked==true && document.getElementById('multiVia').checked==false && $("#viaStation").val()==null){
	    	swal("Via Station Can't be blank");
	    	$("#viaStation").focus();
	    } else if(document.getElementById('runningDayMon').checked==true && document.getElementById('multiVia').checked==true && $("#mulViaMon").val()==null){
	    	swal("Multi Via Can't be blank");
	    	$("#mulViaMon").focus();
	    }else if(document.getElementById('runningDayMon').checked==true && document.getElementById('multiVia').checked==false && $("#viaStation").val()==null){
	    	swal("Via Station Can't be blank");
	    	$("#viaStation").focus();
	    }else if(document.getElementById('runningDayTue').checked==true && document.getElementById('multiVia').checked==true && $("#mulViaTue").val()==null){
	    	swal("Multi Via Can't be blank");
	    	$("#mulViaTue").focus();
	    }else if(document.getElementById('runningDayTue').checked==true && document.getElementById('multiVia').checked==false && $("#viaStation").val()==null){
	    	swal("Via Station Can't be blank");
	    	$("#viaStation").focus();
	    }else if(document.getElementById('runningDayWed').checked==true && document.getElementById('multiVia').checked==true && $("#mulViaWed").val()==null){
	    	swal("Multi Via Can't be blank");
	    	$("#mulViaWed").focus();
	    }else if(document.getElementById('runningDayWed').checked==true && document.getElementById('multiVia').checked==false && $("#viaStation").val()==null){
	    	swal("Via Station Can't be blank");
	    	$("#viaStation").focus();
	    }else if(document.getElementById('runningDayThu').checked==true && document.getElementById('multiVia').checked==true && $("#mulViaThu").val()==null){
	    	swal("Multi Via Can't be blank");
	    	$("#mulViaThu").focus();
	    }else if(document.getElementById('runningDayThu').checked==true && document.getElementById('multiVia').checked==false && $("#viaStation").val()==null){
	    	swal("Via Station Can't be blank");
	    	$("#viaStation").focus();
	    }else if(document.getElementById('runningDayFri').checked==true && document.getElementById('multiVia').checked==true && $("#mulViaFri").val()==null){
	    	swal("Multi Via Can't be blank");
	    	$("#mulViaFri").focus();
	    }else if(document.getElementById('runningDayFri').checked==true && document.getElementById('multiVia').checked==false && $("#viaStation").val()==null){
	    	swal("Via Station Can't be blank");
	    	$("#viaStation").focus();
	    }else if(document.getElementById('runningDaySat').checked==true && document.getElementById('multiVia').checked==true && $("#mulViaSat").val()==null){
	    	swal("Multi Via Can't be blank");
	    	$("#mulViaSat").focus();
	    }else if(document.getElementById('runningDaySat').checked==true && document.getElementById('multiVia').checked==false && $("#viaStation").val()==null){
	    	swal("Via Station Can't be blank");
	    	$("#viaStation").focus();
	    } */else if(document.getElementById('runningDaySun').checked==true && document.getElementById('multiDestination').checked==true && $("#mulDesSun").val()==""){
	    	swal("Multi Destination Can't be blank");
	    	$("#mulDesSun").focus();
	    }else if(document.getElementById('runningDaySun').checked==true && document.getElementById('multiDestination').checked==false && $("#destinationStation").val()==""){
	    	swal("Destination Station Can't be blank");
	    	$("#destinationStation").focus();
	    }else if(document.getElementById('runningDayMon').checked==true && document.getElementById('multiDestination').checked==true && $("#mulDesMon").val()==""){
	    	swal("Multi Destination Can't be blank");
	    	$("#mulDesMon").focus();
	    }else if(document.getElementById('runningDayMon').checked==true && document.getElementById('multiDestination').checked==false && $("#destinationStation").val()==""){
	    	swal("Destination Station Can't be blank");
	    	$("#destinationStation").focus();
	    }else if(document.getElementById('runningDayTue').checked==true && document.getElementById('multiDestination').checked==true && $("#mulDesTue").val()==""){
	    	swal("Multi Destination Can't be blank");
	    	$("#mulDesTue").focus();
	    }else if(document.getElementById('runningDayTue').checked==true && document.getElementById('multiDestination').checked==false && $("#destinationStation").val()==""){
	    	swal("Destination Station Can't be blank");
	    	$("#destinationStation").focus();
	    }else if(document.getElementById('runningDayWed').checked==true && document.getElementById('multiDestination').checked==true && $("#mulDesWed").val()==""){
	    	swal("Multi Destination Can't be blank");
	    	$("#mulDesWed").focus();
	    }else if(document.getElementById('runningDayWed').checked==true && document.getElementById('multiDestination').checked==false && $("#destinationStation").val()==""){
	    	swal("Destination Station Can't be blank");
	    	$("#destinationStation").focus();
	    }else if(document.getElementById('runningDayThu').checked==true && document.getElementById('multiDestination').checked==true && $("#mulDesThu").val()==""){
	    	swal("Multi Destination Can't be blank");
	    	$("#mulDesThu").focus();
	    }else if(document.getElementById('runningDayThu').checked==true && document.getElementById('multiDestination').checked==false && $("#destinationStation").val()==""){
	    	swal("Destination Station Can't be blank");
	    	$("#destinationStation").focus();
	    }else if(document.getElementById('runningDayFri').checked==true && document.getElementById('multiDestination').checked==true && $("#mulDesFri").val()==""){
	    	swal("Multi Destination Can't be blank");
	    	$("#mulDesFri").focus();
	    }else if(document.getElementById('runningDayFri').checked==true && document.getElementById('multiDestination').checked==false && $("#destinationStation").val()==""){
	    	swal("Destination Station Can't be blank");
	    	$("#destinationStation").focus();
	    }else if(document.getElementById('runningDaySat').checked==true && document.getElementById('multiDestination').checked==true && $("#mulDesSat").val()==""){
	    	swal("Multi Destination Can't be blank");
	    	$("#mulDesSat").focus();
	    }else if(document.getElementById('runningDaySat').checked==true && document.getElementById('multiDestination').checked==false && $("#destinationStation").val()==""){
	    	swal("Destination Station Can't be blank");
	    	$("#destinationStation").focus();
	    }else if(document.getElementById('multiDestination').checked==false && $("#sourceStation").val()==$("#destinationStation").val()){
	    	swal("Source and Destination Can't be same");
	    	$("#destinationStation").focus();
	    }else if(document.getElementById('multiDestination').checked==true && document.getElementById('runningDaySun').checked==true &&  $("#sourceStation").val()==$("#mulDesSun").val()){
	    	swal("Source and Destination Can't be same");
	    	$("#mulDesSun").focus();
	    }else if(document.getElementById('multiDestination').checked==true && document.getElementById('runningDayMon').checked==true &&  $("#sourceStation").val()==$("#mulDesMon").val()){
	    	swal("Source and Destination Can't be same");
	    	$("#mulDesMon").focus();
	    }else if(document.getElementById('multiDestination').checked==true && document.getElementById('runningDayTue').checked==true &&  $("#sourceStation").val()==$("#mulDesTue").val()){
	    	swal("Source and Destination Can't be same");
	    	$("#mulDesTue").focus();
	    }else if(document.getElementById('multiDestination').checked==true && document.getElementById('runningDayWed').checked==true &&  $("#sourceStation").val()==$("#mulDesWed").val()){
	    	swal("Source and Destination Can't be same");
	    	$("#mulDesWed").focus();
	    }else if(document.getElementById('multiDestination').checked==true && document.getElementById('runningDayThu').checked==true &&  $("#sourceStation").val()==$("#mulDesThu").val()){
	    	swal("Source and Destination Can't be same");
	    	$("#mulDesThu").focus();
	    }else if(document.getElementById('multiDestination').checked==true && document.getElementById('runningDayFri').checked==true &&  $("#sourceStation").val()==$("#mulDesFri").val()){
	    	swal("Source and Destination Can't be same");
	    	$("#mulDesFri").focus();
	    }else if(document.getElementById('multiDestination').checked==true && document.getElementById('runningDaySat').checked==true &&  $("#sourceStation").val()==$("#mulDesSat").val()){
	    	swal("Source and Destination Can't be same");
	    	$("#mulDesSat").focus();
	    }else{
	    	if(!$("#train_id").length){ 
		    	$.getJSON("checkDuplicateTrain?trainNo="+$("#trainNo").val(),function(data){
		    		if(data.result=="duplicate"){
		    			swal("Train Already Exist"); 
		    		}else{		    			
		    		   $('#trainMasterForm').attr('action', 'saveOrUpdateTrain').submit(); 
		    		}
			    }); 
            }else{ 
            	
            	if(document.getElementById('multiVia').checked==true){
        			$.getJSON("updateTrainStations?value=1&sunstations="+sunselection+"&monstations="+monselection+"&tuestations="+tueselection+"&wedstations="+wedselection+"&thustations="+thuselection+"&fristations="+friselection+"&satstations="+satselection+"&trainNo="+$("#trainNo").val(),function(data){
    					if(data.result=="success"){
    					console.log("Train Stations Updated Successfully");
    				 	$('#trainMasterForm').attr('action', 'saveOrUpdateTrain').submit(); }
    		        }); 
       		
             	}
            	
            	else{
            	    
                	var arrivaldt=	$("#scheduleArrival").val()
                	var departuredt=	$("#scheduleDeparture").val()
                		var arrdt=	 arrivaldt.split(":");
                		var depdt=   departuredt.split(":");
                	
                	if(arrdt[0]<depdt[0] || (arrivaldt != '' ||  departuredt != '')){
                		
                		$.getJSON("updateTrainStations?stations="+selection+"&trainNo="+$("#trainNo").val(),function(data){
						if(data.result=="success"){
						console.log("Train Stations Updated Successfully");
					 	$('#trainMasterForm').attr('action', 'saveOrUpdateTrain').submit(); }
			        }); 
                		
                			}
                else if (arrdt[0]==depdt[0]) {
                	if(arrdt[1]<depdt[1])
        			{
        		$.getJSON("updateTrainStations?stations="+selection+"&trainNo="+$("#trainNo").val(),function(data){
				if(data.result=="success"){
				console.log("Train Stations Updated Successfully");
			 	$('#trainMasterForm').attr('action', 'saveOrUpdateTrain').submit(); }
	        }); 
        			}
        		else
        			{
        			swal("Train Departure Time Always Greater...");
        			}
					}
                		 else
                			 {
                			 swal("Train Departure Time Always Greater...");
                			 }
	            	}
            	
            	
            }
		}
	    
  });

 $('#delete').click(function(e){
	 e.preventDefault();
	 
	 if(!$('#trainNo').val()==""){
			
	    	swal("Please fill out all required fields indicated with * symbol");
	    	 swal({
	   		  title: "Are you sure?",
	   		  text: "You want to delete the Train detail!",
	   		  type: "warning",
	   		  showCancelButton: true,
	   		  confirmButtonColor: "#DD6B55",
	   		  confirmButtonText: "Yes, delete it!",
	   		  closeOnConfirm: false
	   		},
	   		function(){
	   			
	   			$('#trainMasterForm').attr('action', 'deleteTrain').submit();
	   		 
	   		}); 
	    }
	 
	 else
		 {
		 swal("Please select the train first");
		 }
	
	 
	
});	
 
});


function checkRunningAll()
{
	  var count=-1;
	   $( ".runningDay" ).each(function( index ) {
		   if(this.checked==true){
			   count++;
		   }
		   if(count==6){
			   document.getElementById("runningDayAll").checked = true;
		   }

		  });
}

//============== Get cursor position of textbox============================== 

jQuery.fn.extend({
	getCursorPosition: function() {
	        var el = $(this).get(0);
	        var pos = 0;
	        if('selectionStart' in el) {
	            pos = el.selectionStart;
	        } else if('selection' in document) {
	            el.focus();
	            var Sel = document.selection.createRange();
	            var SelLength = document.selection.createRange().text.length;
	            Sel.moveStart('character', -el.value.length);
	            pos = Sel.text.length - SelLength;
	        }
	        return pos;
	    }
})

//=================================XXXXXXXXXXXX========================

</script>

<div id="footer"><p>&copy; 2016 Dan Electronic System Pvt. Ltd.<p></div>
<script type="text/javascript" src="../js/time.js"></script>  
</body>
</html>