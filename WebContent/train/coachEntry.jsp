<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Coach Entry</title>
<link rel="stylesheet" href="../css/style.css">
<link href="../Select2/select2.min.css" type="text/css" rel="stylesheet"> 
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


<style type="text/css">

#coachEntry{
width:550px;
margin-left: 60px;
background: rgba(0, 0, 0, 0.68);
}
#coachEntry table tr td input{
text-align: center;
}
</style>

<style type="text/css">
.auto-completer{
   width:80px;
}
</style>

<style type="text/css">
/*change color of selected coach*/
.style{
  background:#CD514F;
}
/*hide selected option from select2 search box*/
.select2-results__option[aria-selected=true] {
    display: none;
}
</style>

</head>
<body>
<div style="background: #111">
   <img src="../images/header2.png" width="100%" height="100" alt="header2"/>
<ul>

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
<li style=" float: left;"><a href="help.jsp">Help</a></li>
<li style="float: right"><a href="../logout">Logout</a></li>
<li style="float: right"><a href="../user/changePassword"><s:property value="#session['user'].userId" /></a></li>
 	<li style="float: right"><span style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;" id="time"></span></li>                               
</ul>
</div>
<div style="width: 100%;  color: white;">
<ul style=" background-color: #222213">
<li style="display: block;color: white;text-align: center;padding: 3px 20px;text-decoration: none;float: left;" ><img src="../images/arrow.PNG" style="margin-bottom: -5px">Setup</li>
<li style="display: block;color: white;text-align: center;padding: 3px 20px;text-decoration: none;float: left;" ><img src="../images/arrow.PNG" style="margin-bottom: -5px">Master</li>
<li style="display: block;color: white;text-align: center;padding: 3px 20px;text-decoration: none;float: left;" ><img src="../images/arrow.PNG" style="margin-bottom: -5px">Coach Position</li>
</ul>
</div>	
		
<div id="nav">
<div id='cssmenu'>
<ul>
   <li><a href='../setup/getStationDetail'>Station Master</a></li>
    <li><a href='../setup/getIntegration'>Integration / NTES</a></li>
   <li><a href='../setup/getServerDetail'>Server Master</a></li>
   <li><a href='../setup/getLanguageList'>Language Master</a></li>
   <li><a href='../setup/getTrainStatusList'>Status Master</a></li>
     <li><a href='getAllTrainList'>Train Master</a></li>
   <li class='active'><a href='coachEntry'>Coach Position</a></li>
   <li><a href='../setup/setup.jsp'>Back</a></li>
</ul>
</div>
</div>

<div  style=" background: rgba(0, 0, 0, 0.68); width: 80%; display: inline-block;margin-left: 25px; color: white;">
<center>

<h2 style="text-align: center">Coach Entry</h2>

<form method="post" action="getCoachDetail" style="width: 50%" id="getCoachDetailForm">
<div id="buttons" style="text-align: center"><label>Train No : </label>
<select class="js-example-placeholder-single js-states form-control" id="trainList" name="coach.trainId" style="width: 30%" >
<option value='<s:property value="coach.trainId"/>' style="display: none;"><s:property value="coach.trainNo"/></option>
<s:iterator value="trainList">
<option value='<s:property value="id"/>'><s:property value="trainNo"/></option>
</s:iterator>
 </select> 
<input type="hidden" name="coach.trainNo" id="train_No">

 <button class="btn purple" id="getDetail">Get Detail</button>
                    
 </div>
<!-- <button>Get Detail</button> -->
<br>
<span style="color:orange;font-size: 18px;">
<s:property value="result"/>
</span>
</form>


