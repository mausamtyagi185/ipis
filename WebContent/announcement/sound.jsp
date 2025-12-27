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
    <link rel="stylesheet" href="../sweetalert-master/dist/sweetalert.css">
<!-- --Css for Menu-- -->
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


 .vert {
 width: 20px;
 height: 200px;
 -webkit-appearance: slider-vertical;
 }
</style>
<!-- --Css for Page-- -->
<style type="text/css">
#leftmenu{

height:100%;
display: inline-block;
border: 1px solid gray;
vertical-align: top;
background: rgba(0, 0,0, 0.68);
}
#left{
width:50%;
height:530px;
display: inline-block;
border: 1px solid gray;
vertical-align: top;
background: rgba(0, 0,0, 0.68);
}
#specialAnc{
height:463px;
}
#left-top{
width:48%;
height:350px;
color:white;
background: rgba(0, 0,0, 0.68);
display: inline-block;
vertical-align: top;
}

#soundRecordings{
height:463px;
border-top:1px solid gray;
}
#ancSettings{
height:463px;
border-top:1px solid gray;
}
#right{
margin-left:1%;
width:25%;
height:530px;
display: inline-block;
border: 1px solid gray;
vertical-align: top;
color:white;
background: rgba(0, 0,0, 0.68);
}
#right-top{
width:100%;
height:350px;
color:white;
background: rgba(0, 0,0, 0.68);
}
#left button{
width: 180px;
height: 50px;
margin: 8px;
}
#right button{
padding: 5px;
margin: 5px 0px 2px 0px;
}
#volumeControl{
display: inline-block;
width:38%;
height:200px;
color:white;
}

#language{
display: inline-block;
width:48%;
margin-left:10px;
vertical-align: top;
}
#language table{
background-color: white;
}
#uploadSloganForm input{
font-size:16px;
height:30px;
width:180px;
margin-bottom: 10px;
}
#uploadRecordingForm input{
font-size:16px;
height:30px;
width:180px;
margin-bottom: 10px;
}
form{
margin-top: 10px;
}
</style>
<style>
.button {
    background-color: #4CAF50; /* Green */
    border: none;
    color: white;
    padding: 10px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;
    width: 200px;
}

