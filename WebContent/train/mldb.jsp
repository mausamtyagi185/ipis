<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html >
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">

#tym{
position:absolute;
	color: white;
    background: #990000;
    height: 219px;
    font-size: 142px;
   /*  border: 1px solid black; */
    text-align: center;
    width: 20%;

}
#trainname{
white-space: nowrap;
    width: 853px;
     overflow: hidden;
    color: #000066;
    text-overflow: ellipsis;
    margin-left: 71px;
   
    font-size: 54px;
    /* height: 42px; */
   /*  border: 1px solid black; */
    font-weight: 700;
    
    

}

#via{
    white-space: nowrap;
    color: #000066;
    font-size: 40px;
 /*    border: 1px solid black; */
 overflow:hidden;
 text-overflow: ellipsis;
    width: 854px;
    margin-left: 70px;
    
    height: 54px;
    font-weight: 700;
}
.status{
    white-space: nowrap;
    color: #000066;
    font-size: 60px;
 /*    border: 1px solid black; */
 overflow:hidden;
 text-overflow: ellipsis;
    width: 854px;
    margin-left: 70px;
    
    height: 75px;
    font-weight: 700;
}
#trainno{
    width: 343px;
    font-weight: 700;
    white-space: nowrap;
    /* border: 1px solid black; */
    font-size: 95px;
    text-align: center;
    color: #990000;
    height: 212px;
}
#pf{
/* border: 1px solid black; */
    height: 182px;
    text-align: center;
    font-size: 133px;
     color: #000066;
}

#viceversa
{
 white-space: nowrap;
    width: 858px;
    overflow:hidden;
    text-overflow: ellipsis; 
     /*height: 77px; */
  
  /*   border: 1px solid black; */
    color: #990000;
    margin-top: 0px;
    margin-left: 70px;
    font-size: 52px;
    padding-top: 11px;
}

#arrdep{
	margin-top: -37px;
    color: #990000;
    text-align: center;
    font-size: 45px;
}

body{

background: linear-gradient(90deg, #E6E6E6, white); 
}

.neapolitan {
    background:linear-gradient(90deg, #990000, white);
    position:relative;
    width:100%;
    height:5px;
    margin-bottom: 10px;
    /* margin-top: 2px; */
}

.borderless td, .borderless tr {
    border: hidden;
}


      .swach_bharat{
  background-image: url(../displayimg/swach_bharat.jpg);
  background-repeat: no-repeat;
  background-attachment: fixed;
  background-size: cover;
  height:100%;
  width:100%;
   }  
 /*         .bgImg{
  background-image: url(../displayimg/bg14.JPG);
  background-repeat: no-repeat;
  background-attachment: fixed;
  background-size: cover;
  height:100%;
  width:100%;
   }     */
   
  .wrapper {
  position: relative;
  overflow: hidden;
  height: 25px;
  width: 100px;
  border: 1px solid orange;
}

 .wrapper > span {
  position: absolute;
  margin: 0;
  white-space: nowrap;
  animation: marquee 10s linear infinite;
  animation-delay:0s;
}
</style>
</head>
<body>
<div class="container-fluid" >
<img src="../displayimg/swach_bharat.jpg" style="position:absolute;height:100%;width:100%;z-index: 5;display:none;" id="swach_bharat">
   <img src="../displayimg/trainhdre.jpg" style="position:absolute;height:100%;width:100%;z-index: 5;display:none;" id="trainImg">
    <img src="../displayimg/trainhdd.jpg" style="position:absolute;height:100%;width:100%;z-index: 5;display:none;" id="thirdImg">

<table class="table borderless" style="margin-top: 24px;">
  
  <tbody id="multiLine">
     <tr style="width: 100%">
      <td  id="tym">10:40</td>
      <td Style="width: 50%">
      <div id="trainname">JODHPUR JAMMU TAWI EXPRESssdgdgd</div>
      <div id="via">via noida &middot; kanpur &middot; gaziabad</div>
      <div id="viceversa">Delhi &#8652; Mumbai</div>
      </td>
      <td class="col-md-2" ><div id="trainno">12001</div>
      </td>
<td><div id="pf">7</div>
<div id="arrdep">Arrival</div>
</td>
</tr>
<tr>
<td colspan="4"> <div class="neapolitan"></div></td>
</tr>

 <tr style="width: 100%">
      <td  id="tym">10:40</td>
      <td Style="width: 50%">
      <div id="trainname">JODHPUR JAMMU TAWI EXPRES</div>
      <div id="via">via noida &middot; kanpur &middot; gaziabad</div>
      <div id="viceversa">Delhi &#8652; Mumbai</div>
      </td>
      <td Style="width: 20%" ><div id="trainno">12001</div>
      </td>
<td Style="width: 10%"><div id="pf">7</div>
<div id="arrdep">Arrival</div>
</td>
</tr>
<tr>

</tr>
<tr>
<td colspan="4"> <div class="neapolitan"></div></td>
</tr>
<tr style="width: 100%">
      <td  id="tym">10:40</td>
      <td Style="width: 50%">
      <div id="trainname">JODHPUR JAMMU TAWI EXPRES</div>
      <div id="via">via noida &middot; kanpur &middot; gaziabad</div>
      <div id="viceversa">Delhi &#8652; Mumbai</div>
      </td>
      <td class="col-md-2" ><div id="trainno">12001</div>
      </td>
<td><div id="pf">7</div>
<div id="arrdep">Arrival</div>
</td>
</tr>

<tr>
<td colspan="4"> <div class="neapolitan"></div></td>
</tr>


    
  </tbody>
  
</table>

</div>
<!-- <iframe src="https://freesecure.timeanddate.com/clock/i66xka8w/n176/szw1000/szh1000/hoc00f/hbw0/hfc900/cf100/hnc000/hwc000/fas24/facf90/fdi80/mqcfff/mql1/mqd78/mhcfff/mhs4/mhl6/mhw1/mhd74/mmcf90/mml4/mmw1/mmd74/hwm2/hhcf90/hhs2/hhl45/hhb14/hhw11/hhr1/hmcf90/hms2/hml75/hmb14/hmw11/hmr1/hss1/hsl75" frameborder="0" width="1000" height="1000"></iframe> -->
</body>
<!-- <script src="../js/multiline_single.js"></script> -->
</html>