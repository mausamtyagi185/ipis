<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Intensity Setting</title>
	<link rel="stylesheet" href="../css/intensity.css">
	<link rel="stylesheet" href="../sweetalert-master/dist/sweetalert.css">
<style type="text/css">
table.dataTable{width:100%;margin:0 auto;clear:both;border-collapse:separate;border-spacing:0}table.dataTable thead th,table.dataTable tfoot th{font-weight:bold}table.dataTable thead th,table.dataTable thead td{padding:10px 18px;border-bottom:1px solid #111}table.dataTable thead th:active,table.dataTable thead td:active{outline:none}table.dataTable tfoot th,table.dataTable tfoot td{padding:10px 18px 6px 18px;border-top:1px solid #111}table.dataTable thead .sorting,table.dataTable thead .sorting_asc,table.dataTable thead .sorting_desc{cursor:pointer;*cursor:hand}table.dataTable thead .sorting,table.dataTable thead .sorting_asc,table.dataTable thead .sorting_desc,table.dataTable thead .sorting_asc_disabled,table.dataTable thead .sorting_desc_disabled{background-repeat:no-repeat;background-position:center right}table.dataTable thead .sorting{background-image:url("../images/sort_both.png")}table.dataTable thead .sorting_asc{background-image:url("../images/sort_asc.png")}table.dataTable thead .sorting_desc{background-image:url("../images/sort_desc.png")}table.dataTable thead .sorting_asc_disabled{background-image:url("../images/sort_asc_disabled.png")}table.dataTable thead .sorting_desc_disabled{background-image:url("../images/sort_desc_disabled.png")}table.dataTable tbody tr{background-color:#ffffff}table.dataTable tbody tr.selected{background-color:#B0BED9}table.dataTable tbody th,table.dataTable tbody td{padding:8px 10px}table.dataTable.row-border tbody th,table.dataTable.row-border tbody td,table.dataTable.display tbody th,table.dataTable.display tbody td{border-top:1px solid #ddd}table.dataTable.row-border tbody tr:first-child th,table.dataTable.row-border tbody tr:first-child td,table.dataTable.display tbody tr:first-child th,table.dataTable.display tbody tr:first-child td{border-top:none}table.dataTable.cell-border tbody th,table.dataTable.cell-border tbody td{border-top:1px solid #ddd;border-right:1px solid #ddd}table.dataTable.cell-border tbody tr th:first-child,table.dataTable.cell-border tbody tr td:first-child{border-left:1px solid #ddd}table.dataTable.cell-border tbody tr:first-child th,table.dataTable.cell-border tbody tr:first-child td{border-top:none}table.dataTable.stripe tbody tr.odd,table.dataTable.display tbody tr.odd{background-color:#f9f9f9}table.dataTable.stripe tbody tr.odd.selected,table.dataTable.display tbody tr.odd.selected{background-color:#acbad4}table.dataTable.hover tbody tr:hover,table.dataTable.display tbody tr:hover{background-color:#f6f6f6}table.dataTable.hover tbody tr:hover.selected,table.dataTable.display tbody tr:hover.selected{background-color:#aab7d1}table.dataTable.order-column tbody tr>.sorting_1,table.dataTable.order-column tbody tr>.sorting_2,table.dataTable.order-column tbody tr>.sorting_3,table.dataTable.display tbody tr>.sorting_1,table.dataTable.display tbody tr>.sorting_2,table.dataTable.display tbody tr>.sorting_3{background-color:#fafafa}table.dataTable.order-column tbody tr.selected>.sorting_1,table.dataTable.order-column tbody tr.selected>.sorting_2,table.dataTable.order-column tbody tr.selected>.sorting_3,table.dataTable.display tbody tr.selected>.sorting_1,table.dataTable.display tbody tr.selected>.sorting_2,table.dataTable.display tbody tr.selected>.sorting_3{background-color:#acbad5}table.dataTable.display tbody tr.odd>.sorting_1,table.dataTable.order-column.stripe tbody tr.odd>.sorting_1{background-color:#f1f1f1}table.dataTable.display tbody tr.odd>.sorting_2,table.dataTable.order-column.stripe tbody tr.odd>.sorting_2{background-color:#f3f3f3}table.dataTable.display tbody tr.odd>.sorting_3,table.dataTable.order-column.stripe tbody tr.odd>.sorting_3{background-color:whitesmoke}table.dataTable.display tbody tr.odd.selected>.sorting_1,table.dataTable.order-column.stripe tbody tr.odd.selected>.sorting_1{background-color:#a6b4cd}table.dataTable.display tbody tr.odd.selected>.sorting_2,table.dataTable.order-column.stripe tbody tr.odd.selected>.sorting_2{background-color:#a8b5cf}table.dataTable.display tbody tr.odd.selected>.sorting_3,table.dataTable.order-column.stripe tbody tr.odd.selected>.sorting_3{background-color:#a9b7d1}table.dataTable.display tbody tr.even>.sorting_1,table.dataTable.order-column.stripe tbody tr.even>.sorting_1{background-color:#fafafa}table.dataTable.display tbody tr.even>.sorting_2,table.dataTable.order-column.stripe tbody tr.even>.sorting_2{background-color:#fcfcfc}table.dataTable.display tbody tr.even>.sorting_3,table.dataTable.order-column.stripe tbody tr.even>.sorting_3{background-color:#fefefe}table.dataTable.display tbody tr.even.selected>.sorting_1,table.dataTable.order-column.stripe tbody tr.even.selected>.sorting_1{background-color:#acbad5}table.dataTable.display tbody tr.even.selected>.sorting_2,table.dataTable.order-column.stripe tbody tr.even.selected>.sorting_2{background-color:#aebcd6}table.dataTable.display tbody tr.even.selected>.sorting_3,table.dataTable.order-column.stripe tbody tr.even.selected>.sorting_3{background-color:#afbdd8}table.dataTable.display tbody tr:hover>.sorting_1,table.dataTable.order-column.hover tbody tr:hover>.sorting_1{background-color:#eaeaea}table.dataTable.display tbody tr:hover>.sorting_2,table.dataTable.order-column.hover tbody tr:hover>.sorting_2{background-color:#ececec}table.dataTable.display tbody tr:hover>.sorting_3,table.dataTable.order-column.hover tbody tr:hover>.sorting_3{background-color:#efefef}table.dataTable.display tbody tr:hover.selected>.sorting_1,table.dataTable.order-column.hover tbody tr:hover.selected>.sorting_1{background-color:#a2aec7}table.dataTable.display tbody tr:hover.selected>.sorting_2,table.dataTable.order-column.hover tbody tr:hover.selected>.sorting_2{background-color:#a3b0c9}table.dataTable.display tbody tr:hover.selected>.sorting_3,table.dataTable.order-column.hover tbody tr:hover.selected>.sorting_3{background-color:#a5b2cb}table.dataTable.no-footer{border-bottom:1px solid #111}table.dataTable.nowrap th,table.dataTable.nowrap td{white-space:nowrap}table.dataTable.compact thead th,table.dataTable.compact thead td{padding:4px 17px 4px 4px}table.dataTable.compact tfoot th,table.dataTable.compact tfoot td{padding:4px}table.dataTable.compact tbody th,table.dataTable.compact tbody td{padding:4px}table.dataTable th.dt-left,table.dataTable td.dt-left{text-align:left}table.dataTable th.dt-center,table.dataTable td.dt-center,table.dataTable td.dataTables_empty{text-align:center}table.dataTable th.dt-right,table.dataTable td.dt-right{text-align:right}table.dataTable th.dt-justify,table.dataTable td.dt-justify{text-align:justify}table.dataTable th.dt-nowrap,table.dataTable td.dt-nowrap{white-space:nowrap}table.dataTable thead th.dt-head-left,table.dataTable thead td.dt-head-left,table.dataTable tfoot th.dt-head-left,table.dataTable tfoot td.dt-head-left{text-align:left}table.dataTable thead th.dt-head-center,table.dataTable thead td.dt-head-center,table.dataTable tfoot th.dt-head-center,table.dataTable tfoot td.dt-head-center{text-align:center}table.dataTable thead th.dt-head-right,table.dataTable thead td.dt-head-right,table.dataTable tfoot th.dt-head-right,table.dataTable tfoot td.dt-head-right{text-align:right}table.dataTable thead th.dt-head-justify,table.dataTable thead td.dt-head-justify,table.dataTable tfoot th.dt-head-justify,table.dataTable tfoot td.dt-head-justify{text-align:justify}table.dataTable thead th.dt-head-nowrap,table.dataTable thead td.dt-head-nowrap,table.dataTable tfoot th.dt-head-nowrap,table.dataTable tfoot td.dt-head-nowrap{white-space:nowrap}table.dataTable tbody th.dt-body-left,table.dataTable tbody td.dt-body-left{text-align:left}table.dataTable tbody th.dt-body-center,table.dataTable tbody td.dt-body-center{text-align:center}table.dataTable tbody th.dt-body-right,table.dataTable tbody td.dt-body-right{text-align:right}table.dataTable tbody th.dt-body-justify,table.dataTable tbody td.dt-body-justify{text-align:justify}table.dataTable tbody th.dt-body-nowrap,table.dataTable tbody td.dt-body-nowrap{white-space:nowrap}table.dataTable,table.dataTable th,table.dataTable td{-webkit-box-sizing:content-box;box-sizing:content-box}.dataTables_wrapper{position:relative;clear:both;*zoom:1;zoom:1}.dataTables_wrapper .dataTables_length{float:left}.dataTables_wrapper .dataTables_filter{float:right;text-align:right}.dataTables_wrapper .dataTables_filter input{margin-left:0.5em}.dataTables_wrapper .dataTables_info{clear:both;float:left;padding-top:0.755em}.dataTables_wrapper .dataTables_paginate{float:right;text-align:right;padding-top:0.25em}.dataTables_wrapper .dataTables_paginate .paginate_button{box-sizing:border-box;display:inline-block;min-width:1.5em;padding:0.5em 1em;margin-left:2px;text-align:center;text-decoration:none !important;cursor:pointer;*cursor:hand;color:#333 !important;border:1px solid transparent;border-radius:2px}.dataTables_wrapper .dataTables_paginate .paginate_button.current,.dataTables_wrapper .dataTables_paginate .paginate_button.current:hover{color:#333 !important;border:1px solid #979797;background-color:white;background:-webkit-gradient(linear, left top, left bottom, color-stop(0%, #fff), color-stop(100%, #dcdcdc));background:-webkit-linear-gradient(top, #fff 0%, #dcdcdc 100%);background:-moz-linear-gradient(top, #fff 0%, #dcdcdc 100%);background:-ms-linear-gradient(top, #fff 0%, #dcdcdc 100%);background:-o-linear-gradient(top, #fff 0%, #dcdcdc 100%);background:linear-gradient(to bottom, #fff 0%, #dcdcdc 100%)}.dataTables_wrapper .dataTables_paginate .paginate_button.disabled,.dataTables_wrapper .dataTables_paginate .paginate_button.disabled:hover,.dataTables_wrapper .dataTables_paginate .paginate_button.disabled:active{cursor:default;color:#666 !important;border:1px solid transparent;background:transparent;box-shadow:none}.dataTables_wrapper .dataTables_paginate .paginate_button:hover{color:white !important;border:1px solid #111;background-color:#585858;background:-webkit-gradient(linear, left top, left bottom, color-stop(0%, #585858), color-stop(100%, #111));background:-webkit-linear-gradient(top, #585858 0%, #111 100%);background:-moz-linear-gradient(top, #585858 0%, #111 100%);background:-ms-linear-gradient(top, #585858 0%, #111 100%);background:-o-linear-gradient(top, #585858 0%, #111 100%);background:linear-gradient(to bottom, #585858 0%, #111 100%)}.dataTables_wrapper .dataTables_paginate .paginate_button:active{outline:none;background-color:#2b2b2b;background:-webkit-gradient(linear, left top, left bottom, color-stop(0%, #2b2b2b), color-stop(100%, #0c0c0c));background:-webkit-linear-gradient(top, #2b2b2b 0%, #0c0c0c 100%);background:-moz-linear-gradient(top, #2b2b2b 0%, #0c0c0c 100%);background:-ms-linear-gradient(top, #2b2b2b 0%, #0c0c0c 100%);background:-o-linear-gradient(top, #2b2b2b 0%, #0c0c0c 100%);background:linear-gradient(to bottom, #2b2b2b 0%, #0c0c0c 100%);box-shadow:inset 0 0 3px #111}.dataTables_wrapper .dataTables_paginate .ellipsis{padding:0 1em}.dataTables_wrapper .dataTables_processing{position:absolute;top:50%;left:50%;width:100%;height:40px;margin-left:-50%;margin-top:-25px;padding-top:20px;text-align:center;font-size:1.2em;background-color:white;background:-webkit-gradient(linear, left top, right top, color-stop(0%, rgba(255,255,255,0)), color-stop(25%, rgba(255,255,255,0.9)), color-stop(75%, rgba(255,255,255,0.9)), color-stop(100%, rgba(255,255,255,0)));background:-webkit-linear-gradient(left, rgba(255,255,255,0) 0%, rgba(255,255,255,0.9) 25%, rgba(255,255,255,0.9) 75%, rgba(255,255,255,0) 100%);background:-moz-linear-gradient(left, rgba(255,255,255,0) 0%, rgba(255,255,255,0.9) 25%, rgba(255,255,255,0.9) 75%, rgba(255,255,255,0) 100%);background:-ms-linear-gradient(left, rgba(255,255,255,0) 0%, rgba(255,255,255,0.9) 25%, rgba(255,255,255,0.9) 75%, rgba(255,255,255,0) 100%);background:-o-linear-gradient(left, rgba(255,255,255,0) 0%, rgba(255,255,255,0.9) 25%, rgba(255,255,255,0.9) 75%, rgba(255,255,255,0) 100%);background:linear-gradient(to right, rgba(255,255,255,0) 0%, rgba(255,255,255,0.9) 25%, rgba(255,255,255,0.9) 75%, rgba(255,255,255,0) 100%)}.dataTables_wrapper .dataTables_length,.dataTables_wrapper .dataTables_filter,.dataTables_wrapper .dataTables_info,.dataTables_wrapper .dataTables_processing,.dataTables_wrapper .dataTables_paginate{color:#333}.dataTables_wrapper .dataTables_scroll{clear:both}.dataTables_wrapper .dataTables_scroll div.dataTables_scrollBody{*margin-top:-1px;-webkit-overflow-scrolling:touch}.dataTables_wrapper .dataTables_scroll div.dataTables_scrollBody th,.dataTables_wrapper .dataTables_scroll div.dataTables_scrollBody td{vertical-align:middle}.dataTables_wrapper .dataTables_scroll div.dataTables_scrollBody th>div.dataTables_sizing,.dataTables_wrapper .dataTables_scroll div.dataTables_scrollBody td>div.dataTables_sizing{height:0;overflow:hidden;margin:0 !important;padding:0 !important}.dataTables_wrapper.no-footer .dataTables_scrollBody{border-bottom:1px solid #111}.dataTables_wrapper.no-footer div.dataTables_scrollHead table,.dataTables_wrapper.no-footer div.dataTables_scrollBody table{border-bottom:none}.dataTables_wrapper:after{visibility:hidden;display:block;content:"";clear:both;height:0}@media screen and (max-width: 767px){.dataTables_wrapper .dataTables_info,.dataTables_wrapper .dataTables_paginate{float:none;text-align:center}.dataTables_wrapper .dataTables_paginate{margin-top:0.5em}}</style>
	
<style type="text/css">
.left{
display: inline-block;
vertical-align:top;

margin-right: 30px;

}
.right{

display: inline-block;
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
    text-align:center;}

.coach{
margin-top: 30px;
}

.coach table tr td input{
width:30px;
}
#all label{
color:black;
}
.not-active {
   pointer-events: none;
   cursor: default;
   opacity: 0.3;
}
.not-active-privilege {
   pointer-events: none;
   cursor: default;
   opacity: 0.3;
}
.active {
    background-color: #03A9F4;
    color: white;
}

