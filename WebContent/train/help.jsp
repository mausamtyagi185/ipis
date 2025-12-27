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
<li style=" float: left;"><a href="#">Help</a></li>
<li style="float: right"><a href="../logout">Logout</a></li>
<li style="float: right"><a href="../user/changePassword"><s:property value="#session['user'].userId" /></a></li> 
<li style="float: right"><span style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;" id="time"></span></li>
</ul>
</div>







<%--   <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js" type="text/javascript"></script> --%>
   <script src="../js/jquery-1.10.2.js" type="text/javascript"></script>
   <script type="text/javascript" src="../js/blockUI.js"></script> 
   <script type="text/javascript" src="../js/chosen.jquery.min.js"></script>
<script type="text/javascript" src="../js/chosen.order.jquery.min.js"></script>
<%--   <script src="../chosen_v1.5.1/chosen.jquery.js" type="text/javascript"></script>
  <script src="../chosen_v1.5.1/docsupport/prism.js" type="text/javascript" charset="utf-8"></script> --%>
  
  <script src="../sweetalert-master/dist/sweetalert-dev.js"></script>
  <div style="margin-left: 643px">
 <u> <h3><span>DAN Electronic System User Guide</span></h3></u>
  </div>
  <div style="margin-left: 343px">
  <img src="../images/onlinetrain.png" height="600" width="1000">
  <h4>step 1:To add a new Train on online train page,type train number in the given 'Enter Train Number' as shown above then choose a <br>train and click enter.</h4>
  <h4>step 2:Now Choose the status and check on TADD to send data on display board and if you want to send on coach then check on <br>CGDB and then send on CGDB icon.   </h4>
  <h4>step 3:Now for announcement check on ANN. and click on play button on the right side.<br> To stop,pause,reload should be done from online train.   </h4>
  </div>
  <div style="margin-left: 343px">
   <img src="../images/status.png" height="600" width="1000">
   <h4>step 1:To check the link of various devices like PDC and SLDB,AGDB,MLDB,CGDB then go on status link. </h4>
   <h4>step 2:Now click on get status, if you want to check link status of any device. </h4>
  </div>
   <div style="margin-left: 343px">
   <img src="../images/train_display.png" height="600" width="1000">
   <h4>step 1:To configure various devices is done on display page as shown above</h4>
   <h4>step 2:Now to add any device which gives you features like connection mode and to choose various platforms,effects and time. </h4>
   </div>
<div id="footer"><p>&copy; 2016 Dan Electronic System Pvt. Ltd.<p></div>
<script type="text/javascript" src="../js/time.js"></script>  
</body>
</html>