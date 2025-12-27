<%@ taglib uri="/struts-tags" prefix="s"%>
<s:iterator value="currentCoachList">
	<form method="post"
		id='updateCurrentCoachForm_<s:property value="trainNo"/>'>
		<div id='trainNo_<s:property value="trainNo"/>'
			style="background: rgba(0, 0, 0, 0.68); width: 99%; display: none;">
			<input type="hidden" value='<s:property value="id"/>'
				name="currentCoach.id"> <input type="hidden"
				value='<s:property value="trainNo"/>' name="currentCoach.trainNo">
			<p style="display: inline-block; margin-top: 0px;">
				<font color="white"> Coach Position [ Train No : <s:property
						value="trainNo" /> ]
				</font>
			</p>
			<span id='smsg_<s:property value="trainNo"/>'
				style="color: greenyellow; display: none;"></span> <span
				id='emsg_<s:property value="trainNo"/>'
				style="color: red; display: none;"></span>
			<div style="float: right; margin-bottom: -20px">
				<a href="" class="btn purple updateCurrentCoach"
					id='updateCurrentCoach_<s:property value="trainNo"/>'>Save</a> <a
					href="" class="btn orange editCoach"
					id='editCoach_<s:property value="trainNo"/>'>Edit Coach</a> <a
					href="" class="hideCurrentCoach"
					id='hideCurrentCoach_<s:property value="trainNo"/>'
					style="display: inline-block; float: right; padding: 15px;"><img
					src="../images/close.png" width="30" height="30" alt="delete" /></a>
			</div>
			<br>
			<!-- 	<div id="buttons" style="margin-top: 25px;"> -->
			<!--   <a href="#" class="btn purple">In Queue</a> -->
			<!--   <a href="#" class="btn orange">Edit Coach</a> -->
			<!--   </div> -->
			<div style="display: inline-block; width: 500px;">
				<table class="example" class="display" cellspacing="0" width="1005"
					style="font-size: 13px; background-color: white; margin-top: -13px;">
					<thead>
						<tr>
							<th>1</th>
							<th>2</th>
							<th>3</th>
							<th>4</th>
							<th>5</th>
							<th>6</th>
							<th>7</th>
							<th>8</th>
							<th>9</th>
							<th>10</th>
							<th>11</th>
							<th>12</th>
							<th>13</th>
							<th>14</th>
							<th>15</th>
						</tr>
					</thead>
					<tbody>
						<tr style="height: 30px;">
							<td><select class="auto-completer"
								id='C1_<s:property value="trainNo"/>' style="width: 65px;"
								disabled name="currentCoach.coach1">
									<option value='<s:property value="coach1"/>'
										style="display: none;"><s:property value="coach1" /></option>
									<option value="">----</option>
									<s:iterator value="coachCaptionList">
										<option value='<s:property value="coachNameEnglish"/>'><s:property
												value="coachNameEnglish" /></option>
									</s:iterator>
							</select></td>
							<td><select class="auto-completer"
								id='C2_<s:property value="trainNo"/>' style="width: 65px;"
								disabled name="currentCoach.coach2">
									<option value='<s:property value="coach2"/>'
										style="display: none;"><s:property value="coach2" /></option>
									<option value="">----</option>
									<s:iterator value="coachCaptionList">
										<option value='<s:property value="coachNameEnglish"/>'><s:property
												value="coachNameEnglish" /></option>
									</s:iterator>
							</select></td>
							<td><select class="auto-completer"
								id='C3_<s:property value="trainNo"/>' style="width: 65px;"
								disabled name="currentCoach.coach3">
									<option value='<s:property value="coach3"/>'
										style="display: none;"><s:property value="coach3" /></option>
									<option value="">----</option>
									<s:iterator value="coachCaptionList">
										<option value='<s:property value="coachNameEnglish"/>'><s:property
												value="coachNameEnglish" /></option>
									</s:iterator>
							</select></td>
							<td><select class="auto-completer"
								id='C4_<s:property value="trainNo"/>' style="width: 65px;"
								disabled name="currentCoach.coach4">
									<option value='<s:property value="coach4"/>'
										style="display: none;"><s:property value="coach4" /></option>
									<option value="">----</option>
									<s:iterator value="coachCaptionList">
										<option value='<s:property value="coachNameEnglish"/>'><s:property
												value="coachNameEnglish" /></option>
									</s:iterator>
							</select></td>
							<td><select class="auto-completer"
								id='C5_<s:property value="trainNo"/>' style="width: 65px;"
								disabled name="currentCoach.coach5">
									<option value='<s:property value="coach5"/>'
										style="display: none;"><s:property value="coach5" /></option>
									<option value="">----</option>
									<s:iterator value="coachCaptionList">
										<option value='<s:property value="coachNameEnglish"/>'><s:property
												value="coachNameEnglish" /></option>
									</s:iterator>
							</select></td>
							<td><select class="auto-completer"
								id='C6_<s:property value="trainNo"/>' style="width: 65px;"
								disabled name="currentCoach.coach6">
									<option value='<s:property value="coach6"/>'
										style="display: none;"><s:property value="coach6" /></option>
									<option value="">----</option>
									<s:iterator value="coachCaptionList">
										<option value='<s:property value="coachNameEnglish"/>'><s:property
												value="coachNameEnglish" /></option>
									</s:iterator>
							</select></td>
							<td><select class="auto-completer"
								id='C7_<s:property value="trainNo"/>' style="width: 65px;"
								disabled name="currentCoach.coach7">
									<option value='<s:property value="coach7"/>'
										style="display: none;"><s:property value="coach7" /></option>
									<option value="">----</option>
									<s:iterator value="coachCaptionList">
										<option value='<s:property value="coachNameEnglish"/>'><s:property
												value="coachNameEnglish" /></option>
									</s:iterator>
							</select></td>
							<td><select class="auto-completer"
								id='C8_<s:property value="trainNo"/>' style="width: 65px;"
								disabled name="currentCoach.coach8">
									<option value='<s:property value="coach8"/>'
										style="display: none;"><s:property value="coach8" /></option>
									<option value="">----</option>
									<s:iterator value="coachCaptionList">
										<option value='<s:property value="coachNameEnglish"/>'><s:property
												value="coachNameEnglish" /></option>
									</s:iterator>
							</select></td>
							<td><select class="auto-completer"
								id='C9_<s:property value="trainNo"/>' style="width: 65px;"
								disabled name="currentCoach.coach9">
									<option value='<s:property value="coach9"/>'
										style="display: none;"><s:property value="coach9" /></option>
									<option value="">----</option>
									<s:iterator value="coachCaptionList">
										<option value='<s:property value="coachNameEnglish"/>'><s:property
												value="coachNameEnglish" /></option>
									</s:iterator>
							</select></td>
							<td><select class="auto-completer"
								id='C10_<s:property value="trainNo"/>' style="width: 65px;"
								disabled name="currentCoach.coach10">
									<option value='<s:property value="coach10"/>'
										style="display: none;"><s:property value="coach10" /></option>
									<option value="">----</option>
									<s:iterator value="coachCaptionList">
										<option value='<s:property value="coachNameEnglish"/>'><s:property
												value="coachNameEnglish" /></option>
									</s:iterator>
							</select></td>
							<td><select class="auto-completer"
								id='C11_<s:property value="trainNo"/>' style="width: 65px;"
								disabled name="currentCoach.coach11">
									<option value='<s:property value="coach11"/>'
										style="display: none;"><s:property value="coach11" /></option>
									<option value="">----</option>
									<s:iterator value="coachCaptionList">
										<option value='<s:property value="coachNameEnglish"/>'><s:property
												value="coachNameEnglish" /></option>
									</s:iterator>
							</select></td>
							<td><select class="auto-completer"
								id='C12_<s:property value="trainNo"/>' style="width: 65px;"
								disabled name="currentCoach.coach12">
									<option value='<s:property value="coach12"/>'
										style="display: none;"><s:property value="coach12" /></option>
									<option value="">----</option>
									<s:iterator value="coachCaptionList">
										<option value='<s:property value="coachNameEnglish"/>'><s:property
												value="coachNameEnglish" /></option>
									</s:iterator>
							</select></td>
							<td><select class="auto-completer"
								id='C13_<s:property value="trainNo"/>' style="width: 65px;"
								disabled name="currentCoach.coach13">
									<option value='<s:property value="coach13"/>'
										style="display: none;"><s:property value="coach13" /></option>
									<option value="">----</option>
									<s:iterator value="coachCaptionList">
										<option value='<s:property value="coachNameEnglish"/>'><s:property
												value="coachNameEnglish" /></option>
									</s:iterator>
							</select></td>
							<td><select class="auto-completer"
								id='C14_<s:property value="trainNo"/>' style="width: 65px;"
								disabled name="currentCoach.coach14">
									<option value='<s:property value="coach14"/>'
										style="display: none;"><s:property value="coach14" /></option>
									<option value="">----</option>
									<s:iterator value="coachCaptionList">
										<option value='<s:property value="coachNameEnglish"/>'><s:property
												value="coachNameEnglish" /></option>
									</s:iterator>
							</select></td>
							<td><select class="auto-completer"
								id='C15_<s:property value="trainNo"/>' style="width: 65px;"
								disabled name="currentCoach.coach15">
									<option value='<s:property value="coach15"/>'
										style="display: none;"><s:property value="coach15" /></option>
									<option value="">----</option>
									<s:iterator value="coachCaptionList">
										<option value='<s:property value="coachNameEnglish"/>'><s:property
												value="coachNameEnglish" /></option>
									</s:iterator>
							</select></td>
						</tr>
					</tbody>
					<thead>
						<tr>
							<th>16</th>
							<th>17</th>
							<th>18</th>
							<th>19</th>
							<th>20</th>
							<th>21</th>
							<th>22</th>
							<th>23</th>
							<th>24</th>
							<th>25</th>
							<th>26</th>
							<th>27</th>
							<th>28</th>
							<th>29</th>
							<th>30</th>
						</tr>
					</thead>
					<tbody>
						<tr style="height: 30px;">
							<td><select class="auto-completer"
								id='C16_<s:property value="trainNo"/>' style="width: 65px;"
								disabled name="currentCoach.coach16">
									<option value='<s:property value="coach16"/>'
										style="display: none;"><s:property value="coach16" /></option>
									<option value="">----</option>
									<s:iterator value="coachCaptionList">
										<option value='<s:property value="coachNameEnglish"/>'><s:property
												value="coachNameEnglish" /></option>
									</s:iterator>
							</select></td>
							<td><select class="auto-completer"
								id='C17_<s:property value="trainNo"/>' style="width: 65px;"
								disabled name="currentCoach.coach17">
									<option value='<s:property value="coach17"/>'
										style="display: none;"><s:property value="coach17" /></option>
									<option value="">----</option>
									<s:iterator value="coachCaptionList">
										<option value='<s:property value="coachNameEnglish"/>'><s:property
												value="coachNameEnglish" /></option>
									</s:iterator>
							</select></td>
							<td><select class="auto-completer"
								id='C18_<s:property value="trainNo"/>' style="width: 65px;"
								disabled name="currentCoach.coach18">
									<option value='<s:property value="coach18"/>'
										style="display: none;"><s:property value="coach18" /></option>
									<option value="">----</option>
									<s:iterator value="coachCaptionList">
										<option value='<s:property value="coachNameEnglish"/>'><s:property
												value="coachNameEnglish" /></option>
									</s:iterator>
							</select></td>
							<td><select class="auto-completer"
								id='C19_<s:property value="trainNo"/>' style="width: 65px;"
								disabled name="currentCoach.coach19">
									<option value='<s:property value="coach19"/>'
										style="display: none;"><s:property value="coach19" /></option>
									<option value="">----</option>
									<s:iterator value="coachCaptionList">
										<option value='<s:property value="coachNameEnglish"/>'><s:property
												value="coachNameEnglish" /></option>
									</s:iterator>
							</select></td>
							<td><select class="auto-completer"
								id='C20_<s:property value="trainNo"/>' style="width: 65px;"
								disabled name="currentCoach.coach20">
									<option value='<s:property value="coach20"/>'
										style="display: none;"><s:property value="coach20" /></option>
									<option value="">----</option>
									<s:iterator value="coachCaptionList">
										<option value='<s:property value="coachNameEnglish"/>'><s:property
												value="coachNameEnglish" /></option>
									</s:iterator>
							</select></td>
							<td><select class="auto-completer"
								id='C21_<s:property value="trainNo"/>' style="width: 65px;"
								disabled name="currentCoach.coach21">
									<option value='<s:property value="coach21"/>'
										style="display: none;"><s:property value="coach21" /></option>
									<option value="">----</option>
									<s:iterator value="coachCaptionList">
										<option value='<s:property value="coachNameEnglish"/>'><s:property
												value="coachNameEnglish" /></option>
									</s:iterator>
							</select></td>
							<td><select class="auto-completer"
								id='C22_<s:property value="trainNo"/>' style="width: 65px;"
								disabled name="currentCoach.coach22">
									<option value='<s:property value="coach22"/>'
										style="display: none;"><s:property value="coach22" /></option>
									<option value="">----</option>
									<s:iterator value="coachCaptionList">
										<option value='<s:property value="coachNameEnglish"/>'><s:property
												value="coachNameEnglish" /></option>
									</s:iterator>
							</select></td>
							<td><select class="auto-completer"
								id='C23_<s:property value="trainNo"/>' style="width: 65px;"
								disabled name="currentCoach.coach23">
									<option value='<s:property value="coach23"/>'
										style="display: none;"><s:property value="coach23" /></option>
									<option value="">----</option>
									<s:iterator value="coachCaptionList">
										<option value='<s:property value="coachNameEnglish"/>'><s:property
												value="coachNameEnglish" /></option>
									</s:iterator>
							</select></td>
							<td><select class="auto-completer"
								id='C24_<s:property value="trainNo"/>' style="width: 65px;"
								disabled name="currentCoach.coach24">
									<option value='<s:property value="coach24"/>'
										style="display: none;"><s:property value="coach24" /></option>
									<option value="">----</option>
									<s:iterator value="coachCaptionList">
										<option value='<s:property value="coachNameEnglish"/>'><s:property
												value="coachNameEnglish" /></option>
									</s:iterator>
							</select></td>
							<td><select class="auto-completer"
								id='C25_<s:property value="trainNo"/>' style="width: 65px;"
								disabled name="currentCoach.coach25">
									<option value='<s:property value="coach25"/>'
										style="display: none;"><s:property value="coach25" /></option>
									<option value="">----</option>
									<s:iterator value="coachCaptionList">
										<option value='<s:property value="coachNameEnglish"/>'><s:property
												value="coachNameEnglish" /></option>
									</s:iterator>
							</select></td>
							<td><select class="auto-completer"
								id='C26_<s:property value="trainNo"/>' style="width: 65px;"
								disabled name="currentCoach.coach26">
									<option value='<s:property value="coach26"/>'
										style="display: none;"><s:property value="coach26" /></option>
									<option value="">----</option>
									<s:iterator value="coachCaptionList">
										<option value='<s:property value="coachNameEnglish"/>'><s:property
												value="coachNameEnglish" /></option>
									</s:iterator>
							</select></td>
							<td><select class="auto-completer"
								id='C27_<s:property value="trainNo"/>' style="width: 65px;"
								disabled name="currentCoach.coach27">
									<option value='<s:property value="coach27"/>'
										style="display: none;"><s:property value="coach27" /></option>
									<option value="">----</option>
									<s:iterator value="coachCaptionList">
										<option value='<s:property value="coachNameEnglish"/>'><s:property
												value="coachNameEnglish" /></option>
									</s:iterator>
							</select></td>
							<td><select class="auto-completer"
								id='C28_<s:property value="trainNo"/>' style="width: 65px;"
								disabled name="currentCoach.coach28">
									<option value='<s:property value="coach28"/>'
										style="display: none;"><s:property value="coach28" /></option>
									<option value="">----</option>
									<s:iterator value="coachCaptionList">
										<option value='<s:property value="coachNameEnglish"/>'><s:property
												value="coachNameEnglish" /></option>
									</s:iterator>
							</select></td>
							<td><select class="auto-completer"
								id='C29_<s:property value="trainNo"/>' style="width: 65px;"
								disabled name="currentCoach.coach29">
									<option value='<s:property value="coach29"/>'
										style="display: none;"><s:property value="coach29" /></option>
									<option value="">----</option>
									<s:iterator value="coachCaptionList">
										<option value='<s:property value="coachNameEnglish"/>'><s:property
												value="coachNameEnglish" /></option>
									</s:iterator>
							</select></td>
							<td><select class="auto-completer"
								id='C30_<s:property value="trainNo"/>' style="width: 65px;"
								disabled name="currentCoach.coach30">
									<option value='<s:property value="coach30"/>'
										style="display: none;"><s:property value="coach30" /></option>
									<option value="">----</option>
									<s:iterator value="coachCaptionList">
										<option value='<s:property value="coachNameEnglish"/>'><s:property
												value="coachNameEnglish" /></option>
									</s:iterator>
							</select></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div
				style="display: inline-block; float: right; padding-bottom: -20px; margin-right: -286px; margin-top: 12px;">
				<a href="#" style="font-size: 12px; padding: 5px 16px;"
					class="btn button2 insertCoach"
					id='insertCoach_<s:property value="trainNo"/>'>Insert</a> <a
					href="#" style="font-size: 12px; padding: 5px 16px;"
					class="btn button4 shiftLeft"
					id='shiftLeft_<s:property value="trainNo"/>'>Shift Left</a><br>
				<a href="#" style="font-size: 12px; padding: 5px 16px;"
					class="btn purple deleteCoach"
					id='deleteCoach_<s:property value="trainNo"/>'>Delete</a> <a
					href="#" style="font-size: 12px; padding: 5px 16px;"
					class="btn button4 shiftRight"
					id='shiftRight_<s:property value="trainNo"/>'>Shift Right</a><br>
				<a href="#" style="font-size: 12px; padding: 5px 16px;"
					class="btn button5 reverseCoach"
					id='reverse_<s:property value="trainNo"/>'>Reverse</a>
			</div>
			<br>
		</div>
	</form>
</s:iterator>