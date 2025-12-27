<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<TITLE>User Settings</TITLE>
<META http-equiv=Content-Type content="text/html; charset=utf-8">
<link rel="stylesheet" href="css/style.css">
</head>
<body>
	<div style="background: #111">
		<img src="images/header2.png" width="100%" height="100" alt="header2" />
	</div>

	<div id="page-wrap" style="width: 50%; margin-top: 5%; height: 50%;">
		<br>
		<h2 style="text-align: center">User Login</h2>
		<hr style="width: 100%">

		<s:if test="%{result!=null}">
			<br>
			<center>
				<span style="color: red;"><s:property value="result" /></span>
			</center>
		</s:if>

		<form id="userLoginForm" method="post" action="login">
			<div class="left"
				style="margin-left: 20%; color: white; font-size: large">
				<table cellspacing="10">

					<tr></tr>
					<tr></tr>
					<tr>
						<td><label>*User ID</label></td>
						<td><input type="text" class="required" id="userId"
							name="user.userId" value='<s:property value="user.userId"/>' placeholder="Enter User Id" required></td>
					</tr>
					<tr></tr>
					<tr></tr>
					<tr>
						<td><label>*Password</label></td>
						<td><input type="password" id="password" class="required" name="user.password" value='<s:property value="user.password"/>'
							placeholder="Enter Password" required></td>
					</tr>
					<tr></tr>
					<tr></tr>

				</table>
			</div>

			<div id="buttons" style="text-align: center">

				<button id="login" class="btn orange">Login</button>

			</div>

		</form>

	</div>

</body>
</html>