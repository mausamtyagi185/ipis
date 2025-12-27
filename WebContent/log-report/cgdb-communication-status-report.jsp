<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CGDB Communication Status Report</title>
<link rel="stylesheet" href="../css/train.css">
<link rel="stylesheet" href="../css/jquery-ui.css">
<script src="../js/jquery-1.10.2.js"></script>
<script src="../js/jquery-ui.js"></script>
<script type="text/javascript" src="../js/blockUI.js"></script> 
<script type="text/javascript">
$(document).ready(function() {
    
	$( "#datepicker" ).datepicker({dateFormat: 'dd-mm-yy'});
    
} );
function printContent(el){
	var restorepage = document.body.innerHTML;
	var printcontent = document.getElementById(el).innerHTML;
	document.body.innerHTML = printcontent;
	window.print();
	document.body.innerHTML = restorepage;
	location.reload();
}
</script>

<style type="text/css">
.right{
margin-left:25px;
display: inline-block;
width: 80%;
}

.ui-datepicker .ui-datepicker-prev span{
display: contents;
}

 .ui-datepicker .ui-datepicker-next span {
 display: contents;
 }
table {
background-color:white;
	width:100%; 
	border: solid 1px black;
/* 	margin-top: 50px; */
}
tr{
height: 30px;
}
th{
border: 1px solid #ccc; 
background-color: #03A9F4;
color: white}
td{
border: 1px solid #ccc; 
	padding:1px;
    text-align:center;
        width: 21px;
    }
.coach{
margin-top: 30px;
}

.coach table tr td input{
width:30px;
}

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

    padding: 5px 16px;
    text-decoration: none;
}
.active {
    background-color: #03A9F4;
    color: white;}


    
    label{
    color: white;}

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
   <ul style="list-style-type: none;margin: 0;padding: 0;overflow: hidden;background-color: #335996">

         <li style=" float: left;"><a style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;" href="../train/trainRunningInfo">Online Train</a></li>
         <li style=" float: left;"><a style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;" <s:if test='%{#session["user"].status==false}'> class="not-active-privilege" </s:if> href="../device/deviceStatus">Status</a></li>
		 <li style=" float: left;"><a style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;" <s:if test='%{#session["user"].display==false}'> class="not-active-privilege" </s:if> href="../device/deviceConfig">Display</a></li>
		 <li style=" float: left;"><a style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;" <s:if test='%{#session["user"].intensity==false}'> class="not-active-privilege" </s:if> href="../device/deviceIntensity">Intensity</a></li>
		 <li style=" float: left;"><a style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;"  class="active" href="logReport">Log Report</a></li>
 		 <li style=" float: left;"><a style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;" <s:if test='%{#session["user"].cctv==false}'> class="not-active-privilege" </s:if> href="../cctv/led-lcd-display.jsp">CCTV</a></li> 
		 <li style=" float: left;"><a style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;" <s:if test='%{#session["user"].personalAnc==false}'> class="not-active-privilege" </s:if> href="../announcement/personalAnc">PA</a></li>
	                       
		 <li style=" float: left;"><a style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;" <s:if test='%{#session["user"].message==false}'> class="not-active-privilege" </s:if> href="../message/getBoardMessageList">Message</a></li>
		 <li style=" float: left;"><a style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;" <s:if test='%{#session["user"].setup==false}'> class="not-active-privilege" </s:if> href="../setup/setup.jsp">Setup</a></li>
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
   <li><a href='announcementLogReport'>Announcement Report</a></li>
   <li><a href='coachGuidanceLogReport'>Coach Guidance Report</a></li>
   <li class='active'><a href='CGDBCommunicationStatusLogReport'>CGDB Communication Status Report</a></li>
   <li><a href='TADBCommStatusLogReport'>TADDB Communication Status Report</a></li>
   <li><a href='displayBoardLogReport'>Display Board Report</a></li>
   <li><a href='LinkCheckStatusLogReport'>Link Status Report</a></li>
  
</ul>
</div>
</div>
<div class="right" >
<br>


<form action="getCGDBCommStatusLogReport" method="post">
<div>Select Date <input type="text" name="searchDate" id="datepicker" required> <button>View Report</button>
<a href="#" id="print" style="display: inline-block;float:right;" onclick="printContent('report')"><img width="60px" height="35px" src="../images/print.png" /></a>
</div>
</form>


<div id="report" style="background: rgba(0, 0, 0, 0.68);">
<h3 style="text-align: center;"><label>CGDB Communication Status Report</label></h3><hr>
<table class="example" class="display" cellspacing="0" width="100%" style="font-size: 15px">
<thead>
<tr>
<th>CGS No.</th>
<th>1</th>
<th>2</th>
<th>3</th>
<th>4</th>
<th>5</th>
<th>6</th>
<th>7</th>
<th>8</th>
<th>9</th>
<th>10</th>
<th>11</th>
<th>12</th>
<th>13</th>
<th>14</th>
<th>15</th>
<th>16</th>
<th>17</th>
<th>18</th>
<th>19</th>
<th>20</th>
<th>21</th>
<th>22</th>
<th>23</th>
<th>24</th>
<th>25</th>
<th>26</th>
<th>27</th>
<th>28</th>
<th>29</th>
<th>30</th>
</tr>
</thead>
<tbody>
  <s:iterator value="cgdbCommStatusLogList" status="list">  
<tr>
<th><s:property value="updatedAt"/> / <s:property value="updatedBy"/></th>
<%-- <script>
for(var i=0;i<=29;i++)
	{
	 document.write('<td></td>');
	}
</script> --%>
</tr>
<tr>
<th>PF-<s:property value="defaultPlatform"/> / PDC <s:property value="platformConfig"/></th>
<%-- <script>
for(var i=0;i<=29;i++)
{
 document.write('<td></td>');
}
</script> --%>
</tr>
<tr>
<th>Port No</th>
<script>
var portNos='<s:property value="portNo"/>';
var res=portNos.split(",");
for( var i=0;i<res.length;i++)
{
	
	document.write('<td>'+res[i]+'</td>');
}
for( var i=res.length;i<=29;i++)
{
	document.write('<td></td>');
}
</script>
</tr>
<tr>
<th>Status</th>
<script>
var status='<s:property value="status"/>';
var res=status.split(",");
for( var i=0;i<res.length;i++)
{
	if(res[i].startsWith("true"))
		{
			document.write('<td><img src="../images/true.png" alt="true"></td>');
		}
	else
		{
		document.write('<td><img src="../images/false.png" alt="false"></td>');
		}
}
for( var i=res.length;i<=29;i++)
{
	document.write('<td></td>');
}
</script>
</tr>
 </s:iterator>  
</tbody>
</table>
</div>
</div>

<div id="footer"><p>&copy; 2016 Dan Electronic System Pvt. Ltd.<p></div>
<script type="text/javascript" src="../js/time.js"></script>  
</body>
</html>