</style>
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/blockUI.js"></script> 
<script src="../sweetalert-master/dist/sweetalert-dev.js"></script>
<script type="text/javascript">
$( document ).ready(function() {
	
	var cgdbStatus='<s:property value="cgdbStatus"/>';
	if(cgdbStatus=="2")
		{
			swal("Intensity Set sucessfully!");
		}
	else if(cgdbStatus=="1")
		{
			window.location.href="../device/deviceStatus";
		}
	$( "#setIndividual" ).click(function() {
		$("#individual").css("display","block");
		$("#all").css("display","none");
	});	
	
	$( "#setToAll" ).click(function() {
		$("#all").css("display","block");
		$("#individual").css("display","none");
	});
	
	 $("#autoMode" ).change(function() {
		var mode=this.value;
		if(mode=="Day Night"){
			$("#dayNightIntensity").css("display","block");
			$("#setTimeOut").css("display","none");
		}else if(mode=="Time Out"){
			$("#setTimeOut").css("display","block");
			$("#dayNightIntensity").css("display","none");
		}
		
	});	 

    //--------------------show processing image--------------------
    
	$(".tibIntensity" ).click(function() {
		$( "#tibProcessing" ).css("display","inline-block");
		$( ".tibIntensity" ).addClass("not-active");
		$( ".coachIntensity" ).addClass("not-active");
		 $('.tab').addClass("not-active-privilege");		
	});
    
    $("#getTibIntensity").click(function(){
    	
    	$( "#tibProcessing" ).css("display","inline-block");
		$( ".tibIntensity" ).addClass("not-active");
		$( ".coachIntensity" ).addClass("not-active");
		 $('.tab').addClass("not-active-privilege");
		
    	
    });
	
	$(".coachIntensity" ).click(function() {
		var id=this.id.split("_");
		$( "#coachProcessing_"+id[1] ).css("display","inline-block");
		$( ".coachIntensity" ).addClass("not-active");
		$( ".tibIntensity" ).addClass("not-active");	
		 
		if(id[0].indexOf("setCoachIntensity")>-1){
			$('.tab').addClass("not-active-privilege");
			$("#CGDI_"+id[1]).attr("action","updateCGDIntensity");
		}
		else{
			$('.tab').addClass("not-active-privilege");
			$("#CGDI_"+id[1]).attr("action","getIntensity");
		}
		
	});
	
	$(".setToAllTimer").click(function(){
		$( ".coachIntensity" ).addClass("not-active");
		$( ".tibIntensity" ).addClass("not-active");	
		$( "#setIndividual" ).addClass("not-active");
		$( "#setToAll" ).addClass("not-active");
	});
	
	$(".setAll" ).click(function() {
		$('.tab').addClass("not-active-privilege");
		$( "#setAllProcessing" ).css("display","inline-block");
	});
	
});
</script>

