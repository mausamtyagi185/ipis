<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Display Device Config</title>
<link rel="stylesheet" href="../jquery.treeview/jquery.treeview.css" />
<link rel="stylesheet" href="../sweetalert-master/dist/sweetalert.css">
<%-- 	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.2.6/jquery.min.js"></script> --%>
	<script type="text/javascript" src="../js/jquery.min.js"></script>
	<script src="../jquery.treeview/lib/jquery.cookie.js" type="text/javascript"></script>
	<script src="../jquery.treeview/jquery.treeview.js" type="text/javascript"></script>
	
	<script type="text/javascript" src="../jquery.treeview/demo.js"></script>
	<script src="../sweetalert-master/dist/sweetalert-dev.js"></script>
	<script type="text/javascript" src="../js/blockUI.js"></script> 
	<link rel="stylesheet" href="../css/train.css">

<style type="text/css">

#browser li ul li :hover{
  color:black;
}

#conForm{
   border: 1px solid gray;
   width:312px;
   padding: 7px;
   background: rgba(0, 0, 0, 0.68);
 }
#deviceList{
	border: 1px solid gray;
	width:312px;
	height:400px;
	overflow-y: scroll;
	padding: 7px;
	margin-top: 10px;
	background-color: white;
}

table tr td input{
width:150px;
height: 30px; margin: 0 auto;  outline: none; font-size: 16px; 
}
table tr td select{
width:150px;
height: 35px;
font-size: 18px;
    
}
table tr td{
padding: 5px;
}


.leftside{
display: inline-block;
}
.rightside{
display: inline-block;
}
#left{
	display: inline-block;
	
}

#right{
	display: inline-block;
	vertical-align: top;
	margin-left: 50px;
}
#pdcConfig{
	border: 1px solid gray;
	padding: 50px;
	 background: rgba(0, 0, 0, 0.68);
 color: white;

}
#pdcConfig select{
	width:150px;
}

#PDB{
    border: 1px solid gray;
	padding: 50px;
	 background: rgba(0, 0, 0, 0.68);
 color: white;
  width: 100%;
}

#CGDB{
    border: 1px solid gray;
	padding: 20px;
	background: rgba(0, 0, 0, 0.68);
 	color: white;
}

#CGDB select{
width:100px;
}

#CGDB table tr td input{
width:30px;
text-align: center;
}

#infoDelay{
width:300px;
margin-left: 40px;
}

#dataInfo{
width:300px;
}
#dataInfo table tr td input{
width:100px;
}

#multiline{
width:100%;
 border: 1px solid gray;
 padding: 50px;
 background: rgba(0, 0, 0, 0.68);
 color: white;
}

input[readonly]{
  background:#afabab;
}

.not-active-privilege {
   pointer-events: none;
   cursor: default;
   opacity: 0.3;
}

</style>
<script type="text/javascript">
$( document ).ready(function() {
	
	
	var result='<s:property value="result"/>';
	var cdsnewPortName='<s:property value="cdsNewPortName"/>';

	if(result=="false" && !(cdsnewPortName=="Multiline"))
		{
			swal("Device Not Added to PDC");
		}
	else if(result=="true")
		{
			swal("Device Added Successfully to PDC");
		}
		
		//--------------Check Available Port Required for Configuration---------------
		
		$( "#setStartId" ).click(function() {
			
			if($("#startId").attr("readonly")==false){
				
				var cdsPortId=$( "#cgdCDSPortId").val();
				var pdcPortId=$( "#cgdPDCPortId").val();
				var noOfCoach=parseInt($( "#noOfCoach").val());
				var coachesPerPort=parseInt($( "#coachesPerPort").val());
				var noOfPort=0;
				var extraCoach=0;
				
				if(noOfCoach>coachesPerPort){
					extraCoach=noOfCoach%coachesPerPort; 
					if(extraCoach==0){
						noOfPort=noOfCoach/coachesPerPort; 
					}else{
						noOfPort=Math.floor(noOfCoach/coachesPerPort)+1; 
					}
					
					$.getJSON("checkAvailablePort?cdsPortId="+cdsPortId+"&pdcPortId="+pdcPortId+"&noOfPort="+noOfPort,function(data){
						 
						if(data.result=="available"){
								
								for(var i=1;i<=30;i++){
									$( "#"+i ).removeAttr("value");
									$( "#"+i ).removeAttr("readonly");
								}
								var no=parseInt($( "#noOfCoach" ).val());
								var startId=parseInt($("#startId").val()); 
								if(no!=0 && $("#startId").val()!=""){
								for(var i=no+1;i<=30;i++){
									$( "#"+i ).attr("readonly","readonly");
									$( "#"+i ).removeAttr("value");
								}
									for(var j=1,k=startId;j<=no;j++,k++){
										$( "#"+j ).attr("value",k); 
									}
								}
							
							}else{
								
								swal("No. of Required Ports are not Available");
							}
						
			        });
					
				}else{
					noOfPort=1; 
					for(var i=1;i<=30;i++){
						$( "#"+i ).removeAttr("value");
						$( "#"+i ).removeAttr("readonly");
					}
					var no=parseInt($( "#noOfCoach" ).val());
					var startId=parseInt($("#startId").val()); 
					if(no!=0 && $("#startId").val()!=""){
					for(var i=no+1;i<=30;i++){
						$( "#"+i ).attr("readonly","readonly");
						$( "#"+i ).removeAttr("value");
					}
						for(var j=1,k=startId;j<=no;j++,k++){
							$( "#"+j ).attr("value",k); 
						}
					}
				}
				//alert(cdsPortId+"--->"+pdcPortId+"--->"+noOfPort);
				
			

			}
			
		});
		
		var no=parseInt($( "#noOfCoach" ).val());
		if(no!=0 && $("#startId").val()!=""){
			for(var i=no+1;i<=30;i++){	
				$( "#"+i ).attr("readonly","readonly");
				$( "#"+i ).removeAttr("value");
			}
			
		}
		
		//===============================================================================
			
		var device='<s:property value="deviceDetail.currentDevice" escapeJavaScript="true"/>';
		if(device=="cds"){
			$('#displayList').empty();
			$('#displayList').append('<option value="PDC">PDC</option>');
			$('#displayList').append('<option value="Multiline">Multiline</option>');
		}else if(device=="pdc port"){
			$('#displayList').empty();
			$('#displayList').append('<option value="Platform Display Board">Platform Display Board</option>');
			$('#displayList').append('<option value="Coach Guidance Display Board">Coach Guidance Display Board</option>');
		}
		else if(device=="pdc"){
			$('#pdcConfig').css('display','block');
		}else if(device=="multiline"){
			$('#multiline').css('display','block');
		}else if(device=="pfd"){
			$('#PDB').css('display','block');
		}else if(device=="cgd"){
			$('#CGDB').css('display','inline-block');
		}
		
		//alert(device);
		
	//});// document.ready closure before
	
	//-------------Get selected device id from Cookies-----------------
	
	var currentDeviceId = getCookie("currentDeviceId");
	
	$("#"+currentDeviceId).css("background","#376A8C");
	$("#"+currentDeviceId).css("color","white");
	
	//--------change background color of installed cgdb on particular port------------
	
	$("."+currentDeviceId.split("_")[1]).css("background","rgb(84, 105, 121)");
	$("."+currentDeviceId.split("_")[1]).css("color","white");
	
	//-----------------------------------------------------------------
	
	$( ".cds" ).click(function() {
		  
		var cdsId=$(this).find("span").attr("id");
		
		setCookie("currentDeviceId", cdsId, 365);//----set selected device id in cookies--------
		
		$(this).attr("href","CDSDeviceInfo?cdsPortId="+cdsId);
	
	});
	
	$( ".pdc" ).click(function() {
		  
		var pdcId=$(this).find("span").attr("id");
		
		setCookie("currentDeviceId", pdcId, 365);//----set selected device id in cookies--------
		
		var arr = pdcId.split("_");
		
		$(this).attr("href","PDCDeviceInfo?cdsPortId="+arr[0]+"&pdcPortId="+arr[1]);
		
	
	});
	
	//====================================================================
	
	$('#configure').click(function(e) {
	  
		e.preventDefault();
	
		 $('#pdcConfig').css('display','none');	
		 $('#multiline').css('display','none');
		 $('#PDB').css('display','none');
		 $('#CGDB').css('display','none');
		 
	    var selectedValue = $('#displayList option:selected').html();
	    
	    if(selectedValue=="PDC"){
	        $('#pdcConfig').css('display','block');	
	    }else if(selectedValue=="Multiline"){
	        $('#multiline').css('display','block');
	    }else if(selectedValue=="Platform Display Board"){
	    	$('#PDB').css('display','block');
	    }else if(selectedValue=="Coach Guidance Display Board"){
	    	
	    		if(('<s:property value="deviceDetail.availablePDCPlatformList"/>'.length)==2)
	    			{
	    				swal("Platform not avaialble for configuration");
	    			}
	    		else{
	    			$('#CGDB').css('display','block');
	    		}
	    }
	    
	});
	
	
	$('#remove').click(function(e) {
		  
		e.preventDefault();
		$('#displayListForm').attr('action','removeDevice').submit();
	    
	});
	
	
	var cds_deviceId=$('#cds_deviceId').val();
	
	$('#savePdcDetail').click(function(e) { 
		
		e.preventDefault();
		
		if($('#cds_deviceId').val()=="" || $('#cds_ip_address').val()=="" || $('#cds_mac_address').val()=="" || $('#firstPlatform').val()==""){
			
			swal("Please fill out all required fields indicated with * symbol");
			
	    }else if($('#firstPlatform').val()==$('#secondPlatform').val()){
			
	    	swal("Please select different platform");
		
		}else{
			
			    var ipAddress=$('#cds_ip_address').val();
				
				var validIp=ValidateIPaddress(ipAddress);//validate ip address
				
				if(validIp==true){
				
				    $.getJSON("checkDuplicateIpAddress?deviceIp="+ipAddress+"&deviceId="+cds_deviceId,function(data){
						if(data.result=="duplicate"){
							swal("Ip Address Already Exist");
						  $('#cds_ip_address').focus();
						}else{
							$('#pdcDetailForm').submit();
						}
					});
				}
		}
		
	});
	
	
	var multiline_deviceId=$('#multiline_deviceId').val();
	
	$( "#saveMultilineDetail" ).click(function(e){
		
		e.preventDefault(); 
		
	   var platformCount=0;	
		
	   $( ".MP" ).each(function( index ) { 
	  	  if(document.getElementById(this.id).checked==true)
	  	   platformCount++;
	   });
		
	   if($('#multiline_deviceId').val()=="" || $('#multiline_device_ip').val()=="" || $('#multiline_device_mac').val()==""){
			
		   swal("Please fill out all required fields indicated with * symbol");
			
	    }else if(document.getElementById('multiline_deviceLanguageEnglish').checked==false && document.getElementById('multiline_deviceLanguageHindi').checked==false && document.getElementById('multiline_deviceLanguageRegional').checked==false){
	    
	    	swal("Please select at least one language");
	    		
	    }else if(document.getElementById('allMultilinePlatform').checked==false && document.getElementById('selectMultilinePlatform').checked==false){
	    
	    	swal("Please choose platform option");
	    	
	    }else if(platformCount==0){
	    
	    	swal("Please select at least one platform");
	    	
	    }else{
		
			var ipAddress=$('#multiline_device_ip').val();
			
			var validIp=ValidateIPaddress(ipAddress);//validate ip address
			
			if(validIp==true){
			
				$.getJSON("checkDuplicateIpAddress?deviceIp="+ipAddress+"&deviceId="+multiline_deviceId,function(data){
					if(data.result=="duplicate"){
						swal("Ip Address Already Exist");
					  $('#multiline_device_ip').focus();
					}else{
						$('#saveMultilineDetailForm').submit();
					}
				});
		
			}
		}
	});
	
	
	var pfd_deviceId=$('#pfd_deviceId').val();
	
	$( "#savePFDDetail" ).click(function(e){
		
		e.preventDefault();
		
		var platformCount=0;	
		
	    $( ".PF" ).each(function( index ) { 
	  	  if(document.getElementById(this.id).checked==true)
	  	   platformCount++;
	    });
		
		if(document.getElementById('pfdTypeA').checked==false && document.getElementById('pfdTypeB').checked==false){
		    
			swal("Please choose device type");
	    	
	    }else if($('#pfd_deviceId').val()==""){
			
	    	swal("Please fill out all required fields indicated with * symbol");
			
	    }
	    else if(($('#pfd_device_ip').val()=="" || $('#pfd_device_mac').val()=="") && $('#pfd_con_mode').val()==0 ){
	    	swal("Please fill out all required fields indicated with * symbol");
	    	
	    }	    	
	    else if(document.getElementById('pfd_deviceLanguageEnglish').checked==false && document.getElementById('pfd_deviceLanguageHindi').checked==false && document.getElementById('pfd_deviceLanguageRegional').checked==false){
	    
	    	swal("Please select at least one language");
	    		
	    }else if(document.getElementById('allPlatform').checked==false && document.getElementById('selectPlatform').checked==false){
	    
	    	swal("Please choose platform option");
	    	
	    }else if(platformCount==0){
	    
	    	swal("Please select at least one platform");
	    	
	    }else{
		
			var ipAddress=$('#pfd_device_ip').val();
			if(ipAddress!=""){
			
            var validIp=ValidateIPaddress(ipAddress);//validate ip address
			
			if(validIp==true){
			
				$.getJSON("checkDuplicateIpAddress?deviceIp="+ipAddress+"&deviceId="+pfd_deviceId,function(data){
					if(data.result=="duplicate"){
						swal("Ip Address Already Exist");
					  $('#pfd_device_ip').focus();
					}else{
						$('#savePFDDetailForm').submit();
					}
				});
			}
			}
			else{
				$('#savePFDDetailForm').submit();
			}
	    }
		
	});
	
	//-----------------Change Default Platform Info on Change of Platform No-------------------------
	
	$('#cgdPlatformNo').change(function(e){
	var val=this.value;
	if(val.length==1)
		$('#defaultInfo1').val("PF0"+this.value);	
	else{
		$('#defaultInfo1').val("PF"+this.value);	
	}
	});
	
	//------------------Check only Coach Hindi OR PF No checkbox------------------------
	
	$('#coachHindi').change(function(e){
		if(document.getElementById("coachHindi").checked==true){
			$('#pfNo').removeAttr("checked");
		}
	});
	
	$('#pfNo').change(function(e){
	 	if(document.getElementById("pfNo").checked==true){
	 		$('#coachHindi').removeAttr("checked");
	 	}
	});
	$(".defaultInfo").blur(function(e){
	     if(this.value.length>0){
	    	 $("#"+this.id).val(this.value.toUpperCase());
	     }
	});
		
	
	
	//---------------Save CGD Information---------------------------
	
    $('#saveCGDBDetail').click(function(e) { 
		
		e.preventDefault();
		var id='<s:property value="deviceDetail.cgd.id"/>';
		if($('#cgdPlatformNo').val()==0){
			swal("No platform is selected to configure this device");
		}else if($('#end1').val()=="" || $('#end2').val()==""){
			swal("Please fill out both End");
		}else if($('#1').val()=="" || $('#startId').val()==""){
			swal("Please fill the Coach No's");
		}
		
		else if(id==0){
			var deviceIds="";
			for(var i=1;i<=30;i++)
				{
					if($('#'+i).val()=="")
						{
							break;
						}
					deviceIds+=$('#'+i).val()+",";
				}
			  $.getJSON("checkDuplicateDeviceIds?deviceIds="+deviceIds.substring(0,deviceIds.length-1),function(data){
				
				if(data=="available")
					{
					$('#cgdDetailForm').submit(); 
					}
				else
					{
					swal("Device Id not Available");
					}
			}); 
			
			//
		}
		else
			{
			$('#cgdDetailForm').submit(); 
			}
		
	});
   
   
 //-------------------------------validate device Id field---------------------
 
	   //called when key is pressed in textbox
	   $("#cds_deviceId").keypress(function (e) {
	      //if the letter is not digit then don't type anything
	      if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
	         return false;
	     }
	    });
 
	   //called when key is pressed in textbox
	   $("#multiline_deviceId").keypress(function (e) {
	      //if the letter is not digit then don't type anything
	      if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
	         return false;
	     }
	    });
	   
	   //called when key is pressed in textbox
	   $("#pfd_deviceId").keypress(function (e) {
	      //if the letter is not digit then don't type anything
	      if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
	         return false;
	     }
	    });
	   
	   //called when key is pressed in textbox
	   $("#startId").keypress(function (e) {
	      //if the letter is not digit then don't type anything
	      if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
	         return false;
	     }
	    });
   
   //-------------------------------Check duplicate device Id---------------------
	
   var cdsDeviceId= $('#cds_deviceId').val();
   
   if(!$('#cds_deviceId').is('[readonly]')){
	   
	   $('#cds_deviceId').blur(function(e) { 
		   
		   if($('#cds_deviceId').val()!=cdsDeviceId){
			
		   	if($('#cds_deviceId').val()!=0){
					$.getJSON("checkDuplicateDeviceId?deviceId="+$('#cds_deviceId').val(),function(data){
						 if(data.result=="available"){
							 swal( "ID Already Exist Please Enter Different No" );
							 $("#cds_deviceId").removeAttr('value');
						 }
						 
			        });
				}else{
					 $("#cds_deviceId").removeAttr('value');	
				}
			}
		   
		});
   
    }
   
   var mulDeviceId= $('#multiline_deviceId').val();
   
   if(!$('#multiline_deviceId').is('[readonly]')){
   
	    $('#multiline_deviceId').blur(function(e) { 
	    	
	    	if($('#multiline_deviceId').val()!=mulDeviceId){
	    	
				if($('#multiline_deviceId').val()!=0){
					$.getJSON("checkDuplicateDeviceId?deviceId="+$('#multiline_deviceId').val(),function(data){
						 if(data.result=="available"){
							 swal( "ID Already Exist Please Enter Different No" );
							 $("#multiline_deviceId").removeAttr('value');
						 }
						 
			        });
				}else{
					 $("#multiline_deviceId").removeAttr('value');	
				}
	    	}
	    	
		});
    
    }
   
    var pdbDeviceId= $('#pfd_deviceId').val();
   
    if(!$('#pfd_deviceId').is('[readonly]')){
        
    	$('#pfd_deviceId').blur(function(e) { 
	    	
    		if($('#pfd_deviceId').val()!=pdbDeviceId){
    		
				if($('#pfd_deviceId').val()!=0){
					$.getJSON("checkDuplicateDeviceId?deviceId="+$('#pfd_deviceId').val(),function(data){
						 if(data.result=="available"){
							 swal( "ID Already Exist Please Enter Different No" );
							 $("#pfd_deviceId").removeAttr('value');
						 }
						
			        });
				}else{
					 $("#pfd_deviceId").removeAttr('value');	
				}
			
    		}
    		
		});
   
    }
    
   
   //-------------------------------validate coach Id---------------------
   
	    for(var i=1;i<=32;i++){
	        //called when key is pressed in textbox
		    $("#"+i).keypress(function (e) {
		      //if the letter is not digit then don't type anything
		      if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
		         return false;
		     }
	     
	        });
	    }
        
    
   //-------------------------------Check duplicate coach Id---------------------
   
   $('.coachId').blur(function(e) { 
	   var coachId=this.value;
	   var id=this.id;//alert(coachId+" "+id);
	   var count=0;
	   if(coachId!=0){
		   $( ".coachId" ).each(function( index ) { 
	     	     if( $( this ).val()==coachId){
	     	    	count++;
				  }
			});
		   
		   if(count>1){
			   swal("coach id can not be same"); 
			  $( "#"+id ).removeAttr('value');
		   }
		   
	   }else{
		   $( "#"+id ).removeAttr('value');  
	   }
		   
   });
   
