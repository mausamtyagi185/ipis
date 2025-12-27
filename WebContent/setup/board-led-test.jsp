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
    padding: 14px 16px;
    text-decoration: none;
}


.active {
    background-color: #03A9F4;
    color: white;}
  
</style>

<style type="text/css">
table tr td select{
width:170px;
height: 30px;
font-size: larger;
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
<div style="width: 100%;  color: white;">
<ul style=" background-color: #222213">
<li style="display: block;color: white;text-align: center;padding: 3px 20px;text-decoration: none;float: left;" ><img src="../images/arrow.PNG" style="margin-bottom: -5px">Setup</li>
<li style="display: block;color: white;text-align: center;padding: 3px 20px;text-decoration: none;float: left;" ><img src="../images/arrow.PNG" style="margin-bottom: -5px">Board Setup</li>
<li style="display: block;color: white;text-align: center;padding: 3px 20px;text-decoration: none;float: left;" ><img src="../images/arrow.PNG" style="margin-bottom: -5px">Board LED Test</li>
</ul>
</div>
 <div id="nav">
<div id='cssmenu'>
<ul>
   
  
  
   <li><a href='getSystemFont'>Board Font</a></li>
   <li class="active"><a href='testBoardLed'>Board Testing</a></li>
  
 <li><a href='setup.jsp'>Back</a></li>
   
</ul>
</div>
</div>
<div style="width: 80%;display: inline-block;margin-left: 20px;background: rgba(0, 0, 0, 0.68);">

        <h2 style="text-align: center">Board LED Test</h2><br>
	<hr style="width: 100%;">
        
        <div class="left" style="color: white; font-size: large;margin-left: 20%">
<table cellspacing="20">
<tr>
<td>
<label>Device Type</label>
</td>
<td>
<select id="deviceType">

    <option value="" style="display: none;"></option>
    
    <s:iterator value="deviceSet" >
     <option value='<s:property/>'><s:property/></option>
      
    </s:iterator>

</select>
</td>
</tr>
<tr><td>
<label>P.F No.</label>
</td><td>
<select id="pfNo">

    <option value="" style="display: none;"></option>
    
    <s:iterator value="platformList" status="list">
      <s:set var="other" value='platformList[#list.index]' />
      
      <s:if test='%{#other==0}'>
       <option value=''>0</option>
      </s:if>
      <s:else>
       <option value='<s:property value="#other"/>'><s:property value="#other"/></option>
      </s:else>
      
    </s:iterator>

</select>
</td></tr> 
   <tr><td>
<label>Device Name</label>
</td><td>
<select id="deviceName">
    <option style="display: none;"></option>
</select>
</td></tr>
<tr><td>
<label>Device ID</label>
</td><td>
<select id="deviceId">
    <option style="display: none;"></option>

</select>
</td></tr> 
</table>
</div>
     
<div class="right" style="color: white; font-size: large;margin-left: 10%">
<table>
  <div id="buttons" style="font-family: sans-serif">
    <button class="btn orange" id="ledHorizontal" style="width: 250px">HORIZONTAL/VERTICAL</button><br>
    <button class="btn orange" id="ledDiagonalRL" style="width: 250px">DIAGONAL-1</button><br>
    <button class="btn orange" id="ledDiagonalLR" style="width: 250px">DIAGONAL-2</button><br>
   
  </div>

</table>
</div>  
        
 <div id="buttons" style="float:left; font-family: sans-serif;margin-left: 20%"><br>
    
    <button class="btn orange" id="ledOn">ALL LED ON</button>
    <button class="btn purple" id="ledOff">ALL LED OFF</button>
  
  </div>
  </div>
<div id="footer"><p>&copy; 2016 Dan Electronic System Pvt. Ltd.<p></div>
</body>

<script type="text/javascript" src="../js/jquerydf.min.js"></script>
<script src="../sweetalert-master/dist/sweetalert-dev.js"></script>
<script type="text/javascript">
$( document ).ready(function() {
	
	$('#pfNo').change(function() {
		var pfNo=this.value;
		$.getJSON("retrieveDeviceNameListByPFNO?pfNo="+pfNo,function(data){
			$('#deviceName').empty();
			$('#deviceName').append("<option style='display: none;'></option>");
			$.each(data.deviceNameList,function(index, value){
				if(value=="Platform Display Board - Type A")
					{
						$('#deviceName').append("<option value='"+value+"'>Single Line</option>"); 
					}
				else if(value=="Platform Display Board - Type B")
				{
					$('#deviceName').append("<option value='"+value+"'>At a Glance</option>"); 
				}
				else
					{
					$('#deviceName').append("<option value='"+value+"'>"+value+"</option>"); 
					}
				
			});
        });
	});
	
	$('#deviceName').change(function() {
		var pfNo=$('#pfNo').val();
		var deviceName=this.value;
		$.getJSON("retrieveAllDeviceByDeviceName?pfNo="+pfNo+"&deviceName="+deviceName,function(data){
			$('#deviceId').empty();
			$('#deviceId').append("<option style='display: none;'></option>");
			$.each(data.deviceList,function(index, value){
				$('#deviceId').append("<option value='"+value.deviceId+"'>"+value.deviceId+"</option>"); 
			});
        });
	});
	
	$('#deviceType').change(function(){   
		
		var deviceName=this.value;
		
		if(deviceName=="Multiline"){
			$("#pfNo").attr("disabled","disabled");
			$("#deviceName").attr("disabled","disabled");
			$.getJSON("retrieveAllDeviceByDeviceName?&deviceName="+deviceName,function(data){
				$('#deviceId').empty();
				$('#deviceId').append("<option style='display: none;'></option>");
				$.each(data.deviceList,function(index, value){
					$('#deviceId').append("<option value='"+value.deviceId+"'>"+value.deviceId+"</option>"); 
				});
	        });
			
		}
		else{
			$("#pfNo").removeAttr("disabled");
			$("#deviceName").removeAttr("disabled");
		}
		
		
		
	});
	
	 $('#ledOn').click(function() {
		var pfNo=$('#pfNo').val();
		var deviceName=$('#deviceName').val();
		var deviceId=$('#deviceId').val();
		var deviceType=$('#deviceType').val();
		if(deviceType=="Multiline" && deviceId!=""){
			deviceName="Multiline";
			$.getJSON("setLedON?deviceName="+deviceName+"&deviceId="+deviceId,function(data){
				if(data=="0")
					{	
						setTimeout(function(){
							swal("LED ON SUCESSFULLY");
						},1000);
						
					}
				else
					{
					swal("Data Not sent Sucessfully");
					}
				
			 
			});
		}
		else if(pfNo=="" || deviceName=="" || deviceId=="" || deviceType=="")
			{
				swal("Please select the appropriate details");
			}
		else
			{
			$.getJSON("setLedON?pfNo="+pfNo+"&deviceName="+deviceName+"&deviceId="+deviceId,function(data){
				if(data=="0")
					{	
						setTimeout(function(){
							swal("LED ON SUCESSFULLY");
						},1000);
						
					}
				else
					{
					swal("Data Not sent Sucessfully");
					}
				
			 
			}); 
			}
		
			
			
       
	});
	 
	 
	 $('#ledOff').click(function() {
			var pfNo=$('#pfNo').val();
			var deviceName=$('#deviceName').val();
			var deviceId=$('#deviceId').val();
			var deviceType=$('#deviceType').val();
			if(deviceType=="Multiline" && deviceId!=""){
				deviceName="Multiline";
				$.getJSON("setLedOff?deviceName="+deviceName+"&deviceId="+deviceId,function(data){
					if(data=="0")
						{	
							setTimeout(function(){
								swal("LED OFF SUCESSFULLY");
							},1000);
							
						}
					else
						{
						swal("Data Not sent Sucessfully");
						}
					
				 
				});
			}
			else if(pfNo=="" || deviceName=="" || deviceId=="" || deviceType=="")
				{
					swal("Please select the appropriate details");
				}
			else
				{
				$.getJSON("setLedOff?pfNo="+pfNo+"&deviceName="+deviceName+"&deviceId="+deviceId,function(data){
					if(data=="0")
						{
						setTimeout(function(){
							swal("LED OFF SUCESSFULLY");
						},1000);
							
						}
					else
						{
						swal("Data Not sent Sucessfully");
						}
					
				 
				}); 
				}
			
				
				
	       
		});
	 
	 
	 $('#ledHorizontal').click(function() {
			var pfNo=$('#pfNo').val();
			var deviceName=$('#deviceName').val();
			var deviceId=$('#deviceId').val();
			var deviceType=$('#deviceType').val();
			if(deviceType=="Multiline" && deviceId!=""){
				deviceName="Multiline";
				$.getJSON("setLedHorizontal?deviceName="+deviceName+"&deviceId="+deviceId,function(data){
					if(data=="0")
						{	
							setTimeout(function(){
								swal("LED HORIZONTAL/VERTICAL SUCESSFULLY");
							},1000);
							
						}
					else
						{
						swal("Data Not sent Sucessfully");
						}
					
				 
				});
			}
			else if(pfNo=="" || deviceName=="" || deviceId=="" || deviceType=="")
				{
					swal("Please select the appropriate details");
				}
			else
				{
				$.getJSON("setLedHorizontal?pfNo="+pfNo+"&deviceName="+deviceName+"&deviceId="+deviceId,function(data){
					if(data=="0")
						{
						setTimeout(function(){
							swal("LED HORIZONTAL/VERTICAL SUCESSFULLY");
						},1000);
							
						}
					else
						{
						swal("Data Not sent Sucessfully");
						}
					
				 
				}); 
				}
			
				
				
	       
		});
	 
	 $('#ledDiagonalRL').click(function() {
			var pfNo=$('#pfNo').val();
			var deviceName=$('#deviceName').val();
			var deviceId=$('#deviceId').val();
			var deviceType=$('#deviceType').val();
			if(deviceType=="Multiline" && deviceId!=""){
				deviceName="Multiline";
				$.getJSON("setLedDiagonalRL?deviceName="+deviceName+"&deviceId="+deviceId,function(data){
					if(data=="0")
						{	
							setTimeout(function(){
								swal("LED DIAGONAL SUCESSFULLY");
							},1000);
							
						}
					else
						{
						swal("Data Not sent Sucessfully");
						}
					
				 
				});
			}
			else if(pfNo=="" || deviceName=="" || deviceId=="" || deviceType=="")
				{
					swal("Please select the appropriate details");
				}
			else
				{
				$.getJSON("setLedDiagonalRL?pfNo="+pfNo+"&deviceName="+deviceName+"&deviceId="+deviceId,function(data){
					if(data=="0")
						{
						setTimeout(function(){
							swal("LED DIAGONAL SUCESSFULLY");
						},1000);
							
						}
					else
						{
						swal("Data Not sent Sucessfully");
						}
					
				 
				}); 
				}
			
				
				
	       
		});
	 
	 
	 $('#ledDiagonalLR').click(function() {
			var pfNo=$('#pfNo').val();
			var deviceName=$('#deviceName').val();
			var deviceId=$('#deviceId').val();
			var deviceType=$('#deviceType').val();
			if(deviceType=="Multiline" && deviceId!=""){
				deviceName="Multiline";
				$.getJSON("setLedDiagonalLR?deviceName="+deviceName+"&deviceId="+deviceId,function(data){
					if(data=="0")
						{	
							setTimeout(function(){
								swal("LED DIAGONAL SUCESSFULLY");
							},1000);
							
						}
					else
						{
						swal("Data Not sent Sucessfully");
						}
					
				 
				});
			}
			else if(pfNo=="" || deviceName=="" || deviceId=="" || deviceType=="")
				{
					swal("Please select the appropriate details");
				}
			else
				{
				$.getJSON("setLedDiagonalLR?pfNo="+pfNo+"&deviceName="+deviceName+"&deviceId="+deviceId,function(data){
					if(data=="0")
						{
						setTimeout(function(){
							swal("LED DIAGONAL SUCESSFULLY");
						},1000);
						}
					else
						{
						swal("Data Not sent Sucessfully");
						}
					
				 
				}); 
				}
			
				
				
	       
		});
	
	
	
});
</script>
<script type="text/javascript" src="../js/time.js"></script>  
</html>
