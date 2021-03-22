function validateName(){
    var name = document.getElementById("name").value;

    var accept=false;
    if(name.length<1 || name.length>50){
        document.getElementById("name_user").innerHTML = "<font color='red' size='3px'>There is no name entered</font>";
    }else if(!(name.includes(" "))){
        document.getElementById("name_user").innerHTML = "<font color='red' size='3px'>Please enter first and last name</font>";
    } else {
        var names=name.split(' ');

        if(names[0].length<1 || names[1].length<1){
            document.getElementById("name_user").innerHTML = "<font color='red' size='3px'>Please enter first and last name</font>";
        }else {
            document.getElementById("name_user").innerHTML = "<font color='green' size='3px'>Valid Name</font>";
            accept = true;
        }
    }
    return accept;
}


var isEmail;
var emailAccepted;
function validateEmail() {
    var email=document.getElementById("email").value;

    if(email.length<1){
        document.getElementById("email_user").innerHTML = "<font color='red' size='3px'>No Email Entered</font>"
        emailAccepted=false;
    }else {
        let xhr = new XMLHttpRequest();
        let url = '/checkEmailInUse';
        xhr.open("POST", url, true);
        xhr.setRequestHeader("Content-Type", "application/json");
        xhr.send(email);

        xhr.onreadystatechange = function () {
            if (xhr.readyState == XMLHttpRequest.DONE) {
                isEmail = JSON.parse(xhr.response);
                emailAccepted=validateRestOfEmail();
            }
        }
    }
    console.log(emailAccepted);
    return emailAccepted;
}

function validateRestOfEmail(){
    var accepted;

    var email=document.getElementById("email").value;

    //定义正则表达式的变量:邮箱正则
    var emailReg=/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;

    if (isEmail){
        document.getElementById("email_user").innerHTML = "<font color='red' size='3px'>This email is already registered</font>";
        accepted= false;
    } else if(email.search(emailReg) != -1)
    {
        document.getElementById("email_user").innerHTML = "<font color='green' size='3px'>Email accepted</font>";
        accepted=true;
    }else{
        document.getElementById("email_user").innerHTML = "<font color='red' size='3px'>Email format error</font>";
        accepted= false;
    }
    return accepted;
}

function validatePhoneNumber(){

    var accepted;

    var number=document.getElementById("phoneNumber").value;

    if(number.length<9 || number.length>=12){
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

    if(password.length>0 && password.search(passwordReg) != -1 && password.length<17)
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


function validateForm() {
    var accepted;
    accepted = validateName();

    if (accepted) {
        accepted = validateEmail();

    }
    if (accepted) {
        accepted = validatePhoneNumber();

    }
    if (accepted) {
        accepted = validatePassword();

    }
    if (accepted) {
        accepted = validatePasswordCheck();

    }

    console.log(accepted);

    if(accepted) {
        registerCustomer();
        Swal.fire({
            imageUrl: "../images/dancingCream.gif",
            imageWidth:"300px",
            imageHeight:"300px",
            title:"You're In!",
            text: "You have been added to our system! Login to the website to make your first " +
                "ice cream purchase",
            confirmButtonText: "Back to login page",
            allowOutsideClick: false
        }).then(() => {
            window.location.replace("/");
        })
    }else{
        Swal.fire({
            icon:'error',
            title:"Unable to register",
            text:"Some of the required fields have not been filled out or there is an error in your entry",
            allowOutsideClick:false
        })
    }
}


function registerCustomer(){
    var formData=document.getElementById("registerForm");

    var personToRegister={
        "email": formData.elements[1].value.toString(),
        "name": formData.elements[0].value.toString(),
        "phoneNo": formData.elements[2].value.toString(),
        "password": formData.elements[3].value.toString()
    }




    let xhr = new XMLHttpRequest();
    let url = '/registerCustomerUser';
    xhr.open("POST", url, true);
    xhr.setRequestHeader("Content-Type", "application/json");
    xhr.send(JSON.stringify(personToRegister));

    xhr.onreadystatechange = function () {
        if (xhr.readyState == XMLHttpRequest.DONE) {
            console.log("it is finished");
        }
    }
}