<form method="post" action="saveCoachDetail" id="coachDetail">
<s:if test="%{coach.id!=0}">
<input type="hidden" name="coach.id" id="coachId" value='<s:property value="coach.id"/>'>
</s:if>
<input type="hidden" name="coach.trainId" id="trainId" value='<s:property value="coach.trainId"/>'>
<input type="hidden" name="coach.trainNo" id="trainNo" value='<s:property value="coach.trainNo"/>'>
<table cellspacing="10">
<tr>
<td><label>C1</label></td>
<td>
<select class="auto-completer" name="coach.coach1" id="C1">
   <option value="<s:property value="coach.coach1"/>" ><s:property value="coach.coach1"/></option>
   <s:iterator value="coachCaptionList">
    <option value='<s:property value="coachNameEnglish"/>' ><s:property value="coachNameEnglish"/></option>
   </s:iterator>
 </select>
</td>
<td><label>C2</label></td>
<td>
<select class="auto-completer" name="coach.coach2" id="C2">
   <option value="<s:property value="coach.coach2"/>" ><s:property value="coach.coach2"/></option>
   <s:iterator value="coachCaptionList">
    <option value='<s:property value="coachNameEnglish"/>' ><s:property value="coachNameEnglish"/></option>
   </s:iterator>
 </select>
</td>
<td><label>C3</label></td>
<td>
<select class="auto-completer" name="coach.coach3" id="C3">
   <option value="<s:property value="coach.coach3"/>" ><s:property value="coach.coach3"/></option>
   <s:iterator value="coachCaptionList">
    <option value='<s:property value="coachNameEnglish"/>' ><s:property value="coachNameEnglish"/></option>
   </s:iterator>
 </select>
</td>
<td><label>C4</label></td>
<td>
<select class="auto-completer" name="coach.coach4" id="C4">
   <option value="<s:property value="coach.coach4"/>" ><s:property value="coach.coach4"/></option>
   <s:iterator value="coachCaptionList">
    <option value='<s:property value="coachNameEnglish"/>' ><s:property value="coachNameEnglish"/></option>
   </s:iterator>
 </select>
</td>
<td><label>C5</label></td>
<td>
<select class="auto-completer" name="coach.coach5" id="C5">
   <option value="<s:property value="coach.coach5"/>" ><s:property value="coach.coach5"/></option>
   <s:iterator value="coachCaptionList">
    <option value='<s:property value="coachNameEnglish"/>' ><s:property value="coachNameEnglish"/></option>
   </s:iterator>
 </select>
</td>
<td><label>C6</label></td>
<td>
<select class="auto-completer" name="coach.coach6" id="C6">
   <option value="<s:property value="coach.coach6"/>" ><s:property value="coach.coach6"/></option>
   <s:iterator value="coachCaptionList">
    <option value='<s:property value="coachNameEnglish"/>' ><s:property value="coachNameEnglish"/></option>
   </s:iterator>
 </select>
</td>
</tr>

<tr>
<td><label>C7</label></td>
<td>
<select class="auto-completer" name="coach.coach7" id="C7">
   <option value="<s:property value="coach.coach7"/>" ><s:property value="coach.coach7"/></option>
   <s:iterator value="coachCaptionList">
    <option value='<s:property value="coachNameEnglish"/>' ><s:property value="coachNameEnglish"/></option>
   </s:iterator>
 </select>
</td>
<td><label>C8</label></td>
<td>
<select class="auto-completer" name="coach.coach8" id="C8">
   <option value="<s:property value="coach.coach8"/>" ><s:property value="coach.coach8"/></option>
   <s:iterator value="coachCaptionList">
    <option value='<s:property value="coachNameEnglish"/>' ><s:property value="coachNameEnglish"/></option>
   </s:iterator>
 </select>
</td>
<td><label>C9</label></td>
<td>
<select class="auto-completer" name="coach.coach9" id="C9">
   <option value="<s:property value="coach.coach9"/>" ><s:property value="coach.coach9"/></option>
   <s:iterator value="coachCaptionList">
    <option value='<s:property value="coachNameEnglish"/>' ><s:property value="coachNameEnglish"/></option>
   </s:iterator>
 </select>
</td>
<td><label>C10</label></td>
<td>
<select class="auto-completer" name="coach.coach10" id="C10">
   <option value="<s:property value="coach.coach10"/>" ><s:property value="coach.coach10"/></option>
   <s:iterator value="coachCaptionList">
    <option value='<s:property value="coachNameEnglish"/>' ><s:property value="coachNameEnglish"/></option>
   </s:iterator>
 </select>
