<%@ page import="org.springframework.ui.Model" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!doctype html>
<html>
<head>
<%--    Had to make edits to links for images and css in order to get the whole website working together.
 Thanks, George Black.--%>
    <meta charset="utf-8">
    <link href="../css/payment_style.css" type="text/css" rel="stylesheet">


<%--    Files needed to be added in order to get Sweet alert 2. These are used in the pop ups when the person wishes
to make-a payment. Thanks, George Black--%>
    <script src="../SweetAlertJavaScript/sweetalert2.min.js"></script>
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
<%--Edited to display total cost. Additionally, now calls the askToCompeteOrder function. Thanks, George Black--%>
<div id="pay" onclick="askToCompleteOrder()">Pay now £ <%=request.getParameter("totalCost")%>
</div>


</body>


<script type="text/javascript">
    //I believe this code is no longer needed based on how I am getting the totalCost now. Feel free to change if
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







    /**
     * Method to get the current date and turn it into a String with the required format
     * @returns {string} A string of the current date with the required format for the project.
     *
     * @author user113716 on stack overflow.
     * @see https://stackoverflow.com/questions/3605214/javascript-add-leading-zeroes-to-date
     * Modifying author: George Black
     */
    function getFormattedDate() {
        var horseDate = new Date()

        //Add 0 and then slice to get the last two numbers. If there already two number ex: 12 then it will have
        //012 so 12 will be sent to MM. If the date is a single number  ex:5 then the number is 05 and 05 is
        //returned

        //+1 added with montn because month goes 0-11 and we need 1-12
        var MM = ('0' + String(horseDate.getMonth() + 1)).slice(-2);

        var yyyy = String(horseDate.getFullYear());
        var DD = ('0' + String(horseDate.getDate())).slice(-2);
        return DD + "/" + MM + "/" + yyyy;
    }


    /**
     * Method to get the current time and turn it into a String with the required format
     * @returns {string} A string of the current time with the required format for the project.
     *
     * @author user113716 on stack overflow.
     * @see https://stackoverflow.com/questions/3605214/javascript-add-leading-zeroes-to-date
     * Modifying author: George Black
     */
    function getFormattedTime() {
        var horseTimeDate = new Date();
        var hh = ('0' + String(horseTimeDate.getHours())).slice(-2);
        var mm = ('0' + String(horseTimeDate.getMinutes())).slice(-2);
        return hh + ":" + mm;
    }

    //the current date and time with proper format to be sent with the original horsePay JSON. Thanks, George Black
    var dateToSend = getFormattedDate();
    var timeToSend = getFormattedTime();



    //The original horsePay JSON to be sent to server to get proper JSON back with the paymentResult.
    var originalHorseObject = {
        "storeID": "Team08",
        "customerID": String(<%=session.getAttribute("custId")%>), //the customersID in the website
        "date": dateToSend,
        "time": timeToSend,
        "timeZone": "GMT",
        "transactionAmount": String(<%=request.getParameter("totalCost")%>), //the totalCost of the order
        "currencyCode": "GBP",
    }

    /**
     * Method that is run after the user hits Pay now £(their total cost). It does a pop up asking if they are sure
     * they want to make this purchase. If confirm order is clicked, then the horsePay JSON is sent to server to see if
     * horsePayment can process the Users order. If cancel is clicked, then the user stays on the page
     *
     * @author George Black
     */
    function askToCompleteOrder() {
        Swal.fire({
            title: "Confirm Order",

            //displays the companies logo
            imageUrl: "../images/logo.png",

            text: "Confirm order for  £<%=request.getParameter("totalCost")%>" + " ?",
            showCancelButton: true,
            confirmButtonText: 'Confirm order',

            //cannot make click outside of the box
            allowOutsideClick: false

            //if Confirm Order is clicked then send HorsePayJSON
        }).then((result) => {
                if (result.isConfirmed) {
                    this.sendJson()
                }
            }
        )
    }

    //horsePay JSON turned into a string to be sent to the server. Thanks, George Black.
    var stringHorseObject = JSON.stringify(originalHorseObject);


    /**
     * Method to send the horsePayJSON over post to the server and then get the JSON back with the paymentResults.
     * Then with the paymentResults, a proper sweet alert 2 alert is displayed telling the user if the horsePayment is
     * successful.
     *
     * @author sheikh005 on Geek for Geeks
     * @see https://www.geeksforgeeks.org/how-to-send-a-json-object-to-a-server-using-javascript/
     * Modifying author: George Black
     *
     */
    function sendJson() {
        let xhr = new XMLHttpRequest();
        let url = '/horsePay';
        // open a connection to post (add the totalCost as a requestParameter
        xhr.open("POST", url + "?totalCost=" +<%=request.getParameter("totalCost")%>, true);


        //say I am sending a json and then send it
        xhr.setRequestHeader("Content-Type", "application/json");
        xhr.send(stringHorseObject);


        //if the sending back and forth is successful  then the horsePay with the PaymentResult added is
        //sent to see if the transaction was complete or not and then display the proper alert.
        //If the sending back and forth is not successful, add the PaymentResult Status to false and reason
        //to be internal error with horsePay server.
        xhr.onreadystatechange = function () {
            if (xhr.readyState == XMLHttpRequest.DONE) {
                getAlertMessage(JSON.parse(xhr.response));
            } else {
                let paymentResult = {
                    "Status": false,
                    "reason": "internal error with horsePay server"
                }
                //add paymentResult to the object.
                originalHorseObject["paymentResult"] = paymentResult;
                getAlertMessage(originalHorseObject);
                //console.log(originalHorseObject) for testing
            }
        }
    }


    /**
     * Method that displays if the horsePayment was successful or not. A proper message is displayed based on what the
     * paymentSuccess result is.
     * If the payment was successful, the user is given the option to stay on the page (this
     * is for testing purposes and will be removed), logout, or make another purchase.
     * the option to logout or make another order.
     * If the payment was not successful, the user is given the option to stay on the page(this is for testing and will
     * be changed), try to make the payment again, or logout.
     * @author George Black
     *
     * @param result The horsePay JSON with the paymentResult
     * @throws Throws a syntax error thrown because it does not recognize paymentResult. This is just caught and nothing
     * is done because everything is working properly and we know the JSON contains the JSON of payment result.
     */
    function getAlertMessage(result) {
        try {
            //
            if (result.paymentResult["Status"]) {

                Swal.fire({
                    icon: 'success',
                    title: result.paymentResult["reason"],
                    text: "Thank you for shopping with Cavallo",
                    showCancelButton: true,
                    showDenyButton:true,
                    confirmButtonText: 'Logout',
                    cancelButtonText: 'make another order',
                    denyButtonText: 'button for maddie (testing)',
                    allowOutsideClick: false // do not allow user to leave box by clickig outside of it.
                }).then((result) =>{
                    if(result.isConfirmed){

                        //remove the customerId from the session
                        window.location.replace("/");

                    } else if(result.isDismissed){
                        window.location.replace("/pages/shopping.jsp");
                    }
                    //else stay here
                })
            } else {

                Swal.fire({
                    icon: 'error',
                    title: "HorsePay Error",
                    text: result.paymentResult["reason"],
                    showCancelButton: true,
                   showDenyButton: true,
                    confirmButtonText: 'stay on page and try again',
                    cancelButtonText: 'logout',
                    denyButtonText: 'button for maddie (testing)',
                    allowOutsideClick: false // do not allow user to leave box by clickig outside of it.
                }).then((result) =>{
                    if(result.isConfirmed){
                        //stay here do nothing

                    } else if(result.isDismissed){
                        window.location.replace("/");
                    }
                    //else stay here
                })
            }

        } catch
            (error) {
            //unnecessary syntax error with paymentResult catch block here from keeping it from running a Syntax
            //error
        }
    }




</script>
</html>




