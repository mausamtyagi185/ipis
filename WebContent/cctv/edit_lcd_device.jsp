<%-- <%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <TITLE>Personal Announcement</TITLE>
    <META http-equiv=Content-Type content="text/html; charset=utf-8"> 
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" type="text/css" href="../css/component.css" />
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
   <img src="../images/header2.PNG" width="100%" height="100" alt="header2"/>
<ul>

	<li><a href="../train/trainRunningInfo" style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;">Online Train</a></li>
	<li style=" float: left;"><a style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;" <s:if test='%{#session["user"].status==false}'> class="not-active-privilege" </s:if> href="../device/deviceStatus">Status</a></li>
	<li style="float: left;"><a href="../device/deviceConfig" <s:if test='%{#session["user"].display==false}'> class="not-active-privilege" </s:if> style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;">Display</a></li>
	<li style="float: left;"><a href="../device/deviceIntensity" <s:if test='%{#session["user"].intensity==false}'> class="not-active-privilege" </s:if> style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;">Intensity</a></li>
	<li style="float: left;"><a href="../log-report/logReport" <s:if test='%{#session["user"].logReport==false}'> class="not-active-privilege" </s:if> style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;">Log Report</a></li>
<!-- 	<li><a class="active" href="#" style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;">CCTV</a></li> -->
	<li><a href="../announcement/personalAnc" <s:if test='%{#session["user"].personalAnc==false}'> class="not-active-privilege" </s:if> style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;">PA</a></li>
	<li><a href="../message/getBoardMessageList" <s:if test='%{#session["user"].message==false}'> class="not-active-privilege" </s:if> style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;">Message</a></li>
	<li><a href="../setup/setup.jsp" <s:if test='%{#session["user"].setup==false}'> class="not-active-privilege" </s:if> style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;">Setup</a></li>
    <li><a href="../option/optionSettings" style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;">Interface</a></li>
	<li><a href="../user/userSetting" <s:if test='%{#session["user"].user==false}'> class="not-active-privilege" </s:if> style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;">User</a></li>
	<li><a href="#" style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;">Help</a></li>
	<li style="float: right"><a href="../logout" style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;">Logout</a></li>
	<li style="float: right"><a href="../user/changePassword" style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;"><s:property value="#session['user'].userId" /></a></li>
                                
</ul>
</div>
<center>
<br>
<div style="background: rgba(0, 0,0, 0.68);width: 40%">
<form method="get" action="">
<br>
<h2>LED/LCD Display Setting:</h2>
<br>
<label style="color:white;">No. of Line to be Displayed</label>
<select style="width:50px;">
<option value="3">3</option>
<option value="4">4</option>
<option value="5">5</option>
</select>
<br><br>
<button class="btn orange">Start LED TV</button> 
<button class="btn orange" style="background: #ce4c4a;">Close LED TV</button>
<br><br><br><br>
</form>
</div> 
<br>
<span style="color:green;"><s:property value="result"/></span>

</center>


<!-- ----------------------------------------------------- -->

<script type="text/javascript" src="../js/jquery.min.js"></script>

 <script type="text/javascript">
   $( document ).ready(function() {
   
   });
   
 </script>
 
 <!-- ----------------------------------------------------- -->
 <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> 
 <div id="footer"><p>&copy; 2016 Dan Electronic System Pvt. Ltd.<p></div>
</body>
</html> --%>

<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <TITLE>Personal Announcement</TITLE>
    <META http-equiv=Content-Type content="text/html; charset=utf-8"> 
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" type="text/css" href="../css/component.css" />
<!-- --Css for Menu-- -->
<style>

form input{
height:15px;
width: 10%;
}

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
   <img src="../images/header2.png" width="100%" height="100%" alt="header2"/>