</head>
<body>
<div style="background: #111">
   <img src="../images/header2.png" width="100%" height="100" alt="header2"/>
   <ul style="list-style-type: none;margin: 0;padding: 0;overflow: hidden;background-color: #335996">

		<li style=" float: left;"><a class="tab" style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;" href="../train/trainRunningInfo">Online Train</a></li>
		<li style=" float: left;"><a  style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;" <s:if test='%{#session["user"].status==false}'> class="not-active-privilege" </s:if><s:else>class="tab"</s:else>  href="deviceStatus">Status</a></li>
		<li style=" float: left;"><a  style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;" <s:if test='%{#session["user"].display==false}'> class="not-active-privilege" </s:if><s:else>class="tab"</s:else>   href="deviceConfig">Display</a></li>
		<li style=" float: left;"><a class="active tab" style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;" href="deviceIntensity">Intensity</a></li>
		<li style=" float: left;"><a style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;" <s:if test='%{#session["user"].logReport==false}'> class="not-active-privilege" </s:if><s:else>class="tab"</s:else>  href="../log-report/logReport">Log Report</a></li>
		<li style=" float: left;"><a  style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;" <s:if test='%{#session["user"].cctv==false}'> class="not-active-privilege" </s:if><s:else>class="tab"</s:else>  href="../cctv/led-lcd-display.jsp">CCTV</a></li> 
		<li style=" float: left;"><a  style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;" <s:if test='%{#session["user"].personalAnc==false}'> class="not-active-privilege" </s:if><s:else>class="tab"</s:else>  href="../announcement/personalAnc">PA</a></li>
		                     
		<li style=" float: left;"><a  style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;" <s:if test='%{#session["user"].message==false}'> class="not-active-privilege" </s:if><s:else>class="tab"</s:else>  href="../message/getBoardMessageList">Message</a></li>
		<li style=" float: left;"><a  style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;" <s:if test='%{#session["user"].setup==false}'> class="not-active-privilege" </s:if><s:else>class="tab"</s:else>  href="../setup/setup.jsp">Setup</a></li>
		<li style=" float: left;"><a  style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;" <s:if test='%{#session["user"].interfaces==false}'> class="not-active-privilege" </s:if><s:else>class="tab"</s:else>  href="../option/optionSettings">Interface</a></li>
		<li style=" float: left;"><a  style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;" <s:if test='%{#session["user"].user==false}'> class="not-active-privilege" </s:if><s:else>class="tab"</s:else>  href="../user/userSetting">User</a></li>
		<li style=" float: left;"><a class="tab" style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;" href="../train/help.jsp">Help</a></li>
		<li style="float: right"><a class="tab" style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;" href="../logout">Logout</a></li>
		<li style="float: right"><a class="tab" style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;" href="../user/changePassword"><s:property value="#session['user'].userId" /></a></li>
        	<li style="float: right"><span style="display: block;color: white;text-align: center;padding: 5px 16px;text-decoration: none;" id="time"></span></li>                        