//---------Show No of Platform Available at Station-------------  
   
	   var noOfPlatform=<s:property value="noOfPlatform"/>;
	   
	   $( ".MP" ).each(function() {
	      $(this).removeAttr("disabled");
	   });
	   
	   for(var i=noOfPlatform+1;i<=32;i++){
		   $('#MP'+i).attr("disabled","disabled");
	   }
	   
	   $('#allMultilinePlatform').change(function(e) {
		   for(var i=0;i<noOfPlatform;i++){
			   $('#MP'+i).attr("checked","checked");  
		   }
	   });
	   
	   $('#selectMultilinePlatform').change(function(e) {
		   for(var i=0;i<noOfPlatform;i++){
			   $('#MP'+i).removeAttr("checked");  
		   }
	   });
	   
//----------------------------------------------------------------------------
 
	   $( ".PF" ).each(function() {
	      $(this).removeAttr("disabled");
	   });
	  
	   for(var i=noOfPlatform+1;i<=32;i++){
		   $('#P'+i).attr("disabled","disabled");
	   }
	   
	   $('#allPlatform').change(function(e) {
		   for(var i=0;i<noOfPlatform;i++){
			   $('#P'+i).attr("checked","checked");  
		   }
	   });
	   
	   $('#selectPlatform').change(function(e) {
		   for(var i=0;i<noOfPlatform;i++){
			   $('#P'+i).removeAttr("checked");  
		   }
	   });
	   
  //------------------PDC Config Controls ( Edit , Clear , Cancel ) ------------------
  
      var pdcDeviceId=$("#cds_deviceId").val();
  
      if(pdcDeviceId!=0 && pdcDeviceId!=""){ 
  
	       $("#pdcConfig :input").attr("readonly", "readonly");
	       $("#savePdcDetail").attr("disabled", "disabled");
	       
       }else{
    	   $("#cds_deviceId").removeAttr("value");  
       }
       
       $("#editPdcDetail").click(function(){
    	   $("#pdcConfig :input").removeAttr("readonly");
    	   $("#savePdcDetail").removeAttr("disabled");
       });
  
//        $('#clearPdcDetail').click(function() {
//     	    location.reload();
//        });
       
       $('#cancelPdcDetail').click(function() {
    	   $("#pdcConfig").css("display", "none");
       });
       
  //------------------Multiline Config Controls ( Edit , Clear , Cancel ) ------------------   
  
       var multilineDeviceId=$("#multiline_deviceId").val();
  
	   if(multilineDeviceId!=0 && multilineDeviceId!=""){ 
	
	         $("#multiline :input[type='text']").attr("readonly", "readonly");
	         $("#multiline textarea").attr("readonly", "readonly");
	         $("#multiline select").attr("disabled", "disabled");
	         $("#multiline :input[type='radio']").attr("disabled", "disabled");
	         $("#multiline :input[type='checkbox']").attr("disabled", "disabled");
	         $("#saveMultilineDetail").attr("disabled", "disabled");
	         
	   }else{
    	   $("#multiline_deviceId").removeAttr("value");  
       }
  
       $("#editMultilineDetail").click(function(){
    	   $("#multiline :input[type='text']").removeAttr("readonly");
    	   $("#multiline textarea").removeAttr("readonly");
           $("#multiline select").removeAttr("disabled");
           $("#multiline :input[type='radio']").removeAttr("disabled");
           $("#multiline :input[type='checkbox']").removeAttr("disabled");
           for(var i=noOfPlatform+1;i<=32;i++){
    		   $('#MP'+i).attr("disabled","disabled");
    	   }
           $("#saveMultilineDetail").removeAttr("disabled");
       });
  
//        $('#clearMultilineDetail').click(function() {
//     	    location.reload();
//        });
       
       $('#cancelMultilineDetail').click(function() {
    	   $("#multiline").css("display", "none");
       }); 
       
 //------------------PFD Config Controls ( Edit , Clear , Cancel ) ------------------     
     
      var pfdDeviceId=$("#pfd_deviceId").val();
  
      if(pfdDeviceId!=0 && pfdDeviceId!=""){
    
	     $("#PDB :input[type='text']").attr("readonly", "readonly");
	     $("#PDB textarea").attr("readonly", "readonly");
	     $("#PDB select").attr("disabled", "disabled");
	     $("#PDB :input[type='radio']").attr("disabled", "disabled");
	     $("#PDB :input[type='checkbox']").attr("disabled", "disabled");
	     $("#savePFDDetail").attr("disabled", "disabled");
     
      }else{
   	     $("#pfd_deviceId").removeAttr("value");  
      }
 
      $("#editPFDDetail").click(function(){
  	     $("#PDB :input[type='text']").removeAttr("readonly");
  	     $("#PDB textarea").removeAttr("readonly");
         $("#PDB select").removeAttr("disabled");
         $("#PDB :input[type='radio']").removeAttr("disabled");
         if(document.getElementById("pfdTypeA").checked==true){
        	 $("#pfdTypeB").attr("disabled", "disabled");
         }else{
        	 $("#pfdTypeA").attr("disabled", "disabled");
         }

         $("#PDB :input[type='checkbox']").removeAttr("disabled");
         for(var i=noOfPlatform+1;i<=32;i++){
  		   $('#P'+i).attr("disabled","disabled");
  	     }
         $("#savePFDDetail").removeAttr("disabled");
     });