</td>
<td><label>C11</label></td>
<td>
<select class="auto-completer" name="coach.coach11" id="C11">
   <option value="<s:property value="coach.coach11"/>" ><s:property value="coach.coach11"/></option>
   <s:iterator value="coachCaptionList">
    <option value='<s:property value="coachNameEnglish"/>' ><s:property value="coachNameEnglish"/></option>
   </s:iterator>
 </select>
</td>
<td><label>C12</label></td>
<td>
<select class="auto-completer" name="coach.coach12" id="C12">
   <option value="<s:property value="coach.coach12"/>" ><s:property value="coach.coach12"/></option>
   <s:iterator value="coachCaptionList">
    <option value='<s:property value="coachNameEnglish"/>' ><s:property value="coachNameEnglish"/></option>
   </s:iterator>
 </select>
</td>
</tr>

<tr>
<td><label>C13</label></td>
<td>
<select class="auto-completer" name="coach.coach13" id="C13">
   <option value="<s:property value="coach.coach13"/>" ><s:property value="coach.coach13"/></option>
   <s:iterator value="coachCaptionList">
    <option value='<s:property value="coachNameEnglish"/>' ><s:property value="coachNameEnglish"/></option>
   </s:iterator>
 </select>
</td>
<td><label>C14</label></td>
<td>
<select class="auto-completer" name="coach.coach14" id="C14">
   <option value="<s:property value="coach.coach14"/>" ><s:property value="coach.coach14"/></option>
   <s:iterator value="coachCaptionList">
    <option value='<s:property value="coachNameEnglish"/>' ><s:property value="coachNameEnglish"/></option>
   </s:iterator>
 </select>
</td>
<td><label>C15</label></td>
<td>
<select class="auto-completer" name="coach.coach15" id="C15">
   <option value="<s:property value="coach.coach15"/>" ><s:property value="coach.coach15"/></option>
   <s:iterator value="coachCaptionList">
    <option value='<s:property value="coachNameEnglish"/>' ><s:property value="coachNameEnglish"/></option>
   </s:iterator>
 </select>
</td>
<td><label>C16</label></td>
<td>
<select class="auto-completer" name="coach.coach16" id="C16">
   <option value="<s:property value="coach.coach16"/>" ><s:property value="coach.coach16"/></option>
   <s:iterator value="coachCaptionList">
    <option value='<s:property value="coachNameEnglish"/>' ><s:property value="coachNameEnglish"/></option>
   </s:iterator>
 </select>
</td>
<td><label>C17</label></td>
<td>
<select class="auto-completer" name="coach.coach17" id="C17">
   <option value="<s:property value="coach.coach17"/>" ><s:property value="coach.coach17"/></option>
   <s:iterator value="coachCaptionList">
    <option value='<s:property value="coachNameEnglish"/>' ><s:property value="coachNameEnglish"/></option>
   </s:iterator>
 </select>
</td>
<td><label>C18</label></td>
<td>
<select class="auto-completer" name="coach.coach18" id="C18">
   <option value="<s:property value="coach.coach18"/>" ><s:property value="coach.coach18"/></option>
   <s:iterator value="coachCaptionList">
    <option value='<s:property value="coachNameEnglish"/>' ><s:property value="coachNameEnglish"/></option>
   </s:iterator>
 </select>
</td>
</tr>


<tr>
<td><label>C19</label></td>
<td>
<select class="auto-completer" name="coach.coach19" id="C19">
   <option value="<s:property value="coach.coach19"/>" ><s:property value="coach.coach19"/></option>
   <s:iterator value="coachCaptionList">
    <option value='<s:property value="coachNameEnglish"/>' ><s:property value="coachNameEnglish"/></option>
   </s:iterator>
 </select>
