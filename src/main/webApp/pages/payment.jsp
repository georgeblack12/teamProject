<%@ page import="org.springframework.ui.Model" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <link href="../css/payment_style.css" type="text/css" rel="stylesheet">
    <script src="../SweetAlertJavaScript/sweetalert2.min.js"></script>
    <script>

    </script>
    <link rel="stylesheet" href="../css/sweetalert2.css">


    <title>payment</title>
</head>


<body>
<img id="logo" src="../images/logo.png">
<br>
<h2 id="tit">Payment</h2>


<%--Table probably needs to be edited to meet the requirements of horsePay, we do not need a name on Car,--%>
<%--Card Number, or timeZone (we can assume that it is GMT). Thank, George Black--%>
<table id="table">
    <tr>
        <td class="tip">Card type:</td>
        <td>
            <select class="border">
<%--                Only need the option of payment to be HorsePay--%>
                <option>HorsePay (not HorsePlay, ya ding)</option>
                <%--				<option>VISA</option>--%>
                <%--				<option>MASTER</option>--%>
            </select>
        </td>
    </tr>
    <tr>
        <td class="tip">Name on the card:</td>
        <td><input type="text" id="input_border" class="input_border" name="border"/></td>
    </tr>
    <tr>
        <td class="tip">Card number:</td>
        <td><input type="text" id="input_border" class="input_border" name="border"/></td>
    </tr>
    <tr>
        <td class="tip">Time zone</td>
        <td>
            <select class="border" id="shiQu">
                <option>ZeroTimeZone(UKTime)</option>
                <option>EastEightTimeZone(BeijingTime)</option>
                <option>WestDistrict5(UsTime)</option>
                <option>DongjiuDistrict(JapanTime)</option>
            </select>
        </td>
    </tr>
    <tr>
        <td class="tip">Expiry date:</td>
        <td><p id="date"></p></td>
    </tr>
</table>


<%--	<div id="pay">Pay now  £<span id="money"></span></div>--%>
<%--Edited to display total cost. Thanks, George Black--%>
<div id="pay" onclick="askToCompleteOrder()">Pay now £ <%=request.getParameter("totalCost")%>
</div>


</body>


