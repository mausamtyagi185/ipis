<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="/struts-dojo-tags" prefix="sx"%>
<!DOCTYPE html>
<html>
<head>
<link href="../css/home.css" rel="stylesheet">
<link rel="stylesheet" href="../css/style.css">
<link href="../Select2/select2.min.css" type="text/css" rel="stylesheet">
<link rel="stylesheet" href="../sweetalert-master/dist/sweetalert.css">
<script type="text/javascript" src="../js/jquery-2.1.4.js"></script>
<script type="text/javascript" src="../js/blockUI.js"></script>
<script src="../sweetalert-master/dist/sweetalert-dev.js"></script>
<script src="../js/home.js" type="text/javascript"></script>
<script type="text/javascript">
   		$( document ).ready(function() {
	   		// Train Data
	   		var flag='<s:property value="flag"/>';
		  	var status='<s:property value="status"/>';
		  	var stationname='<s:property value="stationnames"/>';
		  	console.log(stationname);
		  	sessionStorage.removeItem("stationname");
		  	sessionStorage.setItem("stationname", stationname);
		  	$("#stnm").text(stationname);
		  	if(flag!=0) {
			  	if(status=="true") {
				  	swal("Data sent Sucessfully");
				} else {
			  		//window.location.href="../device/deviceStatus";
			  	}
			}
		  	// Coach Data
		  	var coachFlag='<s:property value="coachFlag"/>';
		  	var coachStatus='<s:property value="coachStatus"/>';
		  	var co='<s:property value="coachTrain"/>';
		  	if(co!=0) {
			  	$("#trainNo_"+co).css("display","block");
			}
		  	if(coachFlag!=0) {
			  	if(coachStatus==0) {		 
				  	swal("Data sent Sucessfully");
				} else {
			  		/* window.location.href="../device/deviceStatus"; */
			}
		}
	   	$.getJSON("updateCheckedTrainAncValue", function(data) {
			if(data.result=="success") console.log("Checked Train Anc Value Updated Successfully");
     	});
	   	loadReadyFunc();
   	});
   	function loadReadyFunc() {
	   	var coachTrainNo="";
	   	//--------------------------------Validate Train No while Adding to Grid-------------------------------------------------
		$("#addTrain").click(function(e) { 
			e.preventDefault();
			var flag=0;
			var insertedTrainNo=document.getElementsByName("trainNo")[0].value;				  
			var nos=document.getElementsByClassName("trainNo");
			for(var i=0;i<nos.length;i++) {
				var trainNo=$("#"+nos[i].id).text();
				if(insertedTrainNo==trainNo) {			   			
					swal("Train Already inserted");
				   	flag=1;				   			
				   	break;
				}
			}
			if(flag==1) {
			   	$("#addTrainForm span input[type='text']").val("");
			} else if(insertedTrainNo=="") {
				swal("Please Enter 5 Digit Train No Only");
       		  	$("#addTrainForm span input[type='text']").val("");
       		  	$("#addTrainForm span input[type='text']").focus();
       	   	} else if(flag==0) {
       		  	$.getJSON("checkValidRunningTrain?trainNo="+$("#addTrainForm span input[type='text']").val(),function(data) {
       			    if(data.result=="success") {
       					$("#addTrainForm").attr("action","addRunningTrain").submit(); 
       			   	} else {
       				   	swal("Entered Train No is not Available Today");
       				   	$("#addTrainForm span input[type='text']").val("");
       	        	   	$("#addTrainForm span input[type='text']").focus();
       			   	}
       			});      		
       		}
		});
	    //---------------------------------show diverted station if status is diverted or terminated-------------//
        $( ".trainRunningStatus" ).each(function( index ) { 
        	  var str=this.id;
	    	  var id=str.split('_');
			  if( $( this ).val()=="Diverted" || $( this ).val()=="Terminated") {
				  $("#divertedStation_"+id[1] ).css("display","block");
			  }
		});
	    //-------------Keep late hour editable if status would be Running late Or Rescheduled-------------
	    $( ".trainRunningStatus" ).each(function( index ) { 
			var str=this.id;
	    	var id=str.split('_');
			if( $( this ).val()=="Running Late" || $( this ).val()=="Rescheduled") {
				$("#lateHour_"+id[1] ).removeAttr("readonly");
			}
			//-----------------------------------------------------------------------------
			if( $("#defaultPlatform_"+id[1] ).val()=="" && $( this ).val()!="Cancelled" && $( this ).val()!="Indefinite Late" && $( this ).val()!="Terminated" && $( this ).val()!="Diverted") {
				$("#defaultPlatform_"+id[1] ).empty();
	    		$("#defaultPlatform_"+id[1] ).append("<option value=''>NIL</option>");
    			var count=<s:property value="station.numberOfPlateform"/>;
                for(var i=1;i<=count;i++){		                	
                	$("#defaultPlatform_"+id[1] ).append('<option value="'+i+'">'+i+'</option>');
                } 
			} 
		});
		//========================clear textbox value if trainRunningStatus is Running Late OR Rescheduled=================
	    $(".lateHour").focus(function(e){
  		   	var str=this.id;
		    var id=str.split('_');
		    if($("#trainRunningStatus_"+id[1] ).val()=="Running Late" || $("#trainRunningStatus_"+id[1] ).val()=="Rescheduled") {
		       	$("#lateHour_"+id[1] ).val("");
				$("#lateHour_"+id[1] ).keyup(function(e) {
	            	var str=this.value;
	            	var pos = $("#lateHour_"+id[1] ).getCursorPosition();
	            	str=str.substr(0,pos);
	            	if(pos==2) {
	            		$("#lateHour_"+id[1] ).val(str+":");
	                	setCaretToPos($("#lateHour_"+id[1] )[0], pos+1);
	            	} else {
	            		$("#lateHour_"+id[1] ).val(str);
	    	        	setCaretToPos($("#lateHour_"+id[1] )[0], pos);
	            	}
	        	});
		    }
        });
	    //-----------------------------Change status list according to arrival Or Departure-----------------------------
		$( ".trainCategory" ).change(function() {
	    	var id=this.id; 
	    	$(this).parent().parent().css({"background": "#FFBABA"});
	    	$("#divertedStation_"+id ).css("display","none");
	    	$("#trainDisplay_"+id).removeAttr("checked");
	    	$("#coachDisplay_"+id).removeAttr("checked");
	    	$("#announcement_"+id).removeAttr("checked");
	    	$("#lateHour_"+id ).val("00:00");
	    	$("#lateHour_"+id).removeClass('textBlink');
	    	$.getJSON("updateCheckedTrainAncValue?id="+id+"&value=false",function(data){
				if(data.result=="success") console.log("Unchecked Train Anc Value Updated Successfully");
	        });
	    	$( "#trainRunningStatus_"+id ).empty();
	    	if(this.value=="A") {
		    	$("#trainRunningStatus_"+id ).append(
	    			'<option value="Running Right Time">Running Right Time</option>'+
	    			'<option value="Will Arrive Shortly">Will Arrive Shortly</option>'+
	    			'<option value="Is Arriving On">Is Arriving On</option>'+
	    			'<option value="Has Arrived On">Has Arrived On</option>'+
	    			'<option value="Running Late">Running Late</option>'+
	    			'<option value="Cancelled">Cancelled</option>'+
	    			'<option value="Indefinite Late">Indefinite Late</option>'+
	    			'<option value="Terminated">Terminated</option>'+
	    			'<option value="Platform Changed">Platform Changed</option>'
		    	);	    	
	    	} else if(this.value=="D") {
	    		$("#trainRunningStatus_"+id ).append(
    				'<option value="Running Right Time">Running Right Time</option>'+
	    			'<option value="Cancelled">Cancelled</option>'+
	    			'<option value="Is Ready To Leave">Is Ready To Leave</option>'+
	    			'<option value="Is On Platform">Is On Platform</option>'+
	    			'<option value="Has Left">Has Left</option>'+
	    			'<option value="Rescheduled">Rescheduled</option>'+
	    			'<option value="Diverted">Diverted</option>'+
	    			'<option value="Scheduled Departure">Scheduled Departure</option>'+
	    			'<option value="Platform Changed">Platform Changed</option>'
		    	);
	    	}
	    	if($("#lateHour_"+id ).val()=="00:00") {
	    		$("#expectedArrival_"+id).text($("#scheduleArrival_"+id ).text());
	   	    	$("#expectedDeparture_"+id).text($("#scheduleDeparture_"+id ).text());
	   	    	$("#expectedArrival1_"+id).val($("#scheduleArrival_"+id ).text());
	   	    	$("#expectedDeparture1_"+id).val($("#scheduleDeparture_"+id ).text());
   			}
	    	if($("#defaultPlatform_"+id ).val()==0) {
	    		$("#defaultPlatform_"+id ).empty();
	    		$("#defaultPlatform_"+id ).append("<option value=''>NIL</option>");
   				var count=<s:property value="station.numberOfPlateform"/>;
   				var platformNos='<s:property value="station.platformNos"/>'.split(",");
               	for(var i=1;i<=count;i++) {
               		$("#defaultPlatform_"+id ).append('<option value="'+platformNos[i-1]+'">'+platformNos[i-1]+'</option>');
               	}
   			}
	    	//console.log($( "#runningTrainInfoForm" ).serializeArray());
	    	$.post("updateTrain?id="+id,$( "#runningTrainInfoForm" ).serialize(),function(data) {
	    		console.log(data); 
	    	});
	    	//$("#pfd_button").addClass("pfd_button");
		});
	    //=======================Change grid value according to their status===================
	    $( ".trainRunningStatus" ).change(function() {
	    	var str=this.id;
	    	var id=str.split('_');
	    	$(this).parent().parent().css({"background": "#FFBABA"});
			$("#trainDisplay_"+id[1]).removeAttr("checked");
	    	$("#coachDisplay_"+id[1]).removeAttr("checked");
	    	$("#announcement_"+id[1]).removeAttr("checked");
	    	$.getJSON("updateCheckedTrainAncValue?id="+id[1]+"&value=false",function(data){
				if(data.result=="success") console.log("Unchecked Train Anc Value Updated Successfully");
	        });
	    	$(".lateHour" ).attr('readonly', 'readonly');
			$("#lateHour_"+id[1]).removeClass('textBlink');
	    	$( ".trainRunningStatus" ).each(function() {
	    		var str=this.id;
		    	var id=str.split('_');
		    	if(this.value=="Running Late" || this.value=="Rescheduled") {
					$("#lateHour_"+id[1] ).removeAttr('readonly');  
		    	}
   		 	});
	    	$("#divertedStation_"+id[1] ).css("display","none");
	    	var lh=$("#lateHour_"+id[1] ).val();
	    	var sa=$("#scheduleArrival_"+id[1] ).text();
	    	var sd=$("#scheduleDeparture_"+id[1] ).text();
	    	if(this.value=="Running Right Time" || this.value=="Scheduled Departure") {
				$("#lateHour_"+id[1] ).val("00:00");
			 	$("#expectedArrival_"+id[1] ).text(sa);
	    	 	$("#expectedDeparture_"+id[1] ).text(sd);
	    	 	$("#expectedArrival1_"+id[1] ).val(sa);
	    	 	$("#expectedDeparture1_"+id[1] ).val(sd);
	    	 	
	    	 	if($("#defaultPlatform_"+id[1] ).val()==0) {
	    			$("#defaultPlatform_"+id[1] ).empty();
			    	$("#defaultPlatform_"+id[1] ).append("<option value=''>NIL</option>");
   					var count=<s:property value="station.numberOfPlateform"/>;
   					var platformNos='<s:property value="station.platformNos"/>'.split(",");
               		for(var i=1;i<=count;i++) {
               			$("#defaultPlatform_"+id[1] ).append('<option value="'+platformNos[i-1]+'">'+platformNos[i-1]+'</option>');
               		}
   		 		}
			} else if(this.value=="Will Arrive Shortly" || this.value=="Is Arriving On" || this.value=="Has Arrived On" || this.value=="Is Ready To Leave" || this.value=="Is On Platform" || this.value=="Has Left") {
	    		if(lh=="00:00"){
	    			$("#expectedArrival_"+id[1] ).text(sa);
		   	    	$("#expectedDeparture_"+id[1] ).text(sd);
		   	    	$("#expectedArrival1_"+id[1] ).val(sa);
		   	    	$("#expectedDeparture1_"+id[1] ).val(sd);	
	    		}
	    		if($("#defaultPlatform_"+id[1] ).val()==0) {
	    			$("#defaultPlatform_"+id[1] ).empty();
			    	$("#defaultPlatform_"+id[1] ).append("<option value=''>NIL</option>");
	    			var count=<s:property value="station.numberOfPlateform"/>;
	    			var platformNos='<s:property value="station.platformNos"/>'.split(",");
                   	for(var i=1;i<=count;i++) {
                   		$("#defaultPlatform_"+id[1] ).append('<option value="'+platformNos[i-1]+'">'+platformNos[i-1]+'</option>');
                   	}
	    		}
	    		if($("#defaultPlatform_"+id[1] ).val()==0) {
	    			swal("Please select platform"); 
		    	}
	    	} else if(this.value=="Running Late" || this.value=="Rescheduled") {
	    		if(lh=="00:00") {
	    			$("#expectedArrival_"+id[1] ).text(sa);
		   	    	$("#expectedDeparture_"+id[1] ).text(sd);
		   	    	$("#expectedArrival1_"+id[1] ).val(sa);
		   	    	$("#expectedDeparture1_"+id[1] ).val(sd);	
	    		}
	    		$("#lateHour_"+id[1]).removeAttr('readonly');
				// blinking effect
	    		$("#lateHour_"+id[1]).addClass('textBlink');
	    		
				//===========@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@=================
	    		$("#lateHour_"+id[1] ).keyup(function(e) {
	            	var str=this.value;
	            	var pos = $("#lateHour_"+id[1] ).getCursorPosition();
	            	str=str.substr(0,pos);
	            	if(pos==2) {
	            		$("#lateHour_"+id[1] ).val(str+":");
	                	setCaretToPos($("#lateHour_"+id[1] )[0], pos+1);
	            	} else {
	            		$("#lateHour_"+id[1] ).val(str);
	    	        	setCaretToPos($("#lateHour_"+id[1] )[0], pos);
	            	}
	        	});
	    		//==============@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@================== 
	    		
	    		if($("#defaultPlatform_"+id[1] ).val()==0) {
	    			$("#defaultPlatform_"+id[1] ).empty();
			    	$("#defaultPlatform_"+id[1] ).append("<option value=''>NIL</option>");
	    			var count=<s:property value="station.numberOfPlateform"/>;
	    			var platformNos='<s:property value="station.platformNos"/>'.split(",");
                   for(var i=1;i<=count;i++){
                   	$("#defaultPlatform_"+id[1] ).append('<option value="'+platformNos[i-1]+'">'+platformNos[i-1]+'</option>');
                   }
	    		} 
	    	} else if(this.value=="Cancelled" || this.value=="Indefinite Late") {
				$("#lateHour_"+id[1] ).val("00:00");
				  
	 			$("#expectedArrival_"+id[1] ).text("00:00");
		    	$("#expectedDeparture_"+id[1] ).text("00:00");
		    	 
		    	$("#expectedArrival1_"+id[1] ).val("00:00");
		    	$("#expectedDeparture1_"+id[1] ).val("00:00");
		    	 
		    	$("#defaultPlatform_"+id[1] ).empty();
		    	 
		    	$("#defaultPlatform_"+id[1] ).append("<option value=''>NIL</option>");
		    	var count=<s:property value="station.numberOfPlateform"/>;
	    		var platformNos='<s:property value="station.platformNos"/>'.split(",");
                for(var i=1;i<=count;i++) {
                	$("#defaultPlatform_"+id[1] ).append('<option value="'+platformNos[i-1]+'">'+platformNos[i-1]+'</option>');
                }
	    	} else if(this.value=="Diverted" || this.value=="Terminated"){
	    		
				$("#lateHour_"+id[1] ).val("00:00"); 
	 			$("#expectedArrival_"+id[1] ).text("00:00");
		    	$("#expectedDeparture_"+id[1] ).text("00:00");
		    	 
		    	$("#expectedArrival1_"+id[1] ).val("00:00");
		    	$("#expectedDeparture1_"+id[1] ).val("00:00");
		    	 
		    	$("#defaultPlatform_"+id[1] ).empty();
		    	 
		    	$("#defaultPlatform_"+id[1] ).append("<option value=''>NIL</option>");
		    	var count=<s:property value="station.numberOfPlateform"/>;
	    		var platformNos='<s:property value="station.platformNos"/>'.split(",");
                for(var i=1;i<=count;i++) {
                	$("#defaultPlatform_"+id[1] ).append('<option value="'+platformNos[i-1]+'">'+platformNos[i-1]+'</option>');
                }
	    		$("#divertedStation_"+id[1] ).css("display","block");
	    		
	    		swal({
	    	   		title: "Select the Terminated / Diverted City",
	    	   		text:"<select class='dropDownSelectBox' id='stationCode'>"+	
	                	"<s:iterator value='divertedStationList'>"+
	                   	"<option value='<s:property value='stationCode'/>'><s:property value='stationNameEnglish'/></option>"+
	                  	"</s:iterator></select>",
	    	   		showCancelButton: true,
	    	   		closeOnConfirm: true,
	    	   		animation: "slide-from-top",
	    	   		html:true
	    	   	},
	    	   	function(inputValue){
					if(inputValue==true) {
						var stationCode=$("#stationCode").val();
			    	   	$("#divertedStation_"+id[1] ).val(stationCode);			    	   		
			    	   	$('#divertedStationName_'+id[1]).val($('#divertedStation_'+id[1]+' option:selected').text());
					}
	    	   	});
	    	} else if(this.value=="Platform Changed") {
	    		if(lh=="00:00"){
	    			$("#expectedArrival_"+id[1] ).text(sa);
		   	    	$("#expectedDeparture_"+id[1] ).text(sd);
		   	    	$("#expectedArrival1_"+id[1] ).val(sa);
		   	    	$("#expectedDeparture1_"+id[1] ).val(sd);	
	    		}
	    		$("#defaultPlatform_"+id[1] ).empty();
		    	$("#defaultPlatform_"+id[1] ).append("<option value=''>NIL</option>");
		    	if($("#defaultPlatform_"+id[1] ).val()==0){
	    			//$("#defaultPlatform_"+id[1] ).append("<option value=''></option>");
	    			var count=<s:property value="station.numberOfPlateform"/>;
	    			var platformNos='<s:property value="station.platformNos"/>'.split(",");
                   	for(var i=1;i<=count;i++) {
                   		$("#defaultPlatform_"+id[1] ).append('<option value="'+platformNos[i-1]+'">'+platformNos[i-1]+'</option>');
                   	}
	    		}
		    	swal("Please select platform"); 
	    	}
	    	$.post("updateTrain?id="+id[1],$( "#runningTrainInfoForm" ).serialize(),function(data){
	 	    	console.log(data); 
	 	    });
	    	//$("#pfd_button").addClass("pfd_button");//blink pfd button on data change
		});
	    //-----------------------------------------------------------------------------------------------------
	    $( ".lateHour" ).click(function() {
			var str=this.id;
	    	var id=str.split('_');
	    	if( ($("#lateHour_"+id[1]).is('[readonly]')) ) {
	    		swal("This field is not editable"); 
	    	} 
	    });
	    //====================================================================================================
	    $( ".lateHour" ).blur(function() {
	    	var str=this.id;
	    	var id=str.split('_');
	    	if($("#lateHour_"+id[1]).val()==""){
	    		$("#lateHour_"+id[1]).val("00:00");
	    	}
	    	if ( !($("#lateHour_"+id[1]).is('[readonly]')) ){
	    		$(this).parent().parent().css({"background": "#FFBABA"});
	    		//--------------------------------validate time format-----------------------------------------
	    		// regular expression to match required time format
			   	var error=null;
			   	re = /^(\d{1,2}):(\d{2})([ap]m)?$/;
			
		   	    if($("#lateHour_"+id[1]).val() != '') {
		   	      if(regs = $("#lateHour_"+id[1]).val().match(re)) {
		   	        if(regs[3]) {
		   	          // 12-hour value between 1 and 12
		   	          if((regs[1] < 1) || (regs[1] > 12)) {
		   	        	swal("Invalid value for hours: " + regs[1]);
		   	            error="Invalid value for hours: " + regs[1];
		   	            $("#lateHour_"+id[1]).attr('value','00:00');
		   	            $("#lateHour_"+id[1]).focus();
		   	          }
		   	        } else {
		   	          // 24-hour value between 0 and 23
		   	          if(regs[1] > 23) {
		   	        	swal("Invalid value for hours: " + regs[1]);
		   	            error="Invalid value for hours: " + regs[1];
		   	            $("#lateHour_"+id[1]).attr('value','00:00');
		   	            $("#lateHour_"+id[1]).focus();
		   	          }
		   	        }
		   	        // minute value between 0 and 59
		   	        if(regs[2] > 59) {
		   	          swal("Invalid value for minutes: " + regs[2]);
		   	          error="Invalid value for minutes: " + regs[2];
		   	          $("#lateHour_"+id[1]).attr('value','00:00');
		   	          $("#lateHour_"+id[1]).focus();
		   	        }
		   	      } else {
		   	    	swal("Invalid time format: " + $("#lateHour_"+id[1]).val());
		   	        error="Invalid time format: " + $("#lateHour_"+id[1]).val();
		   	        $("#lateHour_"+id[1]).attr('value','00:00');
	   	            $("#lateHour_"+id[1]).focus();
	   	            
		   	      }		   	      
		   	    }
			 //---------------------------------------------------------------------------------------------------//
	    	 if(error==null) {
		    	 var sa = $("#scheduleArrival_"+id[1] ).text();  
		    	 var sd = $("#scheduleDeparture_"+id[1] ).text();  
		    	 /*-------------------------------------------------*/
		    	 var sat=sa.split(":");
		    	 var sah=parseInt(sat[0]);
		    	 var sam=parseInt(sat[1]);//alert(sah+":"+sam);
		    	 
		    	 var sdt=sd.split(":");
		    	 var sdh=parseInt(sdt[0]);
		    	 var sdm=parseInt(sdt[1]);//alert(sdh+":"+sdm);
		    	 
		    	 var lh=this.value; 
		    	 var lht=lh.split(":");
		    	 var lhth=parseInt(lht[0]);
		    	 var lhtm=parseInt(lht[1]);//alert(lhth+":"+lhtm);
	    	 
		    	 /*-------------------------------------------------*/ 
		    	 var nsam=sam+lhtm;
		    	 var nsah=sah+lhth;//alert(nsah+":"+nsam);
		    	 
		    	 /*-------------------------------------------------*/ 
		    	 var newsam=0;
		    	 if(nsam>=60) {
		    	   newsam=nsam%60;
		    	 } else {
		    		newsam=nsam;
		    	 }                       
		    	 var temp1=parseInt(nsam/60);
		    	 var newsah=nsah+temp1;
		    	 if(newsah>=24) {
		    		 newsah=newsah%24;
		    	 }   
		    	 //alert(newsah+":"+newsam);
		    	 /*-------------------------------------------------*/ 
		    	 /*-------------------------------------------------*/ 
		    	 
		    	 var nsdm=sdm+lhtm;
		    	 var nsdh=sdh+lhth;//alert(nsdh+":"+nsdm)
		    	 
		    	 /*-------------------------------------------------*/ 
		    	 var newsdm=0;
		    	 if(nsdm>=60) {
		    	   newsdm=nsdm%60;
		    	 } else {
		    		 newsdm=nsdm;
		    	 }
		    	 var temp2=parseInt(nsdm/60);
		    	 var newsdh=nsdh+temp2;
		    	 if(newsdh>=24) {
		    		 var edHour=newsdh%24;
		    		 if((edHour+'').length==1)edHour='0'+edHour;
		    		 var edMinute=newsdm;
		    		 if((edMinute+'').length==1)edMinute='0'+edMinute;
		    		 var lateTime=edHour+":"+edMinute+":00";//alert(lateTime);
		    		 /*===============update Late date if Expected Arrival is more than 24hr due to late OR 
		  		     Expected Departure is more than 24hr due to Running Late Or Rescheduled============================*/
		  		     $.getJSON("updateLateDate?noOfDay="+parseInt(newsdh/24)+"&lateTime="+lateTime+"&trainNo="+parseInt($("#trainNo_"+id[1]).text()),function(data) {
		  				 if(data.result=="success")console.log( "Late Date updated" );	 
			         });
		  		     //===============================================================================================
		    		 newsdh=newsdh%24;
		    	 }
		    	 //alert(newsdh+":"+newsdm);
		    	 /*-------------------------------------------------*/
		    	 if((newsah+'').length==1)newsah='0'+newsah;
		    	 if((newsam+'').length==1)newsam='0'+newsam;
		    	 if((newsdh+'').length==1)newsdh='0'+newsdh;
		    	 if((newsdm+'').length==1)newsdm='0'+newsdm;
		    	 
		    	 $("#expectedArrival_"+id[1] ).text(newsah+":"+newsam);
		    	 $("#expectedDeparture_"+id[1] ).text(newsdh+":"+newsdm);
		    	 
		    	 $("#expectedArrival1_"+id[1] ).val(newsah+":"+newsam);
		    	 $("#expectedDeparture1_"+id[1] ).val(newsdh+":"+newsdm);
		    	//--------//=================================//-----------------------------
		    	var checkEAT=0;
	 		  
	 		  	var expectedArrival=$("#expectedArrival1_"+id[1]).val(); //alert(expectedArrival);
	 		  	var defaultPlatform=$("#defaultPlatform_"+id[1]).val(); //alert(defaultPlatform);
	 		 	
	 		    $( ".defaultPlatform" ).each(function( index ) { 
	 			  	if( $( this ).val()==defaultPlatform && $('#expectedArrival1_'+this.id.split('_')[1]).val()==expectedArrival) {
	 				 	checkEAT++; 
	 			  	}
	 			});
  		  
	 		  	if(checkEAT>1) {
	 			 	swal("Expected Arrival time and Platform No can not be same for Two train");
	 			 	$("#lateHour_"+id[1] ).val("00:00");
	 			 	$("#expectedArrival_"+id[1] ).text(sa);
		    	 	$("#expectedDeparture_"+id[1] ).text(sd);
		    	 	$("#expectedArrival1_"+id[1] ).val(sa);
		    	 	$("#expectedDeparture1_"+id[1] ).val(sd);
		     	}
	 		 	$.post("updateTrain?id="+id[1],$( "#runningTrainInfoForm" ).serialize(),function(data){
 	    			console.log(data); 
 	    	 	});
	 			//---------------------------------------------------------------------------------------------------//
	 	   	} //end read only
  		  	//$("#pfd_button").addClass("pfd_button");//blink pfd button on data change 
  		}  //end of error check
	});
	//--------//=================================//-----------------------------
	 $( ".defaultPlatform" ).change(function() {
	    	 var str=this.id;
	    	 var id=str.split('_');
	    	 $(this).parent().parent().css({"background": "#FFBABA"});
	    	 
	    	 $("#trainDisplay_"+id[1]).removeAttr("checked");
	    	 $("#coachDisplay_"+id[1]).removeAttr("checked");
	    	 $("#announcement_"+id[1]).removeAttr("checked");
	    	 $.getJSON("updatePlatformNo?value=false&pno="+this.value+"&trainNo="+$("#trainNo_"+id[1]).text(),function(data){
	 				if(data=="success")
	 				console.log("Platform No Value Updated Successfully");
	 	         });
	    	 
	    	 var sa = $("#scheduleArrival_"+id[1] ).text();  
	    	 var sd = $("#scheduleDeparture_"+id[1] ).text();
	    	 
	    	 var checkEAT=0;
	 		  
	 		  var expectedArrival=$("#expectedArrival1_"+id[1]).val(); //alert(expectedArrival);
	 		  var defaultPlatform=$("#defaultPlatform_"+id[1]).val(); //alert(defaultPlatform);
	 		 
	 		    $( ".defaultPlatform" ).each(function( index ) { 
	 			  if( $( this ).val()==defaultPlatform && $('#expectedArrival1_'+this.id.split('_')[1]).val()==expectedArrival){
	 				 checkEAT++; 
	 			  }
	 			});
 		  
	 		  if(checkEAT>1){
	 			 
	 			 swal("Expected Arrival time and Platform No can not be same for Two train");
	 			  
	 			 $("#lateHour_"+id[1] ).val("00:00");
	 			  
	 			 $("#expectedArrival_"+id[1] ).text(sa);
		    	 $("#expectedDeparture_"+id[1] ).text(sd);
		    	 
		    	 $("#expectedArrival1_"+id[1] ).val(sa);
		    	 $("#expectedDeparture1_"+id[1] ).val(sd);
		    }
	 		 //$("#pfd_button").addClass("pfd_button");//blink pfd button on data change 
	     });
	     //====================================================================================================
	     $( ".trainDisplay" ).change(function() {
	    	 var str=this.id;
	    	 var id=str.split('_');
	    	 
	    	 $(this).parent().parent().css({"background": "#FFBABA"});
	    	 
	    	  if(document.getElementById('trainDisplay_'+id[1]).checked==false){
	    		   $("#coachDisplay_"+id[1]).removeAttr("checked");
	    		   $("#announcement_"+id[1]).removeAttr("checked");
	    		   $.getJSON("updateCheckedTrainAncValue?id="+id[1]+"&value=false",function(data){
		 				if(data.result=="success")
		 				console.log("Unchecked Train Anc Value Updated Successfully");
	 	           });
	    	  }
	    	  $.post("updateTrain?id="+id[1],$( "#runningTrainInfoForm" ).serialize(),function(data){
	 	    		console.log(data); 
	 	    	 });
	    	
	    	  $("#pfd_button").addClass("pfd_button");//blink pfd button on data change
		 });
	     
	     //====================================================================================================
	     
	     $( ".coachDisplay" ).change(function(e) {
	    	 e.preventDefault();
	    	 var str=this.id;
	    	 var id=str.split('_');
	    	 
	    	 $(this).parent().parent().css({"background": "#FFBABA"});
	    	 if(document.getElementById('coachDisplay_'+id[1]).checked==false){
	    		  $.post("updateTrain?id="+id[1],$( "#runningTrainInfoForm" ).serialize(),function(data){
		 	    		console.log(data); 
		 	    	 });
	    	 }
	    	 else if (document.getElementById('coachDisplay_'+id[1]).checked==true && document.getElementById('trainDisplay_'+id[1]).checked==false){
	    		   $("#coachDisplay_"+id[1]).removeAttr("checked");
	    		   swal("Please select Train Display First"); 
	    	  }else if(document.getElementById('coachDisplay_'+id[1]).checked==true && document.getElementById('trainDisplay_'+id[1]).checked==true){
	    		  
	    		 //--------//=================================//-----------------------------
	    		  var checkPlatform=0;
	    		  
	    		  var defaultPlatform=$("#defaultPlatform_"+id[1]).val();
	    		  
	    		    $( ".defaultPlatform" ).each(function( index ) { 
	    			  if( $( this ).val()==defaultPlatform && document.getElementById('coachDisplay_'+this.id.split('_')[1]).checked==true){
	    				  checkPlatform++; 
	    			  }
	    			});
	    		  
	    		  //--------//=================================//-----------------------------
	    		  if(checkPlatform>1){
	    			   $("#coachDisplay_"+id[1]).removeAttr("checked");
	    			   swal("Two CGDB Data can not be sent on same platform");  
	    		  }else{
	    		    var trainNo=$('#trainNo_'+id[1]).text();
		  	    	if($("#trainNo_"+trainNo).length==true){
		  	          //=================================================================
   			      	  var platformNo=$("#defaultPlatform_"+id[1]).val();//alert( platformNo);
		    		    	 $.getJSON("checkAvailableCGDBPlatform?platformNo="+platformNo,function(data){
		    		          if(data!="available"){
		    		        	  $("#coachDisplay_"+id[1]).removeAttr("checked");
		    		        	  swal("No CGDB is configured for selected platform"); 
		    		          }
		    		          else
		    		        	  {
		    		        	  $.post("updateTrain?id="+id[1],$( "#runningTrainInfoForm" ).serialize(),function(data){
		    			 	    		console.log(data); 
		    			 	    	 });
		    		        	  $("#pfd_button").addClass("pfd_button");//blink pfd button on data change
		    		        	  }
		    		         });
		    		    //=================================================================
		    		  }else{
		  	    		swal("Coach Detail not configured for this train!!!");
		  	    		$("#coachDisplay_"+id[1]).removeAttr("checked");
		  	    	}
		  	      } //end of else
	    		} //end of else if
	      });
	    //---------------------------------------View & Update Coach Position-------------------------------------------
	    
	    $( ".trainName" ).click(function(e) {
	    	 e.preventDefault();
	    	 var str=this.id;
	    	 var id=str.split('_');
   		    var trainNo=$('#trainNo_'+id[1]).text();
	  	    	 if($("#trainNo_"+trainNo).length==true){
	  	      		     if(coachTrainNo!="")
			    		    	 {
			    		    	    $("#trainNo_"+coachTrainNo).css("display","none");
			    		    	 }
			    		         coachTrainNo=trainNo;
			    		         
	  	    		$("#trainNo_"+trainNo).css("display","block");
	  	    		$("#coachTrain").val(trainNo);
	  	    	}else{
	  	    		if(coachTrainNo!="")
   		    	 {
   		    	    $("#trainNo_"+coachTrainNo).css("display","none");
   		    	 }
   		         coachTrainNo=trainNo;
   		         
		 		$("#trainNo_"+trainNo).css("display","block");
		 		$("#coachTrain").val(trainNo);
	  	    		//swal("Coach Detail not configured for this train!!!");
	  	    	}
	  	    	$("#smsg_"+trainNo).css("display","none");
				$("#emsg_"+trainNo).css("display","none");
	    	});
			
			  	    	//---------------------------------------------------------
			  	    	 $(".editCoach").click(function(e) {
			  	    		 e.preventDefault();
			  	    		 var str=this.id;
			  		    	 var id=str.split('_');
	  		   
			  	    	      	$.getJSON("getNoofCoachesCGDB?trainNo="+id[1],function(data){
			    		          if(data==0){
			    		        	  data=30;
			    		          }
			    		          noofcoaches=data;
		  	    	       	      for(var i=1;i<=data;i++){
		  	    	      		 
		  	    	       	         $("#C"+i+"_"+id[1]).removeAttr("disabled");
		  	    	       	         $("#C"+i+"_"+id[1]).next().removeAttr("disabled");
		  	    	       	      } 
			  	    		 });
			  	    	 });
			  	    	 $( ".hideCurrentCoach").click(function(e) {
			  	    		 e.preventDefault();
			  	    		 var str=this.id;
			  		    	 var id=str.split('_');
			  		    	 
			  		    	  $("#trainNo_"+id[1]).css("display","none");
		  	    	      	for(var i=1;i<=30;i++){
		  	    	      		 
	  	    	       	         $("#C"+i+"_"+id[1]).attr("disabled","disabled");
	  	    	       	         $("#C"+i+"_"+id[1]).next().attr("disabled","disabled");
	  	    	       	         
	  	    	              } 
			  	    	 });
			  	    	//---------------Reverse,Insert,Delete,Left Shift,Right Shift--------------------
			  	    	 $( ".updateCurrentCoach").click(function(e) {
			  	    		 e.preventDefault();
			  	    		 var str=this.id;
			  		    	 var id=str.split('_');
			  	    	    //$("#updateCurrentCoach_"+id[1]).unbind().click(function(e) {
			  	    	      //	  e.preventDefault();
			  	    	      	 
			  	    	      	if($("#C1_"+id[1]).prop("disabled")==false){
			  	    	      	 for(var i=1;i<=30;i++){
			  	    	      		 
		  	    	       	         $("#C"+i+"_"+id[1]).removeAttr("disabled");
		  	    	       	         $("#C"+i+"_"+id[1]).next().removeAttr("disabled");
		  	    	       	         
		  	    	              } 
			  	    	   		
				  	    	      	  var formInput=$('#updateCurrentCoachForm_'+id[1]).serialize();//alert(formInput);
				  				   
				  	    	      	for(var i=1;i<=30;i++){
				  	    	      		 
			  	    	       	         $("#C"+i+"_"+id[1]).attr("disabled","disabled");
			  	    	       	         $("#C"+i+"_"+id[1]).next().attr("disabled","disabled");
			  	    	       	         
			  	    	              }
				  	    	      	  $.getJSON('updateCurrentCoach', formInput,function(data) {
					  					   
					  					   if(data.result!=null && data.result=="success"){
					  						 $("#smsg_"+id[1]).text("Coach Position Updated Successfully");
					  						 $("#smsg_"+id[1]).css("display","inline-block");
					  						setTimeout(function() {
							  					$("#trainNo_"+id[1]).css("display","none");
							  			    }, 1200); 
					  					   }else if(data.result!=null && data.result=="fail"){
					  						 $("#emsg_"+id[1]).text("Unable to Update Coach Position");
					  						 $("#emsg_"+id[1]).css("display","inline-block"); 
					  					   }else{
					  						 $("#emsg_"+id[1]).text("Unable to Update Coach Position");
					  						 $("#emsg_"+id[1]).css("display","inline-block");
					  					   }
					  					 
					  				   });
			  	    	      	}
				  				 
			  	    		// });
			  	    	 });
			  	    	
	     $( ".announcement" ).change(function(e) {
	    	 e.preventDefault();
	    	 var str=this.id;
	    	 var id=str.split('_');
	    	 
	    	 $(this).parent().parent().css({"background": "#FFBABA"});
	    	 
	    	 if (document.getElementById('announcement_'+id[1]).checked==true && document.getElementById('trainDisplay_'+id[1]).checked==false){
   		     $("#announcement_"+id[1]).removeAttr("checked");
   		     swal("Please select Train Display First"); 
	    	 }else if(document.getElementById('announcement_'+id[1]).checked==true && document.getElementById('trainDisplay_'+id[1]).checked==true){
	    		 $.getJSON("updateCheckedTrainAncValue?id="+id[1]+"&value=true",function(data){
	 				if(data.result=="success")
	 				console.log("Checked Train Anc Value Updated Successfully");
	 	         });
	    		 $.post("updateTrain?id="+id[1],$( "#runningTrainInfoForm" ).serialize(),function(data){
		 	    		console.log(data); 
		 	    	 });
	    	 }else if(document.getElementById('announcement_'+id[1]).checked==false && document.getElementById('trainDisplay_'+id[1]).checked==true){
	    		 $.getJSON("updateCheckedTrainAncValue?id="+id[1]+"&value=false",function(data){
	 				if(data.result=="success")
	 				console.log("Unchecked Train Anc Value Updated Successfully");
	 				
	 	         });
	    		 $.post("updateTrain?id="+id[1],$( "#runningTrainInfoForm" ).serialize(),function(data){
		 	    		console.log(data); 
		 	    	 });
	    	 }
	     });
	     
       $( ".divertedStation" ).change(function(e) {
       	 
       	 var str=this.id;
	    	 var id=str.split('_');
       	 
	    	 $(this).parent().parent().css({"background": "#FFBABA"});
	    	 
	    	 $('#divertedStationName_'+id[1]).val($('#divertedStation_'+id[1]+' option:selected').text());
	    	 $.post("updateTrain?id="+id[1],$( "#runningTrainInfoForm" ).serialize(),function(data){
	 	    		console.log(data); 
	 	    	 });
      });
       var message='<s:property value="message"/>';
       if(message!=null && message.length!=0){
       /* 	swal(message); */
       }
       
       //-------------------------------------------Train Announcement---------------------------------------------------------- 
     
       $('#playAnnouncement').click(function(){
       	 $("#processing").css("display","inline-block");
       	var ancStatus=$("#ancStatus").val();
       	var noOfTrain=$(".announcement");
       	 
       	var count=0;
			if(ancStatus=="true")
				{				
				 swal(" Please Activate Announcement First");
				 $("#processing").css("display","none");
				}
			 else if(noOfTrain.length==0)
			 {
				 swal(" Please Add Train First");
				 $("#processing").css("display","none");
			 }
			else if(noOfTrain.length>0)
			{
				
				for(var i=0;i<noOfTrain.length;i++)
				{
				var status=$('#'+noOfTrain[i].id).is(':checked');
				if(status==true)
				{
					count=1;
				}
				}
			if(count==0)
				{
					swal("No Announcement is selected");
					$("#processing").css("display","none");
				}			
			else
				{
				var repeateCount=$("#repeateCount").val(); //alert(repeateCount);
	        	$.getJSON("announcementRequest?announcementCommand=play&repeateCount="+repeateCount,function(data){
	        		if(data.result!=null)
	        			{
						swal(data.result);	        		
	        			}
	        		$("#processing").css("display","none");
		         });
	        	  
				}
			}
       	
       });
     
       $('#pauseAnnouncement').click(function(){
      	 $("#processing").css("display","inline-block"); 
       	var repeateCount=$("#repeateCount").val(); //alert(repeateCount);
       	$.getJSON("announcementRequest?announcementCommand=pause&repeateCount="+repeateCount,function(data){
       		console.log( "Announcement Paused" );	
       		$("#processing").css("display","none");
	         });
       });
       $('#resumeAnnouncement').click(function(){        	
       	var repeateCount=$("#repeateCount").val(); //alert(repeateCount);
       	$.getJSON("announcementRequest?announcementCommand=resume&repeateCount="+repeateCount,function(data){
       		console.log( "Announcement Resumed" );	 
	         });
       });
       
       $('#stopAnnouncement').click(function(){
      	 $("#processing").css("display","inline-block"); 
       	var repeateCount=$("#repeateCount").val(); //alert(repeateCount);
       	$.getJSON("announcementRequest?announcementCommand=stop&repeateCount="+repeateCount,function(data){
       		console.log( "Announcement Stopped" );	 
       		$("#processing").css("display","none");
	         });
       });
     $("#refreshcgdb").click(function(e){
   	  e.preventDefault();
   	  swal({
   		  title: "Enter the Platform No. to be Refreshed",
   		  type: "input",
   		  showCancelButton: true,
   		  closeOnConfirm: false,
   		  animation: "slide-from-top",
   		  inputPlaceholder: "Enter the Platform No."
   		},
   		function(inputValue){
   		  if (inputValue === false) return false;
   		  
   		  if (inputValue === "") {
   		    swal.showInputError("Please Enter the Platform No.");
   		    return false;
   		  }
   		  
   		 /*  else if(isNaN(inputValue)){
   			  swal.showInputError("Please Enter the Number!");
   			  return false;
   		  } */
   		  else if(inputValue.length>3){
   			  swal.showInputError("Please Enter the Configured Platform No.");
   			  return false;
   		  }
   		  else{
   			  $("#processing").css("display","inline-block");
  	    	   	
   			  $.getJSON("defaultInfo?platform="+inputValue,function(data){
   					 console.log( "Refresh Display--->"+data);
   					 if(data==false)
   						 {
   						 swal.showInputError("Please Enter the Configured Platform No.");
   						  $("#processing").css("display","none");
   						 //window.location.reload();
   						 }
   					 else{
   						 swal("DATA SAVED!","", "success");
   						 $("#processing").css("display","none");
   						//window.location.reload();
   					 }
   					
   		         });
   		  }
   		  
   		}); 
     });
     
	$("#coachDisplay").click(function () {
		var cgdbStatus=$("#cgdbStatus").val();
		var noOfTrain=$(".coachDisplay");
		var count=0;
		if(cgdbStatus=="true") {
			swal("Please Activate CGDB First");
		} else if(noOfTrain.length == 0) {
			 swal("Please Add Train First");
		} else if(noOfTrain.length > 0) {
			for(var i=0; i<noOfTrain.length; i++) {
				var status=$('#'+noOfTrain[i].id).is(':checked');
				if(status==true) {
					count=1;
				}
			}
			alert('count : '+count);
			if(count==0) {
				swal("No CGDB is selected");
			} else {
				$("#processing").css("display","inline-block");
			   	$("#coachDisplay").addClass("not-active");
			   	$("#platformDisplay").addClass("not-active");
			   	$("#repeate").css("opacity",0.2);
			   	$("#repeateCount").css("opacity",0.2);
			   	$("#playAnnouncement").addClass("not-active");
			   	$("#pauseAnnouncement").addClass("not-active");
			   	$("#stopAnnouncement").addClass("not-active");
			   	$("#refreshcgdb").addClass("not-active");
			   	$("#refreshPage").addClass("not-active");
			   	$("#coachDisplay").attr("href","cgdbDisplay");
			   	$('.tab').addClass("not-active-privilege");
			}
		}
	});

	$(".deleteTrain").click(function (e) {
		e.preventDefault();
		var str=this.id.split("_");
		swal({
			title: "Are you sure?",
			text: "You want to delete the Train detail!",
		  	type: "warning",
		  	showCancelButton: true,
		  	confirmButtonColor: "#DD6B55",
		  	confirmButtonText: "Yes, delete it!",
		  	closeOnConfirm: true
		},
		function(){
			$("#delete_"+str[1]).attr("href","deleteRunningTrain?id="+str[1]);
			window.location.href=$("#delete_"+str[1]).attr("href");
		});
	});
}
	   //--------------Uncheck anc if train display is unchecked on page load-----------------
	      
	   function submitform(){
    	   var count=0;
    	   $(".divertedStation").each(function(index) {
    		   var str=this.id;
		       var id=str.split('_');
		       var trainNo=$('#trainNo_'+id[1]).text();
    		   if($(this).css('display')=='block' && this.value==''){
    			 count++;
    			 swal("Terminated or Diverted City Can't be Blank for train No "+trainNo);
    		   }
		   });
    	   
    	   $( ".trainRunningStatus" ).each(function( index ) {
    		      var str=this.id;
		    	  var id=str.split('_');
		    	  console.log($("#lateHour_"+id[1]));
		    	  var trainNo=$('#trainNo_'+id[1]).text();
				  if( $( this ).val()=="Is Ready To Leave" && $( "#defaultPlatform_"+id[1] ).val()==0){
					  count++;
					  swal("Platform must be selected for status "+this.value+" of Train No "+trainNo);
				  }else if($( this ).val()=="Is On Platform" && $( "#defaultPlatform_"+id[1] ).val()==0){
					  count++;
					  swal("Platform must be selected for status "+this.value+" of Train No "+trainNo);
				  }else if($( this ).val()=="Has Left" && $( "#defaultPlatform_"+id[1] ).val()==0){
					  count++;
					  swal("Platform must be selected for status "+this.value+" of Train No "+trainNo);
				  }else if($( this ).val()=="Platform Changed" && $( "#defaultPlatform_"+id[1] ).val()==0){
					  count++;
					  swal("Platform must be selected for status "+this.value+" of Train No "+trainNo);
				  }else if($( this ).val()=="Has Arrived On" && $( "#defaultPlatform_"+id[1] ).val()==0){
					  count++;
					  swal("Platform must be selected in status "+this.value+" of Train No "+trainNo);
				  }else if($( this ).val()=="Will Arrive Shortly" && $( "#defaultPlatform_"+id[1] ).val()==0){
					  count++;
					  swal("Platform must be selected in status "+this.value+" of Train No "+trainNo);
				  }else if($( this ).val()=="Is Arriving On" && $( "#defaultPlatform_"+id[1] ).val()==0){
					  count++;
					  swal("Platform must be selected in status "+this.value+" of Train No "+trainNo);
				  }
				  else if(($(this).val()=="Running Late" || $(this).val()=="Rescheduled")&& $("#lateHour_"+id[1]).val()=="00:00"){
					  count++;
					  swal("Please update the late time");
				  }
		    });
    	   if(count==0){
    		   var tadbStatus=$("#tadbStatus").val();
    		   var noOfTrain=$(".trainDisplay");
    		   var counter1=0;
    			if(tadbStatus=="true") {
    				 swal(" Please Activate TADDB First");
    			} else if(noOfTrain.length==0) {
    			 swal(" Please Add Train First");
    			} else if(noOfTrain.length>0) {
    			for(var i=0;i<noOfTrain.length;i++) {
    				var status=$('#'+noOfTrain[i].id).is(':checked');
    				if(status==true) {
    					counter1=1;
    					break;
    				}
   				}
   				$("#processing").css("display","inline-block");
   		    	$("#addTrain").addClass("not-active-privilege");
   	    		$("#coachDisplay").addClass("not-active");
   		    	$("#platformDisplay").addClass("not-active");
   		    	$("#repeate").css("opacity",0.2);
   		    	$("#repeateCount").css("opacity",0.2);
   		    	$("#playAnnouncement").addClass("not-active");
   		    	$("#pauseAnnouncement").addClass("not-active");
   		    	$("#stopAnnouncement").addClass("not-active");
   		    	$("#refreshcgdb").addClass("not-active");
   		    	$("#refreshPage").addClass("not-active");
   		    	$('.tab').addClass("not-active-privilege");
   		    	document.runningTrainInfoForm.submit();
    		}
		}
	} 
   	//========================validate time format for late hour on Form Submission====================
	
 	function checkForm(form) {
    	// regular expression to match required time format
    	re = /^(\d{1,2}):(\d{2})([ap]m)?$/;
    	if(form.starttime.value != '') {
      		if(regs = form.starttime.value.match(re)) {
        		if(regs[3]) {
          			// 12-hour value between 1 and 12
          			if(regs[1] < 1 || regs[1] > 12) {
        				swal("Invalid value for hours: " + regs[1]);
            			form.starttime.focus();
            			return false;
          			}
        		} else {
          			// 24-hour value between 0 and 23
          			if(regs[1] > 23) {
        				swal("Invalid value for hours: " + regs[1]);
            			form.starttime.focus();
            			return false;
          			}
        		}
        		// minute value between 0 and 59
        		if(regs[2] > 59) {
          			swal("Invalid value for minutes: " + regs[2]);
          			form.starttime.focus();
          			return false;
        		}
      		} else {
    			swal("Invalid time format: " + form.starttime.value);
        		form.starttime.focus();
        		return false;
      		}
    	}
    	swal("All input fields have been validated!");
    	return true;
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
 	</script>
<sx:head />
</head>
<body>
	<div style="background: #111">
		<img src="../images/header2.png" width="100%" height="100"
			alt="header2" />
		<ul class="header">
			<li><a class="active tab" href="trainRunningInfo"
				style="display: block; color: white; text-align: center; padding: 5px 16px; text-decoration: none;">Online
					Train</a></li>
			<li style="float: left;"><a
				style="display: block; color: white; text-align: center; padding: 5px 16px; text-decoration: none;"
				<s:if test='%{#session["user"].status==false}'> class="not-active-privilege" </s:if>
				<s:else>class="tab"</s:else> href="../device/deviceStatus">Status</a></li>
			<li><a href="../device/deviceConfig"
				<s:if test='%{#session["user"].display==false}'> class="not-active-privilege" </s:if>
				<s:else>class="tab"</s:else>
				style="display: block; color: white; text-align: center; padding: 5px 16px; text-decoration: none;">Display</a></li>
			<li><a href="../device/deviceIntensity"
				<s:if test='%{#session["user"].intensity==false}'> class="not-active-privilege" </s:if>
				<s:else>class="tab"</s:else>
				style="display: block; color: white; text-align: center; padding: 5px 16px; text-decoration: none;">Intensity</a></li>
			<li><a href="../log-report/logReport"
				<s:if test='%{#session["user"].logReport==false}'> class="not-active-privilege" </s:if>
				<s:else>class="tab"</s:else>
				style="display: block; color: white; text-align: center; padding: 5px 16px; text-decoration: none;">Log
					Report</a></li>
			<li><a href="../cctv/led-lcd-display.jsp"
				<s:if test='%{#session["user"].cctv==false}'> class="not-active-privilege" </s:if>
				<s:else>class="tab"</s:else>
				style="display: block; color: white; text-align: center; padding: 5px 16px; text-decoration: none;">CCTV</a></li>
			<li><a href="../announcement/personalAnc"
				<s:if test='%{#session["user"].personalAnc==false}'> class="not-active-privilege" </s:if>
				<s:else>class="tab"</s:else>
				style="display: block; color: white; text-align: center; padding: 5px 16px; text-decoration: none;">PA</a></li>

			<li><a href="../message/getBoardMessageList"
				<s:if test='%{#session["user"].message==false}'> class="not-active-privilege" </s:if>
				<s:else>class="tab"</s:else>
				style="display: block; color: white; text-align: center; padding: 5px 16px; text-decoration: none;">Message</a></li>
			<li><a href="../setup/setup.jsp"
				<s:if test='%{#session["user"].setup==false}'> class="not-active-privilege" </s:if>
				<s:else>class="tab"</s:else>
				style="display: block; color: white; text-align: center; padding: 5px 16px; text-decoration: none;">Setup</a></li>
			<li><a href="../option/optionSettings"
				<s:if test='%{#session["user"].interfaces==false}'> class="not-active-privilege" </s:if>
				<s:else>class="tab"</s:else>
				style="display: block; color: white; text-align: center; padding: 5px 16px; text-decoration: none;">Interface</a></li>
			<li><a href="../user/userSetting"
				<s:if test='%{#session["user"].user==false}'> class="not-active-privilege" </s:if>
				<s:else>class="tab"</s:else>
				style="display: block; color: white; text-align: center; padding: 5px 16px; text-decoration: none;">User</a></li>
			<li><a class="tab" href="../train/help.jsp"
				style="display: block; color: white; text-align: center; padding: 5px 16px; text-decoration: none;">Help</a></span></li>

			<li><span class="tab"
				style="display: block; color: white; text-align: left; padding: 5px 30px; text-decoration: none;"
				id="stnm"></span></li>

			<li style="float: right"><a class="tab" href="../logout"
				style="display: block; color: white; text-align: center; padding: 5px 16px; text-decoration: none;">Logout</a></li>
			<li style="float: right"><a class="tab"
				href="../user/changePassword"
				style="display: block; color: white; text-align: center; padding: 5px 16px; text-decoration: none;"><s:property
						value="#session['user'].userId" /></a></li>
			<li style="float: right"><span
				style="display: block; color: white; text-align: center; padding: 5px 16px; text-decoration: none;"
				id="time"></span></li>
		</ul>
	</div>
	<div align="center">
		<form id="addTrainForm" method="post">
			<label>Enter Train No</label>
			<sx:autocompleter id="trainNo" cssClass="autocompleter"
				name="trainNo" list="trainList" listValue="trainNo" listKey="id"
				autoComplete="true" showDownArrow="false" value="" />
			<input type="submit" id="addTrain" value="Add" style="width: 60px;">
		</form>
	</div>
	<input type="hidden" id="cgdbStatus"
		value="<s:property value='option.isCgdb()'/>" />
	<input type="hidden" id="tadbStatus"
		value="<s:property value='option.isTaddb()'/>" />
	<input type="hidden" id="ancStatus"
		value="<s:property value='option.isPlatformAnc()'/>" />
	<form method="post" name="runningTrainInfoForm"
		id="runningTrainInfoForm" action="updateRunningTrain">
		<input type="hidden" name="coachTrain" id="coachTrain"
			value="<s:property value='coachTrain'/>" />
		<div style="">
			<!--  where icons were small and list comes from right -->
			<div
				style="display: inline; float: left; width: 86%; background: white; height: 500px; overflow: scroll;">
				<table class="table1">
					<thead>
						<tr>
							<th>Sr. No.</th>
							<th>TR. No.</th>
							<th>TRAIN NAME</th>
							<th>SAT</th>
							<th>SDT</th>
							<th>A/D</th>
							<th>TRAIN STATUS</th>
							<th>LATE</th>
							<th>EAT</th>
							<th>EDT</th>
							<th>PF</th>
							<th>TADD</th>
							<th>CGDB</th>
							<th>ANN.</th>
							<th>DEL</th>
							<th>TER / DIV CITY</th>
						</tr>
					</thead>
					<tbody id="runningTrainData">
						<s:include value="AddTrain.jsp" />
					</tbody>
				</table>
				<div class="loader" style="display: none"></div>
			</div>
			<div
				style="display: inline; background-color: black; width: 12.5%; float: left; height: 510px">
				<div id="reload" style="position: relative;">
					<table style="margin-left: 1px; display: inline-block;">
						<tr>
							<td><a href="javascript: submitform()" id="platformDisplay"
								class="tooltip" style="margin: 2px;"><span
									class="tooltiptext">Platform Display</span><img id="pfd_button"
									src="../images/platform.png" width="160" height="55" /></a></td>
						</tr>
						<tr>
							<td><a href="#" id="coachDisplay" class="tooltip"
								style="margin: 2px"><span class="tooltiptext">Coach
										Display</span><img src="../images/refresh_icon1.png" width="160"
									height="55" /></a></td>
						</tr>
						<tr>
							<td><a href="#" id="refreshcgdb" class="tooltip"
								style="margin: 2px;"><span class="tooltiptext">REF
										CGDB</span><img src="../images/cgdb_refresh.png" width="160"
									height="55" /></a></td>
						</tr>
						<tr>
							<td class="tooltip" style="margin: -2px;"><span
								class="tooltiptext">Repeat Announcement</span>
							<!-- <input type="text" id="repeate" value="Repeat" disabled="disabled" style="height: 15px; width: 35px;margin-top: 2px"><br> -->
								<b><span
									style="color: white; margin-right: 15px; font-size: 20px;">Repeat</span></b><input
								type="number" id="repeateCount" name="repeateCount" value="1"
								min="1" max="10" style="height: 25px; width: 55px;"
								onkeydown="return false;"></td>
						</tr>
						<tr>
							<td><a href="#" id="playAnnouncement" class="tooltip"
								style="margin: 2px;"><span class="tooltiptext">Announcement</span><img
									src="../images/announcement.png" width="160" height="55" /></a></td>
						</tr>
						<tr>
							<td><a href="#" id="pauseAnnouncement" class="tooltip"
								style="margin: 2px;"><span class="tooltiptext">Pause</span><img
									src="../images/pause.png" width="160" height="55" /></a></td>
						</tr>
						<tr>
							<td><a href="#" id="stopAnnouncement" class="tooltip"
								style="margin: 2px;"><span class="tooltiptext">Stop</span><img
									src="../images/stop.png" width="160" height="55" /></a></td>
						</tr>
						<tr>
							<td><a href="trainRunningInfo" id="refreshPage"
								class="tooltip" style="margin: 2px;"><span
									class="tooltiptext">Reload</span><img
									src="../images/reload.png" width="160" height="55" /></a></td>
						</tr>
						<tr>
							<td><div id="processing"
									style="position: absolute; top: 1; right: 40px; display: none; vertical-align: top; margin-top: 10px;">
									<img height="25px;" width="120px"
										src="../images/processbar.gif" />
								</div></td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</form>
	<!-- ------------------------------------------------------------------------------------------------------ -->
	<div id="currentcoaches">
		<s:include value="currentCoach.jsp" />
	</div>
	<div id="footer">
		<p>&copy;2016 Dan Electronic System Pvt. Ltd.
		<p>
	</div>
	<script type="text/javascript" src="../Select2/select2.full.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			//Initialize Auto Completer
			$(".auto-completer").select2();
			var arr=[];
  			var selectedId="";
		  	$(".select2-selection__rendered").click(function(){
			  	var tr=(this.id).split("_")[1];
			  	var trainNo=tr.split("-")[0];
			  	if($("#C1_"+trainNo).prop("disabled")==false){
					selectedId=this.id; //alert(selectedId);
					$(".select2-selection__rendered").each(function () {
						$(this).removeClass( "style" );
					});
					$(this).addClass( "style" );
				}
			});
			//--------------Delete Selected Coach------------------------
			$(".deleteCoach").click(function(){ 
				var trainNo=(this.id).split("_")[1]; //alert(trainNo);
				console.log($("#C1_"+trainNo).prop("disabled"));
				/* console.log("---"+("#C1_"+trainNo).prop("disabled")); */
				if($("#C1_"+trainNo).prop("disabled")==false){
					if(selectedId!=""){
					    var no=parseInt(selectedId.split("-")[1].split("_")[0].substring(1));
						for(var i=1,j=no;j<=30;i++,j++){
							arr[i-1]=$("#select2-C"+j+"_"+trainNo+"-container").text();
						}
						for(var i=0,j=no;i<arr.length;i++,j++){  //alert(arr[i]);
							$("#select2-C"+(j)+"_"+trainNo+"-container").text(arr[i+1]);
						    $("#C"+(j)+"_"+trainNo+" option:selected").val("");
						}
						for(var i=0,j=no;i<arr.length-1;i++,j++){  //alert(arr[i]);
							$("#select2-C"+(j)+"_"+trainNo+"-container").text(arr[i+1]);
						    $("#C"+(j)+"_"+trainNo+" option:selected").val(arr[i+1]);
						}
					} else {
						swal("Can't delete! Please Select a Coach First");	
					}	
				}	
		  	});
			//------------------Shift Left------------------------
			$(".shiftLeft").click(function(){ 
				var trainNo=(this.id).split("_")[1]; //alert(trainNo);
				if($("#C1_"+trainNo).prop("disabled")==false){
					for(var i=1;i<=30;i++){
						arr[i-1]=$("#select2-C"+i+"_"+trainNo+"-container").text();
					}
					//alert(arr);
					for(var i=0;i<arr.length;i++){  //alert(arr[i]);
						$("#select2-C"+(i+1)+"_"+trainNo+"-container").text("");
					    $("#C"+(i+1)+"_"+trainNo+" option:selected").val("");
					}
					for(var i=0;i<arr.length-1;i++){  //alert(arr[i]);
						$("#select2-C"+(i+1)+"_"+trainNo+"-container").text(arr[i+1]);
					    $("#C"+(i+1)+"_"+trainNo+" option:selected").val(arr[i+1]);
					}
				}
		    });
		   //---------------------Shift Right------------------------
			$(".shiftRight").click(function(){ 
				var trainNo=(this.id).split("_")[1]; //alert(trainNo);
				if($("#C1_"+trainNo).prop("disabled")==false){
					for(var i=1;i<=30;i++){
						arr[i-1]=$("#select2-C"+i+"_"+trainNo+"-container").text();
					}
					//alert(arr);
					for(var i=0;i<arr.length;i++){  //alert(arr[i]);
						$("#select2-C"+(i+1)+"_"+trainNo+"-container").text("");
					    $("#C"+(i+1)+"_"+trainNo+" option:selected").val("");
					}
					for(var i=arr.length-1;i>0;i--){  //alert(arr[i]);
						$("#select2-C"+(i+1)+"_"+trainNo+"-container").text(arr[i-1]);
					    $("#C"+(i+1)+"_"+trainNo+" option:selected").val(arr[i-1]);
					}
				}
		    });
			//--------------Reverse Coach position------------------------
			$(".reverseCoach").click(function(){ 
			   var trainNo=(this.id).split("_")[1];
			    if($("#C1_"+trainNo).prop("disabled")==false){
					for(var i=1;i<=30;i++){
						arr[i-1]=$("#select2-C"+i+"_"+trainNo+"-container").text();
					}
					var revArray=arr.reverse();
					for(var i=0;i<30;i++){  //alert(arr.reverse()[i]);
						$("#select2-C"+(i+1)+"_"+trainNo+"-container").text(revArray[i]);
					    $("#C"+(i+1)+"_"+trainNo+" option:selected").val(revArray[i]);
					}
				}
		    });
			//--------------Insert New Coach------------------------
			$(".insertCoach").click(function() {
				var trainNo=(this.id).split("_")[1]; //alert(trainNo);
				if($("#C1_"+trainNo).prop("disabled")==false) {
					if(selectedId!="") {
						var no=parseInt(selectedId.split("-")[1].split("_")[0].substring(1)); 
						for(var i=1,j=no;j<=30;i++,j++) {
							arr[i-1]=$("#select2-C"+j+"_"+trainNo+"-container").text();
						}
						//alert(arr);
						for(var i=0,j=no;i<arr.length;i++,j++) {  //alert(arr[i]);
							$("#select2-C"+(j)+"_"+trainNo+"-container").text("");
						    $("#C"+(j)+"_"+trainNo+" option:selected").val("");
						}
						for(var i=0,j=no;i<arr.length-1;i++,j++) {  //alert(arr[i]);
							$("#select2-C"+(j+1)+"_"+trainNo+"-container").text(arr[i]);
						    $("#C"+(j+1)+"_"+trainNo+" option:selected").val(arr[i]);
						}
		          	} else {
		          		swal("Can't insert! Please Select a Coach First");	
					}
				}
		  	});
		});
		</script>
	<script type="text/javascript" src="../js/time.js"></script>
</body>
</html>