</td>
<td><label>C20</label></td>
<td>
<select class="auto-completer" name="coach.coach20" id="C20">
   <option value="<s:property value="coach.coach20"/>" ><s:property value="coach.coach20"/></option>
   <s:iterator value="coachCaptionList">
    <option value='<s:property value="coachNameEnglish"/>' ><s:property value="coachNameEnglish"/></option>
   </s:iterator>
 </select>
</td>
<td><label>C21</label></td>
<td>
<select class="auto-completer" name="coach.coach21" id="C21">
   <option value="<s:property value="coach.coach21"/>" ><s:property value="coach.coach21"/></option>
   <s:iterator value="coachCaptionList">
    <option value='<s:property value="coachNameEnglish"/>' ><s:property value="coachNameEnglish"/></option>
   </s:iterator>
 </select>
</td>
<td><label>C22</label></td>
<td>
<select class="auto-completer" name="coach.coach22" id="C22">
   <option value="<s:property value="coach.coach22"/>" ><s:property value="coach.coach22"/></option>
   <s:iterator value="coachCaptionList">
    <option value='<s:property value="coachNameEnglish"/>' ><s:property value="coachNameEnglish"/></option>
   </s:iterator>
 </select>
</td>
<td><label>C23</label></td>
<td>
<select class="auto-completer" name="coach.coach23" id="C23">
   <option value="<s:property value="coach.coach23"/>" ><s:property value="coach.coach23"/></option>
   <s:iterator value="coachCaptionList">
    <option value='<s:property value="coachNameEnglish"/>' ><s:property value="coachNameEnglish"/></option>
   </s:iterator>
 </select>
</td>
<td><label>C24</label></td>
<td>
<select class="auto-completer" name="coach.coach24" id="C24">
   <option value="<s:property value="coach.coach24"/>" ><s:property value="coach.coach24"/></option>
   <s:iterator value="coachCaptionList">
    <option value='<s:property value="coachNameEnglish"/>' ><s:property value="coachNameEnglish"/></option>
   </s:iterator>
 </select>
</td></tr>

<tr>

<td><label>C25</label></td>
<td>
<select class="auto-completer" name="coach.coach25" id="C25">
   <option value="<s:property value="coach.coach25"/>" ><s:property value="coach.coach25"/></option>
   <s:iterator value="coachCaptionList">
    <option value='<s:property value="coachNameEnglish"/>' ><s:property value="coachNameEnglish"/></option>
   </s:iterator>
 </select>
</td>
<td><label>C26</label></td>
<td>
<select class="auto-completer" name="coach.coach26" id="C26">
   <option value="<s:property value="coach.coach26"/>" ><s:property value="coach.coach26"/></option>
   <s:iterator value="coachCaptionList">
    <option value='<s:property value="coachNameEnglish"/>' ><s:property value="coachNameEnglish"/></option>
   </s:iterator>
 </select>
</td>
<td><label>C27</label></td>
<td>
<select class="auto-completer" name="coach.coach27" id="C27">
   <option value="<s:property value="coach.coach27"/>" ><s:property value="coach.coach27"/></option>
   <s:iterator value="coachCaptionList">
    <option value='<s:property value="coachNameEnglish"/>' ><s:property value="coachNameEnglish"/></option>
   </s:iterator>
 </select>
</td>
<td><label>C28</label></td>
<td>
<select class="auto-completer" name="coach.coach28" id="C28">
   <option value="<s:property value="coach.coach28"/>" ><s:property value="coach.coach28"/></option>
   <s:iterator value="coachCaptionList">
    <option value='<s:property value="coachNameEnglish"/>' ><s:property value="coachNameEnglish"/></option>
   </s:iterator>
 </select>
</td>
<td><label>C29</label></td>
<td>
<select class="auto-completer" name="coach.coach29" id="C29">
   <option value="<s:property value="coach.coach29"/>" ><s:property value="coach.coach29"/></option>
   <s:iterator value="coachCaptionList">
    <option value='<s:property value="coachNameEnglish"/>' ><s:property value="coachNameEnglish"/></option>
   </s:iterator>
 </select>
