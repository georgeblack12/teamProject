<!DOCTYPE html>
<html>
<head>
	<title>register</title>
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
<img id="logo" src="../images/logo.png" >
<br>
<div id="user_reg">create a new user</div>
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
					   placeholder="This should only contain 9 to 10 digits" oninput="validatePhoneNumber()"/></td>
			<td id="phone_user"></td>


		</tr>
		<tr>
			<td class="tit">Password:</td>
			<td><input type="password" id="password" name="password" placeholder="Needs 8-16 digits and upper and lower case letters."
					   oninput="validatePassword()"/></td>
			<td id="test_pw"></td>
		</tr>
		<tr>
			<td class="tit">Confirm password:</td>
			<td><input type="password" id="password2" name="password2" oninput="validatePasswordCheck()" /></td>
			<td id="is_test_pw"></td>
		</tr>
		<tr>
			<td></td>
			<td><input type="submit" id="submit_form" value="Register" onclick="validateForm()"/></td>
			<td></td>
		</tr>
	</table>
</form>
</body>

<script type="text/javascript" src="../javascript/register.js"></script>

</html>