</ul>
</div>

<div class="left" style=" background: rgba(0, 0, 0, 0.68);">

<fieldset>
<div id="buttons" style="text-align: center;">
 <button id="setIndividual" class="btn orange tab">Set Individual</button><br>
<button id="setToAll" class="btn purple tab">Set To All</button></div>
</fieldset><br>

 &nbsp;&nbsp;<label>Auto Int. Mode</label>
<select id="autoMode" style="height:25px; font-size:15px">
<option style="display: none;"></option>
<option value="Day Night">Day Night</option>
<!-- <option value="Time Out">Time Out</option> -->
</select><br><br> 




<!--  Time Out -->
<fieldset id="setTimeOut" style="text-align: center;display: none;">
<legend><label>Set Time Out Value</label></legend>
&nbsp;&nbsp;<label>( in Minutes )</label>
<br>
<form method="post" action="updateTimeOutValue">
<div id="buttons" style="text-align: center;">
<select style="width:48px;height:25px; font-size:15px" id="timeOutValue" name="intensityConfig.timeOutValue">
<s:if test="%{intensityConfig.timeOutValue!=0}">
<option value='<s:property value="intensityConfig.timeOutValue"/>' style="display: none;"><s:property value="intensityConfig.timeOutValue"/></option>
</s:if>
<s:else>
<option value="0" style="display: none;">None</option>
</s:else>
<script> 
for(var i=1;i<=256;i++)
document.write("<option value="+i+">"+i+"</option>");
</script>
</select>
<select name="intensityConfig.timeOutIntensity" style="width:48px;height:25px; font-size:15px">
<s:if test="%{intensityConfig.timeOutIntensity!=0}">
<option value='<s:property value="intensityConfig.timeOutIntensity"/>' style="display: none;"><s:property value="intensityConfig.timeOutIntensity"/></option>
</s:if>
<script>
for(var o=25;o<=100;o=o+25)
document.write("<option value="+o+">"+o+"</option>");
</script>
</select>
 <select name="intensityConfig.timeOutDuration" style="width:48px;height:25px; font-size:15px">