</td>
<td><label>C30</label></td>
<td>
<select class="auto-completer" name="coach.coach30" id="C30">
   <option value="<s:property value="coach.coach30"/>" ><s:property value="coach.coach30"/></option>
   <s:iterator value="coachCaptionList">
    <option value='<s:property value="coachNameEnglish"/>' ><s:property value="coachNameEnglish"/></option>
   </s:iterator>
 </select>
</td>
</tr>
</table><br>
<div id="buttons" style="text-align: center">
<div style="display: inline-block;padding-bottom: -20px;">
   <a href="#" style="font-size: 14px;padding: 5px 16px;" class="btn button2 insertCoach" id='insertCoach'>Insert</a>
   <a href="#" style="font-size: 14px;padding: 5px 16px;" class="btn purple deleteCoach" id='deleteCoach'>Delete</a>
   <a href="#" style="font-size: 14px;padding: 5px 16px;" class="btn button4 shiftLeft" id='shiftLeft'>Shift Left</a>
   <a href="#" style="font-size: 14px;padding: 5px 7px;" class="btn button4 shiftRight" id='shiftRight'>Shift Right</a>
   <a href="#" style="font-size: 14px;padding: 5px 7px;" class="btn button5 reverseCoach" id='reverse'>Reverse</a>
</div><br><br>
<button  class="btn purple" id="delete">Delete Coach Position</button>
 <button class="btn orange" id="save">Save Coach Position</button>
 <br><br>                  
 </div>
<!-- <button>Save</button> -->
</form>
</center>

</div>