.button2 {background-color: #008CBA;} /* Blue */
.button3 {background-color: #f44336;} /* Red */ 
.button5 {background-color: #673AB7;} /* Purple */
.button6 {background-color: #212121;} /* gray */  
.button4 {background-color: #e7e7e7; color: black;} /* Gray */ 

.not-active-privilege {
   pointer-events: none;
   cursor: default;
   opacity: 0.3;
}

</style>
<!-- ------XXX------- -->
</head>
<body><div style="background: #111">
   <img src="../images/header2.png" width="100%" height="100" alt="header2"/>
<ul>
	
	<li style="float: left;"><a style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;" href="../train/trainRunningInfo">Online Train</a></li>
	<li style=" float: left;"><a style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;" <s:if test='%{#session["user"].status==false}'> class="not-active-privilege" </s:if> href="../device/deviceStatus">Status</a></li>
	<li style="float: left;"><a href="../device/deviceConfig" <s:if test='%{#session["user"].display==false}'> class="not-active-privilege" </s:if> style="  display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;">Display</a></li>
	<li style="float: left;"><a href="../device/deviceIntensity" <s:if test='%{#session["user"].intensity==false}'> class="not-active-privilege" </s:if> style="  display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;">Intensity</a></li>
	<li style="float: left;"><a href="../log-report/logReport" <s:if test='%{#session["user"].logReport==false}'> class="not-active-privilege" </s:if> style="  display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;">Log Report</a></li>
	<li style="float: left;"><a href="../cctv/led-lcd-display.jsp" <s:if test='%{#session["user"].cctv==false}'> class="not-active-privilege" </s:if> style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;">CCTV</a></li> 
	<li style="float: left;" class="active"><a href="personalAnc" style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;">PA</a></li>
	                      
	<li style="float: left;"><a href="../message/getBoardMessageList" <s:if test='%{#session["user"].message==false}'> class="not-active-privilege" </s:if> style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;">Message</a></li>
	<li style="float: left;"><a href="../setup/setup.jsp" <s:if test='%{#session["user"].setup==false}'> class="not-active-privilege" </s:if> style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;">Setup</a></li>
	<li style="float: left;"><a href="../option/optionSettings" <s:if test='%{#session["user"].interfaces==false}'> class="not-active-privilege" </s:if> style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;">Interface</a></li>
	<li style="float: left;"><a href="../user/userSetting" <s:if test='%{#session["user"].user==false}'> class="not-active-privilege" </s:if> style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;">User</a></li>
	<li style="float: left;"><a href="../train/help.jsp" style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;">Help</a></li>
	<li style="float: right"><a href="../logout" style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;">Logout</a></li>
	<li style="float: right"><a href="../user/changePassword" style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;"><s:property value="#session['user'].userId" /></a></li>
     	<li style="float: right"><span style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;" id="time"></span></li>                              
</ul>
</div>



<div>
<div id="nav">
<div id='cssmenu'>
<ul>
    <li ><a href='personalAnc'>Special Announcement</a></li>
    <li class='active'><a href='soundRecording'>Sound Recordings</a></li>
    <li><a href='ancSetting'>Announcement Settings</a></li>
    <li ><a href='recordSound'>Record Sound</a></li>
   
</ul>
</div>

</div>
<div id="left">

	<div id="soundRecordings"><h2 style="text-align: center;">Sound Recordings</h2>
	    <hr>
		<div id="left-top">
		
	        <form method="post" id="uploadRecordingForm" action="#" enctype="multipart/form-data" style="text-align: center;">
	            <br>
	             <input type="hidden" name="announcement.id" id="recordingAncId"> 
	            <input type="text" name="announcement.soundName" id="recordingSoundName" placeholder="Enter Sound Name">
				<br>
		        <div>
		         <label id="englishRecordingBtnText">English Sound</label>
		         <input type="file" id="englishRecordingFile" name="announcement.englishFileUpload.file" class="upload" />
		        </div>
		        <input type="hidden" name="announcement.englishFileName" id="recordingEnglishFileName">
		        <input type="hidden" name="announcement.englishPath" id="recordingEnglishPath">
		        <div>
		         <label id="hindiRecordingBtnText">Hindi Sound</label>
		         <input type="file" id="hindiRecordingFile" name="announcement.hindiFileUpload.file" class="upload" style="margin-left: 15px"/>
		        </div>
		        <input type="hidden" name="announcement.hindiFileName" id="recordingHindiFileName">
		        <input type="hidden" name="announcement.hindiPath" id="recordingHindiPath">
		        <div>
		         <label id="regionalRecordingBtnText">Other Sound</label>
		         <input type="file" id="regionalRecordingFile" name="announcement.regionalFileUpload.file" class="upload" style="margin-left: 12px"/>
		        </div>
		        <input type="hidden" name="announcement.regionalFileName" id="recordingRegionalFileName">
		        <input type="hidden" name="announcement.regionalPath" id="recordingRegionalPath">
		        
		        <input type="hidden" name="announcement.ancType" value="recording">
 		        	    <input id="save" type="image" src="../images/save_sound_list.png" alt="Save Sound" style="width:150px; height:55px; padding-top: 18px;">
	            <!-- <button class="button button5">Save To Sound List</button>  -->
            </form>
        
	    </div>
	   <select multiple name="recording" class="recordingList" id="left-top">
		 <s:iterator value="recordingList" status="list">
	      <option value="<s:property value="id"/>_<s:property value="soundName"/>_<s:property value="hindiFileName"/>_<s:property value="englishFileName"/>_<s:property value="regionalFileName"/>_<s:property value="hindiPath"/>_<s:property value="englishPath"/>_<s:property value="regionalPath"/>"><s:property value="#list.index+1"/> <s:property value="soundName"/></option>
	     </s:iterator>
	   </select>
	   <hr>
	   
	   <div style="text-align: center;">
	  <input id="updateRecording" type="image" src="../images/update_sound.png" alt="Update Sound" style="width:150px; height:55px; padding-top:10px ">
	    <input id="removeRecording" type="image" src="../images/remove_sound.png" alt="Remove Sound" style="width:150px; height:55px; padding-top:10px ">
	    <input id="addRecordingToPlaylist" type="image" src="../images/add_to_playlist_button1.png" alt="ADD to PlayList" style="width:150px; height:55px; padding-top:10px ">
	     <!--   <button id="updateRecording" class="button">Update Sound</button> 
	   <button id="removeRecording" class="button button3">Remove Sound</button>
	  <button id="addRecordingToPlaylist" class="button button2">Add To Playlist</button> -->
	   
	   </div>
	   </div>

	
</div>

<!-- -------------------------------------------------------------------------------------------------- -->

<div id="right">

 <center><label>Play List</label></center>
    <hr>
	<select multiple id="right-top" class="playList">
	     <s:iterator value="playList" status="list">
	       <option value="<s:property value="id"/>"><s:property value="#list.index+1"/>  <s:property value="soundName"/></option>
	     </s:iterator>
   </select>
   <hr>
   
   <center>
    Repeat<select id="repeate" style="font-size:16px; margin:10px 0px 5px 0px;">
	   <option>1</option>
	   <option>2</option>
	   <option>3</option>
	   <option>4</option>
	   <option>5</option>
	   <option>6</option>
	   <option>7</option>
	   <option>8</option>
	   <option>9</option>
	   <option>10</option>
    </select>
   </center>
   <div style="text-align: center;">
   <input id="play" type="image" src="../images/play.png" alt="play" style="width:100px; height:35px; ">
	 <input id="stop" type="image" src="../images/Stop4.png" alt="Stop" style="width:100px; height:35px; ">
	 <input id="up" type="image" src="../images/up2.png" alt="Up" style="width:100px; height:35px; ">
	<!--  <br> -->
	  <input id="removeFromPlaylist" type="image" src="../images/remove1.png" alt="Remove" style="width:100px; height:35px; ">
	  <input id="clearPlaylist" type="image" src="../images/clear1.png" alt="Clear" style="width:100px; height:35px; ">
	   <input id="down" type="image" src="../images/down2.png" alt="Down" style="width:100px; height:35px; ">
   <!-- <button id="play" class="button" style="width: 100px">Play</button>
	   <button id="stop" class="button button3"style="width: 100px">Stop</button>
	   <button id="up" class="button button2"style="width: 100px">Up</button>
       <br>
       <button id="removeFromPlaylist" class="button button5" style="width: 100px">Remove</button>
	   <button id="clearPlaylist" class="button button6"style="width: 100px">Clear</button>
	   <button id="down" class="button button2"style="width: 100px">Down</button> -->
 
   </div>
 
  
</div>
</div> 


<div id="processing" style="position:absolute; top:0; bottom:0; left:0; right:0; margin-top:30%; margin-left:45%;background-color: white;width:10%;height:15%; display: none;">
    <img src="../images/Processing.gif"/>
</div>

<!-- ----------------------------------------------------- -->

<script type="text/javascript" src="../js/jquery.min.js"></script>
<script src="../sweetalert-master/dist/sweetalert-dev.js"></script>
<script type="text/javascript" src="../js/blockUI.js"></script> 
 <script type="text/javascript">
   $( document ).ready(function() {
     
	//--------------------------------------------------------
	
	 $("#leftRange").change(function (e){
		var volume=$("#lefPosition").val(); //alert(repeate);
	  	$.getJSON("setVolume?volume="+volume,function(data){
			console.log( "Volume Changed" );	 
	    });
	 });
	
	 $("#mute").change(function (e){
		 if($('#mute').attr('checked')){
			 $.getJSON("changeMuteStatus?status=true",function(data){
				console.log( "Mute Volume" );	 
			  });
		 }else{
			 $.getJSON("changeMuteStatus?status=false",function(data){
			    console.log( "Mute Volume" );	 
		      });
		 }
	 });
	 
	//--------------------------------------------------------
	
	$("#specialAnc").css("display","none");
	$("#ancSettings").css("display","none");
	
    $("#spAnc").click(function(e){
    	$("#specialAnc").css("display","block");
    	$("#soundRecordings").css("display","none");
    	$("#ancSettings").css("display","none");
    })
    $("#sdRc").click(function(e){
    	$("#specialAnc").css("display","none");
    	$("#soundRecordings").css("display","block");
    	$("#ancSettings").css("display","none");
    })
    $("#ancSt").click(function(e){
    	$("#specialAnc").css("display","none");
    	$("#soundRecordings").css("display","none");
    	$("#ancSettings").css("display","block");
    });
    
   //   ------------------------------------------------
   
//     $("#hindiRecordingFile").change(function(){ 
//         var file=this.files[0];
//         $('#hindiRecordingBtnText').text(file.name);
//      });
     
//      $("#englishRecordingFile").change(function(){ 
//         var file=this.files[0];
//         $('#englishRecordingBtnText').text(file.name);
//      });
     
//      $("#regionalRecordingFile").change(function(){ 
//         var file=this.files[0];
//         $('#regionalRecordingBtnText').text(file.name);
//      });
    	
 //------------------------------------------------------------------------
 
 
 $("#hindiRecordingFile").change(function(){
	 var ext=[".mp3",".wav"];
	 var fileName=$("#hindiRecordingFile").val();
	 if(!fileName=="")
		 {
		 var fileExt=fileName.substring(fileName.lastIndexOf("."),fileName.length);
		 var i=0;
		 	for(i=0;i<ext.length;i++)
		 		{
		 			if(ext[i].search(fileExt)>-1)
		 				{
		 					break;
		 				}
		 		}
		 	if(i==ext.length)
			  {
			  	swal("Please select an audio file");
			  	$("#hindiRecordingFile").val("");
			  }
		 }
	 
	 
 });
 
 $("#englishRecordingFile").change(function(){
	 var ext=[".mp3",".wav"];
	 var fileName=$("#englishRecordingFile").val();
	 if(!fileName=="")
		 {
		 var fileExt=fileName.substring(fileName.lastIndexOf("."),fileName.length);
		 var i=0;
		 	for(i=0;i<ext.length;i++)
		 		{
		 			if(ext[i].search(fileExt)>-1)
		 				{
		 					break;
		 				}
		 		}
		 	if(i==ext.length)
			  {
			  	swal("Please select an audio file");
			  	$("#englishRecordingFile").val("");
			  }
		 }
	 
	 
 });
 
 $("#regionalRecordingFile").change(function(){
	 var ext=[".mp3",".wav"];
	 var fileName=$("#regionalRecordingFile").val();
	 if(!fileName=="")
		 {
		 var fileExt=fileName.substring(fileName.lastIndexOf("."),fileName.length);
		 var i=0;
		 	for(i=0;i<ext.length;i++)
		 		{
		 			if(ext[i].search(fileExt)>-1)
		 				{
		 					break;
		 				}
		 		}
		 	if(i==ext.length)
			  {
			  	swal("Please select an audio file");
			  	$("#regionalRecordingFile").val("");
			  }
		 }
	 
	 
 });
  $("#save").click(function(e){
	  e.preventDefault();
	  var fileName=$("#recordingSoundName").val();
	  var ext=[".mp3",".wav"];
	  var hindiFile=$("#hindiRecordingFile").val();
	  var engFile=$("#englishRecordingFile").val();
	  var regFile=$("#regionalRecordingFile").val();
	  
	  if(fileName=="")
		  {
		  swal("Please Enter File Name");
		  }
	  else if(!hindiFile=="" || !engFile=="" || !regFile=="" )
		  {
		  $("#uploadRecordingForm").attr("action","uploadRecording").submit();
		  }
	  else
		  {
		  swal("Please Select an audio file");
		  }
		  
		  		  
		  
  });
 
 
  $("#updateRecording").click(function(){ 
	   var len=$(".recordingList option:selected").length;
   	   if (len==1) {
	   		var selvalue=$(".recordingList option:selected").val().split("_");
	   		var id=selvalue[0];
	   		$("#recordingAncId").attr("value",id);
	   	    var soundName=selvalue[1];
	   	    $("#recordingSoundName").attr("value",soundName);
		    var hindiFileName=selvalue[2];
		    //$("#hindiRecordingBtnText").text(hindiFileName);
		    $("#recordingHindiFileName").attr("value",hindiFileName);
		    var englishFileName=selvalue[3];
 		    //$("#englishRecordingBtnText").text(englishFileName);
		    $("#recordingEnglishFileName").attr("value",englishFileName);
		    var regionalFileName=selvalue[4];
		    //$("#regionalRecordingBtnText").text(regionalFileName);
		    $("#recordingRegionalFileName").attr("value",regionalFileName);
		    var hindiFilePath=selvalue[5];
		    $("#recordingHindiPath").attr("value",hindiFilePath);
		    var englishFilePath=selvalue[6];
		    $("#recordingEnglishPath").attr("value",englishFilePath);
		    var regionalFilePath=selvalue[7];
		    $("#recordingRegionalPath").attr("value",regionalFilePath);
   	   }else if(len>1){
   		  swal("Select only one Announcement");  
   	   }else if(len<1){
   		  swal("No Announcement is selected");  
   	   }
   });
  
  //------------------------------------------------------------------------
  
  $("#removeRecording").click(function(){ 
	  var len=$(".recordingList option:selected").length;
  	  if (len>0) {
	  var recording=" ";
	  $('.recordingList option:selected').each(function(i, selected){ 
		  recording= recording+","+$(selected).val();
	  });
	  
	  $('#processing').css("display","block"); 
	  
	  $.getJSON("removeRecording?recording="+recording.replace(" ,",""),function(data){
		  
		     if(data.result=="success"){
				 window.location.href="soundRecording";
				 if(<s:property value="process"/>=="done"){
				   $('#processing').css("display","none");
				 }
			 } 
      });
	  
  	  }else{
  		swal("No Announcement is selected");  
  	  }
  	  
  });
  
 //------------------------------------------------------------------------
  
  $("#addRecordingToPlaylist").click(function(){ 
	  var len=$(".recordingList option:selected").length;
  	  if (len>0) {
	  var recording=" ";
	  $('.recordingList option:selected').each(function(i, selected){ 
		  recording= recording+","+$(selected).val();
	  });
	  
	  $('#processing').css("display","block");
	  
	  $.getJSON("addRecordingToPlaylist?recording="+recording.replace(" ,",""),function(data){
		  
		     if(data.result=="success"){
				 window.location.href="soundRecording";
				 if(<s:property value="process"/>=="done"){
				   $('#processing').css("display","none");
				 }
			 } 
      });
	  
  	  }else{
  		swal("No Announcement is selected");  
  	  }
  	  
  });
  
//------------------------------------------------------------------------
  
  $("#removeFromPlaylist").click(function(){ 
	  var len=$(".playList option:selected").length;
  	  if (len>0) {
	  var ancList=" ";
	  $('.playList option:selected').each(function(i, selected){ 
		  ancList= ancList+","+$(selected).val();
	  });
	  
	  $('#processing').css("display","block"); 
	  
	  $.getJSON("removeFromPlaylist?ancList="+ancList.replace(" ,",""),function(data){
		  
		     if(data.result=="success"){
				 window.location.href="soundRecording";
				 if(<s:property value="process"/>=="done"){
				   $('#processing').css("display","none");
				 } 
			 }	 
      }); 
	  
  	  }else{
  		swal("No Announcement is selected");  
  	  }
  	  
  });
  
  //------------------------------------------------------------------------
  
  
  $("#clearPlaylist").click(function(){ 
	  
	  window.location.href="clearRecordingPlaylist"; 
	  
  });
  

  //------------------------------------------------------------------------
  
  
  $("#up").click(function(){ 
	  
	  var len=$(".playList option:selected").length; 
	  var first = $('.playList option[value!=""]:first').val();
	  
	  if(len==1){
	  
		  if($('.playList option:selected').val()==first){
			  swal("Already On Top Position");
		  }else{
			  
			  $('#processing').css("display","block"); 
			  
			  $.getJSON("swapCurrentAnc?id1="+$('.playList option:selected').val()+"&id2="+$('.playList option:selected').prev().val(),function(data){
				  
				    if(data.result=="success"){
						 window.location.href="soundRecording";
						 if(<s:property value="process"/>=="done"){
						   $('#processing').css("display","none");
						 } 
					 }	 
		      }); 
				  
		  }
		  
	  }else{
		  
		  swal("Please Select Only One Announcement");
		  
	  }
	  
	  
  });
  
  //------------------------------------------------------------------------
  
  $("#down").click(function(){ 
	  
	  var len=$(".playList option:selected").length;
	  var last = $('.playList option[value!=""]:last').val();
	  
	  if(len==1){
	  
		  if($('.playList option:selected').val()==last){
			  swal("Already On Last Position");
		  }else{

			  $('#processing').css("display","block");
			  
			  $.getJSON("swapCurrentAnc?id1="+$('.playList option:selected').val()+"&id2="+$('.playList option:selected').next().val(),function(data){
				    
				     if(data.result=="success"){
						 window.location.href="soundRecording";
						 if(<s:property value="process"/>=="done"){
						   $('#processing').css("display","none");
						 }
					 }	 
		      }); 
			  
		  }
	  
	  }else{
		  
		  swal("Please Select Only One Announcement");
		  
	  }
	  
	  
  });
  
  
  //------------------------------------------------------------------------
  
  $('#play').click(function(){
  	var repeate=$("#repeate").val(); //alert(repeate);
  	$.getJSON("ancRequest?command=play&repeate="+repeate,function(data){
		   if(data.result!=null)
		   swal(data.result);
    });
  });
  
  $('#stop').click(function(){
  	var repeate=$("#repeate").val(); //alert(repeate);
  	$.getJSON("ancRequest?command=stop&repeate="+repeate,function(data){
			 console.log( "Announcement Stopped" );	 
       });
  });
  
   
   //------------------------------------------------------------------------
  
   
 });
   
 </script>
 
 <script type="text/javascript">

	document.getElementById("leftRange").oninput=function(){
		val=this.value;
		document.getElementById('lefPosition').value=val;
		document.getElementById('lefPositionValue').innerHTML=val;
	};
	
</script>

<script type="text/javascript" src="../js/time.js"></script>  
 <!-- ----------------------------------------------------- -->
 
 
</body>
</html>