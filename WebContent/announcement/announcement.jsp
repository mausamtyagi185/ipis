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
/*  width: 20px; */
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
margin-left:10%;
display: inline-block;
width:30px;
height:310px;
color:white;
text-align: center;
}

#language{
display: inline-block;
width:50%;
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
    padding: 10px 15px;
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
    <li ><a href='soundRecording'>Sound Recordings</a></li>
    <li class='active'><a href='ancSetting'>Announcement Settings</a></li>
    <li ><a href='recordSound'>Record Sound</a></li>
   
</ul>
</div>

</div>
<div id="left">

	
	
<!-- -------------------------------------------------------------------------------------------------- -->
	
	<div id="ancSettings"><h2 style="text-align: center;">Announcement Settings</h2>
	 <form method="post" action="saveAncSetting">
	    <hr><br>
	    <fieldset id="volumeControl">
	       <legend>Volume Control</legend>
	      
		   <input type="range" name="ancVolume" class="vert" id="leftRange" min="0" max="9" value="<s:property value="ancSettingList[0].ancVolume"/>"/>
		   <label id="lefPositionValue"></label><br>
		   <input type="hidden" id="lefPosition" value="<s:property value="ancSettingList[0].ancVolume"/>">
		   <input type="checkbox" id="mute" name="muteStatus" style="height: 20px;width: 20px;"    <s:if test='%{ancSettingList[0].muteStatus==true}'> checked  </s:if>> &nbsp;&nbsp;<label style="font-size: 20px">Mute</label>
		</fieldset>
		<fieldset id="language">
	       <legend>Select Language</legend>
	       <table class="table1"><thead>
	       <tr><th>Select</th><th>Language</th><th>UP</th><th>Down</th></tr></thead><tbody>
	      
	       <s:iterator value="ancSettingList" status="list">
	       <input type="hidden" name='ancSettingList[<s:property value="#list.index"/>].id' value='<s:property value="id"/>' >
	       <input type="hidden" name='ancSettingList[<s:property value="#list.index"/>].ancLanguage' value='<s:property value="ancLanguage"/>' >
	       <tr>
	       <td><input type="checkbox" name='ancSettingList[<s:property value="#list.index"/>].activeStatus' value="true" <s:if test="%{ancSettingList[#list.index].activeStatus==true}">checked</s:if> ></td>
	       <td><label><s:property value="ancSettingList[#list.index].ancLanguage"/></label></td>
	        <s:if test="%{#list.index==0}">
			  <td><font color="#428bca">UP</font></td>
			</s:if>
			<s:else>
			  <td><a href="swapAncLanguage?id1=<s:property value="id"/>&id2=<s:property value="ancSettingList[#list.index-1].id"/>"><font color="#428bca">UP</font></a></td>
			</s:else>
	        <s:if test="%{#list.index==ancSettingList.size()-1}">
			  <td><font color="#428bca">Down</font></td>
			</s:if>
			<s:else>
			  <td><a href="swapAncLanguage?id1=<s:property value="id"/>&id2=<s:property value="ancSettingList[#list.index+1].id"/>"><font color="#428bca">Down</font></a></td>
			</s:else>
	       </tr>
	       </s:iterator>
	      
	       </table>
	    </fieldset>
	    <br><div style="text-align: center;">
		<input type="image" src="../images/save_unactive.png" style=" width: 125px; height:45px; margin-top: -2px" ></div>
		</form>
		
	   <hr style="margin-bottom: 7px;">
	   
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
	  <!--  <button id="stop" class="button button3"style="width: 100px">Stop</button>
	   <button id="up" class="button button2"style="width: 100px">Up</button>
       <br>
       <button id="removeFromPlaylist" class="button button5" style="width: 100px">Remove</button>
	   <button id="clearPlaylist" class="button button6"style="width: 100px">Clear</button>
	   <button id="down" class="button button2"style="width: 100px">Down</button> -->
 
   </div>
    
</div>
</div> 


<div id="processing" style="position:absolute; top:0; bottom:0; left:0; right:0; margin-top:30%; margin-left:45%;background-color: white;width:10%;height:30%; display: none;">
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
				console.log( "Mute Volume true" );	 
			  });
		 }else{
			 $.getJSON("changeMuteStatus?status=false",function(data){
			    console.log( "Mute Volume false" );	 
		      });
		 }
	 });
	//--------------------------------------------------------
	
	$("#specialAnc").css("display","none");
	$("#soundRecordings").css("display","none");
	 
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
    
   //  ------------------------------------------------

//     $("#hindiSloganFile").change(function(){ 
//        var file=this.files[0];
//        $('#hindiSloganBtnText').text(file.name);
//     });
    
//     $("#englishSloganFile").change(function(){ 
//        var file=this.files[0];
//        $('#englishSloganBtnText').text(file.name);
//     });
//     $("#regionalSloganFile").change(function(){ 
//        var file=this.files[0];
//        $('#regionalSloganBtnText').text(file.name);
//     });
    
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
				 window.location.href="ancSetting";
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
	  
	  window.location.href="clearAncSettingPlaylist"; 
	  
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
						 window.location.href="ancSetting";
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
						 window.location.href="ancSetting";
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
   
   $('#startRecording').click(function(){
   	    $.getJSON("startRecording",function(data){
			 console.log( "Recording Started" );	 
        });
   });
   
   $('#stopRecording').click(function(){
  	    $.getJSON("stopRecording",function(data){
			 console.log( "Recording Stopped" );	 
       });
  });
   
  $('#playRecording').click(function(){
  	    $.getJSON("playRecording",function(data){
  	    	if(data.result!=null)
  	    	swal(data.result); 
       });
  });
  
  //------------------------------------------------------------------------
  
  $('#saveRecording').click(function(){
	   $("#labelmsg").text("Enter File Name");
	   $('#saveRecordingPopup').css("display","block"); 
  });
  
  $('#saveRecordingFile').click(function(){
	  var fileName=$("#recordingFileName").val();
	    $.getJSON("saveRecording?fileName="+fileName,function(data){
			 if(data.result=="done"){
				 $("#labelmsg").text("File Saved Successfully");
			 } 
				  
     });
  });
  
  $('#closeRecordingFile').click(function(){
	   $('#saveRecordingPopup').css("display","none"); 
  });
  
  //------------------------------------------------------------------------
   
 });
   
 </script>
 
 <script type="text/javascript">
 
    var val=<s:property value="ancSettingList[0].ancVolume"/>;
    var volume=[10,20,30,40,50,60,70,80,90,100];
	document.getElementById('lefPositionValue').innerHTML=volume[val];
 
	document.getElementById("leftRange").oninput=function(){
		val=this.value;
		document.getElementById('lefPosition').value=val;
		document.getElementById('lefPositionValue').innerHTML=volume[val];
	};
	
</script>

<script type="text/javascript" src="../js/time.js"></script>  
 <!-- ----------------------------------------------------- -->
 
 
</body>
</html>