<%-- <ul>

	<li><a href="../train/trainRunningInfo" style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;">Online Train</a></li>
	<li style=" float: left;"><a style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;" <s:if test='%{#session["user"].status==false}'> class="not-active-privilege" </s:if> href="../device/deviceStatus">Status</a></li>
	<li style="float: left;"><a href="../device/deviceConfig" <s:if test='%{#session["user"].display==false}'> class="not-active-privilege" </s:if> style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;">Display</a></li>
	<li style="float: left;"><a href="../device/deviceIntensity" <s:if test='%{#session["user"].intensity==false}'> class="not-active-privilege" </s:if> style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;">Intensity</a></li>
	<li style="float: left;"><a href="../log-report/logReport" <s:if test='%{#session["user"].logReport==false}'> class="not-active-privilege" </s:if> style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;">Log Report</a></li>
	<li><a class="active" href="#" style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;">CCTV</a></li> 
	<li><a href="../announcement/personalAnc" <s:if test='%{#session["user"].personalAnc==false}'> class="not-active-privilege" </s:if> style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;">PA</a></li>
	<li><a href="../message/getBoardMessageList" <s:if test='%{#session["user"].message==false}'> class="not-active-privilege" </s:if> style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;">Message</a></li>
	<li><a href="../setup/setup.jsp" <s:if test='%{#session["user"].setup==false}'> class="not-active-privilege" </s:if> style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;">Setup</a></li>
    <li><a href="../option/optionSettings" style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;">Interface</a></li>
	<li><a href="../user/userSetting" <s:if test='%{#session["user"].user==false}'> class="not-active-privilege" </s:if> style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;">User</a></li>
	<li><a href="../train/help.jsp" style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;">Help</a></li>
	<li style="float: right"><a href="../logout" style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;">Logout</a></li>
	<li style="float: right"><a href="../user/changePassword" style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;"><s:property value="#session['user'].userId" /></a></li>
    	<li style="float: right"><span style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;" id="time"></span></li>                            
</ul> --%>
</div>

<center>
<div style="background: rgba(0, 0, 0, 0.68);width: 700px;">
<br>
<h1 style="color: white;">LCD Device Configuration</h1>
<div class="right">
<form  method="post" id="form" action="updatelcddeviceconfig" style="margin-left: 20%;" enctype="multipart/form-data">
<s:iterator value="editdevicedata"> 
<table style="margin-top: 63px;">

<tr>
<td><label style="color: white;">Device Name*</label>
</td>
<td>
<input type="text" id="devicename" name="editdeviceobj.Device_Name"  value="<s:property value='Device_Name'/>" required>
</td>
</tr>
<tr>
<td>
<label class="table-margin-top" style="color: white;">Display Type*</label>
</td>
<td>
 <select id="devicetype" name="editdeviceobj.Device_Type">
<option>Select</option>
<option value="1">Single</option>
<option value="2">VideoWall</option>
<option value="3">CGDB</option>
</select>
 
 

</td>
</tr>
<tr>
<td>
<label class="table-margin-top" style="color: white;">Display Mode*</label>
</td>
<td>
<select id="devicemode" name="editdeviceobj.display_mode">
</select>
</td>
</tr>
<tr>
<td>
<label class="table-margin-top" style="color: white;">Device Address*</label>
</td>
<td>
<input type="number" id="address" name="editdeviceobj.Device_Adrress" style="width: 190px;"  value="<s:property value='Device_Adrress'/>" required>
</td>
</tr>

<tr>
<td>
<label class="table-margin-top" style="color: white;">Device IP:</label>
</td>
<td>
<input type="text" id="" name="editdeviceobj.Device_Ip" value="<s:property value='Device_Ip'/>" class="upload table-margin-left table-margin-top" />
</td></tr>

</table>
<div id="platform">
<label class="table-margin-top" name="" id="" style="color: white;">Platform:</label>
<input type="hidden" name="editdeviceobj.Device_Platform" id="hid">
<fieldset>
<label style="color: white;"> Select All</label> <input type="checkbox" name="pf" id="pfALL" onclick="toggle(this);" value="ALL" ><br/>
<label style="color: white;"> 1</label><input type="checkbox" name="pf" id="pf1" value="1" />     
<label style="color: white;"> 2</label><input type="checkbox" name="pf"  id="pf2" value="2"/>
<label style="color: white;"> 3</label><input type="checkbox" name="pf"  id="pf3" value="3"/>
<label style="color: white;"> 4</label><input type="checkbox" name="pf" id="pf4" value="4" />
<label style="color: white;"> 5</label><input type="checkbox" name="pf" id="pf5" value="5"/>     
<label style="color: white;"> 6</label><input type="checkbox" name="pf" id="pf6" value="6" />
<label style="color: white;"> 7</label><input type="checkbox" name="pf" id="pf7" value="7" />
<label style="color: white;"> 8</label><input type="checkbox" name="pf" id="pf8" value="8" />
<label style="color: white;"> 9</label><input type="checkbox" name="pf" id="pf9" value="9" />     
<label style="margin-left: -6px;color: white;"> 10</label><input type="checkbox" name="pf" id="pf10" value="10"/>
<label style="margin-left: -9px;color: white;"> 11</label><input type="checkbox" name="pf" id="pf11" value="11" />
<label style="margin-left: -9px;color: white;"> 12</label><input type="checkbox" name="pf" id="pf12" value="12" />

</fieldset>
</div>
<br>