//      $('#clearPFDDetail').click(function() {
//   	    location.reload();
//      });
     
     $('#cancelPFDDetail').click(function() {
  	   $("#PDB").css("display", "none");
     }); 
     
  //------------------CGDB Config Controls ( Edit , Clear , Cancel ) ------------------     
	
     var cgdDeviceId=$("#1").val();
  
     if(cgdDeviceId!=0 && cgdDeviceId!=""){
  
	     $("#CGDB :input[type='text']").attr("readonly", "readonly");
	     $("#CGDB select").attr("disabled", "disabled");
	     $("#CGDB :input[type='checkbox']").attr("disabled", "disabled");
	     $("#saveCGDBDetail").attr("disabled", "disabled");

     }     
     $("#editCGDBDetail").click(function(){
  	     
    	 $("#CGDB :input[type='text']").removeAttr("readonly");
    	 $("#startId").attr("readonly","readonly"); 
    	 
  	     var no=parseInt($( "#noOfCoach" ).val());
		 if(no!=0 && $("#startId").val()!=""){
		   for(var i=no+1;i<=30;i++){	
			   $( "#"+i ).attr("readonly","readonly");
			   $( "#"+i ).removeAttr("value");
		   }			
		 }
			
         $("#CGDB select").removeAttr("disabled");
         $("#noOfCoach").css("display","none");
         $("#noOfCoachLabel").css("display","block");
         $("#coachesPerPort").css("display","none");
         $("#coachesPerPortLabel").css("display","block");
         $("#CGDB :input[type='checkbox']").removeAttr("disabled");
         $("#trainNo").attr("disabled","disabled");
         $("#coachEnglish").attr("disabled","disabled");
         $("#default1").attr("disabled","disabled");
         $("#default2").attr("disabled","disabled");
         $("#defaultInfo1").attr("readonly", "readonly");
         $("#defaultInfo2").attr("readonly", "readonly");
         $("#saveCGDBDetail").removeAttr("disabled");
         
     });

//      $('#clearCGDBDetail').click(function() {
//   	    location.reload();
//      });
     
     $('#cancelCGDBDetail').click(function() {
  	   $("#CGDB").css("display", "none");
     }); 
     
     
     $("#clrPFD").click(function(e){
    	 e.preventDefault();
    	 var retVal = confirm("Do you want to continue ?");
    	 console.log(retVal);
    	 if(retVal==true)
    		 {
    		 var rst = confirm("This will Clr PFD DB...");
    		 if(rst==true)
    			 {
    			 $('.tab').addClass("not-active-privilege");
    	    	 $("#ConfigForm").attr("action","clrPFDdevices").submit();
    			 }
    		 }
    	 /* $('.tab').addClass("not-active-privilege");
    	 $("#ConfigForm").attr("action","clrPFDdevices").submit(); */ 
    	 
     });
     $("#clrCGS").click(function(e){
    	 e.preventDefault();
    	 
    	 var retVal = confirm("Do you want to continue ?");
    	 console.log(retVal);
    	 if(retVal==true)
    		 {
    		 var rst = confirm("This will Clr CGS DB...");
    		 if(rst==true)
    			 {
	    	 $('.tab').addClass("not-active-privilege");
	    	 $("#ConfigForm").attr("action","clrCGSdevices").submit(); 
    			 }
    		 }
     });
     $("#setDefaultBoard").click(function(e){
    	 e.preventDefault();
    	 $('.tab').addClass("not-active-privilege");
    	 $("#ConfigForm").attr("action","setDefaultBoardAction").submit(); 
    	 
     });
     $("#setDefaultCGS").click(function(e){
    	 e.preventDefault();
    	 var x = document.getElementsByClassName("pdc");
    	 var i=0;
    	 for(i=0;i<x.length;i++)
    		 {
    		 	var s1=$(x[i]).find("span").html();
    		 	if(s1.includes("Coach Guidance Display Board"))
    		 		{
    		 		swal({
    		 	   		  title: "Default Info",
    		 	   		  type: "input",
    		 	   		  showCancelButton: true,
    		 	   		  closeOnConfirm: false,
    		 	   		  animation: "slide-from-top",
    		 	   		  inputPlaceholder: "Enter the Default info"
    		 	   		},
    		 	   		function(inputValue){
    		 	   		  if (inputValue === false) return false;
    		 	   		  
    		 	   		  if (inputValue === "") {
    		 	   		    swal.showInputError("Please Enter the default text");
    		 	   		    return false;
    		 	   		  }
    		 	   		  else if(inputValue.length>4){
    		 	   			  swal.showInputError("Input cannot be greater than 4");
    		 	   			  return false;
    		 	   		  } 
    		 	   		  else{ 
    		 	   			  inputValue=inputValue.toUpperCase();
    		 	    			  $.getJSON("defaultCGDInfo?defaultText="+inputValue,function(data){
    		 	   					 console.log( "Response Data--->"+data);
    		 					
    		 	   					 if(data=="")
    		 	   						 {
    		 	   						 	swal("DATA SENT","", "success");
    		 	   						 }
    		 	   					 else
    		 	   						 {
    		 	   							swal.showInputError(data+" is not connected ");
    		 	   						 }
    		 	   					
    		 	   		         }); 
    		 	   			 
    		 	   		  }
    		 	   		  
    		 	   		}); 
    		 		break;
    		 		}
    		 	
    		 }
    	 if(i==x.length)
    		 {
    		 	swal("No CGDB is Configured");
    		 }
    	 
     });
     $("#setConfig").click(function(e){
    	 e.preventDefault();
    	 var cdsportName=$('#cdsNewPortName').val();
    	 var pdcportName=$('#pdcNewPortName').val();
    	 if(!(cdsportName=="Multiline") || cdsportName=="")
    		 {    		 
    		 if(pdcportName=="" || pdcportName.search("port")>-1)
    			 {
    			 	swal("Please select either MultiLine or Type A/B or CGDB");
    			 }
    		 else
    			 {
    			 $('.tab').addClass("not-active-privilege");
    			 	$("#ConfigForm").attr("action","SetConfigAction").submit(); 
    			 }
    		 }
    	 else
    		 {
    		 $('.tab').addClass("not-active-privilege");
    		 	$("#ConfigForm").attr("action","SetConfigAction").submit(); 
    		 }
    	 
    	 
    	 //
    	 
     });
     
     
  
 //---------------------Set and Get Cookies-----------------------------------

	function setCookie(cname, cvalue, exdays) {
	   var d = new Date();
	   d.setTime(d.getTime() + (exdays*24*60*60*1000));
	   var expires = "expires="+d.toUTCString();
	   document.cookie = cname + "=" + cvalue + "; " + expires;
	}
	
	function getCookie(cname) {
	    var name = cname + "=";
	    var ca = document.cookie.split(';');
	    for(var i = 0; i < ca.length; i++) {
	        var c = ca[i];
	        while (c.charAt(0) == ' ') {
	            c = c.substring(1);
	        }
	        if (c.indexOf(name) == 0) {
	            return c.substring(name.length, c.length);
	        }
	    }
	    return "";
	}

//-------------------------Validate Ip Address----------------------------------
	
	function ValidateIPaddress(ipaddress){
	 if (/^(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$/.test(ipaddress)){  
	    return (true);  
	  }  
	  swal("You have entered an invalid IP address!");  
	  return (false);  
	}     
	
//----------------------------XXXXXXXXXXXXXXXXX----------------------------------
$("#multiline_display_effect").change(function(e){
	var effect=this.value;
	if(effect==0)
		{
		$("#multiline_effect_speed").empty();
			$("#multiline_effect_speed").append("<option value='5' style='display: none;'>Medium</option>"+
			"<option value='1'>Lowest</option>"+
			"<option value='3'>Low</option>"+
			"<option value='5'>Medium</option>"+
			"<option value='8'>High</option>"+
			"<option value='11'>Highest</option>");
		}
	else if(effect==10)
		{
		$("#multiline_effect_speed").empty();
			$("#multiline_effect_speed").append("<option value='11' style='display: none;'>Medium</option>"+
			"<option value='2'>Lowest</option>"+
			"<option value='3'>Low</option>"+
			"<option value='11'>Medium</option>"+
			"<option value='16'>High</option>"+
			"<option value='21'>Highest</option>");
		}
	else if(effect==6)
	{
	$("#multiline_effect_speed").empty();
		$("#multiline_effect_speed").append("<option value='9' style='display: none;'>Medium</option>"+
		"<option value='32'>Lowest</option>"+
		"<option value='11'>Low</option>"+
		"<option value='9'>Medium</option>"+
		"<option value='5'>High</option>"+
		"<option value='2'>Highest</option>");
	}
	else if(effect==20)
	{
	$("#multiline_effect_speed").empty();
		$("#multiline_effect_speed").append("<option value='9' style='display: none;'>Medium</option>"+
		"<option value='19'>Lowest</option>"+
		"<option value='11'>Low</option>"+
		"<option value='9'>Medium</option>"+
		"<option value='5'>High</option>"+
		"<option value='2'>Highest</option>");
	}
	else if(effect==22 || effect==27 || effect==21)
	{
	$("#multiline_effect_speed").empty();
		$("#multiline_effect_speed").append("<option value='17' style='display: none;'>Medium</option>"+
		"<option value='26'>Lowest</option>"+
		"<option value='22'>Low</option>"+
		"<option value='17'>Medium</option>"+
		"<option value='12'>High</option>"+
		"<option value='6'>Highest</option>");
	}
	else if(effect==9 || effect==8)
	{
	$("#multiline_effect_speed").empty();
		$("#multiline_effect_speed").append("<option value='27' style='display: none;'>Medium</option>"+
		"<option value='32'>Lowest</option>"+
		"<option value='30'>Low</option>"+
		"<option value='27'>Medium</option>"+
		"<option value='24'>High</option>"+
		"<option value='23'>Highest</option>");
	}
	
	
});	


$("#pfd_display_effect").change(function(e){
	var effect=this.value;
	if(effect==0)
		{
		$("#pfd_effect_speed").empty();
			$("#pfd_effect_speed").append("<option value='5' style='display: none;'>Medium</option>"+
			"<option value='1'>Lowest</option>"+
			"<option value='3'>Low</option>"+
			"<option value='5'>Medium</option>"+
			"<option value='8'>High</option>"+
			"<option value='11'>Highest</option>");
		}
	else if(effect==10)
		{
		$("#pfd_effect_speed").empty();
			$("#pfd_effect_speed").append("<option value='11' style='display: none;'>Medium</option>"+
			"<option value='2'>Lowest</option>"+
			"<option value='3'>Low</option>"+
			"<option value='11'>Medium</option>"+
			"<option value='16'>High</option>"+
			"<option value='21'>Highest</option>");
		}
	else if(effect==6)
	{
	$("#pfd_effect_speed").empty();
		$("#pfd_effect_speed").append("<option value='9' style='display: none;'>Medium</option>"+
		"<option value='32'>Lowest</option>"+
		"<option value='11'>Low</option>"+
		"<option value='9'>Medium</option>"+
		"<option value='5'>High</option>"+
		"<option value='2'>Highest</option>");
	}
	else if(effect==20)
	{
	$("#pfd_effect_speed").empty();
		$("#pfd_effect_speed").append("<option value='9' style='display: none;'>Medium</option>"+
		"<option value='19'>Lowest</option>"+
		"<option value='11'>Low</option>"+
		"<option value='9'>Medium</option>"+
		"<option value='5'>High</option>"+
		"<option value='2'>Highest</option>");
	}
	else if(effect==22 || effect==27 || effect==21)
	{
	$("#pfd_effect_speed").empty();
		$("#pfd_effect_speed").append("<option value='17' style='display: none;'>Medium</option>"+
		"<option value='26'>Lowest</option>"+
		"<option value='22'>Low</option>"+
		"<option value='17'>Medium</option>"+
		"<option value='12'>High</option>"+
		"<option value='6'>Highest</option>");
	}
	else if(effect==9 || effect==8)
	{
	$("#pfd_effect_speed").empty();
		$("#pfd_effect_speed").append("<option value='27' style='display: none;'>Medium</option>"+
		"<option value='32'>Lowest</option>"+
		"<option value='30'>Low</option>"+
		"<option value='27'>Medium</option>"+
		"<option value='24'>High</option>"+
		"<option value='23'>Highest</option>");
	}
	
	
});	

$("#noOfLine").change(function(e){

	var linenos=this.value;
	$("#line_nos").html("");
	for(var i=1;i<=linenos;i++)
		{
			$("#line_nos").append("<label>"+i+"</label><input type='checkbox' value='"+i+"' name='multiline.lineNos' style='width:20px;height:20px;margin-right:10px;' checked/>");
		}
});
			
			
			
	
});
</script>