<s:if test="%{intensityConfig.timeOutDuration!=0}">
<option value='<s:property value="intensityConfig.timeOutDuration"/>' style="display: block;"><s:property value="intensityConfig.timeOutDuration"/></option>
</s:if>
<s:else>
<option value="0" style="display: none;">None</option>
</s:else>
<script>
for(var l=1;l<=256;l++)
document.write("<option value="+l+">"+l+"</option>");
</script>
</select> <br>
 <button class="btn orange setToAllTimer">Set</button>
</div> 
</form>

</fieldset>

<!-- Time Out End -->

<!--  Day Night Intensity -->
<div id="dayNightIntensity" style="display: none;">
<form method="post" action="updateIntensityConfig"> 
<center><label >Set Auto Day/Night Intensity</label></center>
<s:if test="%{intensityConfig.id!=0}">
<input type="hidden" name="intensityConfig.id" value='<s:property value="intensityConfig.id"/>'>
</s:if>
<input type="hidden" name="intensityConfig.timeOutValue" value='0'>
<table style="height: 150px;">
<tr>
<th>Start Time</th><th>Intensity</th></tr>
<tr>
<td>
<select name="intensityConfig.dayHourValue" style="margin-left: 10px;">
<s:if test="%{intensityConfig.dayHourValue!=0}">
<option value='<s:property value="intensityConfig.dayHourValue"/>' style="display: none;"><s:property value="intensityConfig.dayHourValue"/></option>
</s:if>
<script>
for(var j=0;j<=23;j++)
	{
	if(j<10)
		{
			document.write("<option value="+j+">0"+j+"</option>");
		}
	else
		{
			document.write("<option value="+j+">"+j+"</option>");
		}
		
	}

