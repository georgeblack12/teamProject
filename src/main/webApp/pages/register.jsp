<%--Original Author: Shiyao Ding, Haolei Ning--%>
<%--Modifying Authors: Madeleine Towes, Aggrey Nhiwatiwa, George Black (23/03/21)--%>

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
	<title>Register</title>
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="this is my page">
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<link href="../css/register_style.css" type="text/css" rel="stylesheet">


	<!--    Files needed to be added in order to get Sweet alert 2. These are used in the pop ups when the person wishes
    to make-a payment. Thanks, George Black-->
	<script src="../javascript/sweetalert2.min.js"></script>
	<link rel="stylesheet" href="../css/sweetalert2.css">

</head>

<body>

<header>
	<img id="logo" src="../images/logo1.png" alt="Yellow circle with red text reading Cavallo, black text of traditional Italian ice cream and a picture of an ice cream.">
</header>

<div id="intro">
	<h1>Register</h1>
	<p>Please register here</p>
</div>

<main>

<h2>Create new account</h2>
<form id="registerForm" onsubmit="return false;">
	<table>
		<tr>
			<td class="tit">Full Name:</td>
			<td><input type="text" id="name" name="name"
					   placeholder="Please enter your first and last name" oninput="validateName()"/></td>
			<td id="name_user"></td>

		</tr>

		<tr>
			<td class="tit">Email address:</td>
			<td><input type="text" id="email" name="email"
					   placeholder="Please enter your email" oninput="validateEmail()"/></td>
			<td id="email_user"></td>
		</tr>

		<tr>
			<td class="tit">Phone Number:</td>
			<td><input type="text" id="phoneNumber" name="phoneNumberUser"
					   placeholder="This should contain 9-11 digits" oninput="validatePhoneNumber()"/></td>
			<td id="phone_user"></td>
		</tr>

		<tr>
			<td class="tit">Password:</td>
			<td><input type="password" id="password" name="password" placeholder="8-16 characters inc. numbers and upper & lower case letters"
					   oninput="validatePassword()"/></td>
			<td id="test_pw"></td>
		</tr>

		<tr>
			<td class="tit">Confirm password:</td>
			<td><input type="password" id="password2" name="password2" placeholder="Re-enter your password" oninput="validatePasswordCheck()" /></td>
			<td id="is_test_pw"></td>
		</tr>

		<tr>
			<td></td>
			<td><input type="submit" id="submit_form" value="Register" onclick="validateForm()"/></td>
			<td></td>
		</tr>
	</table>
</form>
</main>

<footer>
	<div class="contactleft">
		<p>Avenue Cresent, Seaton Delaval, Northumberland, NE25 0DN </p>
		<p>Open Monday - Sunday 11:00-18:00 </p>
	</div>

	<div class="socials">
		<a href="https://www.instagram.com" target="_blank"><img class="icons" src="../images/instagram.png"></a>
		<a href="https://www.twitter.com" target="_blank"><img class="icons" src="../images/twitter.png"></a>
		<a href="https://www.facebook.com" target="_blank"><img class="icons" src="../images/facebook.jpg"></a>
	</div>
</footer>

</body>

<script type="text/javascript" src="../javascript/register.js"></script>

</html>