</head>
<body>
<div style="background: #111">
   <img src="../images/header2.png" width="100%" height="100" alt="header2"/>
   <ul style="list-style-type: none;margin: 0;padding: 0;overflow: hidden;background-color: #335996">

       <li  style=" float: left;"><a class="tab" style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;" href="../train/trainRunningInfo">Online Train</a></li>
       <li  style=" float: left;"><a  style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;" <s:if test='%{#session["user"].status==false}'> class="not-active-privilege" </s:if><s:else>class="tab"</s:else>  href="deviceStatus">Status</a></li>
			 <li style=" float: left;"><a class="active tab" style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;" href="deviceConfig">Display</a></li>
				 <li style=" float: left;"><a  style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;" <s:if test='%{#session["user"].intensity==false}'> class="not-active-privilege" </s:if><s:else>class="tab"</s:else>   href="deviceIntensity">Intensity</a></li>
				 <li style=" float: left;"><a style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;" <s:if test='%{#session["user"].logReport==false}'> class="not-active-privilege" </s:if><s:else>class="tab"</s:else>  href="../log-report/logReport">Log Report</a></li>
 				 <li style=" float: left;"><a  style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;" <s:if test='%{#session["user"].cctv==false}'> class="not-active-privilege" </s:if><s:else>class="tab"</s:else>  href="../cctv/led-lcd-display.jsp">CCTV</a></li> 
				 <li style=" float: left;"><a style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;" <s:if test='%{#session["user"].personalAnc==false}'> class="not-active-privilege" </s:if><s:else>class="tab"</s:else>  href="../announcement/personalAnc">PA</a></li>
                          
				 <li style=" float: left;"><a style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;" <s:if test='%{#session["user"].message==false}'> class="not-active-privilege" </s:if><s:else>class="tab"</s:else>  href="../message/getBoardMessageList">Message</a></li>
				 <li style=" float: left;"><a  style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;" <s:if test='%{#session["user"].setup==false}'> class="not-active-privilege" </s:if><s:else>class="tab"</s:else>  href="../setup/setup.jsp">Setup</a></li>
                 <li style=" float: left;"><a  style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;" <s:if test='%{#session["user"].interfaces==false}'> class="not-active-privilege" </s:if><s:else>class="tab"</s:else>  href="../option/optionSettings">Interface</a></li>
				 <li style=" float: left;"><a  style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;" <s:if test='%{#session["user"].user==false}'> class="not-active-privilege" </s:if><s:else>class="tab"</s:else>  href="../user/userSetting">User</a></li>
				 <li style=" float: left;"><a class="tab" style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;" href="../train/help.jsp">Help</a></li>
                 <li style="float: right"><a class="tab" style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;" href="../logout">Logout</a></li>
                 <li style="float: right"><a class="tab" style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;" href="../user/changePassword"><s:property value="#session['user'].userId" /></a></li>                                
					<li style="float: right"><span style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;" id="time"></span></li>
</ul>
</div>

<div id="left">

<div id="conForm">
<form action="" method="post" id="displayListForm">
<fieldset><legend><label>Select Device to Configure</label></legend>
<select style="width:250px; height:25px;" id="displayList"></select>
<s:if test='%{deviceDetail.cds.deviceId!=0}'>
<%--  <input type="hidden" name="deviceId" value='<s:property value="deviceDetail.cds.deviceId"/>'> --%>
 <input type="hidden" name="firstPlatform" value='<s:property value="deviceDetail.cds.firstPlatform"/>'>
 <input type="hidden" name="secondPlatform" value='<s:property value="deviceDetail.cds.secondPlatform"/>'>
 <input type="hidden" name="cdsPortId" value='<s:property value="deviceDetail.cds.defaultPortName"/>'>
</s:if>
<s:if test='%{deviceDetail.multiline.deviceId!=0}'>
 <input type="hidden" name="deviceId" value='<s:property value="deviceDetail.multiline.deviceId"/>'>
 <%-- <input type="hidden" name="cdsPortId" value='<s:property value="deviceDetail.multiline.cdsPortId"/>'> --%>
</s:if>
<s:if test='%{deviceDetail.pfd.deviceId!=0}'>
 <input type="hidden" name="deviceId" value='<s:property value="deviceDetail.pfd.deviceId"/>'>
 <input type="hidden" name="cdsPortId" value='<s:property value="deviceDetail.pfd.cdsPortId"/>'>
 <input type="hidden" name="pdcPortId" value='<s:property value="deviceDetail.pfd.pdcPortId"/>'>
</s:if>
<s:if test='%{deviceDetail.cgd.id!=0}'>
 <input type="hidden" name="firstPlatform" value='<s:property value="deviceDetail.cgd.platformNo"/>'>
 <input type="hidden" name="cdsPortId" value='<s:property value="deviceDetail.cgd.cdsPortId"/>'>
 <input type="hidden" name="pdcPortId" value='<s:property value="deviceDetail.cgd.pdcPortId"/>'>
</s:if>
<input type="hidden" id="deviceName" name="deviceName" value='<s:property value="deviceDetail.currentDevice"/>' placeholder="Device Name">
<input type="hidden" id="cdsId" name="cdsId" value='<s:if test='%{deviceDetail.cds.id!=0}'><s:property value="deviceDetail.cds.id"/></s:if><s:else><s:property value="deviceDetail.pdc.cdsId"/></s:else>'  placeholder="CDS ID">
<input type="hidden" id="pdcId" name="pdcId" value='<s:property value="deviceDetail.pdc.id"/>' placeholder="PDC ID">
<input type="hidden" id="defaultPortName" name="defaultPortName" value='<s:property value="deviceDetail.pdc.defaultPortName"/>' placeholder="PDC Default Port Name">
<br><br></fieldset>
<div id="buttons">
 <button class="btn tab" id="configure" style="width: 120px; font-size: 14px; background-color:rgb(33, 125, 189);">Add Device</button>
  <button class="btn tab" id="remove" style="width: 100px; font-size: 14px; background-color:#dd5156;">Remove</button>                  
 </div>
</form>
</div>

<div id="deviceList" style="text-transform: capitalize;">
<ul id="browser" class="filetree">
	<li><span>Main CDS</span>
		<ul>
		<s:iterator var="cds" value="cdsList">
		  <li><a class="cds"><span id='<s:property value="#cds.cdsPortId"/>'>
		  <s:if test="#cds.setConfig==1">
		  
		  <svg width="10" height="10">
   						<circle cx="5" cy="5" r="5" stroke-width="4" fill="green" />
						</svg> 
		  </s:if>		  
		  <s:else><s:if test="#cds.setConfig==2">
		  
		  <svg width="10" height="10">
   						<circle cx="5" cy="5" r="5" stroke-width="4" fill="#dd5156" />
						</svg> 
						</s:if>
		  </s:else> 
		  <s:property value="#cds.newPortName"/></span></a>
		        
		       <s:iterator var="pdc" value="pdcList"> 
		          
		          <s:if test="#cds.cdsPortId==#pdc.cdsPortId">
		           <ul>
	            	 <li><a class="pdc"><span id='<s:property value="#cds.cdsPortId"/>_<s:property value="#pdc.pdcPortId"/>'>	            	             	 
	            	 <s:if test="#pdc.setConfig==1">
		  
		 				 <svg width="10" height="10">
   						<circle cx="5" cy="5" r="5" stroke-width="4" fill="green" />
						</svg> 
		  			</s:if>		  
		   			<s:else><s:if test="#pdc.setConfig==2">
		  
		  				<svg width="10" height="10">
   						<circle cx="5" cy="5" r="5" stroke-width="4" fill="#dd5156" />
						</svg> 
						</s:if>
		  			</s:else> 
	            	 
	            	 <s:property value="#pdc.newPortName"/></span></a></li>
                   </ul>
                  </s:if>                 
               </s:iterator>              
		  </li>
		</s:iterator>
        </ul>
	</li>
</ul>
</div>


<form method="post" action="#" id="ConfigForm">
<input type="hidden" id="cdsId" name="cdsId" value='<s:if test='%{deviceDetail.cds.id!=0}'><s:property value="deviceDetail.cds.id"/></s:if><s:else><s:property value="deviceDetail.pdc.cdsId"/></s:else>'  placeholder="CDS ID">
<input type="hidden" id="pdcId" name="pdcId" value='<s:property value="deviceDetail.pdc.id"/>' placeholder="PDC ID"><br>
<input type="hidden" id="cdsNewPortName" name="cdsNewPortName" value='<s:property value="deviceDetail.cds.newPortName"/>' placeholder="CDS New Port Name">
<input type="hidden" id="pdcNewPortName" name="pdcNewPortName" value='<s:property value="deviceDetail.pdc.newPortName"/>' placeholder="PDC New Port Name">
<input type="hidden" id="pdcPortId" name=pdcPortId value='<s:property value="deviceDetail.pdc.pdcPortId"/>' placeholder="PDC Port Id">
<input type="hidden" id="cdsPortId" name=cdsPortId value='<s:property value="deviceDetail.pdc.cdsPortId"/>' placeholder="CDS Port Id">
<!-- <button>Not working</button>  -->
<!-- <button>Refresh CDS</button> -->

<div id="conForm" style="height: 271px;margin-top: -20px;">
<!-- <div id="buttons" style="text-align: center;" > -->
 <button class="btn tab" style="width: 284px;height: 49px;margin-left:9px !important; background-color:rgb(33, 125, 189)" id="setConfig">&nbsp;Set config&nbsp;</button>  
<!--  <button class="btn purple">&nbsp;Get config&nbsp;</button> -->
 <br> 
 <button class="btn tab" id="clrPFD" style="width: 138px; height: 60px; margin-left:9px !important;background-color:#dd5156;">Clr Db PFD</button>  
 <button class="btn tab" id="clrCGS" style="width: 138px; height: 60px; background-color:#dd5156;" >Clr Db CGS</button> 
  <button class="btn tab" id="setDefaultCGS" style="width: 138px; height: 60px; margin-left:9px !important; background-color:rgb(33, 125, 189)">Set Default(CGS)</button>   
   <button class="btn tab" style="width: 138px; height: 60px; background-color:rgb(33, 125, 189)" id="setDefaultBoard">Set Default(Boards)</button>   
<!--     <button class="btn tab" style="width: 138px; height: 71px;margin-left:9px !important; background-color:rgb(33, 125, 189)">Restore Factory Setting(CGS)</button>   
     <button class="btn tab" style="width: 138px; height: 71px; background-color:rgb(33, 125, 189)">Restore Factory Setting(Boards)</button>  -->            
<!--  </div>  -->
</div>
</form>
</div>
<div id="right">

<!-- ===============================PDC Configuration============================================== -->

