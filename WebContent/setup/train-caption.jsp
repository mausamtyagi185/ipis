<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Train Caption</title>
<META http-equiv=Content-Type content="text/html; charset=utf-8"> 
 <script type="text/javascript" src="../js/jqueryname.min.js"></script><style type="text/css"></style>
<link rel="stylesheet" type="text/css" href="../css/normalize.css">
  <script type="text/javascript" src="../js/jquery-ui.min.js"></script>
    <script type="text/javascript" src="../js/jquery.mousewheel.js"></script>
     <script type="text/javascript" src="../js/jquery.keyboard.extension-typing.js"></script>
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
    <LINK href="../css/keyboard.css" type=text/css rel=stylesheet> 
	<link rel="stylesheet" href="../css/style.css">

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
    
.not-active-privilege {
   pointer-events: none;
   cursor: default;
   opacity: 0.3;
}

</style>

<SCRIPT language=javascript>
var Maj=new Array(),Min=new Array()
/*begin of data*/
Maj["Hindi (Devanagari)"]		="0912|090D|0945|094D0930|0930094D|091C094D091E|0924094D0930|0915094D0937|0936094D0930|0028|0029|0903|090B|0914|0910|0906|0908|090A|092D|0919|0918|0927|091D|0922|091E|0913|090F|0905|0907|0909|092B|0931|0916|0925|091B|0920|0911|090E|0901|0923|0929|0934|0936|0937|0964|092A|003E|005D|007D|0024|007E|0020"
Min["Hindi (Devanagari)"]		="094A|0031|0032|0033|0034|0035|0036|0037|0038|0039|0030|002D|0943|094C|0948|093E|0940|0942|092C|0939|0917|0926|091C|0921|093C|094B|0947|094D|093F|0941|0930|0915|0924|091A|091F|0949|0946|0902|092E|0928|0935|0932|0938|002C|002E|092F|003C|005B|007B|00A3|007E|0020"

/*end of data*/
</SCRIPT> <SCRIPT language=javascript>
var dia=new Array()
/*begin of data*/
/*diacritical letters*/
dia["0060"]=new Array();dia["00B4"]=new Array();dia["005E"]=new Array();dia["00A8"]=new Array();dia["007E"]=new Array();dia["00B0"]=new Array();dia["00B7"]=new Array();dia["00B8"]=new Array();dia["00AF"]=new Array();dia["02D9"]=new Array();dia["02DB"]=new Array();dia["02C7"]=new Array();dia["02D8"]=new Array();dia["02DD"]=new Array();dia["031B"]=new Array();	
dia["0060"]["0061"]="00E0";dia["00B4"]["0061"]="00E1";dia["005E"]["0061"]="00E2";dia["00A8"]["0061"]="00E4";dia["007E"]["0061"]="00E3";dia["00B0"]["0061"]="00E5";dia["00AF"]["0061"]="0101";dia["02DB"]["0061"]="0105";dia["02D8"]["0061"]="0103";	
	
dia["00B4"]["0063"]="0107";dia["005E"]["0063"]="0109";dia["00B8"]["0063"]="00E7";dia["02D9"]["0063"]="010B";dia["02C7"]["0063"]="010D";	
dia["02C7"]["0064"]="010F";	
dia["0060"]["0065"]="00E8";dia["00B4"]["0065"]="00E9";dia["005E"]["0065"]="00EA";dia["00A8"]["0065"]="00EB";dia["00AF"]["0065"]="0113";dia["02D9"]["0065"]="0117";dia["02DB"]["0065"]="0119";dia["02C7"]["0065"]="011B";dia["02D8"]["0065"]="0115";	
	
