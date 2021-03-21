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
	<script src="../SweetAlertJavaScript/sweetalert2.min.js"></script>
	<link rel="stylesheet" href="../css/sweetalert2.css">

</head>

<body>
<img id="logo" src="../images/logo.png" >
<br>
<div id="user_reg">create a new user</div>
<form action="register" method="post" name="form" >
	<table>
		<tr>
			<td class="tit">Full Name:</td>
			<td><input type="text" id="name" name="name"
					   placeholder="Please enter your first and last name" onblur="validateName()"/></td>
			<td id="name_user"></td>

		</tr>
		<tr>
			<td class="tit">Email address:</td>
			<td><input type="text" id="email" name="email"
					   placeholder="Please enter your email" onblur="validateEmail()"/></td>
			<td id="email_user"></td>
		</tr>
		<tr>
			<td class="tit">Phone Number:</td>
			<td><input type="text" id="phoneNumber" name="phoneNumberUser"
					   placeholder="This should only contain 9 to 10 digits" onblur="validatePhoneNumber()"
					   onblur="validate_username(this.value)"/></td>
			<td id="phone_user"></td>


		</tr>
		<tr>
			<td class="tit">Password:</td>
			<td><input type="password" id="password" name="password" placeholder="Needs 8-16 digits and upper and lower case letters."
					   onblur="validatePassword()"/></td>
			<td id="test_pw"></td>
		</tr>
		<tr>
			<td class="tit">Confirm password:</td>
			<td><input type="password" id="password2" name="password2" onblur="validatePasswordCheck()" /></td>
			<td id="is_test_pw"></td>
		</tr>
		<tr>
			<td></td>
			<td><input type="submit" id="submit_form" value="Register" onclick="return validate_form()"/></td>
			<td></td>
		</tr>
	</table>
</form>
</body>

<script type="text/javascript">

	//COME BACK HERE
	function validateName(){
		var name = document.getElementById("name").value;
		console.log(name);

		var accept=false;
		if(name.length<1){
			document.getElementById("name_user").innerHTML = "<font color='red' size='3px'>There is no name entered</font>";
		}else if(!(name.includes(" "))){
			document.getElementById("name_user").innerHTML = "<font color='red' size='3px'>Please enter first and last name</font>";
		} else {
			accept=true;
		}
		return accept;
	}


	function checkIfInUse(email){
		let xhr = new XMLHttpRequest();
		let url = '/checkEmailInUse';
		xhr.open("POST", url, true);
		xhr.setRequestHeader("Content-Type", "application/json");
		xhr.send(email);
		xhr.onreadystatechange = function () {
			if (xhr.readyState == XMLHttpRequest.DONE) {
				console.log(JSON.parse(xhr.response));
				return JSON.parse(xhr.response);

			}
		}
	}



	//onblur失去焦点事件，用户离开输入框时执行 JavaScript 代码：
	//函数1：验证邮箱格式
	// Onblur loses focus events and executes JavaScript code when the user leaves the input box:
	// Function 1: Verify mailbox format
	function validateEmail(){
		var email=document.getElementById("email").value;
		//定义正则表达式的变量:邮箱正则
		var emailReg=/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;

		var alreadyInUse=checkIfInUse(email);
		//console.log(username);
		if(email !="" && email.search(emailReg) != -1)
		{
			document.getElementById("email_user").innerHTML = "<font color='green' size='3px'>Email accepted</font>";
			return true;
		}else if (alreadyInUse){
			document.getElementById("email_user").innerHTML = "<font color='red' size='3px'>This email is already registered</font>";
			return false
		}else{
			document.getElementById("email_user").innerHTML = "<font color='red' size='3px'>Email format error</font>";
			return false;
		}
	}

	function validatePhoneNumber(){

		var accepted;

		var number=document.getElementById("phoneNumber").value;

		if(number.length<9 || number.length>10){
			document.getElementById("phone_user").innerHTML = "<font color='red' size='3px'>Phone number length is incorrect</font>";
			accepted=false;

		} else if(number.match(/^[0-9]+$/) == null){
			document.getElementById("phone_user").innerHTML ="<font color='red' size='3px'>Phone number should only contain numbers</font>";
			accepted=false;

		} else{
			document.getElementById("phone_user").innerHTML = "<font color='green' size='3px'>Phone number accepted</font>"
			accepted=true;
		}
		return accepted;
	}



	//函数2：验证密码是否符合要求：匹配6位密码，由数字和字母组成：
	// Function 2: Verify that the password matches the requirement: Matches the 6-digit password, consisting of numbers and letters:
	function validatePassword(){

		var password=document.getElementById("password").value;

		var passwordReg=/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[^]{8,16}$/;
		if(password != "" && password.search(passwordReg) != -1)
		{
			document.getElementById("test_pw").innerHTML = "<font color='green' size='3px'>Password accepted</font>";
			return true;
		}else{
			document.getElementById("test_pw").innerHTML = "<font color='red' size='3px'>Password format error</font>";
			return false;

		}
	}

	//函数3：验证两次输入的密码是否一样
	// Function 3: Verify that the password is the same when entered twice
	function validatePasswordCheck(){
		var accepted;

		var password = document.getElementById("password").value;
		var password2 = document.getElementById("password2").value;


		if (password == ""){
			document.getElementById("is_test_pw").innerHTML = "<font color='red' size='3px'>Password is empty</font>";
			accepted=false;
		}else if(password==password2){
			document.getElementById("is_test_pw").innerHTML = "<font color='green' size='3px'>The password entered twice is the same</font>";
			accepted=true;
		}else{
			document.getElementById("is_test_pw").innerHTML = "<font color='red' size='3px'>The password entered twice is not the same</font>";
			accepted=false;
		}
		return accepted;
	}


	function validate_form() {
		var accepted;
		accepted = validateName();
		if (accepted) {
			accepted = validateEmail();
		}
		if (accepted) {
			accepted = validatePhoneNumber();
		}
		if (accepted) {
			accepted = validatePassword()
		}
		if (accepted) {
			accepted = validatePasswordCheck();
		}
		if (accepted) {
			Swal.fire({
				imageURL: "../images/dancingCream.gif",
				text: "You are currently being added to our system! Login to the website to make your first " +
						"ice cream purchase",
				confirmButtonText: "Back to login page"
			}).then(() => {
				return accepted;
			})
		}
	}












</script>


</html>