</script>
</select>hr
<select name="intensityConfig.dayMinuteValue">
<s:if test="%{intensityConfig.dayMinuteValue!=0}">
<option value='<s:property value="intensityConfig.dayMinuteValue"/>' style="display: none;"><s:property value="intensityConfig.dayMinuteValue"/></option>
</s:if>
<script>
for(var k=0;k<=59;k++)
	{
	if(k<10)
		{
			document.write("<option value="+k+">0"+k+"</option>");
		}
	else
		{
			document.write("<option value="+k+">"+k+"</option>");
		}
	}
	

</script>
</select>mm
</td>


<td rowspan=3>
<select name="intensityConfig.dayIntensityValue">
<s:if test="%{intensityConfig.dayIntensityValue!=0}">
<option value='<s:property value="intensityConfig.dayIntensityValue"/>' style="display: none;"><s:property value="intensityConfig.dayIntensityValue"/></option>
</s:if>
<script>
for(var o=25;o<=100;o=o+25)
document.write("<option value="+o+">"+o+"</option>");
</script>
</select>
</td>
</tr><tr>
<th>End Time</th><!-- <th>Intensity</th> --></tr>
<tr>
<td>
<select name="intensityConfig.nightHourValue">
<s:if test="%{intensityConfig.nightHourValue!=0}">
<option value='<s:property value="intensityConfig.nightHourValue"/>' style="display: none;"><s:property value="intensityConfig.nightHourValue"/></option>
</s:if>
<script>
for(var m=0;m<=23;m++)
	{
	if(m<10)
		{
			document.write("<option value="+m+">0"+m+"</option>");
		}
	else
		{
			document.write("<option value="+m+">"+m+"</option>");
		}
	}
</script>
</select>hr
<select name="intensityConfig.nightMinuteValue">
<s:if test="%{intensityConfig.nightMinuteValue!=0}">
<option value='<s:property value="intensityConfig.nightMinuteValue"/>' style="display: none;"><s:property value="intensityConfig.nightMinuteValue"/></option>
</s:if>
<script>
for(var n=0;n<=59;n++)
	{
	if(n<10)
		{
			document.write("<option value="+n+">0"+n+"</option>");
		}
	else
		{
			document.write("<option value="+n+">"+n+"</option>");
		}
	}