<div id="coach" style="display: none;">
<label class="table-margin-top" id=""  style="color: white;">PF No:</label>
<select id="coachpf" requried>
<option value="select" >Select</option>
<option value="1">1</option>
<option value="2">2</option>
<option value="3">3</option>
<option value="4">4</option>
<option value="5">5</option>
<option value="6">6</option>
<option value="7">7</option>
<option value="8">8</option>
<option value="9">9</option>
<option value="10">10</option>
<option value="11">11</option>
<option value="12">12</option>
</select>
<label class="table-margin-top" id=""  style="color: white;">Coach:</label>
<input type="number" name="editdeviceobj.cgdb_count" id="coachcount" value="<s:property value='cgdb_count'/>" requried/>
</div>
<div id="brige">
<label class="table-margin-top" id=""  style="color: white;">First Bridge:</label>
<select id="fbridge" name="editdeviceobj.firstBridge">
<option value="NA" >NA</option>
<option value="1">1</option>
<option value="2">2</option>
<option value="3">3</option>
<option value="4">4</option>
<option value="5">5</option>
<option value="6">6</option>
<option value="7">7</option>
<option value="8">8</option>
<option value="9">9</option>
<option value="10">10</option>
<option value="11">11</option>
<option value="12">12</option>
<option value="13">13</option>
<option value="14">14</option>
<option value="15">15</option>
<option value="16">16</option>
<option value="17">17</option>
<option value="18">18</option>
<option value="19">19</option>
<option value="20">20</option>
<option value="21">21</option>
<option value="22">22</option>
<option value="23">23</option>
<option value="24">24</option>
<option value="25">25</option>
</select>

<label class="table-margin-top" id=""  style="color: white;">Second Bridge:</label>
<select id="sbridge" name="editdeviceobj.secondBridge">
<option value="NA" >NA</option>
<option value="1">1</option>
<option value="2">2</option>
<option value="3">3</option>
<option value="4">4</option>
<option value="5">5</option>
<option value="6">6</option>
<option value="7">7</option>
<option value="8">8</option>
<option value="9">9</option>
<option value="10">10</option>
<option value="11">11</option>
<option value="12">12</option>
<option value="13">13</option>
<option value="14">14</option>
<option value="15">15</option>
<option value="16">16</option>
<option value="17">17</option>
<option value="18">18</option>
<option value="19">19</option>
<option value="20">20</option>
<option value="21">21</option>
<option value="22">22</option>
<option value="23">23</option>
<option value="24">24</option>
<option value="25">25</option>
</select>



</div>

<br>
<!-- <label style="color: white;">Image</label>
<input type="file" name="upl" multiple/> -->
<div class="buttons" style="text-align: center;margin-right: 50%">
<input type="submit" class="btn orange" id="save" value="update" style="height: 30px"/>

</div> 

 <input type="hidden" name="editdeviceobj.Device_Id" id="recordid" value="<s:property value="Device_Id" />">
</s:iterator>
</form>
</div>
<br>
<span style="color:green;"><s:property value="result"/></span>

</div>

</center> 

<!-- <div id="cctvData">
</div> -->
<!-- ----------------------------------------------------- -->