<div id="pdcConfig" style="display:none;">
<h4 style="text-align: center;">PDC Configuration</h4><hr>
<form method="post" action="savePDCDetail" id="pdcDetailForm">
<s:if test='%{deviceDetail.cds.id!=0}'>
<input type="hidden" name="cds.id" value='<s:property value="deviceDetail.cds.id"/>'>
</s:if>
<input type="hidden" name="cds.cdsPortId" value='<s:property value="deviceDetail.cds.cdsPortId"/>'>
<input type="hidden" name="cds.defaultPortName" value='<s:property value="deviceDetail.cds.defaultPortName"/>'>
<input type="hidden" name="cds.newPortName" value='<s:property value="deviceDetail.cds.newPortName"/>'>
<div class="leftside">
<table>
<tr>
<td><label>*device ID</label></td>
<td><input type="text" name="cds.deviceId" id="cds_deviceId" value='<s:property value="deviceDetail.cds.deviceId"/>'></td>
<td><label>device Location</label></td>
<td><input type="text" name="cds.deviceLocation" id="cds_deviceLocation" value='<s:property value="deviceDetail.cds.deviceLocation"/>'></td>
</tr>
<tr>
<td>
<label>*IP Address  </label>
</td><td>
<input type="text" name="cds.ipAddress" id="cds_ip_address" value='<s:property value="deviceDetail.cds.ipAddress"/>'>
</td>
<td>
<label>*Mac Address  </label>
</td><td>
<input type="text" name="cds.macAddress" id="cds_mac_address" value='<s:property value="deviceDetail.cds.macAddress"/>'>
</td>
</tr>

<tr><td>
<label>*Platform First  </label>
</td><td>
<select name="cds.firstPlatform" id="firstPlatform">
<option value='<s:if test="%{deviceDetail.cds.firstPlatform!=''}"><s:property value="deviceDetail.cds.firstPlatform"/></s:if>' selected style="display:none;"><s:if test="%{deviceDetail.cds.firstPlatform!=''}"><s:property value="deviceDetail.cds.firstPlatform"/></s:if></option>
<s:if test="%{deviceDetail.cds.firstPlatform==0}">
<s:iterator value="deviceDetail.availableCDSPlatformList">
<option value='<s:property/>'><s:property/></option>
</s:iterator>
</s:if>
</select>
</td>
<td>
<label>Platform Second  </label>
</td><td>
<select name="cds.secondPlatform" id="secondPlatform">
<option value='<s:if test="%{deviceDetail.cds.secondPlatform!=''}"><s:property value="deviceDetail.cds.secondPlatform"/></s:if>' selected style="display:none;"><s:if test="%{deviceDetail.cds.secondPlatform!=''}"><s:property value="deviceDetail.cds.secondPlatform"/></s:if></option>
<s:if test="%{deviceDetail.cds.secondPlatform==0}">
<s:iterator value="deviceDetail.availableCDSPlatformList">
<option value='<s:property/>'><s:property/></option>
</s:iterator>
</s:if>
</select>
</td>
</tr></table></div>
<br>
</form>
<div id="buttons" style="text-align: center">
<button class="btn orange" id="savePdcDetail">Save</button> 
<button class="btn purple" id="editPdcDetail">Edit</button>
<!-- <button class="btn orange" id="clearPdcDetail">Clear</button>  -->
<button class="btn purple" id="cancelPdcDetail">Cancel</button>        
 </div>
</div>

<!-- =================================Multiline Display Board Configuration======================================== -->

<div id="multiline" style="display:none;">
<h4 style="text-align: center;">Multiline Display Board Configuration</h4><hr>
<form method="post" action="saveMultilineDetail" id="saveMultilineDetailForm">
<s:if test='%{deviceDetail.cds.id!=0}'>
<input type="hidden" name="cds.id" value='<s:property value="deviceDetail.cds.id"/>'>
</s:if>
<s:if test='%{deviceDetail.multiline.id!=0}'>
<input type="hidden" name="multiline.id" value='<s:property value="deviceDetail.multiline.id"/>'>
</s:if>
<input type="hidden" name="cds.cdsPortId" value='<s:property value="deviceDetail.cds.cdsPortId"/>'>
<input type="hidden" name="cds.defaultPortName" value='<s:property value="deviceDetail.cds.defaultPortName"/>'>
 <div class="leftside">
 <table><tr><td>
<label>*Device Id</label></td><td>
<input type="text" name="multiline.deviceId" id="multiline_deviceId" placeholder="Enter Device Id" value='<s:property value="deviceDetail.multiline.deviceId"/>'>
</td><tr>
<tr><td><label>*Device IP  </label></td><td> <input type="text" name="multiline.deviceIp" id="multiline_device_ip" placeholder="Enter Device IP" value='<s:property value="deviceDetail.multiline.deviceIp"/>'></td></tr>
<tr><td><label>*Mac Address  </label></td><td> <input type="text" name="multiline.macAddress" id="multiline_device_mac" placeholder="Enter Mac Address" value='<s:property value="deviceDetail.multiline.macAddress"/>'></td></tr></table>
</div>
<div class="rightside">
<table>
<tr><td><label>Location  </label></td><td> <input type="text" name="multiline.deviceLocation" placeholder="Enter Device Location" value='<s:property value="deviceDetail.multiline.deviceLocation"/>'></td></tr>
<tr><td><label>Train Type  </label></td><td>
<select name="multiline.trainType">
<option value="<s:if test='%{deviceDetail.multiline.trainType!=""}'><s:property value="deviceDetail.multiline.trainType"/></s:if><s:else>Both</s:else>" selected style="display:none;"><s:if test='%{deviceDetail.multiline.trainType!=""}'><s:property value="deviceDetail.multiline.trainType"/></s:if><s:else>Both</s:else></option>
<option value="Arrival">Arrival</option>
<option value="Departure">Departure</option>
<option value="Both">Both</option>
</select></td><tr>
<tr><td><label>No of Line  </label></td><td>
<select name="multiline.noOfLine" id="noOfLine">
<option value="<s:if test='%{deviceDetail.multiline.noOfLine!=0}'><s:property value="deviceDetail.multiline.noOfLine"/></s:if><s:else>2</s:else>" selected style="display:none;"><s:if test='%{deviceDetail.multiline.noOfLine!=0}'><s:property value="deviceDetail.multiline.noOfLine"/></s:if><s:else>2</s:else></option>
<script>
for(var i=2;i<=10;i++){
document.writeln('<option value="'+i+'">'+i+'</option>');
}
</script>
</select> </td><td>
<input type="checkbox" style="width: 20px; height: 20px" name="multiline.message" value="true" <s:if test="%{deviceDetail.multiline.message==true}">checked</s:if> ><label>Message</label></td><tr>
</table></div>
<fieldset>
<legend>MultiLine Line Number</legend>
<div id="line_nos">
<table>
<tbody>
<s:if test='%{deviceDetail.multiline.lineNos!=null}'>
<tr>
<script>
var lineNos='<s:property value="deviceDetail.multiline.lineNos"/>';
var noOfLine=<s:property value="deviceDetail.multiline.noOfLine"/>;
var lines=lineNos.split(",");
var flag=0;
for(var i=0;i<noOfLine;i++){
	flag=0;
	for(var k=0;k<lines.length;k++){
		if(i+1==lines[k]){
			document.writeln('<td><label>'+(i+1)+'</label><input type="checkbox" value='+(i+1)+' style="width: 20px; height: 20px" name="multiline.lineNos" checked/></td>')
			flag=1;
			break;
		}
	}
	if(flag==0){
		document.writeln('<td><label>'+(i+1)+'</label><input type="checkbox" value='+(i+1)+' style="width: 20px; height: 20px" name="multiline.lineNos" /></td>')
	}
}

</script>
<%-- <s:iterator value='deviceDetail.multiline.lineNos.split(",")' status="list">

<td>
<label>&nbsp;&nbsp;<s:property/></label><input value="<s:property/>" type="checkbox" style="width: 20px; height: 20px" name="multiline.lineNos" 
<s:if test='%{deviceDetail.multiline.lineNos[#list.index]!=null}'><s:property value="deviceDetail.multiline.lineNos[#list.index]"/>

</s:if> checked >
</td>
</s:iterator> --%>
</tr>
</s:if>
<s:else>
<tr>
<td>
1<input type="checkbox" value="1" style="width: 20px; height: 20px" name="multiline.lineNos" checked/></td>
<td>2<input type="checkbox" value="2" style="width: 20px; height: 20px" name="multiline.lineNos" checked/></td>
</tr>
</s:else>
</tbody>
</table>

</div>
</fieldset>
<fieldset>
<legend>Select Language</legend>
<input type="checkbox" style="width: 20px; height: 20px" name="multiline.deviceLanguageEnglish" id="multiline_deviceLanguageEnglish" value="English" <s:if test='%{deviceDetail.multiline.deviceLanguageEnglish=="English"}'>checked</s:if> ><label>English</label>
<input type="checkbox" style="width: 20px; height: 20px" name="multiline.deviceLanguageHindi" id="multiline_deviceLanguageHindi" value="Hindi" <s:if test='%{deviceDetail.multiline.deviceLanguageHindi=="Hindi"}'>checked</s:if> ><label>Hindi</label>
<input type="checkbox" style="width: 20px; height: 20px" name="multiline.deviceLanguageRegional" id="multiline_deviceLanguageRegional" value="Regional" <s:if test='%{deviceDetail.multiline.deviceLanguageRegional=="Regional"}'>checked</s:if> ><label>Regional</label>
</fieldset>
<br>
<fieldset>
<legend>Select Platform</legend>
<input type="radio" name="multiline.allSelectedPlatform" value="1" id="allMultilinePlatform" style="width: 20px; height: 20px" <s:if test='%{deviceDetail.multiline.allSelectedPlatform==1}'>checked</s:if> > <label>All Platform </label> 
<input type="radio" name="multiline.allSelectedPlatform" value="0" id="selectMultilinePlatform" style="width: 20px; height: 20px" <s:if test='%{deviceDetail.multiline.allSelectedPlatform==0}'>checked</s:if> > <label>Select Platform  </label><br><br>

<table>
<tbody>
<s:iterator value='station.platformNos.split(",")' status="list">
<s:if test='%{#list.index==10 || #list.index==20 } '>
<tr>
</s:if>
<td>
<label>&nbsp;&nbsp;<s:property/></label><input class="MP" id="MP<s:property value="#list.index"/>" value="<s:property/>" type="checkbox" style="width: 20px; height: 20px" name="multiline.platform" <s:if test='%{deviceDetail.multiline.platformList[#list.index]!=null}'><s:property value="deviceDetail.multiline.platformList[#list.index]"/></s:if> >
</td>
</s:iterator>
</tbody>
</table>
</fieldset>
<br>
<div class="leftside">
<table>
<tr>
<td>
<label>Display Mode  </label></td>
<td>
<select id="multivideoType" name="multiline.videoType">
<option value="normal">Normal</option>
<option value="reverse">Reverse</option>
</select>
<script>
var videoType='<s:property value="deviceDetail.multiline.videoType"/>';
if(videoType=="reverse")
$("#multivideoType").val(videoType);
</script>
</td>
</tr>
<tr><td>
<label>Display Effect  </label></td><td>
<select name="multiline.displayEffect" id="multiline_display_effect">
<option value="0">Reserved</option>
<option value="20">Curtain Left to Right</option>
<option value="22">Curtain Top to Bottom</option>
<option value="21">Curtain Bottom to Top</option>
<option value="27">Typing Left to Right</option>
<option value="6">Scrolling Right to Left</option>
<option value="9">Scrolling Top to Bottom</option>
<option value="8">Scrolling Bottom to Top</option>
<option value="10">Flashing</option>
</select>
<script>
var displayEffect=<s:property value="deviceDetail.multiline.displayEffect"/>;
if(displayEffect!=0)
$("#multiline_display_effect").val(displayEffect);
</script>
</td></tr>

<tr><td>
<label>Effect Speed</label></td><td>
<select name="multiline.effectSpeed" id="multiline_effect_speed">
<!--  <option value="5" style="display: none;">Medium</option>
<option value="1">Lowest</option>
<option value="3">Low</option>
<option value="5">Medium</option>
<option value="8">High</option>
<option value="11">Highest</option>  -->
</select>
<script>

</script>
</td></tr>