dia["005E"]["0067"]="011D";dia["00B8"]["0067"]="0123";dia["02D9"]["0067"]="0121";dia["02D8"]["0067"]="011F";	
dia["005E"]["0068"]="0125";	
dia["0060"]["0069"]="00EC";dia["00B4"]["0069"]="00ED";dia["005E"]["0069"]="00EE";dia["00A8"]["0069"]="00EF";dia["007E"]["0069"]="0129";dia["00AF"]["0069"]="012B";dia["02DB"]["0069"]="012F";dia["02D8"]["0069"]="012D";	
dia["005E"]["006A"]="0135";	
dia["00B8"]["006B"]="0137";	
dia["00B4"]["006C"]="013A";dia["00B7"]["006C"]="0140";dia["00B8"]["006C"]="013C";dia["02C7"]["006C"]="013E";	
	
dia["00B4"]["006E"]="0144";dia["007E"]["006E"]="00F1";dia["00B8"]["006E"]="0146";dia["02D8"]["006E"]="0148";	
dia["0060"]["006F"]="00F2";dia["00B4"]["006F"]="00F3";dia["005E"]["006F"]="00F4";dia["00A8"]["006F"]="00F6";dia["007E"]["006F"]="00F5";dia["00AF"]["006F"]="014D";dia["02D8"]["006F"]="014F";dia["02DD"]["006F"]="0151";dia["031B"]["006F"]="01A1";	
	
	
dia["00B4"]["0072"]="0155";dia["00B8"]["0072"]="0157";dia["02C7"]["0072"]="0159";	
dia["00B4"]["0073"]="015B";dia["005E"]["0073"]="015D";dia["00B8"]["0073"]="015F";dia["02C7"]["0073"]="0161";	
dia["00B8"]["0074"]="0163";dia["02C7"]["0074"]="0165";	
dia["0060"]["0075"]="00F9";dia["00B4"]["0075"]="00FA";dia["005E"]["0075"]="00FB";dia["00A8"]["0075"]="00FC";dia["007E"]["0075"]="0169";dia["00B0"]["0075"]="016F";dia["00AF"]["0075"]="016B";dia["02DB"]["0075"]="0173";dia["02D8"]["0075"]="016D";dia["02DD"]["0075"]="0171";dia["031B"]["0075"]="01B0";	
	
dia["005E"]["0077"]="0175";	
	
dia["00B4"]["0079"]="00FD";dia["005E"]["0079"]="0177";dia["00A8"]["0079"]="00FF";	
dia["00B4"]["007A"]="017A";dia["02D9"]["007A"]="017C";dia["02C7"]["007A"]="017E";	
dia["00B4"]["00E6"]="01FD";	
	
dia["00B4"]["00F8"]="01FF";	
dia["0060"]["0041"]="00C0";dia["00B4"]["0041"]="00C1";dia["005E"]["0041"]="00C2";dia["00A8"]["0041"]="00C4";dia["007E"]["0041"]="00C3";dia["00B0"]["0041"]="00C5";dia["00AF"]["0041"]="0100";dia["02DB"]["0041"]="0104";dia["02D8"]["0041"]="0102";	
	
dia["00B4"]["0043"]="0106";dia["005E"]["0043"]="0108";dia["00B8"]["0043"]="00C7";dia["02D9"]["0043"]="010A";dia["02C7"]["0043"]="010C";	
dia["02C7"]["0044"]="010E";	
dia["0060"]["0045"]="00C8";dia["00B4"]["0045"]="00C9";dia["005E"]["0045"]="00CA";dia["00A8"]["0045"]="00CB";dia["00AF"]["0045"]="0112";dia["02D9"]["0045"]="0116";dia["02DB"]["0045"]="0118";dia["02C7"]["0045"]="011A";dia["02D8"]["0045"]="0114";	
	
dia["005E"]["0047"]="011C";dia["00B8"]["0047"]="0122";dia["02D9"]["0047"]="0120";dia["02D8"]["0047"]="011E";	
dia["005E"]["0048"]="0124";	
dia["0060"]["0049"]="00CC";dia["00B4"]["0049"]="00CD";dia["005E"]["0049"]="00CE";dia["00A8"]["0049"]="00CF";dia["007E"]["0049"]="0128";dia["00AF"]["0049"]="012A";dia["02D9"]["0049"]="0130";dia["02DB"]["0049"]="012E";dia["02D8"]["0049"]="012C";	
dia["005E"]["004A"]="0134";	
dia["00B8"]["004B"]="0136";	
dia["00B4"]["004C"]="0139";dia["00B7"]["004C"]="013F";dia["00B8"]["004C"]="013B";dia["02C7"]["004C"]="013D";	
	
