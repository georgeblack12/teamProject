<%--Original Author: Shiyao Ding, Haolei Ning--%>
<%--Modifying Authors: Madeleine Towes, Aggrey Nhiwatiwa, George Black (23/03/21)--%>

<!DOCTYPE html>


<%--<!doctype html>--%>
<html>
<head>
    <meta charset="utf-8">
    <title>Welcome to Cavallo</title>
    <link href="../css/login_style.css" type="text/css" rel="stylesheet">
</head>

<body>

<%--If the user already has the cust, orderID, and/or statsRep in the session removethem . This is to be used if the
user decides to go back into the login page after making/trying to make  an order or viewing the admin page.
Thanks, George Black--%>
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
<header>
    <img id="logo" src="../images/logo1.png" alt="Yellow circle with red text reading Cavallo, black text of traditional Italian ice cream and a picture of an ice cream.">
</header>

<div id="intro">
    <h1>About Us</h1>
    <p>Welcome to Cavallo! We are a traditional Italian ice cream shop based in Northumberland. To browse our selection of goods, please login or create an account below.</p>
</div>

<div id="nav">
    <div class="left">
        <h2>Login</h2>

        <%--        If the user tries to log in and and they enter incorrect credentials an error message is displayed.
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
Please enter your email" onchange="validate_username(this.value)"/></td>
                </tr>
                <tr>
                <td id="test_user"></td>
                </tr>
                <tr>
                    <td class="tit">Password:</td>
                </tr>
                    <td>
                        <input type="password" id="password" name="password"
                               placeholder="Please enter your password"
                               onchange="validate_password(this.value)"/>
                    </td>
                </tr>
                <tr>
                    <td id="test_pw"></td>
                </tr>
                <tr>
                <tr>
                    <td>
                        <input type="submit" id="submit_form" value="Login"/>
                    </td>
                </tr>
            </table>
        </form>
    </div>

    <div class="right">
        <h2>Register</h2>
        <p>To view the Cavallo site, you must have an account.</p>
        <p>If you do not have an account, please press the register button below to create one.</p>
        <div id="goto_register"><a href="/pages/register.jsp">Register</a>
        </div>
    </div>

</div>

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

<script type="text/javascript">

    //函数1：验证邮箱格式
    function validate_username(username) {
        //定义正则表达式的变量:邮箱正则
        var emailReg = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
        //console.log(username);
        if (username != "" && username.search(emailReg) != -1) {
            console.log(document.getElementById("email").value);
            document.getElementById("test_user").innerHTML = "<font color='green' size='3px'>email format is correct</font>";
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
            document.getElementById("test_pw").innerHTML = "<font color='green' size='3px'>the password format is correct</font>";
        } else {
            document.getElementById("test_pw").innerHTML = "<font color='red' size='3px'>password format error</font>";
        }
    }

</script>
</html>