<tr><td><label>Delay time(In sec) : </label></td><td>
<select name="multiline.delayTime">
<option value="<s:if test='%{deviceDetail.multiline.delayTime!=0}'><s:property value="deviceDetail.multiline.delayTime"/></s:if><s:else>10</s:else>" selected style="display:none;"><s:if test='%{deviceDetail.multiline.delayTime!=0}'><s:property value="deviceDetail.multiline.delayTime"/></s:if><s:else>10</s:else></option>
<script>
for(var i=1;i<=60;i++){
document.writeln('<option value="'+i+'">'+i+'</option>');
}
</script>
</select></td></tr>
</table>
</div>
<div style="float: right; height: 100px; margin-right: 50px;">
	<label style="display: inline-block; vertical-align: top; height: 100%;">Default Message : &nbsp </label><textarea style="display: inline-block;height: 100%;" maxlength="56" id="messagedisplay" name="multiline.defaultMessage"><s:if test='%{deviceDetail.multiline.defaultMessage!=""}'><s:property value="deviceDetail.multiline.defaultMessage"/></s:if><s:else>Welcome to Indian Railways</s:else></textarea>
</div>
</form>

<div id="buttons" style="text-align: center">
 <button class="btn orange" id="saveMultilineDetail">Save</button>
 <a href="#" class="btn purple" id="editMultilineDetail">Edit</a>
<!--  <a href="#" class="btn orange" id="clearMultilineDetail">Clear</a>  -->
 <a href="#" class="btn purple" id="cancelMultilineDetail">Cancel</a>               
 </div>

</div>

<!-- ===============================Platform Display Board Configuration=================================== -->

<div id="PDB" style="display:none;">
<h4 style="text-align: center;">Platform Display Board Configuration</h4><hr>
<form method="post" action="savePFDDetail" id="savePFDDetailForm">
<s:if test='%{deviceDetail.pdc.id!=0}'>
<input type="hidden" name="pdc.id" value='<s:property value="deviceDetail.pdc.id"/>'>
</s:if>
<s:if test='%{deviceDetail.pfd.id!=0}'>
<input type="hidden" name="pfd.id" value='<s:property value="deviceDetail.pfd.id"/>'>
</s:if>
<input type="hidden" name="pdc.cdsId" value='<s:property value="deviceDetail.pdc.cdsId"/>'>
<input type="hidden" name="pdc.cdsPortId" value='<s:property value="deviceDetail.pdc.cdsPortId"/>'>
<input type="hidden" name="pdc.pdcPortId" value='<s:property value="deviceDetail.pdc.pdcPortId"/>'>
<input type="hidden" name="pdc.defaultPortName" value='<s:property value="deviceDetail.pdc.defaultPortName"/>'>

<input type="radio" style="width: 15px; height: 15px"  name="pfd.deviceName" id="pfdTypeA" value="Platform Display Board - Type A" <s:if test='%{deviceDetail.pfd.deviceName=="Platform Display Board - Type A"}'>checked</s:if> ><label>PFD( 336 X 16 ) Single Line  </label> <br>
<input type="radio" style="width: 15px; height: 15px"  name="pfd.deviceName" id="pfdTypeB" value="Platform Display Board - Type B" <s:if test='%{deviceDetail.pfd.deviceName=="Platform Display Board - Type B"}'>checked</s:if> ><label>PFD( 192 X 32 ) At a glance  </label><br><br>
<div class="leftside">
<table><tr><td><label>*Device ID</label></td><td> <input type="text" name="pfd.deviceId" id="pfd_deviceId" placeholder="Enter Device Id" value='<s:property value="deviceDetail.pfd.deviceId"/>'></td>
<td><label>Location  </label></td><td> <input type="text" name="pfd.deviceLocation" placeholder="Enter Device Location" value='<s:property value="deviceDetail.pfd.deviceLocation"/>'></td></tr>
<tr><td><label>*Device IP</label></td><td> <input type="text" name="pfd.deviceIp" id="pfd_device_ip" placeholder="Enter Device IP" value='<s:property value="deviceDetail.pfd.deviceIp"/>'></td>
<td><label>*Mac Address  </label></td><td> <input type="text" name="pfd.macAddress" id="pfd_device_mac" placeholder="Enter Mac Address" value='<s:property value="deviceDetail.pfd.macAddress"/>'></td></tr>
<tr><td><label>Connection Mode</label></td>
<td><select id="pfd_con_mode" name="pfd.connectionMode">
<option value="0">Ethernet</option>
<option value="1">Serial(RS-485)</option>
<option value="2">Zigbee</option>
</select>
<script>
var mode=<s:property value="deviceDetail.pfd.connectionMode"/>;
$('#pfd_con_mode').val(mode);
</script>
</td><td>
<input type="checkbox" style="width: 20px; height: 20px" name="pfd.message" value="true" <s:if test="%{deviceDetail.pfd.message==true}">checked</s:if> ><label>Message</label></td></tr>
</table></div>
<fieldset>
<legend>Select Language</legend>
<input type="checkbox" style="width: 15px; height: 15px"  name="pfd.deviceLanguageEnglish" id="pfd_deviceLanguageEnglish" value="English" <s:if test='%{deviceDetail.pfd.deviceLanguageEnglish=="English"}'>checked</s:if> ><label>English</label>
<input type="checkbox" style="width: 15px; height: 15px"  name="pfd.deviceLanguageHindi" id="pfd_deviceLanguageHindi" value="Hindi" <s:if test='%{deviceDetail.pfd.deviceLanguageHindi=="Hindi"}'>checked</s:if> ><label>Hindi</label>
<input type="checkbox" style="width: 15px; height: 15px"  name="pfd.deviceLanguageRegional" id="pfd_deviceLanguageRegional" value="Regional" <s:if test='%{deviceDetail.pfd.deviceLanguageRegional=="Regional"}'>checked</s:if> ><label>Regional</label>
</fieldset>
<br>
<fieldset>
<legend>Select Platform</legend>
<input type="radio" id="allPlatform" name="pfd.AllselectedStation" value="true" <s:if test='%{deviceDetail.pfd.AllselectedStation==true}'>checked</s:if> ><label>All Platform</label> 
<input type="radio" id="selectPlatform" name="pfd.AllselectedStation" value="false" <s:if test='%{deviceDetail.pfd.AllselectedStation==false}'>checked</s:if> ><label>Select Platform </label><br><br>

<table>
<tbody>
<s:iterator value='station.platformNos.split(",")' status="list">
<s:if test='%{#list.index==10 || #list.index==20 } '>
<tr>
</s:if>
<td>
<label>&nbsp;&nbsp;<s:property/></label><input class="PF" id="P<s:property value="#list.index"/>" value="<s:property/>" type="checkbox" style="width: 20px; height: 20px"  name="pfd.platform" <s:if test='%{deviceDetail.pfd.platformList[#list.index]!=null}'><s:property value="deviceDetail.pfd.platformList[#list.index]"/></s:if> >

</td>
</s:iterator>
</tbody>
</table>

</fieldset><br><br>
<div class="leftside">
<table><tr>
<td>
<label>Display Mode  </label>
</td>
<td>
<select id="videoType" name="pfd.videoType">
<option value="normal">Normal</option>
<option value="reverse">Reverse</option>
</select>
<script>
var videoType='<s:property value="deviceDetail.pfd.videoType"/>';
if(videoType=="reverse")
$("#videoType").val(videoType);
</script>
</td>
<td><label>Delay time(In sec) : </label></td><td>
<select name="pfd.delayTime">
<option value="<s:if test='%{deviceDetail.pfd.delayTime!=0}'><s:property value="deviceDetail.pfd.delayTime"/></s:if><s:else>10</s:else>" selected style="display:none;"><s:if test='%{deviceDetail.pfd.delayTime!=0}'><s:property value="deviceDetail.pfd.delayTime"/></s:if><s:else>10</s:else></option>
<script>
for(var i=1;i<=60;i++){
document.writeln('<option value="'+i+'">'+i+'</option>');
}
</script>
</select>
</td>
</tr>
<tr>

 <td>
<label>Display Effect  </label></td><td>
<select id="pfd_display_effect" name="pfd.displayEffect">
<option value="0">Reserved</option>
<option value="20">Curtain Left to Right</option>
<option value="22">Curtain Top to Bottom</option>
<option value="21">Curtain Bottom to Top</option>
<option value="20">Typing Left to Right</option>
<option value="6">Scrolling Right to Left</option>
<option value="9">Scrolling Top to Bottom</option>
<option value="8">Scrolling Bottom to Top</option>
<option value="10">Flashing</option>
</select>
<script>
var displayEffect=<s:property value="deviceDetail.pfd.displayEffect"/>;
if(displayEffect!=0)
$("#pfd_display_effect").val(displayEffect);
</script>
</td> 
<td><label>Default Message : </label></td><td rowspan="2"> <textarea name="pfd.defaultMessage" style="height: 90px;" maxlength="56"><s:if test='%{deviceDetail.pfd.defaultMessage!=""}'><s:property value="deviceDetail.pfd.defaultMessage"/></s:if><s:else>Welcome to Indian Railway</s:else></textarea></td>


</tr>

<tr><td>
<label>Effect Speed</label></td><td>
<select id="pfd_effect_speed" name="pfd.effectSpeed">
<!-- <option value="4" style="display: none;">Medium</option>
<option value="1">Lowest</option>
<option value="3">Low</option>
<option value="5">Medium</option>
<option value="8">High</option>
<option value="11">Highest</option>  -->
</select>
<script>

</script>
</td>

</tr>

<tr><td><label>Train Type  </label></td><td>
<select id="pfd_train_type" name="pfd.trainType">
<option value="<s:if test='%{deviceDetail.pfd.trainType!=""}'><s:property value="deviceDetail.pfd.trainType"/></s:if><s:else>Both</s:else>" selected style="display:none;"><s:if test='%{deviceDetail.pfd.trainType!=""}'><s:property value="deviceDetail.pfd.trainType"/></s:if><s:else>Both</s:else></option>
<option value="Arrival">Arrival</option>
<option value="Departure">Departure</option>
<option value="Both">Both</option>
</select>
</td></tr>

</table>
</div>
</form>

<div id="buttons" style="text-align: center">
  <button class="btn orange" id="savePFDDetail">Save</button> 
  <a href="#" class="btn purple" id="editPFDDetail">Edit</a>
<!--   <a href="#" class="btn orange" id="clearPFDDetail">Clear</a>  -->
  <a href="#" class="btn purple" id="cancelPFDDetail">Cancel</a>          
</div>

</div>

<!-- ===============================Coach Guidance Display Board Configuration================================= -->

<div id="CGDB" style="display:none;">
<h4 style="text-align: center">Coach Guidance Display Board Configuration</h4><hr>
<form method="post" action="saveCGDBDetail" id="cgdDetailForm">
<s:if test='%{deviceDetail.pdc.id!=0}'>
<input type="hidden" name="pdc.id" value='<s:property value="deviceDetail.pdc.id"/>'>
</s:if>
<s:if test='%{deviceDetail.cgd.id!=0}'>
<input type="hidden" name="cgd.id" value='<s:property value="deviceDetail.cgd.id"/>'>
<input type="hidden" name="cgd.pdcPortId" value='<s:property value="deviceDetail.cgd.pdcPortId"/>'>
<input type="hidden" name="cgd.cdsPortId" value='<s:property value="deviceDetail.cgd.cdsPortId"/>'>
</s:if>
<input type="hidden" name="pdc.cdsId" value='<s:property value="deviceDetail.pdc.cdsId"/>'>
<input type="hidden" name="pdc.cdsPortId" id="cgdCDSPortId" value='<s:property value="deviceDetail.pdc.cdsPortId"/>'>
<input type="hidden" name="pdc.pdcPortId" id="cgdPDCPortId" value='<s:property value="deviceDetail.pdc.pdcPortId"/>'>
<input type="hidden" name="pdc.defaultPortName" value='<s:property value="deviceDetail.pdc.defaultPortName"/>'>