</script>
</select>mm
</td>


<%-- <td>
<select name="intensityConfig.nightIntensityValue">
<s:if test="%{intensityConfig.nightIntensityValue!=0}">
<option value='<s:property value="intensityConfig.nightIntensityValue"/>' style="display: none;"><s:property value="intensityConfig.nightIntensityValue"/></option>
</s:if>
<script>
for(var o=25;o<=100;o=o+25)
document.write("<option value="+o+">"+o+"</option>");
</script>
</select>
</td> --%>
</tr>
</table>
<div style="text-align: center;">
<button class="btn orange">Set</button></div>
</form>

</div>
<!--  Day Night Intensity -->

</div>

<div class="right" style="width: 80%">
<div id="individual">
<!-- <center > -->
<br><div style="background: rgba(0, 0, 0, 0.68);">
<center><label>TIB (PFD & Multiline)</label></center>
<table class="example" class="display" cellspacing="0" width="100%" style="font-size: 13px">
<thead><tr><th>S.No</th><th>Device ID</th><th>Device Name</th><th>Platform No</th><th>Device IP</th><th>CDS Port</th><th>PDC Port</th><th>Intensity</th><th>Conn. Status</th><th>Set Int.</th></tr></thead>
<s:iterator value="taadbList" status="list">
<form method="post" action="updateTAADBIntensity" style="background: rgba(0, 0, 0, 0.68);">
<input type="hidden" name="device.id" value='<s:property value="id"/>'>
<input type="hidden" name="device.deviceId" value='<s:property value="deviceId"/>'>
<input type="hidden" name="device.deviceName" value='<s:property value="deviceName"/>'>
<input type="hidden" name="device.platformNo" value='<s:property value="platformNo"/>'>
<input type="hidden" name="device.deviceIp" value='<s:property value="deviceIp"/>'>
<input type="hidden" name="device.cdsPort" value='<s:property value="cdsPort"/>'>
<input type="hidden" name="device.pdcPort" value='<s:property value="pdcPort"/>'>
<input type="hidden" name="device.connectionStatus" value='<s:property value="connectionStatus"/>'>
<input type="hidden" name="device.lastConnectionTime" value='<s:property value="lastConnectionTime"/>'>
<tr>
<td><s:property value="#list.index+1"/></td>
<td><s:property value="deviceId"/></td>
<td><s:property value="deviceName"/></td>
<td><s:property value="platformNo"/></td>
<td><s:property value="deviceIp"/></td>
<td><s:property value="cdsPort"/></td>
<td><s:property value="pdcPort"/></td>
<td>
<select name="device.intensity">
<option value='<s:property value="intensity"/>' style="display:none;"><s:property value="intensity"/></option>
<option value="25">25</option>
<option value="50">50</option>
<option value="75">75</option>
<option value="100">100</option>
</select><label style="color:black;">%</label>
</td>
<%-- <td><input type="text" name="taadbList[<s:property value='#list.index'/>].intensity" value='<s:property value="intensity"/>' style="width:50px;">%</td> --%>
<td>
<s:if test="%{connectionStatus==true}"><img src="../images/true.png" alt="true"></s:if>
<s:else><img src="../images/false.png" alt="false"></s:else>
</td>
<td><button class="tibIntensity tab">Set</button></td>
</tr>
</form>

</s:iterator>
</table>
<form action="getTibIntensity">
<button class="btn purple tibIntensity tab" style="margin-left:45%;" >Get Intensity</button>
<div id="tibProcessing" style="float:right; top:780px;right:40px; left:850px; display:none; vertical-align: top; margin-top: 10px;">
     <img height="25px;" width="160px" src="../images/processbar.gif"/>
</div>
</form>


<br></div>
<!-- <div style="text-align: center;"> -->
<!-- <button class="btn orange">Send</button></div> -->
<!-- </center> -->
<div class="coach">
<br>

<s:iterator value="cgdList" id="coach" status="list">