dia["00B4"]["004E"]="0143";dia["007E"]["004E"]="00D1";dia["00B8"]["004E"]="0145";dia["02D8"]["004E"]="0147";	
dia["0060"]["004F"]="00D2";dia["00B4"]["004F"]="00D3";dia["005E"]["004F"]="00D4";dia["00A8"]["004F"]="00D6";dia["007E"]["004F"]="00D5";dia["00AF"]["004F"]="014C";dia["02D8"]["004F"]="014E";dia["02DD"]["004F"]="0150";dia["031B"]["004F"]="01A0";	
	
	
dia["00B4"]["0052"]="0154";dia["00B8"]["0052"]="0156";dia["02C7"]["0052"]="0158";	
dia["00B4"]["0053"]="015A";dia["005E"]["0053"]="015C";dia["00B8"]["0053"]="015E";dia["02C7"]["0053"]="0160";	
dia["00B8"]["0054"]="0162";dia["02C7"]["0054"]="0164";	
dia["0060"]["0055"]="00D9";dia["00B4"]["0055"]="00DA";dia["005E"]["0055"]="00DB";dia["00A8"]["0055"]="00DC";dia["007E"]["0055"]="0168";dia["00B0"]["0055"]="016E";dia["00AF"]["0055"]="016A";dia["02DB"]["0055"]="0172";dia["02D8"]["0055"]="016C";dia["02DD"]["0055"]="0170";dia["031B"]["0055"]="01AF";	
	
dia["005E"]["0057"]="0174";	
	
dia["00B4"]["0059"]="00DD";dia["005E"]["0059"]="0176";dia["00A8"]["0059"]="0178";	
dia["00B4"]["005A"]="0179";dia["02D9"]["005A"]="017B";dia["02C7"]["005A"]="017D";	
dia["00B4"]["00C6"]="01FC";	
	
dia["00B4"]["00D8"]="01FE";	


/*end of data*/

</SCRIPT> <META content="MSHTML 6.00.2900.2627" name=GENERATOR> 

<script type="text/javascript">
$( document ).ready(function() {
	
	 $( ".keyb" ).css("display","none");
	 $( "#hindiShortName" ).focus(function() {
		$( ".keyb" ).css("display","table");
		visu=document.getElementById('hindiShortName');
	 });
	 $( "#hindiLongName" ).focus(function() {
		$( ".keyb" ).css("display","table");
		visu=document.getElementById('hindiLongName');
	 });
	
	 $('#trainList').change(function(){
		 
		   $('#id').val('');
		   $('#trainId').val('');
		   $('#englishShortName').val('');
		   $('#englishLongName').val('');
		   $('#hindiShortName').val('');
		   $('#hindiLongName').val('');
		   $('#regionalShortName').val('');
		   $('#regionalLongName').val('');
		   $('#result').text('');
		   
		   var formInput=$("#trainCaptionForm #trainList").serialize();//alert(formInput);
		   
		   if($("#trainCaptionForm #trainList").val()!=0){
			  
		   $.getJSON('getTrainCaption', formInput,function(data) { //alert(data.trainCaption.hindiShortName);
			   if(data.trainCaption.id!=0){
				   $('#id').attr('value', data.trainCaption.id);
				   $('#trainId').attr('value', data.trainCaption.trainId);
				   $('#englishShortName').attr('value', data.trainCaption.englishShortName);
				   $('#englishLongName').attr('value', data.trainCaption.englishLongName);
				   $('#hindiShortName').attr('value', data.trainCaption.hindiShortName);
				   $('#hindiLongName').attr('value', data.trainCaption.hindiLongName);
				   $('#regionalShortName').attr('value', data.trainCaption.regionalShortName);
				   $('#regionalLongName').attr('value', data.trainCaption.regionalLongName);
			   }
			   
		   });
		   
		  }
		   
	  });
	
});
</script>