<div class="leftside" style="margin-left: 2%">
<table><tr><td>
<label>Platform no </label></td><td>
<select name="cgd.platformNo" id="cgdPlatformNo" required>
<option value='<s:property value="deviceDetail.cgd.platformNo"/>' selected style="display:none;"><s:property value="deviceDetail.cgd.platformNo"/></option>
<s:iterator value="deviceDetail.availablePDCPlatformList">
<option value='<s:property/>'><s:property/></option>
</s:iterator>
</select></td><td>
<label>No of coaches </label></td><td>
<select id="noOfCoach" name="cgd.noOfCoach" required>
<option value="<s:property value="deviceDetail.cgd.noOfCoach"/>" selected style="display:none;"><s:property value="deviceDetail.cgd.noOfCoach"/></option>
<script>
for(var i=1;i<=30;i++){
document.writeln('<option value="'+i+'">'+i+'</option>');
}
</script>
</select>
<label id="noOfCoachLabel" style="width:100px;background: white;color:black;padding:5px;display: none;"><s:property value="deviceDetail.cgd.noOfCoach"/></label>
</td>
<td><label>Coaches Per Port</label></td><td>
<select id="coachesPerPort" name="cgd.coachesPerPort" required>
<option value="<s:property value="deviceDetail.cgd.coachesPerPort"/>" selected style="display:none;"><s:property value="deviceDetail.cgd.coachesPerPort"/></option>
<option value="1">1</option>
<option value="6">6</option>
<option value="8">8</option>
<option value="12">12</option>
<option value="16">16</option>
<option value="24">24</option>
<option value="30">All</option>
</select>
<label id="coachesPerPortLabel" style="width:100px;background: white;color:black;padding:5px;display: none;"><s:property value="deviceDetail.cgd.coachesPerPort"/></label>
</td>
</tr></table></div><br>

<fieldset>
<legend>Coach Id</legend>
<label>End 1 </label><input type="text" id="end1" style="height: 25px; width:100px; font-size: 16px" name="cgd.end1" value='<s:property value="deviceDetail.cgd.end1"/>'>
&nbsp;&nbsp;
<label> Start Id </label><input type="text" id="startId" style="height: 25px; width:35px; font-size: 16px" name="cgd.startId" value='<s:property value="deviceDetail.cgd.startId"/>'><a class="btn orange" id="setStartId">Set</a>
<br>
<table>
<tr><td>C1</td><td><input id="1" class="coachId pdc<s:property value='deviceDetail.cgd.coach1PdcId'/>" type="text" name="cgd.coach1" value='<s:property value="deviceDetail.cgd.coach1"/>'></td><td>C2</td><td><input id="2" class="coachId pdc<s:property value='deviceDetail.cgd.coach2PdcId'/>" type="text" name="cgd.coach2" value='<s:property value="deviceDetail.cgd.coach2"/>'></td><td>C3</td><td><input id="3" class="coachId pdc<s:property value='deviceDetail.cgd.coach3PdcId'/>" type="text" name="cgd.coach3" value='<s:property value="deviceDetail.cgd.coach3"/>'></td><td>C4</td><td><input id="4" class="coachId pdc<s:property value='deviceDetail.cgd.coach4PdcId'/>" type="text" name="cgd.coach4" value='<s:property value="deviceDetail.cgd.coach4"/>'></td><td>C5</td><td><input id="5" class="coachId pdc<s:property value='deviceDetail.cgd.coach5PdcId'/>" type="text" name="cgd.coach5" value='<s:property value="deviceDetail.cgd.coach5"/>'></td><td>C6</td><td><input id="6" class="coachId pdc<s:property value='deviceDetail.cgd.coach6PdcId'/>" type="text" name="cgd.coach6" value='<s:property value="deviceDetail.cgd.coach6"/>'></td><td>C7</td><td><input id="7" class="coachId pdc<s:property value='deviceDetail.cgd.coach7PdcId'/>" type="text" name="cgd.coach7" value='<s:property value="deviceDetail.cgd.coach7"/>'></td><td>C8</td><td><input id="8" class="coachId pdc<s:property value='deviceDetail.cgd.coach8PdcId'/>" type="text" name="cgd.coach8" value='<s:property value="deviceDetail.cgd.coach8"/>'></td></tr>
<tr><td>C9</td><td><input id="9" class="coachId pdc<s:property value='deviceDetail.cgd.coach9PdcId'/>" type="text" name="cgd.coach9" value='<s:property value="deviceDetail.cgd.coach9"/>'></td><td>C10</td><td><input id="10" class="coachId pdc<s:property value='deviceDetail.cgd.coach10PdcId'/>" type="text" name="cgd.coach10" value='<s:property value="deviceDetail.cgd.coach10"/>'></td><td>C11</td><td><input id="11" class="coachId pdc<s:property value='deviceDetail.cgd.coach11PdcId'/>" type="text" name="cgd.coach11" value='<s:property value="deviceDetail.cgd.coach11"/>'></td><td>C12</td><td><input id="12" class="coachId pdc<s:property value='deviceDetail.cgd.coach12PdcId'/>" type="text" name="cgd.coach12" value='<s:property value="deviceDetail.cgd.coach12"/>'></td><td>C13</td><td><input id="13" class="coachId pdc<s:property value='deviceDetail.cgd.coach13PdcId'/>" type="text" name="cgd.coach13" value='<s:property value="deviceDetail.cgd.coach13"/>'></td><td>C14</td><td><input id="14" class="coachId pdc<s:property value='deviceDetail.cgd.coach14PdcId'/>" type="text" name="cgd.coach14" value='<s:property value="deviceDetail.cgd.coach14"/>'></td><td>C15</td><td><input id="15" class="coachId pdc<s:property value='deviceDetail.cgd.coach15PdcId'/>" type="text" name="cgd.coach15" value='<s:property value="deviceDetail.cgd.coach15"/>'></td><td>C16</td><td><input id="16" class="coachId pdc<s:property value='deviceDetail.cgd.coach16PdcId'/>" type="text" name="cgd.coach16" value='<s:property value="deviceDetail.cgd.coach16"/>'></td></tr>
<tr><td>C17</td><td><input id="17" class="coachId pdc<s:property value='deviceDetail.cgd.coach17PdcId'/>" type="text" name="cgd.coach17" value='<s:property value="deviceDetail.cgd.coach17"/>'></td><td>C18</td><td><input id="18" class="coachId pdc<s:property value='deviceDetail.cgd.coach18PdcId'/>" type="text" name="cgd.coach18" value='<s:property value="deviceDetail.cgd.coach18"/>'></td><td>C19</td><td><input id="19" class="coachId pdc<s:property value='deviceDetail.cgd.coach19PdcId'/>" type="text" name="cgd.coach19" value='<s:property value="deviceDetail.cgd.coach19"/>'></td><td>C20</td><td><input id="20" class="coachId pdc<s:property value='deviceDetail.cgd.coach20PdcId'/>" type="text" name="cgd.coach20" value='<s:property value="deviceDetail.cgd.coach20"/>'></td><td>C21</td><td><input id="21" class="coachId pdc<s:property value='deviceDetail.cgd.coach21PdcId'/>" type="text" name="cgd.coach21" value='<s:property value="deviceDetail.cgd.coach21"/>'></td><td>C22</td><td><input id="22" class="coachId pdc<s:property value='deviceDetail.cgd.coach22PdcId'/>" type="text" name="cgd.coach22" value='<s:property value="deviceDetail.cgd.coach22"/>'></td><td>C23</td><td><input id="23" class="coachId pdc<s:property value='deviceDetail.cgd.coach23PdcId'/>" type="text" name="cgd.coach23" value='<s:property value="deviceDetail.cgd.coach23"/>'></td><td>C24</td><td><input id="24" class="coachId pdc<s:property value='deviceDetail.cgd.coach24PdcId'/>" type="text" name="cgd.coach24" value='<s:property value="deviceDetail.cgd.coach24"/>'></td></tr>
<tr><td>C25</td><td><input id="25" class="coachId pdc<s:property value='deviceDetail.cgd.coach25PdcId'/>" type="text" name="cgd.coach25" value='<s:property value="deviceDetail.cgd.coach25"/>'></td><td>C26</td><td><input id="26" class="coachId pdc<s:property value='deviceDetail.cgd.coach26PdcId'/>" type="text" name="cgd.coach26" value='<s:property value="deviceDetail.cgd.coach26"/>'></td><td>C27</td><td><input id="27" class="coachId pdc<s:property value='deviceDetail.cgd.coach27PdcId'/>" type="text" name="cgd.coach27" value='<s:property value="deviceDetail.cgd.coach27"/>'></td><td>C28</td><td><input id="28" class="coachId pdc<s:property value='deviceDetail.cgd.coach28PdcId'/>" type="text" name="cgd.coach28" value='<s:property value="deviceDetail.cgd.coach28"/>'></td><td>C29</td><td><input id="29" class="coachId pdc<s:property value='deviceDetail.cgd.coach29PdcId'/>" type="text" name="cgd.coach29" value='<s:property value="deviceDetail.cgd.coach29"/>'></td><td>C30</td><td><input id="30" class="coachId pdc<s:property value='deviceDetail.cgd.coach30PdcId'/>" type="text" name="cgd.coach30" value='<s:property value="deviceDetail.cgd.coach30"/>'></td></tr>
</table>
<label>End 2 </label><input type="text" id="end2" style="height: 25px; width:100px; font-size: 16px" name="cgd.end2" value='<s:property value="deviceDetail.cgd.end2"/>'>
<br>

</fieldset>
<br>

<center>
<label>Connection Mode</label>
<select name="cgd.connectionMode" id="cgd_con_mode" style="height: 30px; font-size: 16px">
<option value="1">Serial(RS-485)</option>
<option value="2">Zigbee</option>
</select>
<script>
var mode=<s:property value="deviceDetail.cgd.connectionMode"/>;
$('#cgd_con_mode').val(mode);
</script>

<label>Display effect </label>
<select name="cgd.displayEffect" id="cgd_display_effect" style="height: 30px; font-size: 16px">
<option value="0">Reserved</option>
<option value="1">Curtain Left to Right</option>
<option value="2">Curtain Top to Bottom</option>
<option value="3">Curtain Bottom to Top</option>
<option value="4">Typing Left to Right</option>
<option value="5">Running Right to Left</option>
<option value="6">Running Top to Bottom</option>
<option value="7">Running Bottom to Top</option>
<option value="8">Flashing</option>
</select>
<script>
var displayEffect=<s:property value="deviceDetail.cgd.displayEffect"/>;
if(displayEffect!=0)
$("#cgd_display_effect").val(displayEffect);
</script>

<label>Effect Speed</label>
<select name="cgd.effectSpeed" id="cgd_effect_speed" style="height: 30px; font-size: 16px">
<option value="4" style="display: none;">Medium</option>
<option value="6">Lowest</option>
<option value="5">Low</option>
<option value="4">Medium</option>
<option value="3">High</option>
<option value="2">Highest</option>
</select>
<script>
var effectSpeed=<s:property value="deviceDetail.cgd.effectSpeed"/>;
if(effectSpeed!=0)
$("#cgd_effect_speed").val(effectSpeed);
</script>
</center>
<br>
<label style="margin-left:100px;">Display Mode</label>
<select id="videoType" name="cgd.videoType" style="height: 30px; font-size: 16px;">
<option value="normal">Normal</option>
<option value="reverse">Reverse</option>
</select>
<script>
var videoType='<s:property value="deviceDetail.cgd.videoType"/>';
if(videoType=="reverse")
$("#videoType").val(videoType);
</script>



<br>
<br>
<div  class="leftside">
<fieldset id="infoDelay">
<legend>Information delay</legend>
<table>
<tr><th>Information</th><th>Delay Time <br>( In Sec )</th></tr>
<tr><td><input type="checkbox" style="width: 20px; height: 20px" name="cgd.trainNo" id="trainNo" checked disabled><label>Train No</label></td>
<td>
<select name="cgd.trainNoDelay">
<option value="<s:if test='%{deviceDetail.cgd.trainNoDelay!=0}'><s:property value="deviceDetail.cgd.trainNoDelay"/></s:if><s:else>10</s:else>" selected style="display:none;"><s:if test='%{deviceDetail.cgd.trainNoDelay!=0}'><s:property value="deviceDetail.cgd.trainNoDelay"/></s:if><s:else>10</s:else></option>
<script>
for(var i=5;i<=60;i++){
document.writeln('<option value="'+i+'">'+i+'</option>');
}
</script>
</select></td></tr>

<tr><td><input type="checkbox" style="width: 20px; height: 20px"  name="cgd.coachEnglish" id="coachEnglish" checked disabled><label>Coach English</label></td>
<td>
<select name="cgd.coachEnglishDelay">
<option value="<s:if test='%{deviceDetail.cgd.coachEnglishDelay!=0}'><s:property value="deviceDetail.cgd.coachEnglishDelay"/></s:if><s:else>10</s:else>" selected style="display:none;"><s:if test='%{deviceDetail.cgd.coachEnglishDelay!=0}'><s:property value="deviceDetail.cgd.coachEnglishDelay"/></s:if><s:else>10</s:else></option>
<script>
for(var i=5;i<=60;i++){
document.writeln('<option value="'+i+'">'+i+'</option>');
}
</script>
</select></td></tr>

