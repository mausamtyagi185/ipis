                   <%@ taglib uri="/struts-tags" prefix="s" %> 
               
           
                <s:iterator value="runningTrainList" status="list">
                     <tr>
			<td><s:property value="#list.index+1"/></td>
			<input type="hidden" name="runningTrainList[<s:property value="#list.index"/>].id" value="<s:property value='id'/>">
			<input type="hidden" name="runningTrainList[<s:property value="#list.index"/>].trainNo" value="<s:property value="trainNo"/>">
			<input type="hidden" name="runningTrainList[<s:property value="#list.index"/>].trainNameEnglish" value="<s:property value="trainNameEnglish"/>">
			<input type="hidden"  id='expectedArrival1_<s:property value="id"/>' name="runningTrainList[<s:property value="#list.index"/>].expectedArrival" value="<s:property value="expectedArrival"/>">
			<input type="hidden"  id='expectedDeparture1_<s:property value="id"/>' name="runningTrainList[<s:property value="#list.index"/>].expectedDeparture" value="<s:property value="expectedDeparture"/>">
			<td><label class="trainNo" id='trainNo_<s:property value="id"/>'><s:property value="trainNo"/></label></td>
			<td style="width: 223px;"><label class="trainName" id='trainName_<s:property value="id"/>'><s:property value="trainNameEnglish"/></label></td>
			<td><label class="scheduleArrival" id='scheduleArrival_<s:property value="id"/>'><s:property value="scheduleArrival"/></label></td>
			<td><label class="scheduleDeparture" id='scheduleDeparture_<s:property value="id"/>'><s:property value="scheduleDeparture"/></label></td>
                        <td><select class="trainCategory" id='<s:property value="id"/>'  name="runningTrainList[<s:property value="#list.index"/>].trainCategory">
                                <option value='<s:property value="trainCategory"/>' style="display: none;"><s:property value="trainCategory"/></option>
                                <option>A</option>
                                <option>D</option>
                            </select></td>
                        <td><select name="runningTrainList[<s:property value="#list.index"/>].trainRunningStatus" class="trainRunningStatus" id="trainRunningStatus_<s:property value="id"/>">
                                <option value='<s:property value="trainRunningStatus"/>' style="display: none;"><s:property value="trainRunningStatus"/></option>
			                    <s:if test='%{trainCategory=="A"}'>
			                    <option value="Running Right Time">Running Right Time</option>
				    			<option value="Will Arrive Shortly">Will Arrive Shortly</option>
				    			<option value="Is Arriving On">Is Arriving On</option>
				    			<option value="Has Arrived On">Has Arrived On</option>
				    			<option value="Running Late">Running Late</option>
				    			<option value="Cancelled">Cancelled</option>
				    			<option value="Indefinite Late">Indefinite Late</option>
				    			<option value="Terminated">Terminated</option>
				    			<option value="Platform Changed">Platform Changed</option>
				    			</s:if>
				    			<s:elseif test='%{trainCategory=="D"}'>
				    			 <option value="Running Right Time">Running Right Time</option> 
				    			 <option value="Cancelled">Cancelled</option>'+
				    			 <option value="Is Ready To Leave">Is Ready To Leave</option> 
				    			 <option value="Is On Platform">Is On Platform</option> 
				    			 <option value="Has Left">Has Left</option> 
				    			 <option value="Rescheduled">Rescheduled</option> 
				    			 <option value="Diverted">Diverted</option> 
				    			 <option value="Scheduled Departure">Scheduled Departure</option> 
				    			 <option value="Platform Changed">Platform Changed</option> 
				    			</s:elseif>
                            </select></td>
			<td><input type="text" class="lateHour" id='lateHour_<s:property value="id"/>' style="width:50px;" value='<s:property value="lateHour"/>' name="runningTrainList[<s:property value="#list.index"/>].lateHour" maxlength="5" readonly="readonly"></td>
			<td><label class="expectedArrival" id='expectedArrival_<s:property value="id"/>'><s:property value="expectedArrival"/></label></td>
			<td><label class="expectedDeparture" id='expectedDeparture_<s:property value="id"/>'><s:property value="expectedDeparture"/></label></td>
			<td><select name="runningTrainList[<s:property value="#list.index"/>].defaultPlatform" style="width:54px;" class="defaultPlatform" id="defaultPlatform_<s:property value="id"/>">
			<s:if test="%{!defaultPlatform.equals('')}">
			<%-- <option value='<s:property value="defaultPlatform"/>' style="display:none;"><s:property value="defaultPlatform"/></option> --%>
			 <option value=''>NIL</option>
	            <script>
	            var defaultPlatform='<s:property value="defaultPlatform"/>';
	            var count=<s:property value="station.numberOfPlateform"/>;
	            var platformNos='<s:property value="station.platformNos"/>';
	            var platformNosArray=platformNos.split(",");	          
			     for(var i=1;i<=count;i++){
			    	 var option = document.createElement("option");
			    	 option.text = platformNosArray[i-1];
			    	 option.value=platformNosArray[i-1];			    	 
			    	 if(defaultPlatform== platformNosArray[i-1]){
			    		 option.selected=true;
			    	 }
			        document.getElementsByClassName("defaultPlatform")[<s:property value="#list.index"/>].appendChild(option);
			     }
	            </script> 
            </s:if>
            <s:else>
            <option value='' style="display:none;">NIL</option>
            </s:else> 
            </select>
            </td>
			<td><input type="checkbox" name="runningTrainList[<s:property value="#list.index"/>].trainDisplay" class="trainDisplay" id="trainDisplay_<s:property value="id"/>" value="true" <s:if test='%{trainDisplay==true}'>checked</s:if> style="width: 25px; height: 25px"/></td>
            <td><input type="checkbox" name="runningTrainList[<s:property value="#list.index"/>].coachDisplay" class="coachDisplay" id="coachDisplay_<s:property value="id"/>" value="true" <s:if test='%{coachDisplay==true}'>checked</s:if> style="width: 25px; height: 25px"/></td>
<%-- 			<td><button style="background-color: orange;" class="viewCoachDisplay" id="viewCoachDisplay_<s:property value="id"/>">CG</button></td> --%>
			<td><input type="checkbox" name="runningTrainList[<s:property value="#list.index"/>].announcement" class="announcement" id="announcement_<s:property value="id"/>" value="true" <s:if test='%{announcement==true}'>checked</s:if> style="width: 25px; height: 25px"/></td>
			<td><a href="#" class="deleteTrain" id="delete_<s:property value='id'/>"><img src="../images/Delete_Icon.png" width="30" height="30" alt="delete"/></a></td>
		    <td><select name="runningTrainList[<s:property value="#list.index"/>].divertedStationCode" class="divertedStation" id="divertedStation_<s:property value="id"/>" style="display:none;">
                <option value='<s:if test="%{divertedStationCode!=null}"><s:property value="divertedStationCode"/></s:if>' style="display:none;"><s:property value="divertedStationName"/></option>
                <s:iterator value="divertedStationList">
                   <option value='<s:property value="stationCode"/>'><s:property value="stationNameEnglish"/></option>
                </s:iterator>
            </select>
            <input type="hidden" id="divertedStationName_<s:property value="id"/>" name="runningTrainList[<s:property value="#list.index"/>].divertedStationName" value='<s:property value="divertedStationName"/>'>
            </td>
		</tr>
		</s:iterator>