<script type="text/javascript">
    //I to not believe this code is no longer needed based on how I am getting the totalCost now. Feel free to change if
    //need be. Could you please translate/change your chinese? Thanks, George Black.

    //获取总额
    //var infor = window.location.search.substring(1).split("&");
    //var money = document.getElementById("money");

    //money.innerHTML = infor;
    //alert(infor);

    //选择时区获取时间
    var shiQu = document.getElementById("shiQu");
    var date = document.getElementById("date");


    function getTimeString(date, timezone) {
        //获取时差（返回当地时间与伦敦时间的分钟的差值）
        var sc = date.getTimezoneOffset();
        //获取日期对象
        var newDate = new Date();
        //重置日期对象
        newDate.setTime(date.getTime() + sc * 60000 + timezone * 3600000);
        //年
        var Y = format(newDate.getFullYear());
        //月
        var M = format(newDate.getMonth() + 1);
        //日
        var D = format(newDate.getDate());
        //小时
        var H = format(newDate.getHours());
        //分钟
        var m = format(newDate.getMinutes());
        //秒
        var S = format(newDate.getSeconds());

        //格式化时间
        function format(n) {
            if (n < 10) {
                return '0' + n;
            } else {
                return '' + n;
            }
        }

        //返回时间字符串
        return Y + '-' + M + '-' + D + '&nbsp;' + H + ':' + m + ':' + S;
    };
    setInterval(function () {
        var now = new Date();
        switch (shiQu.value) {
            case "ZeroTimeZone(UKTime)":
                date.innerHTML = getTimeString(now, 8);
                break;
            case "EastEightTimeZone(BeijingTime)":
                date.innerHTML = getTimeString(now, 9);
                break;
            case "WestDistrict5(UsTime)":
                date.innerHTML = getTimeString(now, 0);
                break;
            case "DongjiuDistrict(JapanTime)":
                date.innerHTML = getTimeString(now, -5);
                break;
        }
    }, 1000)
    //slicing to get the last two digits
    //slicing source https://stackoverflow.com/questions/3605214/javascript-add-leading-zeroes-to-date
    function getFormattedDate() {
        var horseDate = new Date()

        var MM = ('0' + String(horseDate.getMonth() + 1)).slice(-2); //plus one because
        var yyyy = String(horseDate.getFullYear());
        var DD = ('0' + String(horseDate.getDate())).slice(-2);
        return DD + "/" + MM + "/" + yyyy;
    }


    function getFormattedTime() {
        var horseTimeDate = new Date();
        var hh = ('0' + String(horseTimeDate.getHours())).slice(-2);
        var mm = ('0' + String(horseTimeDate.getMinutes())).slice(-2);
        return hh + ":" + mm;
    }


    var dateToSend = getFormattedDate();

    var timeToSend = getFormattedTime();


    function askToCompleteOrder() {
        Swal.fire({
            title: "Complete Order",
            imageUrl: "../images/logo.png",
            text: "Complete order for  £<%=request.getParameter("totalCost")%>" + " ?",
            showCancelButton: true,
            confirmButtonText: 'Confirm order',
        }).then((result) => {
                if (result.isConfirmed) {
                    this.sendJson()
                }
            }
        )
    }

    var originalHorseObject = {
        "storeID": "Team08",
        "customerID": String(<%=session.getAttribute("custId")%>),
        "date": dateToSend,
        "time": timeToSend,
        "timeZone": "GMT",
        "transactionAmount": String(<%=request.getParameter("totalCost")%>),
        "currencyCode": "GBP",
    }

    //adapted example from https://www.geeksforgeeks.org/how-to-send-a-jsn-object-to-a-server-using-javascript/
    var stringHorseObject = JSON.stringify(originalHorseObject);

    function sendJson() {
        let xhr = new XMLHttpRequest();
        let url = '/horsePay';
        // open a connection
        xhr.open("POST", url + "?totalCost=" +<%=request.getParameter("totalCost")%>, true);


        xhr.setRequestHeader("Content-Type", "application/json");
        xhr.send(stringHorseObject);


        xhr.onreadystatechange = function () {
            if (xhr.readyState == XMLHttpRequest.DONE) {

                getAlertMessage(JSON.parse(xhr.response));
            } else {
                let paymentResult = {
                    "Status": false,
                    "reason": "internal error with horsePay server"
                }

                originalHorseObject["paymentResult"] = paymentResult;
                getAlertMessage(originalHorseObject);
                console.log(originalHorseObject)

            }
        }
    }


    function getAlertMessage(result) {
        try {
            if (result.paymentResult["Status"]) {

                Swal.fire({
                    icon: 'success',
                    title: result.paymentResult["reason"],
                    text: "Thank you for shopping with Cavallo",
                    showCancelButton: true,
                    showDenyButton:true,
                    confirmButtonText: 'Back to login page',
                    cancelButtonText: 'make another order',
                    denyButtonText: 'button for maddie (testing)'
                }).then((result) =>{
                    if(result.isConfirmed){

                        //remove the customerId from the session

                        window.location.replace("/");

                    } else if(result.isDismissed){
                        window.location.replace("/pages/shopping.jsp");
                    }else{
                        //stay here for testing
                    }
                })
            } else {

                Swal.fire({
                    icon: 'error',
                    title: "HorsePay Error",
                    text: result.paymentResult["reason"],
                    showCancelButton: true,
                    showDenyButton: true,
                    confirmButtonText: 'stay on page and try again',
                    cancelButtonText: 'go back to login page',
                    denyButtonText: 'button for maddie (testing)'
                }).then((result) =>{
                    if(result.isConfirmed){
                        //stay here do nothing

                    } else if(result.isDismissed){
                        window.location.replace("/");
                    }else{
                        //do nothing stay here
                    }
                })
            }

        } catch
            (error) {
            //unneccessary syntax error with paymentResult catch block here from keeping it from running a Syntax
            //error
        }

    }


</script>


</html>




