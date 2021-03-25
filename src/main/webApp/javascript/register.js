/**
 * Method that checks to see if the name being entered has the proper format. For this, we only required a space
 * and a single letter between each space. If the value for name is not correctly entered, then display the issue
 * and return false. Otherwise, display the entry is valid and return true. This method will be used in validateForm.
 * @returns {boolean} A boolean that is true if the entered name has the required format and returns false otherwise.
 * Original Authors: Shiyao Ding, Haolei Ning
 * Modifying Author: George Black
 */
function validateName() {
    var name = document.getElementById("name").value;

    var accept = false;
    if (name.length < 1 || name.length > 50) {
        document.getElementById("name_user").innerHTML = "<font color='red' size='3px'>There is no name entered</font>";
    } else if (!(name.includes(" "))) {
        document.getElementById("name_user").innerHTML = "<font color='red' size='3px'>Please enter first and last name</font>";
    } else {
        var names = name.split(' ');

        if (names[0].length < 1 || names[1].length < 1) {
            document.getElementById("name_user").innerHTML = "<font color='red' size='3px'>Please enter first and last name</font>";
        } else {
            document.getElementById("name_user").innerHTML = "<font color='green' size='3px'>Valid Name</font>";
            accept = true;
        }
    }
    return accept;
}

//varaibles used in validateEmail
var isEmail;
var emailAccepted;

/**
 * Method that checks to see if the email being entered does not have a length less than one and, more importantly,
 * checks to see if the email entered already registered. If the email length is 0, then the issue is displayed, and false is returned.
 * Otherwise, true is returned and a request is sent to see if the email is already in the User
 * table. This method will be used in validateForm.
 * @returns {boolean} A boolean that is false if the entered email has a length of 0 or the email is already in the User
 * table. This method returns true otherwise.
 * Original Authors: Shiyao Ding, Haolei Ning
 * Modifying Author: George Black
 */
function validateEmail() {
    var email = document.getElementById("email").value;

    if (email.length < 1) {
        document.getElementById("email_user").innerHTML = "<font color='red' size='3px'>No Email Entered</font>"
        emailAccepted = false;
    } else {

        //send request to see if the email is Already in the User Table.
        let xhr = new XMLHttpRequest();
        let url = '/checkEmailInUse';
        xhr.open("POST", url, true);
        xhr.setRequestHeader("Content-Type", "application/json");
        xhr.send(email);

        xhr.onreadystatechange = function () {
            if (xhr.readyState == XMLHttpRequest.DONE) {
                isEmail = JSON.parse(xhr.response);
                //if the email is unique do the rest of the validation
                emailAccepted = validateRestOfEmail();
            }
        }
    }
    return emailAccepted;
}

/**
 * Does the rest of the validation for the email that the client entered. If the email is already registered, an error
 * message is shown, and false is returned. If the email does not have the proper format, then an error message is
 * shown, and false is returned. Otherwise, a message saying the email is accepted is displayed, and true is returned.
 * This method is used in validateForm.
 *
 * @returns {boolean} A boolean that is true if the email entered is accepted. Otherwise, false is returned.
 * Original Authors: Shiyao Ding, Haolei Ning
 * Modifying Author: George Black
 */
function validateRestOfEmail() {
    var accepted;

    var email = document.getElementById("email").value;

    //定义正则表达式的变量:邮箱正则
    var emailReg = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;

    if (isEmail) {
        document.getElementById("email_user").innerHTML = "<font color='red' size='3px'>This email is already registered</font>";
        accepted = false;
    } else if (email.search(emailReg) != -1) {
        document.getElementById("email_user").innerHTML = "<font color='green' size='3px'>Email accepted</font>";
        accepted = true;
    } else {
        document.getElementById("email_user").innerHTML = "<font color='red' size='3px'>Email format error</font>";
        accepted = false;
    }
    return accepted;
}

/**
 * A method to verify the phoneNumber entered meets the needed requirements. If the entered phone number does not have
 * the proper length or contains values that are not numbers, false is returned, and an error message is displayed.
 * Otherwise, true is returned, and a message saying "phone number accepted" is displayed.
 * @returns {boolean} A boolean that is false if the entered phone number does not meet the needed requirements.
 * Otherwise, true is returned.
 * Original Authors: Shiyao Ding, Haolei Ning
 * Modifying Author: George Black
 */