</head>
<body> <div style="background: #111">
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
<li style="display: block;color: white;text-align: center;padding: 3px 20px;text-decoration: none;float: left;" ><img src="../images/arrow.PNG" style="margin-bottom: -5px">Caption</li>
<li style="display: block;color: white;text-align: center;padding: 3px 20px;text-decoration: none;float: left;" ><img src="../images/arrow.PNG" style="margin-bottom: -5px">Train Caption</li>
</ul>
</div>
    <div id="nav">
<div id='cssmenu'>
<ul>
   <li><a href='getDivertedStationList'>Diverted / Terminated Station</a></li>
   <li class='active'><a href='getTrainCaptionList'>Train Caption</a></li>
   <li><a href='getCoachCaptionList'>Coach Caption</a></li>
   <li><a href='setup.jsp'>Back</a></li>
</ul>
</div>
</div>
<div id="displaynew">
<center>
<form id="trainCaptionForm" method="post" action="saveOrUpdateTrainCaption">
<input type="hidden" id="id" name="trainCaption.id" value="<s:property value='trainCaption.id'/>">
<input type="hidden" id="trainId" name="trainCaption.trainId" value="<s:property value='trainCaption.trainId'/>">
<br>
<label>Train No :-  </label>
<select id="trainList" name="trainCaption.trainNo" style="width:100px;" required>
<option value="<s:property value='trainCaption.trainNo'/>" style="display:none;"><s:property value='trainCaption.trainNo'/></option>
<s:iterator value="trainCaptionList">
<option value="<s:property value='trainNo'/>"><s:property value='trainNo'/></option>
</s:iterator>
</select>
<div>
<br>
<table style="margin-top: 12px">

<tr><td>
<label> English &nbsp;</label>
</td><td>
<input type="text"  placeholder="Short Name" style="width: 100%;height: 30px" id="englishShortName" name="trainCaption.englishShortName" value="<s:property value='trainCaption.englishShortName'/>" readonly>
</td>
<td>&nbsp;</td>
<td>
<input type="text"  placeholder="Long Name" style="width: 100%;height: 30px" id="englishLongName" name="trainCaption.englishLongName" value="<s:property value='trainCaption.englishLongName'/>">
</td></tr></table>
<table style="margin-top: 12px">
<tr><td>
<label>&nbsp;&nbsp;&nbsp;&nbsp; Hindi &nbsp;</label>
</td><td>
<input type="text"  placeholder="Short Name" style="width: 100%;height: 30px" id="hindiShortName" name="trainCaption.hindiShortName" value="<s:property value='trainCaption.hindiShortName'/>">
</td>
<td>&nbsp;</td>
<td>
<input type="text"  placeholder="Long Name" style="width: 100%;height: 30px" id="hindiLongName" name="trainCaption.hindiLongName" value="<s:property value='trainCaption.hindiLongName'/>">
</td></tr></table>
<table style="margin-top: 12px">
<tr><td>
<label> Regional &nbsp;</label>
</td><td>
<input type="text"  placeholder="Short Name" style="width: 100%;height: 30px" id="regionalShortName" name="trainCaption.regionalShortName" value="<s:property value='trainCaption.regionalShortName'/>">
</td>
<td>&nbsp;</td>
<td>
<input type="text"  placeholder="Long Name" style="width: 100%;height: 30px" id="regionalLongName" name="trainCaption.regionalLongName" value="<s:property value='trainCaption.regionalLongName'/>">
</td></tr>
</table></div>