<div id="footer"><p>&copy; 2016 Dan Electronic System Pvt. Ltd.<p></div>
<script type="text/javascript" src="../js/jquery-2.1.4.js"></script>
<script type="text/javascript" src="../js/blockUI.js"></script> 
<script type="text/javascript" src="../Select2/select2.full.js"></script>
<script src="../sweetalert-master/dist/sweetalert-dev.js"></script>
<script type="text/javascript">
$( document ).ready(function() {

	$(".js-example-placeholder-single").select2({
	    placeholder: "Select a Trainno",
	    allowClear: true
	});
	
 $('#trainList').change(function(){
	 $('#trainId').attr('value',this.value);
     var text=$("#trainList option:selected").text();
     $('#train_No').attr('value',text);
     $('#trainNo').attr('value',text);
	     
	     
  });
 
//----------------Initialize Auto Completer---------------------

 $(".auto-completer").select2();

//---------------Reverse,Insert,Delete,Left Shift,Right Shift--------------------
	
   var arr=[];
   var selectedId="";

	$(".select2-selection__rendered").click(function(){
		
		selectedId=this.id; //alert(selectedId);
		
		$(".select2-selection__rendered").each(function () {
			$(this).removeClass( "style" );
		});
		
		$(this).addClass( "style" );
		
	});

	//--------------Reverse Coach position------------------------

	$(".reverseCoach").click(function(){ 
		
		for(var i=1;i<=30;i++){
			arr[i-1]=$("#select2-C"+i+"-container").text();
		}
		
		var revArray=arr.reverse();
		
		for(var i=0;i<30;i++){  //alert(arr.reverse()[i]);
			$("#select2-C"+(i+1)+"-container").text(revArray[i]);
		    $("#C"+(i+1)+" option:selected").val(revArray[i]);
		}
	
 });
	
	//--------------Delete Selected Coach------------------------
	
	$(".deleteCoach").click(function(){ 
		
		if(selectedId!=""){
		
		    var no=parseInt(selectedId.split("-")[1].split("_")[0].substring(1));
		
			for(var i=1,j=no;j<=30;i++,j++){
				arr[i-1]=$("#select2-C"+j+"-container").text();
			}
			
			for(var i=0,j=no;i<arr.length;i++,j++){  //alert(arr[i]);
				$("#select2-C"+(j)+"-container").text("");
			    $("#C"+(j)+" option:selected").val("");
			}
			
			for(var i=0,j=no;i<arr.length-1;i++,j++){  //alert(arr[i]);
				$("#select2-C"+(j)+"-container").text(arr[i+1]);
			    $("#C"+(j)+" option:selected").val(arr[i+1]);
			}
		
		}else{
			
			swal("Can't delete! Please Select a Coach First");
			
		}
		
 });
	
//--------------Insert New Coach------------------------
	
	$(".insertCoach").click(function(){ 
		
		if(selectedId!=""){
		
			var no=parseInt(selectedId.split("-")[1].split("_")[0].substring(1));
			  
			for(var i=1,j=no;j<=30;i++,j++){
				arr[i-1]=$("#select2-C"+j+"-container").text();
			}
			//alert(arr);
			for(var i=0,j=no;i<arr.length;i++,j++){  //alert(arr[i]);
				$("#select2-C"+(j)+"-container").text("");
			    $("#C"+(j)+" option:selected").val("");
			}
			
			for(var i=0,j=no;i<arr.length-1;i++,j++){  //alert(arr[i]);
				$("#select2-C"+(j+1)+"-container").text(arr[i]);
			    $("#C"+(j+1)+" option:selected").val(arr[i]);
			}
			
     }else{
			
    	 swal("Can't insert! Please Select a Coach First");
			
		}
		
 });

 //------------------Shift Left------------------------
	
	$(".shiftLeft").click(function(){ 
		 
		for(var i=1;i<=30;i++){
			arr[i-1]=$("#select2-C"+i+"-container").text();
		}
		//alert(arr);
		for(var i=0;i<arr.length;i++){  //alert(arr[i]);
			$("#select2-C"+(i+1)+"-container").text("");
		    $("#C"+(i+1)+" option:selected").val("");
		}
		
		for(var i=0;i<arr.length-1;i++){  //alert(arr[i]);
			$("#select2-C"+(i+1)+"-container").text(arr[i+1]);
		    $("#C"+(i+1)+" option:selected").val(arr[i+1]);
		}
		
 });
 
 //---------------------Shift Right------------------------
	
	$(".shiftRight").click(function(){ 
		 
		for(var i=1;i<=30;i++){
			arr[i-1]=$("#select2-C"+i+"-container").text();
		}
		//alert(arr);
		for(var i=0;i<arr.length;i++){  //alert(arr[i]);
			$("#select2-C"+(i+1)+"-container").text("");
		    $("#C"+(i+1)+" option:selected").val("");
		}
		
		for(var i=arr.length-1;i>0;i--){  //alert(arr[i]);
			$("#select2-C"+(i+1)+"-container").text(arr[i-1]);
		    $("#C"+(i+1)+" option:selected").val(arr[i-1]);
		}
		
 });
 
 $("#save").click(function(e){
	 e.preventDefault();
	 var trainNo=$("#trainNo").val();
	 
	 if(trainNo=="")
		 {
		 	swal("Please select a train first");
		 }
	 else 
		 {
		
		 	var i=0;
			$(".auto-completer").each(function(index)
			{
				
				if($(this).val()!="")
					{						
						return false;
					}
				i=index;
				
			});
			if(i<29)
				{
					$("#coachDetail").submit();
				}
			else
				{
					swal("Plaese Select at least one coach");
				}
		 }


 });
 
 
 $("#delete").click(function(e){
	 e.preventDefault();
	 var trainNo=$("#trainNo").val();
	 
	 if(trainNo=="")
		 {
		 	swal("Please select a train first");
		 }
	 else 
		 {
		 $("#coachDetail").attr("action","deleteCoachDetail").submit();
		 	var i=0;
			$(".auto-completer").each(function(index)
			{
				$(this).val()=="";
			});

		 }
	 


 });
 
 $('#getDetail').click(function(e){
	e.preventDefault();
	 var trainNo=$("#trainNo").val();
	 if(trainNo=="")
	 {
	 	swal("Please select a train first");
	 }
	 else 
	 {
	 $("#getCoachDetailForm").submit();
	 }
 });

//----------------------------------------------------------------
 	
});
</script>
<script type="text/javascript" src="../js/time.js"></script>  
</body>
</html>