<tr><td><input type="checkbox" style="width: 20px; height: 20px" name="cgd.coachHindi" id="coachHindi" value="true" <s:if test="%{deviceDetail.cgd.coachHindi==true}">checked</s:if> ><label>Coach Hindi</label></td>
<td>
<select name="cgd.coachHindiDelay">
<option value="<s:if test='%{deviceDetail.cgd.coachHindiDelay!=0}'><s:property value="deviceDetail.cgd.coachHindiDelay"/></s:if><s:else>10</s:else>" selected style="display:none;"><s:if test='%{deviceDetail.cgd.coachHindiDelay!=0}'><s:property value="deviceDetail.cgd.coachHindiDelay"/></s:if><s:else>10</s:else></option>
<script>
for(var i=5;i<=60;i++){
document.writeln('<option value="'+i+'">'+i+'</option>');
}
</script>
</select></td></tr>

<tr><td><input type="checkbox" style="width: 20px; height: 20px" name="cgd.pfNo" id="pfNo" value="true" <s:if test="%{deviceDetail.cgd.pfNo==true}">checked</s:if>  ><label>PF No</label></td>
<td>
<select name="cgd.pfNoDelay">
<option value="<s:if test='%{deviceDetail.cgd.pfNoDelay!=0}'><s:property value="deviceDetail.cgd.pfNoDelay"/></s:if><s:else>10</s:else>" selected style="display:none;"><s:if test='%{deviceDetail.cgd.pfNoDelay!=0}'><s:property value="deviceDetail.cgd.pfNoDelay"/></s:if><s:else>10</s:else></option>
<script>
for(var i=5;i<=60;i++){
document.writeln('<option value="'+i+'">'+i+'</option>');
}
</script>
</select></td></tr>
</table>
</fieldset></div>

<div class="rightside">
<fieldset id="dataInfo" >
<legend>Default Information</legend>
<table>
<tr><th></th><th>Information</th><th>Delay Time <br>( In Sec )</th></tr>
<tr><td><input type="checkbox" style="width: 20px; height: 20px"  name="cgd.default1"  id="default1" checked disabled></td>
<td><input type="text" name="cgd.defaultInfo1" id="defaultInfo1" value="<s:if test='%{deviceDetail.cgd.defaultInfo1!=""}'><s:property value='deviceDetail.cgd.defaultInfo1'/></s:if><s:else>PF No</s:else>" readonly></td>
<td>
<select name="cgd.defaultInfoDelay1">
<option value="<s:if test='%{deviceDetail.cgd.defaultInfoDelay1!=0}'><s:property value="deviceDetail.cgd.defaultInfoDelay1"/></s:if><s:else>10</s:else>" selected style="display:none;"><s:if test='%{deviceDetail.cgd.defaultInfoDelay1!=0}'><s:property value="deviceDetail.cgd.defaultInfoDelay1"/></s:if><s:else>10</s:else></option>
<script>
for(var i=5;i<=60;i++){
document.writeln('<option value="'+i+'">'+i+'</option>');
}
</script>
</select></td></tr>

<tr><td><input type="checkbox" style="width: 20px; height: 20px"  name="cgd.default2" id="default2" checked disabled></td>
<td><input type="text" name="cgd.defaultInfo2" id="defaultInfo2" value="<s:property value='station.stationCode'/>" readonly></td>
<td>
<select name="cgd.defaultInfoDelay2">
<option value="<s:if test='%{deviceDetail.cgd.defaultInfoDelay2!=0}'><s:property value="deviceDetail.cgd.defaultInfoDelay2"/></s:if><s:else>10</s:else>" selected style="display:none;"><s:if test='%{deviceDetail.cgd.defaultInfoDelay2!=0}'><s:property value="deviceDetail.cgd.defaultInfoDelay2"/></s:if><s:else>10</s:else></option>
<script>
for(var i=5;i<=60;i++){
document.writeln('<option value="'+i+'">'+i+'</option>');
}
</script>
</select></td></tr>

<tr><td><input type="checkbox" style="width: 20px; height: 20px" name="cgd.default3" value="true" <s:if test="%{deviceDetail.cgd.default3==true}">checked</s:if> ></td>
<td><input type="text" name="cgd.defaultInfo3" class="defaultInfo" id="defaultInfo3" value="<s:if test='%{deviceDetail.cgd.defaultInfo3!=""}'><s:property value='deviceDetail.cgd.defaultInfo3'/></s:if>" ></td>
<td>
<select name="cgd.defaultInfoDelay3">
<option value="<s:if test='%{deviceDetail.cgd.defaultInfoDelay3!=0}'><s:property value="deviceDetail.cgd.defaultInfoDelay3"/></s:if><s:else>10</s:else>" selected style="display:none;"><s:if test='%{deviceDetail.cgd.defaultInfoDelay3!=0}'><s:property value="deviceDetail.cgd.defaultInfoDelay3"/></s:if><s:else>10</s:else></option>
<script>
for(var i=5;i<=60;i++){
document.writeln('<option value="'+i+'">'+i+'</option>');
}
</script>
</select></td></tr>

<tr><td><input type="checkbox" style="width: 20px; height: 20px" name="cgd.default4" value="true" <s:if test="%{deviceDetail.cgd.default4==true}">checked</s:if> ></td>
<td><input type="text" name="cgd.defaultInfo4" class="defaultInfo" id="defaultInfo4" value="<s:if test='%{deviceDetail.cgd.defaultInfo4!=""}'><s:property value='deviceDetail.cgd.defaultInfo4'/></s:if>" ></td>
<td>
<select name="cgd.defaultInfoDelay4">
<option value="<s:if test='%{deviceDetail.cgd.defaultInfoDelay4!=0}'><s:property value="deviceDetail.cgd.defaultInfoDelay4"/></s:if><s:else>10</s:else>" selected style="display:none;"><s:if test='%{deviceDetail.cgd.defaultInfoDelay4!=0}'><s:property value="deviceDetail.cgd.defaultInfoDelay4"/></s:if><s:else>10</s:else></option>
<script>
for(var i=5;i<=60;i++){
document.writeln('<option value="'+i+'">'+i+'</option>');
}
</script>
</select></td></tr>
</table>
</fieldset></div>

<br><br>
<div id="buttons" style="text-align: center">
 <button class="btn orange" id="saveCGDBDetail">Save</button> 
 <a href="#" class="btn purple" id="editCGDBDetail">Edit</a>
<!--  <a href="#" class="btn orange" id="clearCGDBDetail">Clear</a>  -->
 <a href="#" class="btn purple" id="cancelCGDBDetail">Cancel</a>          
 </div>

</form>

</div>


</div>
<div id="footer"><p>&copy; 2016 Dan Electronic System Pvt. Ltd.<p></div>
<script type="text/javascript" src="../js/time.js"></script>  

<script  type="text/javascript">
	var effect=$("#pfd_display_effect").val();
	if(effect==0)
		{
		$("#pfd_effect_speed").empty();
			$("#pfd_effect_speed").append("<option value='5' style='display: none;'>Medium</option>"+
			"<option value='1'>Lowest</option>"+
			"<option value='3'>Low</option>"+
			"<option value='5'>Medium</option>"+
			"<option value='8'>High</option>"+
			"<option value='11'>Highest</option>");
		}
	else if(effect==10)
		{
		$("#pfd_effect_speed").empty();
			$("#pfd_effect_speed").append("<option value='11' style='display: none;'>Medium</option>"+
			"<option value='2'>Lowest</option>"+
			"<option value='3'>Low</option>"+
			"<option value='11'>Medium</option>"+
			"<option value='16'>High</option>"+
			"<option value='21'>Highest</option>");
		}
	else if(effect==6)
	{
	$("#pfd_effect_speed").empty();
		$("#pfd_effect_speed").append("<option value='50' style='display: none;'>Medium</option>"+
		"<option value='70'>Lowest</option>"+
		"<option value='60'>Low</option>"+
		"<option value='50'>Medium</option>"+
		"<option value='35'>High</option>"+
		"<option value='25'>Highest</option>");
	}
	else if(effect==20)
	{
	$("#pfd_effect_speed").empty();
	$("#pfd_effect_speed").append("<option value='30' style='display: none;'>Medium</option>"+
			"<option value='40'>Lowest</option>"+
			"<option value='35'>Low</option>"+
			"<option value='30'>Medium</option>"+
			"<option value='25'>High</option>"+
			"<option value='21'>Highest</option>");
	}
	else if(effect==22 || effect==27 || effect==21)
	{
	$("#pfd_effect_speed").empty();
	$("#pfd_effect_speed").append("<option value='40' style='display: none;'>Medium</option>"+
			"<option value='60'>Lowest</option>"+
			"<option value='50'>Low</option>"+
			"<option value='40'>Medium</option>"+
			"<option value='30'>High</option>"+
			"<option value='27'>Highest</option>");
	}
	else if(effect==9 || effect==8)
	{
	$("#pfd_effect_speed").empty();
	$("#pfd_effect_speed").append("<option value='200' style='display: none;'>Medium</option>"+
			"<option value='255'>Lowest</option>"+
			"<option value='210'>Low</option>"+
			"<option value='200'>Medium</option>"+
			"<option value='160'>High</option>"+
			"<option value='120'>Highest</option>");
	}
	var effectSpeed='<s:property value="deviceDetail.pfd.effectSpeed"/>';
	if(effectSpeed!='0')
	$("#pfd_effect_speed").val(effectSpeed);

	var effect=$("#multiline_display_effect").val();
	if(effect==0)
		{
		$("#multiline_effect_speed").empty();
			$("#multiline_effect_speed").append("<option value='5' style='display: none;'>Medium</option>"+
			"<option value='1'>Lowest</option>"+
			"<option value='3'>Low</option>"+
			"<option value='5'>Medium</option>"+
			"<option value='8'>High</option>"+
			"<option value='11'>Highest</option>");
		}
	else if(effect==10)
		{
		$("#multiline_effect_speed").empty();
			$("#multiline_effect_speed").append("<option value='11' style='display: none;'>Medium</option>"+
			"<option value='2'>Lowest</option>"+
			"<option value='3'>Low</option>"+
			"<option value='11'>Medium</option>"+
			"<option value='16'>High</option>"+
			"<option value='21'>Highest</option>");
		}
	else if(effect==6)
	{
	$("#multiline_effect_speed").empty();
		$("#multiline_effect_speed").append("<option value='9' style='display: none;'>Medium</option>"+
		"<option value='13'>Lowest</option>"+
		"<option value='11'>Low</option>"+
		"<option value='9'>Medium</option>"+
		"<option value='5'>High</option>"+
		"<option value='2'>Highest</option>");
	}
	else if(effect==20)
	{
	$("#multiline_effect_speed").empty();
		$("#multiline_effect_speed").append("<option value='9' style='display: none;'>Medium</option>"+
		"<option value='19'>Lowest</option>"+
		"<option value='11'>Low</option>"+
		"<option value='9'>Medium</option>"+
		"<option value='5'>High</option>"+
		"<option value='2'>Highest</option>");
	}
	else if(effect==22 || effect==27 || effect==21)
	{
	$("#multiline_effect_speed").empty();
		$("#multiline_effect_speed").append("<option value='17' style='display: none;'>Medium</option>"+
		"<option value='26'>Lowest</option>"+
		"<option value='22'>Low</option>"+
		"<option value='17'>Medium</option>"+
		"<option value='12'>High</option>"+
		"<option value='6'>Highest</option>");
	}
	else if(effect==9 || effect==8)
	{
	$("#multiline_effect_speed").empty();
		$("#multiline_effect_speed").append("<option value='27' style='display: none;'>Medium</option>"+
		"<option value='32'>Lowest</option>"+
		"<option value='30'>Low</option>"+
		"<option value='27'>Medium</option>"+
		"<option value='24'>High</option>"+
		"<option value='23'>Highest</option>");
	}
 	
	  var effectSpeedMultiLine='<s:property value="deviceDetail.multiline.effectSpeed"/>';
		 if(effectSpeedMultiLine!='0')
		 $("#multiline_effect_speed").val(effectSpeedMultiLine);   
</script>
</body>
</html>