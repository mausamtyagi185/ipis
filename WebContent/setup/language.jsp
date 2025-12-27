<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add New Language</title>
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
    padding: 14px 16px;
    text-decoration: none;
}
.active {
    background-color: #03A9F4;
    color: white;
    }

current_page_item a {
    background: #1D96ED;
}

.not-active-privilege {
   pointer-events: none;
   cursor: default;
   opacity: 0.3;
}

</style>

</head>
<body> <div style="background: #111">
   <img src="../images/header2.png" width="100%" height="100" alt="header2"/>
<ul>

	<li style=" float: left;"><a style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;" href="../train/trainRunningInfo">Online Train</a></li>
	<li style=" float: left;"><a style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;" <s:if test='%{#session["user"].status==false}'> class="not-active-privilege" </s:if> href="../device/deviceStatus">Status</a></li>
	<li style=" float: left;"><a style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;" <s:if test='%{#session["user"].display==false}'> class="not-active-privilege" </s:if> href="../device/deviceConfig">Display</a></li>
	<li style=" float: left;"><a style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;" <s:if test='%{#session["user"].intensity==false}'> class="not-active-privilege" </s:if> href="../device/deviceIntensity">Intensity</a></li>
	<li style=" float: left;"><a style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;" <s:if test='%{#session["user"].logReport==false}'> class="not-active-privilege" </s:if> href="../log-report/logReport">Log Report</a></li>
 	<li style=" float: left;"><a style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;" <s:if test='%{#session["user"].logReport==false}'> class="not-active-privilege" </s:if> href="../cctv/led-lcd-display.jsp">CCTV</a></li> 
	<li style=" float: left;"><a style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;" <s:if test='%{#session["user"].personalAnc==false}'> class="not-active-privilege" </s:if> href="../announcement/personalAnc">PA</a></li>
	                      
	<li style=" float: left;"><a style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;" <s:if test='%{#session["user"].message==false}'> class="not-active-privilege" </s:if> href="../message/getBoardMessageList">Message</a></li>
	<li style=" float: left;"class="active" ><a  style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;" href="../setup/setup.jsp">Setup</a></li>
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
<li style="display: block;color: white;text-align: center;padding: 3px 20px;text-decoration: none;float: left;" ><img src="../images/arrow.PNG" style="margin-bottom: -5px">Language Master</li>
</ul>
</div>
    <div id="nav">
<div id='cssmenu'>
<ul>
   <li><a href='getStationDetail'>Station Master</a></li>
    <li><a href='getIntegration'>Integration / NTES</a></li>
   <li><a href='getServerDetail'>Server Master</a></li>
      <li class='active'><a href='getLanguageList'>Language Master</a></li>
   <li><a href='getTrainStatusList'>Status Master</a></li>
      <li><a href='../train/getAllTrainList'>Train Master</a></li>
   <li><a href='../train/coachEntry'>Coach Position</a></li>
   <li><a href='setup.jsp'>Back</a></li>
</ul>
</div>
</div>
<div id="displaynew">
<form action="addLanguage" method="post">
<div id="buttons" style="text-align: center">
 <label>Language</label>  
 <input type="text" name="language.languageName" id="language" style="width: 25%; height: 30px;  margin-top: 10px; outline: none; font-size: 16px;" onkeyup="allowAlphabet()" required>
<button class="btn orange">Add</button>
</form>

<br>
 <br> <center><table class="table1" style="background-color: white;width: 50%">
<thead>
                    <tr>
    <th>S.No</th>
<th>Language Name</th>
<th>Delete</th>
</tr></thead>
<% int sno = 1; %>
<s:iterator value="languageList">
<tr>
<td><%= sno %></td>
<td><s:property value="languageName"/></td>
<td><a href="deleteLanguage?id=<s:property value="id"/>"><img alt="" src="../images/Delete_Icon.png" width="30px" height="30px"></a></td>
</tr>
<% sno++; %>
</s:iterator>
</table></center><br>
</div>

<br><br><br><br><br><br><br><br><br>
<div id="footer"><p>&copy; 2016 Dan Electronic System Pvt. Ltd.<p></div>
<script type="text/javascript">
function allowAlphabet(){ 
	if (!document.getElementById('language').value.match(/^[a-zA-Z ]+$/) && document.getElementById('language').value !=""){
		document.getElementById('language').value=document.getElementById('language').value.slice(0, -1);
		document.getElementById('language').focus();
	}
}
</script>
<script type="text/javascript" src="../js/time.js"></script>  
</body>
</html>