<form method="post" action="#" id="CGDI_<s:property value="#list.index"/>" style="background: rgba(0, 0, 0, 0.68);">
<input type="hidden" name="platformNo" value="<s:property value="cgdList[#list.index][0].platformNo"/>">
<br>
<center><label>Platform NO - <s:property value="cgdList[#list.index][0].platformNo"/></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label><s:property value="cgdList[#list.index][0].cdsPort"/></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label>PDC Port &nbsp;-&nbsp;<s:property value="cgdList[#list.index][0].pdcPort"/></label></center>
<input type="hidden" name="pdcport" value='<s:property value="cgdList[#list.index][0].pdcPort"/>'>
<div style="width: 100%; overflow: scroll; ">
<table class="example" class="display" cellspacing="0" width="100%" style="font-size: 13px">
<tr><th>Coach</th>
<s:iterator var="device" value="#coach" status="deviceList">
<th>C<s:property value="#deviceList.index+1"/></th>
</s:iterator>
</tr>
<tr><td>Coach ID</td>
<s:iterator var="device" value="#coach">
<td><s:property value="#device.deviceId"/></td>
</s:iterator>
</tr>
<tr><td>Intensity</td>
<s:iterator var="device" value="#coach" status="list1">
<input type="hidden" name="deviceList[<s:property value='#list1.index'/>].id" value='<s:property value="#device.id"/>' >
<input type="hidden" name="deviceList[<s:property value='#list1.index'/>].deviceId" value='<s:property value="#device.deviceId"/>' >
<input type="hidden" name="deviceList[<s:property value='#list1.index'/>].deviceName" value='<s:property value="#device.deviceName"/>' >
<input type="hidden" name="deviceList[<s:property value='#list1.index'/>].platformNo" value='<s:property value="#device.platformNo"/>' >
<input type="hidden" name="deviceList[<s:property value='#list1.index'/>].deviceIp" value='<s:property value="#device.deviceIp"/>' >
<input type="hidden" name="deviceList[<s:property value='#list1.index'/>].cdsPort" value='<s:property value="#device.cdsPort"/>' >
<input type="hidden" name="deviceList[<s:property value='#list1.index'/>].pdcPort" value='<s:property value="#device.pdcPort"/>' >
<input type="hidden" name="deviceList[<s:property value='#list1.index'/>].pdcPortNo" value='<s:property value="#device.pdcPortNo"/>' >
<input type="hidden" name="deviceList[<s:property value='#list1.index'/>].connectionStatus" value='<s:property value="connectionStatus"/>'>
<input type="hidden" name="deviceList[<s:property value='#list1.index'/>].lastConnectionTime" value='<s:property value="lastConnectionTime"/>'>
<td>
<select name="deviceList[<s:property value='#list1.index'/>].intensity">
<option value='<s:property value="#device.intensity"/>' style="display:none;"><s:property value="#device.intensity"/></option>
<option value="25">25</option>
<option value="50">50</option>
<option value="75">75</option>
<option value="100">100</option>
</select><label style="color:black;">%</label>
</td>
<%-- <td><input type="text" name="deviceList[<s:property value='#list1.index'/>].intensity" value='<s:property value="#device.intensity"/>'>%</td> --%>
</s:iterator>
</tr>
</table>
</div>
<button style="margin-left:38%" class="btn orange coachIntensity" id="setCoachIntensity_<s:property value="#list.index"/>">Set Intensity</button>
<button class="btn purple coachIntensity" id="getCoachIntensity_<s:property value="#list.index"/>">Get Intensity</button>
<div id="coachProcessing_<s:property value="#list.index"/>" style="float:right; top:780px;right:40px; left:850px; display:none; vertical-align: top; margin-top: 10px;">
     <img height="25px;" width="160px" src="../images/processbar.gif"/>
</div>
</form>
</s:iterator>

</div></div>

<div id="all" style="display: none;width:100%; background: rgba(0, 0, 0, 0.68);">

<form method="post" action="setIntensityToAllDevice">
<center>
<label style="color:white;">Set Intensity to All Devices</label><br><br>
<table style="width:500px; height:250px; text-align: center;font-size: 25px">
<tr>
<td><input style="width: 20px;height: 20px" type="radio" value="25" name="globalIntensity" <s:if test="%{globalIntensity==25}">checked</s:if> ><label>25%</label></td>
<td><input style="width: 20px;height: 20px" type="radio" value="50" name="globalIntensity" <s:if test="%{globalIntensity==50}">checked</s:if> ><label>50%</label></td>
</tr>
<tr>
<td><input style="width: 20px;height: 20px" type="radio" value="75" name="globalIntensity" <s:if test="%{globalIntensity==75}">checked</s:if> ><label>75%</label></td>
<td><input style="width: 20px;height: 20px" type="radio" value="100" name="globalIntensity" <s:if test="%{globalIntensity==100}">checked</s:if> ><label>100%</label></td>
</tr>
</table>
</center>
<br>
<button class="btn orange setAll tab" style="margin-left:45%;">Set</button>
<div id="setAllProcessing" style="float:right; top:780px;right:40px; left:850px; display:none; vertical-align: top;">
     <img height="25px;" width="160px" src="../images/processbar.gif"/>
</div>
</form>
</div>
</div>


<div id="footer"><p>&copy; 2016 Dan Electronic System Pvt. Ltd.<p></div>
<script type="text/javascript" src="../js/time.js"></script>  
</body>
</html>