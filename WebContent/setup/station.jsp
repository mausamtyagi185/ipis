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
<script type="text/javascript">
$( document ).ready(function() {
	
	$( "#platformNo" ).change(function() {
		for(var i=1;i<=24;i++){
			$("#"+i).attr("disabled","disabled");
			$( "#"+i ).removeAttr("value");	
		}
		var no=$( "#platformNo" ).val();
		if(no!=""){
		for(var i=1;i<=no;i++){
			$("#"+i ).attr("value",i);	
			$("#"+i).removeAttr("disabled");
		}
		}
		
	});
	
	var no=$( "#platformNo" ).val();
	if(no!=""){
		var platformNos='<s:property value="station.platformNos"/>';
		var platformNosArray=platformNos.split(",");
	for(var i=1;i<=no;i++){
		$( "#"+i ).attr("value",platformNosArray[i-1]);
		$("#"+i).removeAttr("disabled");
	}
	
	}
	$(".toUpper").blur(function(e){
	     if(this.value.length>0){
	    	 $("#"+this.id).val(this.value.toUpperCase());
	     }
	});
	
	$("#save").click(function(e)
		{
		e.preventDefault();
		var platNo=$( "#platformNo" ).val();
		var platformDetails="";
		for(var i=1;i<=platNo;i++)
			{
			
			platformDetails+=$("#"+i).val()+",";
			}
		$("#platformNos").val(platformDetails.substring(0,platformDetails.length-1));
		$("#stationDetailForm").attr("action","saveOrUpdateStationDetail").submit();
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
<li style="display: block;color: white;text-align: center;padding: 3px 20px;text-decoration: none;float: left;" ><img src="../images/arrow.PNG" style="margin-bottom: -5px">Station Master</li>
</ul>
</div>
		
<div id="nav">
<div id='cssmenu'>
<ul>
   <li class='active'><a href='getStationDetail'>Station Master</a></li>
   <li><a href='getIntegration'>Integration / NTES</a></li>
   <li><a href='getServerDetail'>Server Master</a></li>
      <li><a href='getLanguageList'>Language Master</a></li>
   <li><a href='getTrainStatusList'>Status Master</a></li>
    <li><a href='../train/getAllTrainList'>Train Master</a></li>
   <li><a href='../train/coachEntry'>Coach Position</a></li>
    <li><a href='setup.jsp'>Back</a></li>
</ul>
</div>
</div>
<div  class="right" style="background: rgba(0, 0, 0, 0.68);width: 80%">

<form id="stationDetailForm" action="#" method="post" enctype="multipart/form-data" style="text-align: center;">
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
<tr><%-- <td>
<label>First Language</label>
</td><td>
<select name="station.firstLanguage">
<option value="<s:property value='station.firstLanguage'/>"><s:property value='station.firstLanguage'/></option>
<s:iterator value="languageList"> 
<option value="<s:property value="languageName"/>"><s:property value="languageName"/></option>
</s:iterator>
</select>
</td> --%>
<td>
<s:select list="languageList" listValue="languageName" name="station.firstLanguage" label="First Language" listKey="languageName"/>
</td>
</tr>

<tr><%-- <td>
<label>Second Language</label>
</td><td>
<select name="station.secondLanguage">
<option value="<s:property value='station.secondLanguage'/>"><s:property value='station.secondLanguage'/></option>
<s:iterator value="languageList">
<option value="<s:property value="languageName"/>"><s:property value="languageName"/></option>
</s:iterator>
</select>
</td> --%>
<td>
<s:select list="languageList" listValue="languageName" name="station.secondLanguage" label="Second Language" listKey="languageName"/>
</td>
</tr>

<tr><!-- <td>
<label>Third Language</label>
</td> -->
<%-- <select id="thirdLang" name="station.thirdLanguage">
<option type="hidden" value="<s:property value='station.thirdLanguage'/>"><s:property value='station.thirdLanguage'/></option>
<s:iterator value="languageList">
<option value="<s:property value="languageName"/>"><s:property value="languageName"/></option>
</s:iterator>
</select>  --%>
<td>
<s:select list="languageList" listValue="languageName" name="station.thirdLanguage" label="Third Language" listKey="languageName"/>
</td></tr>
</table>
</div>
<br>
<%-- <div >
 <label>Auto Train Load Time</label>
<select name="station.autoTrainLoadTime" style="width: 50px; height: 30px">
<script>
var autoTime=<s:property value='station.autoTrainLoadTime'/>;
for(var i=0; i<=6;i++){
	if(i==0){
		document.write("<option value='0'>Select</option>");
	}
	else if(i==autoTime){
		document.write("<option value="+i+" selected>"+i+"</option>");
	}
	else{
		document.write("<option value="+i+">"+i+"</option>");
	}	
}

</script>
</select>  <label>(In Minute)</label><br><br>
</div> --%>


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
</form>
</div>

 
	
<div id="footer"><p>&copy; 2016 Dan Electronic System Pvt. Ltd.<p></div>
<script type="text/javascript" src="../js/time.js"></script>  

</body>

</html>