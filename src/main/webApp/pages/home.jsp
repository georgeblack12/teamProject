<%@ page import="com.project.cavallo.dao.StatisticsRepository" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>


<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>login</title>
    <link href="../css/login_style.css" type="text/css" rel="stylesheet">

</head>

<body>

<%--If the user already has the custId in the session remove it. This is to be used if the user decides to go back into--%>
<%--the login page after making/trying to make  an order. Thanks, George Black--%>
<%if (session.getAttribute("cust") != null) {%>
<%session.removeAttribute("cust");%>
<%
    }
    if (session.getAttribute("orderID") != null) {%>
<%
        session.removeAttribute("orderID");
    }
    if(session.getAttribute("statsRepo") != null) {
        session.removeAttribute("statsRepo");
    }
%>


            <img id="logo" src="../images/logo.png">

<br>

<div id="nav">
    <div class="left">
        <h2>login</h2>

        <%--        If the user tries to login and and they enter incorrect credentials an error message is displayed.
                    This will need to be styled. Thanks, George Black. --%>
        <% if (request.getAttribute("ERROR") != null) { %>
        <%=request.getAttribute("ERROR")%>
        <%
            }%>


        <form action="login" method="post" name="form">
            <table>
                <tr>
                    <td class="tit">Email address:</td>
                </tr>
                <tr>
                    <td><input type="text" id="email" name="email" placeholder="
Please log in by email" onblur="validate_username(this.value)"/></td>
                </tr>
                <tr>
                    <td id="test_user"></td>
                </tr>
                <tr>
                    <td class="tit">Password:</td>
                </tr>
                <tr>
                    <td><input type="password" id="password" name="password"
                               placeholder="The 8-16 bit password consists of numbers and uppercase and lowercase letters！"
                               onblur="validate_password(this.value)"/></td>
                </tr>
                <tr>
                    <td id="test_pw"></td>
                </tr>
                <tr>
                    <td>

                        <input type="submit" id="submit_form" value="Login" onclick="return validate_form()"/>
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <div class="right">
        <h2>register</h2>
        <p class="tips">Notice for registration:</p>
        <br>
        <br>
        <p>Please register by email</p>
        <p>The password has 6 digits, composed of numbers and letters!</p>
        <div id="goto_register"><a href="/pages/register.jsp">Register</a>
        </div>
    </div>

</div>


</body>

<script type="text/javascript">






    //函数1：验证邮箱格式
    function validate_username(username) {
        //定义正则表达式的变量:邮箱正则
        var emailReg = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
        //console.log(username);
        if (username != "" && username.search(emailReg) != -1) {
            document.getElementById("test_user").innerHTML = "<font color='green' size='3px'>√ email format is correct</font>";
        } else {
            document.getElementById("test_user").innerHTML = "<font color='red' size='3px'> email format error</font>";
        }
    }

    //函数2：验证密码是否符合要求：匹配6位密码，由数字和字母组成：
    function validate_password(password) {
        //^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6-10}$
        //测试密码：12345y
        var passwordReg = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[^]{8,16}$/;
        if (password != "" && password.search(passwordReg) != -1) {
            document.getElementById("test_pw").innerHTML = "<font color='green' size='3px'>√ the password format is correct</font>";
        } else {
            document.getElementById("test_pw").innerHTML = "<font color='red' size='3px'>password format error</font>";
            alert("The password consists of 8-16 digits. The password consists of numbers and upper and lower case letters");
        }
    }

    //Edited this out since it seemed to be a test case and no longer needed now we are connected to database. At least
    //locally, feel free to change it if need be Thanks, George Black.


    //函数4：验证表单是否已经填好
    // function validate_form() {
    //     var username = document.getElementById("username").value;
    //     var password = document.getElementById("password").value;
    //     //console.log("表单填写正确，可以正常提交！");
    //
    //     //这三个，如果任何一个有问题，都返回false
    //     //18128@qq.com		12345y
    //     var emailReg = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
    //     var passwordReg = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[^]{8,16}$/;
    //
    //     if (username != "" && emailReg.test(username)) {
    //         if (password != "" && passwordReg.test(password)) {
    //             alert("信息填写正确，可以正常提交！");
    //             console.log("信息填写正确，可以正常提交！");
    //             return true;
    //         } else {
    //             alert("密码格式错误，提交失败，请重新填写！");
    //             console.log("密码格式错误，提交失败，请重新填写！");
    //             return false;
    //         }
    //     } else {
    //         alert("注册的账号不符合要求，提交失败，请重新填写！");
    //         console.log("注册的账号不符合要求，提交失败，请重新填写！");
    //         return false;
    //     }
    // }
</script>
</html>