<script type="text/javascript" src="../js/jquery-2.1.4.js"></script> 

 <script type="text/javascript">
   $( document ).ready(function() {	
	  
	   Device=$('#recordid').val();
   	
   				$.getJSON("editlcdDeviceApi?Device="+Device, function( data ) {
   					
   					
   					console.log(data);
   					console.log(data[0].display_mode); 
   					/*  console.log(data[0].device_Type); 
   					
   				 console.log(data[0].firstBridge); 
					console.log(data[0].secondBridge);  */
					$("#devicetype").val(data[0].device_Type);  
				
   					$("#fbridge").val(data[0].firstBridge);
   					$("#sbridge").val(data[0].secondBridge);
   					$('#hid').val(data[0].device_Platform);
   					$('#coachpf').val(data[0].device_Platform);
   					
   					var pf=data[0].device_Platform;
   					if(pf=="ALL")
   						{
   						
   						$('#pfALL').attr("checked",true)
   						for(var i=1;i<=12;i++)
   						{
   					
   					$('#pf'+i+'').attr("checked",true)
   					/* console.log('pf'+i+''); */
   						}
   						}
   					else
   						{
   					var spf=pf.split(",");
   					for(var i=0;i<spf.length;i++)
   						{
   					
   					$('#pf'+spf[i]+'').attr("checked",true)
   					/* console.log('pf'+spf[i]+''); */
   						}
   						}
   				var devType=data[0].device_Type;
   					
   					if(devType==1)
   					{
   						
   					$('#devicemode').append('<option value="1">Single TIB</option>');
   					$('#devicemode').append('<option value="2">Single AGDB</option>');
   					
   					}
   				else if (devType==2) {
   					/* $('#devicemode').html(data[0].display_mode); */
   					$('#devicemode').append('<option value="1">VW2 TIB</option>');
   					$('#devicemode').append('<option value="2">VW2 AGDB</option>');
   					$('#devicemode').append('<option value="3">VW3 TIB</option>');
   					$('#devicemode').append('<option value="4">VW3 Single TIB</option>');
   				}
   				else if (devType==3) {
   					/* $('#devicemode').html(data[0].display_mode); */
 					$('#devicemode').append('<option value="1">CGDB</option>');
   					
   				}
   					$('#devicemode').val(data[0].display_mode);	
   					
   				});
   
	  
	$('#devicetype').change(function(){
	
		console.log(this.value);
		var device=this.value;
		if(device==1)
			{
			$('#coach').css("display","none");
			$('#platform').css("display","block");	
			$('#devicemode').find('option').remove()
			$('#devicemode').append('<option value="1">Single TIB</option>');
			$('#devicemode').append('<option value="2">Single AGDB</option>');
			
			}
		else if (device==2) {
			$('#coach').css("display","none");
			$('#platform').css("display","block");	
			$('#devicemode').find('option').remove();
			$('#devicemode').append('<option value="1">VW2 TIB</option>');
			$('#devicemode').append('<option value="2">VW2 AGDB</option>');
			$('#devicemode').append('<option value="3">VW3 TIB</option>');
			$('#devicemode').append('<option value="4">VW3 Single TIB</option>');
		}
		else if (device==3) {
			$('#devicemode').find('option').remove();
			$('#devicemode').append('<option value="1">CGDB</option>');
			$('#platform').css("display","none");
			$('#coach').css("display","block");
		}else
			{
			$('#coach').css("display","none");
			$('#platform').css("display","block");			
			$('#devicemode').find('option').remove();
			}
	});
	
	$('#address').focusout(function() {
	 console.log(this.value);
	 var id=this.value;
	   if(id!="")
		   {
		   console.log(id);
		   $.getJSON("checkdevicealready?deviceid="+id,function(data){				
				console.log("Checked Train Anc Value Updated Successfully"+data.length);
				if(data.length>0)
					{
					$('#address').val("");
					alert("Device Address Alread Exist");
					}
	     });
		   }
	  });
	  
	
	$('#form').submit(function(e) {
		var ids= document.getElementsByName("pf");		
		var ds=$('#platform').css('display');
		console.log(ds);
	var devicetype=$('#devicetype').val();
	if(devicetype!="select")
		{
	if($('#platform').css('display')!='none')
		{
		 var checkboxesChecked = [];
		  // loop over them all 
		  for (var i=0; i<ids.length; i++) {
		     // And stick the checked ones onto an array...
		     if (ids[i].checked) {
		        checkboxesChecked.push(ids[i].value);
		     }
		  }
		  if(checkboxesChecked.length!=0)
			  {
			  if(checkboxesChecked[0]=="All")
				  {
				  console.log("All Contain");
				  $('#hid').val("All");
				  }
			  else
				  {
				  $('#hid').val(checkboxesChecked);
				  console.log("All not Contain");
				  }
			  console.log("Contain -----------------"+checkboxesChecked);
			  
		/*  window.location.href = "bulkprint?listofIds="+checkboxesChecked+"&copies="+copies; */
			  }
		  else
			  {
			  alert("Must Select Atleast One Platform");
			console.log("not contain-----------");
			return false;
			  }
		}	
	else
		{
		var coachpf=$('#coachpf :selected').text();
	/* 	var coachpf=document.getElementById('coachpf').checked; */
	console.log("Coach PF Select="+coachpf);
		if(coachpf=="Select")
			{
			alert("First Select Platform")
			return false;
			
			}
		else
			{
			if($('#coachcount').val()!="")
			  $('#hid').val(coachpf);
			else
				return false;
			}
		}
	}
	else
		{
		alert("Select the Display Type");
		return false;
		}
	});
   });
   function toggle(source) {
	    var checkboxes = document.querySelectorAll('input[type="checkbox"]');
	    for (var i = 0; i < checkboxes.length; i++) {
	        if (checkboxes[i] != source)
	            checkboxes[i].checked = source.checked;
	    }
	}   
   
 </script>
 
 <!-- ----------------------------------------------------- -->
 <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> 
 <div id="footer"><p>&copy; 2016 Dan Electronic System Pvt. Ltd.<p></div>
 <script type="text/javascript" src="../js/time.js"></script>  
</body>
</html>