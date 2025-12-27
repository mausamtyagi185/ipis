<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
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
  
    padding: 5px 16px;
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
<script type="text/javascript" src="../js/jquerydf.min.js"></script>
<script src="../sweetalert-master/dist/sweetalert-dev.js"></script>
<script type="text/javascript">
$( document ).ready(function() {
	
	var fontStatus='<s:property value="fontStatus"/>';
	if(fontStatus=="2")
		{
			swal("Board Font Saved sucessfully");
		}
	
	$('#show').click(function() {
		$('#boardFontConfigForm').attr('action', 'showBoardFont');
		$('#show').submit(function(){
		});
	});
	
	$("#save").click(function(e){
		e.preventDefault();
		var deviceType=$('#deviceType').val();
		var dataType=$('#dataType').val(); 
		if(deviceType=="" || dataType=="")
			{
				swal("Please Select Device Type and Data Type");
			}
		else
			{
				$("#boardFontConfigForm").submit();
			}
	});
	
	$('#dataType').change(function() {
		var deviceType=$('#deviceType').val();
		var dataType=$('#dataType').val(); 
		$.getJSON("getBoardFontDetail?deviceType="+deviceType+"&dataType="+dataType,function(data){
			 if(data.boardFont!=null){
				 $('#boardFontId').val(data.boardFont.id);
				 //Displaying Fix value Arial
				 //$('#fontName').val(data.boardFont.fontName);
				 $('#fontSize').val(data.boardFont.fontSize);
				 $('#fontStyle').val(data.boardFont.fontStyle);
			 }else{
				 $('#boardFontId').removeAttr("value");
				 //Fix value is diplayed so value cannot be blank
				// $('#fontName').val("");
				 $('#fontSize').val("");
				 $('#fontStyle').val("");
			 }
	    });
	});
	
	
	
});
</script>
        <style type="text/css">