<br>
<div id="buttons" style="text-align: center">
<button id="update" class="btn orange">Update</button>
</div>
<br>
<span id="result" style="color:green;"><s:property value="result"/></span>
<SCRIPT language=javascript>
/*do not change hereafter*/
var sp="&nbsp;&nbsp;",gui='"',lig="</tr><tr>",lock=0,lng="",
hexchars="0123456789ABCDEF";getCk();if(lng==""||Maj[lng]==null){lng="Hindi (Devanagari)"}
CarMaj=Maj[lng].split("|");CarMin=Min[lng].split("|");for(i=0;i<52;i++){CarMaj[i]=fromhexby4tocar(CarMaj[i]);CarMin[i]=fromhexby4tocar(CarMin[i])}
code="<br><br><select class=act onChange='changer(this)' style='display:none;'><option selected>Hindi (Devanagari)</select>"
code+="<table cellspacing=1 class='keyb'><tr>"+wrC(0,12)+wrF(3,'Close')+lig+"<td class=act colspan=3><input type=checkbox></td>"+wrC(13,24)+wrF(2,'Back')+lig+wrF(4,'Lock')+wrC(25,35)+wrF(3,'Erase')+lig+wrF(5,'Shift')+wrC(36,45)+wrF(4,'Shift')+lig+"<td class=act colspan=4></td>"+wrC(46,48)+"<td class=smpl colspan=10><a href='javascript:faire(\" \")'>"+sp+sp+sp+sp+sp+sp+sp+sp+sp+sp+sp+sp+"</a></td>"+wrC(49,51)+"<td class=act colspan=3></td>"+lig
code+="</tr></table>"
document.write(code);var caps=document.forms[0].elements[2]
function wrC(debut,fin){w="";for (j=debut;j<fin+1;j++){if (CarMaj[j]==CarMin[j].toUpperCase()){car=CarMaj[j];w+="<td class=smpl"}else{car=sp+CarMaj[j]+"<br>"+CarMin[j]+sp;w+="<td class=dbl"}w+=" colspan=2><a href='javascript:wr("+j+")'>&nbsp;"+car+"&nbsp;</a></td>"}return w}
function wrF(nbCol,fun){if (fun!=null){return("<td class=act colspan="+nbCol+"><a href='javascript:"+fun+"()'>"+fun+"<br>"+sp+sp+"</a></td>")}else{return("<td class=act colspan="+nbCol+">"+sp+"<br>"+sp+"</td>")}}
function wr(j){visu.value+=(lock==1)?CarMaj[j]:((caps.checked==true)?CarMaj[j]:CarMin[j]);caps.checked=(lock==1)?true:false;acc=hexa(visu.value.substring(visu.value.length-2,visu.value.length-1));car=hexa(visu.value.substring(visu.value.length-1,visu.value.length));if (dia[acc]!=null&&dia[acc][car]!=null){visu.value=visu.value.substring(0,visu.value.length-2)+fromhexby4tocar(dia[acc][car])}}
function faire(a){visu.value+=a}
function Erase(){visu.value=""}
function Close(){$( ".keyb" ).css("display","none");}
function Shift(){caps.checked=true}
function Lock(){caps.checked=(lock==1)?false:true;lock=(lock==1)?0:1}
function Back(){if (visu.value.length==0){return};visu.value=visu.value.substr(0,(visu.value.length-1))}
function changer(ceci){lng=document.forms[0].elements[1].options[ceci.selectedIndex].text;}
function tr(ceci){return ceci.replace(/"/g,"\\\"")}
function getCk(){return true}
function setCk(inval){return true}
function fromhex(inval){out=0;for (a=inval.length-1;a>=0;a--){out+=Math.pow(16,inval.length-a-1)*hexchars.indexOf(inval.charAt(a))}return out}
function fromhexby4tocar(ceci){out4=new String();for (l=0;l<ceci.length;l+=4){out4+=String.fromCharCode(fromhex(ceci.substring(l,l+4)))}return out4}
function tohex(inval){return hexchars.charAt(inval/16)+hexchars.charAt(inval%16)}
function tohex2(inval){return tohex(inval/256)+tohex(inval%256)}
function hexa(ceci){out="";for (k=0;k<ceci.length;k++){out+=(tohex2(ceci.charCodeAt(k)))}return out}
</SCRIPT>

</form>
</center>
</div>
<div id="footer"><p>&copy; 2016 Dan Electronic System Pvt. Ltd.<p></div>
<script type="text/javascript" src="../js/time.js"></script>  
</body>
</html>