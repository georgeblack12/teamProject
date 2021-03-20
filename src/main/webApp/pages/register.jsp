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
<form action="/" method="post" name="form" >
	<table>
		<tr>
			<td class="tit">Full Name:</td>
			<td><input type="text" id="name" name="name"
					   placeholder="Please enter your first and last name" onblur="validateName(this.value)"/></td>
			<td id="name_user"></td>

		</tr>
		<tr>
			<td class="tit">Email address:</td>
			<td><input type="text" id="email" name="email"
					   placeholder="Please enter your email" onblur="validate_email(this.value)"/></td>
			<td id="email_user"></td>
		</tr>
		<tr>
			<td class="tit">Phone Number:</td>
			<td><input type="text" id="phoneNumber" name="phoneNumberUser"
					   placeholder="This should only contain 9 to 10 digits" onblur="validatePhoneNumber(this.value)"
					   onblur="validate_username(this.value)"/></td>
			<td id="phone_user"></td>


		</tr>
		<tr>
			<td class="tit">Password:</td>
			<td><input type="password" id="password" name="password" placeholder="The password consists of 8-16 digits. The password consists of numbers and upper and lower case letters" onblur="validate_password(this.value)"/></td>
			<td id="test_pw"></td>
		</tr>
		<tr>
			<td class="tit">Confirm password:</td>
			<td><input type="password" id="password2" name="password2" onblur="validate_password2(this.value)" /></td>
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
	function validateName(name){
		if(name=""){
			document.getElementById("name_user").innerHTML = "<font color='red' size='3px'>There is no name entered</font>";
		}else if(!(name.contains(" "))){
			document.getElementById("name_user").innerHTML = "<font color='red' size='3px'>Please enter first and last name</font>";
		}
	}



	//onblur失去焦点事件，用户离开输入框时执行 JavaScript 代码：
	//函数1：验证邮箱格式
	// Onblur loses focus events and executes JavaScript code when the user leaves the input box:
	// Function 1: Verify mailbox format
	function validate_email(email){
		//定义正则表达式的变量:邮箱正则
		var emailReg=/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
		//console.log(username);
		if(email !="" && email.search(emailReg) != -1)
		{
			document.getElementById("email_user").innerHTML = "<font color='green' size='3px'>Email accepted</font>";
		}else{
			document.getElementById("email_user").innerHTML = "<font color='red' size='3px'>Email format error</font>";
		}
	}

	function validatePhoneNumber(number){

		if(number.length<9 || number.length>10){
			document.getElementById("phone_user").innerHTML = "<font color='red' size='3px'>Phone number length is incorrect</font>";

		} else if(number.match(/^[0-9]+$/) == null){
			document.getElementById("phone_user").innerHTML ="<font color='red' size='3px'>Phone number should only contain numbers</font>";

		} else{
			document.getElementById("phone_user").innerHTML = "<font color='green' size='3px'>Phone number accepted</font>"
		}
	}



	//函数2：验证密码是否符合要求：匹配6位密码，由数字和字母组成：
	// Function 2: Verify that the password matches the requirement: Matches the 6-digit password, consisting of numbers and letters:
	function validate_password(password){
		//^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6-10}$
		//测试密码：12345y
		// Test password: 12345y
		var passwordReg=/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[^]{8,16}$/;
		if(password != "" && password.search(passwordReg) != -1)
		{
			document.getElementById("test_pw").innerHTML = "<font color='green' size='3px'>√ The password format is correct</font>";
		}else{
			document.getElementById("test_pw").innerHTML = "<font color='red' size='3px'>Password format error</font>";
			alert("The password consists of 8-16 digits. The password consists of numbers and upper and lower case letters！");
		}
	}

	//函数3：验证两次输入的密码是否一样
	// Function 3: Verify that the password is the same when entered twice
	function validate_password2(password2){
		var password = document.getElementById("password").value;
		//测试：console.log(password);
		//测试：console.log(password2);
		if (password == ""){
			document.getElementById("is_test_pw").innerHTML = "<font color='red' size='3px'>Password is empty</font>";
		}else if(password==password2){
			document.getElementById("is_test_pw").innerHTML = "<font color='green' size='3px'>The password entered twice is the same</font>";
		}else{
			document.getElementById("is_test_pw").innerHTML = "<font color='red' size='3px'>The password entered twice is not the same</font>";
			console.log("The password has 6 digits, composed of numbers and letters!");
		}
	}



	//函数4：验证表单是否已经填好
	// Function 4: Verifies that the form is already filled in
	function validate_form(){
		var username = document.getElementById("username").value;
		var password = document.getElementById("password").value;
		var password2 = document.getElementById("password2").value;
		//console.log("表单填写正确，可以正常提交！");

		//这三个，如果任何一个有问题，都返回false
		//console.log(" Form filled correctly, ready to submit!");
        // All three return false if there is a problem with any of them
		//18128@qq.com		12345y
		var emailReg=/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
		var passwordReg=/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[^]{8,16}$/;

		if(username != "" && emailReg.test(username)){
			if(password !="" && passwordReg.test(password)){
				if(password2==password){
					alert("Information filled in correctly, can be submitted normally!");
					console.log("Information filled in correctly, can be submitted normally!");
					return true;
				}else{
					alert("The password is not consistent, the submission failed, please fill in again!");
					console.log("The password is not consistent, the submission failed, please fill in again!");
					return false;
				}
			}else{
				alert("Incorrect password format, failed to submit, please fill in again!");
				console.log("Incorrect password format, failed to submit, please fill in again!");
				return false;
			}
		}else{
			alert("The registered account does not meet the requirements, the submission failed, please fill in again!");
			console.log("The registered account does not meet the requirements, the submission failed, please fill in again!");
			return false;
		}
	}
</script>


</html>