table tr td input{
width:170px;
height: 30px;
font-size: larger;
}
table tr td select{
width:170px;
height: 30px;
font-size: larger;
}
.left table tr td input{
width:170px;
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

		<li style="float: left;"><a style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;" href="../train/trainRunningInfo">Online Train</a></li>
		<li style=" float: left;"><a style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;" <s:if test='%{#session["user"].status==false}'> class="not-active-privilege" </s:if> href="../device/deviceStatus">Status</a></li>
		<li style="float: left;"><a style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;" <s:if test='%{#session["user"].display==false}'> class="not-active-privilege" </s:if> href="../device/deviceConfig">Display</a></li>
		<li style="float: left;"><a style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;" <s:if test='%{#session["user"].intensity==false}'> class="not-active-privilege" </s:if> href="../device/deviceIntensity">Intensity</a></li>
		<li style="float: left;"><a style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;" <s:if test='%{#session["user"].logReport==false}'> class="not-active-privilege" </s:if> href="../log-report/logReport">Log Report</a></li>
 		<li style="float: left;"><a style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;" <s:if test='%{#session["user"].cctv==false}'> class="not-active-privilege" </s:if> href="../cctv/led-lcd-display.jsp">CCTV</a></li> 
		<li style="float: left;"><a style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;" <s:if test='%{#session["user"].personalAnc==false}'> class="not-active-privilege" </s:if> href="../announcement/personalAnc">PA</a></li>
		                      
		<li style="float: left;"><a style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;" <s:if test='%{#session["user"].message==false}'> class="not-active-privilege" </s:if> href="../message/getBoardMessageList">Message</a></li>
		<li style="float: left;" class="active" ><a  style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;" href="../setup/setup.jsp">Setup</a></li>
		<li style="float: left;"><a style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;" <s:if test='%{#session["user"].interfaces==false}'> class="not-active-privilege" </s:if> href="../option/optionSettings">Interface</a></li>
		<li style="float: left;"><a style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;" <s:if test='%{#session["user"].user==false}'> class="not-active-privilege" </s:if> href="../user/userSetting">User</a></li>
		<li style="float: left;"><a style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;" href="../train/help.jsp">Help</a></li>
		<li style="float: right"><a style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;" href="../logout">Logout</a></li>
		<li style="float: right"><a style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;" href="../user/changePassword"><s:property value="#session['user'].userId" /></a></li>
        	<li style="float: right"><span style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;" id="time"></span></li>                        
</ul>
</div>
<div style="width: 100%;  color: white;">
<ul style=" background-color: #222213">

<li style="display: block;color: white;text-align: center;padding: 3px 20px;text-decoration: none;float: left;" ><img src="../images/arrow.PNG" style="margin-bottom: -5px">Setup</li>
<li style="display: block;color: white;text-align: center;padding: 3px 20px;text-decoration: none;float: left;" ><img src="../images/arrow.PNG" style="margin-bottom: -5px">Board Setup</li>
<li style="display: block;color: white;text-align: center;padding: 3px 20px;text-decoration: none;float: left;" ><img src="../images/arrow.PNG" style="margin-bottom: -5px">Board Font</li>
</ul>
</div>
 <div id="nav">
<div id='cssmenu'>
<ul>
  
   <li  class='active'><a href='getSystemFont'>Board Font</a></li>
   <li><a href='testBoardLed'>Board Testing</a></li>
   
<li><a href='../setup/setup.jsp'>Back</a></li>
</ul>
</div>
</div>
<div id="displaynew">
<form method="post" action="saveBoardFontDetail" id="boardFontConfigForm">
         <h2 style="text-align: center">PIS Board Font Configuration</h2><br>
         <hr>

<input type="hidden" name="boardFont.id" id="boardFontId">

<div class="left" style="margin-left: 20%;color: white; font-size: large">
<table cellspacing="15">
<tr><td>
<label>Device Type</label>
</td><td>
<select name="boardFont.deviceType" id="deviceType">
<option value="" style="display: none;"> Please Select </option>
<option value="TADDB">TADDB</option>
<option value="CGDB">CGDB</option>
</select>
</td></tr>   
  

<tr><td>
<label>Font Name</label>
</td><td>

<!--  Font Name in a drop down list with multiple values  -->
<%-- <select name="boardFont.fontName" id="fontName">
<option value="" style="display: none;"> Please Select </option>
<s:iterator value="systemFontList">
  <option value="<s:property />"><s:property /></option>
</s:iterator>
</select> --%>
<!--  Font Name with fix value Arial Value -->
<input type="text" name="boardFont.fontName" id="fontName" value="Arial" readOnly/>
</td>
</tr>

<%-- <tr><td>
<label>Font Style</label>
</td><td>
<select name="boardFont.fontStyle" id="fontStyle">
<option value="" style="display: none;"> Please Select </option>
<option value="Regular">Regular</option>
<option value="Bold">Bold</option>
</select></td></tr> --%>
</table>
</div>

<!-- --------------------- -->
    <div style="display: inline-block;  font-size: large"">
    <table cellspacing="15">
     <tr><td>
<label>Data Type</label>
</td><td>
<select name="boardFont.dataType" id="dataType">
<option value="" style="display: none;"> Please Select </option>
<option value="Train Info">Train Info</option>
<option value="Message">Message</option>
</select></td></tr>
<tr><td>
<label>Font Size</label>
</td><td>
<select name="boardFont.fontSize" id="fontSize">
<option value="" style="display: none;"> Please Select </option>
<option value="7">7</option>
<option value="8">8</option>
<option value="10">10</option>
<option value="12">12</option>
<option value="14">14</option>
<option value="16">16</option>
</select></td></tr>
    </table>
    </div>    
      
  
     
   
        
        <div id="buttons" style="text-align: center; font-family: sans-serif"><br>
            
           
 <button class="btn orange" id="save">SAVE/SET</button>
  <button class="btn purple" id="show">SHOW</button></div>
 
 <div class="right" style="display: none;">
<label>Left Position</label> <input type="text" id="lefPosition" value="<s:property value="boardFont.leftPosition"/>"><br>
<input type="range" name="boardFont.leftPosition" id="leftRange" min="-15" max="15" value="<s:property value="boardFont.leftPosition"/>"/><br>
<input type="range" name="boardFont.topPosition" id="topRange" class="vert" min="-15" max="15" value="<s:property value="boardFont.topPosition"/>"/><br>
<label>Top Position</label> <input type="text" id="topPosition" value="<s:property value="boardFont.topPosition"/>"><br><br>
<button id="show">show</button>
</div>
<br>
<s:if test="%{imagePath!=null}">
<img src="../allImages/sample.BMP" id="sampleImage" style="height:25px;width:500px;">
</s:if>

</form>

<script type="text/javascript">

document.getElementById("leftRange").oninput=function(){
	val=this.value;
	document.getElementById('lefPosition').value=val;
};

document.getElementById("topRange").oninput=function(){
	val=this.value;
	document.getElementById('topPosition').value=val;
};



</script>
   
  
  
   


      
	
	</div>

   
 
	


	
<div id="footer"><p>&copy; 2016 Dan Electronic System Pvt. Ltd.<p></div>
<script type="text/javascript" src="../js/time.js"></script>  
</body>
</html>