function validatePhoneNumber() {
    var accepted;

    var number = document.getElementById("phoneNumber").value;

    if (number.length < 9 || number.length >= 12) {
        document.getElementById("phone_user").innerHTML = "<font color='red' size='3px'>Phone number length is incorrect</font>";
        accepted = false;

    } else if (number.match(/^[0-9]+$/) == null) {
        document.getElementById("phone_user").innerHTML = "<font color='red' size='3px'>Phone number should only contain numbers</font>";
        accepted = false;

    } else {
        document.getElementById("phone_user").innerHTML = "<font color='green' size='3px'>Phone number accepted</font>"
        accepted = true;
    }
    return accepted;
}

/**
 * A method to verify the password entered meets the needed requirements. If the entered phone number does not have
 * 8-16 characters with numbers, lowercase, and uppercase letters, false is returned, and an error message is displayed.
 * Otherwise, true is returned, and a message saying "Password accepted" is displayed.
 * @returns {boolean} A boolean that is false if the entered password does not meet the needed requirements.
 * Otherwise, true is returned.
 * Original Authors: Shiyao Ding, Haolei Ning
 * Modifying Author: George Black
 */
function validatePassword() {

    var password = document.getElementById("password").value;

    var passwordReg = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[^]{8,16}$/;

    if (password.length > 0 && password.search(passwordReg) != -1 && password.length < 17) {
        document.getElementById("test_pw").innerHTML = "<font color='green' size='3px'>Password accepted</font>";
        return true;
    } else {
        document.getElementById("test_pw").innerHTML = "<font color='red' size='3px'>Password format error</font>";
        return false;

    }
}

/**
 * A method to verify the password entered in the password verification input is the same as the password that was
 * entered in password input. If they are not the same, an error message is displayed, and false is returned. Otherwise,
 * a message saying, "The password entered twice is the same," is displayed, and true is returned.
 * @returns {boolean} Returns a boolean that is false if the password entered is not the same as the password entered in the
 * password input. Otherwise, false is returned.
 * Original Authors: Shiyao Ding, Haolei Ning
 * Modifying Author: George Black
 */
function validatePasswordCheck() {
    var accepted;

    var password = document.getElementById("password").value;
    var password2 = document.getElementById("password2").value;


    if (password == "") {
        document.getElementById("is_test_pw").innerHTML = "<font color='red' size='3px'>Password is empty</font>";
        accepted = false;
    } else if (password == password2) {
        document.getElementById("is_test_pw").innerHTML = "<font color='green' size='3px'>The password entered twice is the same</font>";
        accepted = true;
    } else {
        document.getElementById("is_test_pw").innerHTML = "<font color='red' size='3px'>The password entered twice is not the same</font>";
        accepted = false;
    }
    return accepted;
}

/**
 * Function run when a client tries to register a new Customer/User. If all the inputs entered meet all the proper
 * requirements, then the new User and Client are registered, and they are given a popup telling them they are registered.
 * If any of the inputs are not entered correctly, an error message is displayed.
 * Original Authors: Shiyao Ding, Haolei Ning
 * Modifying Author: George Black
 */
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

    if (accepted) {
        registerCustomer(); //register the Customer and User. Need to do User as well since a Customer isa User
        Swal.fire({
            imageUrl: "../images/dancingCream.gif",
            imageWidth: "300px",
            imageHeight: "300px",
            title: "You're In!",
            text: "You have been added to our system! Login to the website to make your first " +
                "ice cream purchase",
            confirmButtonText: "Back to login page",
            allowOutsideClick: false
        }).then(() => {
            window.location.replace("/");
        })
    } else {
        Swal.fire({
            icon: 'error',
            title: "Unable to register",
            text: "Some of the required fields have not been filled out or there is an error in your entry",
            allowOutsideClick: false
        })
    }
}


/**
 * A method to register a Customer and User in the database with the given inputs that were entered by the client.
 * @author George Black
 */
function registerCustomer() {
    var formData = document.getElementById("registerForm");

    //get all the form data inputs and create a JSON to send to the server.
    var personToRegister = {
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