<%@ page import="com.project.cavallo.domain.Customer" %>
<%@ page import="com.project.cavallo.domain.IceCream" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.project.cavallo.dao.IceCreamRepository" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!--Note: I moved this html to pages in order to have the website workingc ontinuously. For example, if the user-->
<!--wishes to make another order after they place order. Thanks,George Black-->
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>order</title>

    <!--	Had to change links for css and images to be in the right spot for our project. Thanks, George Black-->
    <link href="../css/order_style.css" type="text/css" rel="stylesheet">

    <!--    Files needed to be added in order to get Sweet alert 2. These are used in the pop ups when the person wishes
    to make-a payment. Thanks, George Black-->
    <script src="../SweetAlertJavaScript/sweetalert2.min.js"></script>
    <link rel="stylesheet" href="../css/sweetalert2.css">


    <script rel="javascript" type="text/javascript" href="js/jquery-1.11.3.min.js"></script>




</head>

<body>
<img id="logo" src="../images/logo.png">
<br>

<h4 id="numMoney">total:£</h4>
<%--<input type="text" id="inputAddress" name="inputAddress" placeholder="Please enter address here"/>--%>
<%--<a id="address">Determine address</a>--%>
<table>
    <tbody id="tbody1">
    <tr class="tit">
        <td>Type</td>
        <td>Size</td>
        <td>SizeMoney</td>
        <td>Number</td>
    </tr>
    </tbody>
</table>

<%--<div id="choice">--%>
<%--    <a id="peisong">Distribution</a>&nbsp;&nbsp;&nbsp;&nbsp;--%>
<%--    <a id="self">SelfExtraction</a>--%>
<%--</div>--%>



    <%--	<div id="pay">Pay now  £<span id="money"></span></div>--%>
    <%--Edited to display total cost. Additionally, now calls the askToCompeteOrder function. Thanks, George Black--%>
    <div id="confirm" onclick=askToCompleteOrder()>Complete Order</div>


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
    // var shiQu = document.getElementById("shiQu");
    // var date = document.getElementById("date");


    // function getTimeString(date, timezone) {
    // 	//获取时差（返回当地时间与伦敦时间的分钟的差值）
    // 	var sc = date.getTimezoneOffset();
    // 	//获取日期对象
    // 	var newDate = new Date();
    // 	//重置日期对象
    // 	newDate.setTime(date.getTime() + sc * 60000 + timezone * 3600000);
    // 	//年
    // 	var Y = format(newDate.getFullYear());
    // 	//月
    // 	var M = format(newDate.getMonth() + 1);
    // 	//日
    // 	var D = format(newDate.getDate());
    // 	//小时
    // 	var H = format(newDate.getHours());
    // 	//分钟
    // 	var m = format(newDate.getMinutes());
    // 	//秒
    // 	var S = format(newDate.getSeconds());
    //
    // 	//格式化时间
    // 	function format(n) {
    // 		if (n < 10) {
    // 			return '0' + n;
    // 		} else {
    // 			return '' + n;
    // 		}
    // 	}
    //
    // 	//返回时间字符串
    // 	return Y + '-' + M + '-' + D + '&nbsp;' + H + ':' + m + ':' + S;
    // };
    // setInterval(function () {
    // 	var now = new Date();
    // 	switch (shiQu.value) {
    // 		case "ZeroTimeZone(UKTime)":
    // 			date.innerHTML = getTimeString(now, 8);
    // 			break;
    // 		case "EastEightTimeZone(BeijingTime)":
    // 			date.innerHTML = getTimeString(now, 9);
    // 			break;
    // 		case "WestDistrict5(UsTime)":
    // 			date.innerHTML = getTimeString(now, 0);
    // 			break;
    // 		case "DongjiuDistrict(JapanTime)":
    // 			date.innerHTML = getTimeString(now, -5);
    // 			break;
    // 	}
    // }, 1000)


    //颜色转换
    // String.prototype.colorHex = function () {
    //     // RGB颜色值的正则
    //     var reg = /^(rgb|RGB)/;
    //     var color = this;
    //     if (reg.test(color)) {
    //         var strHex = "#";
    //         // 把RGB的3个数值变成数组
    //         var colorArr = color.replace(/(?:\(|\)|rgb|RGB)*/g, "").split(",");
    //         // 转成16进制
    //         for (var i = 0; i < colorArr.length; i++) {
    //             var hex = Number(colorArr[i]).toString(16);
    //             if (hex === "0") {
    //                 hex += hex;
    //             }
    //             strHex += hex;
    //         }
    //         return strHex;
    //     } else {
    //         return String(color);
    //     }
    //     //返回时间字符串
    //     return H + ':' + m;
    // };





    function getSpaces(typeOfIceCream){
        while(typeOfIceCream.includes("%20")){
            typeOfIceCream = typeOfIceCream.replace("%20"," ");
        }
        return typeOfIceCream;
    }

    var infor = window.location.search.substring(1).split("&");
    infor[1]=getSpaces(infor[1]);
    infor[2]=getSpaces(infor[2]);




    var sumMoney = infor[0];	//总额
    var type_arr = infor[1].split(",");	//冰激凌类型数组
    var size_arr = infor[2].split(",");	//尺寸数组
    var sizeMoney_arr = infor[3].split(",");	//尺寸价格数组
    var number_arr = infor[4].split(",");	//数量数组
    var iceCreamOrderList=[];
    

    //alert(sumMoney);
    //alert(type_arr);
    //alert(type_arr[0]);
    //alert(type_arr[1]);



    var tbody = document.getElementById("tbody1");
    var tableData = "";


    for (var i = 0; i < type_arr.length; i++) {

        tableData += "<tr><td>" + type_arr[i] + "</td>" + "<td>" + size_arr[i] + "</td>" + "<td>" + sizeMoney_arr[i] + "</td>" + "<td>" + number_arr[i] + "</td></tr>";


        for (j=0; j<number_arr[i];j++) {
            var iceCreamOrder={
                "flavour": String(type_arr[i]),
                "size": String(size_arr[i]),
                "price": String(sizeMoney_arr[i])
            }
            iceCreamOrderList.push(iceCreamOrder);
        }

    }

    console.log(iceCreamOrderList);
    tbody.innerHTML += tableData;
    //alert(tbody.innerHTML);

    //设置总额
    var numMoney = document.getElementById("numMoney");
    numMoney.innerHTML += sumMoney;




    //选择配送或自提
    // var address = document.getElementById("address");
    // var peisong = document.getElementById("peisong");
    // var self = document.getElementById("self");
    // peisong.onclick = function () {
    //     peisong.style.background = "#FF0004";
    //     self.style.background = "000000";
    //     address.style.display = "block";
    // }
    // self.onclick = function () {
    //     self.style.background = "#FF0004";
    //     peisong.style.background = "000000";
    //     address.style.display = "none";
    // }

    // //当前英国时间
    // function getTimeString(date, timezone) {
    //     //获取时差（返回当地时间与伦敦时间的分钟的差值）
    //     var sc = date.getTimezoneOffset();
    //     //获取日期对象
    //     var newDate = new Date();
    //     //重置日期对象
    //     newDate.setTime(date.getTime() + sc * 60000 + timezone * 3600000);
    //     //年
    //     var Y = format(newDate.getFullYear());
    //     //月
    //     var M = format(newDate.getMonth() + 1);
    //     //日
    //     var D = format(newDate.getDate());
    //     //小时
    //     var H = format(newDate.getHours());
    //     //分钟
    //     var m = format(newDate.getMinutes());
    //     //秒
    //     var S = format(newDate.getSeconds());
    //
    //     //格式化时间
    //     function format(n) {
    //         if (n < 10) {
    //             return '0' + n;
    //         } else {
    //             return '' + n;
    //         }
    //     }
    //     //返回时间字符串
    //     return H + ':' + m;
    // }


    //Had to edit this to get the totalCost to be moved properly as a request Parameter. Thanks, George Black
    //点击提交订单
    // var confirm = document.getElementById("confirm");
    //英国时间（小时和分钟）
    // var date = getTimeString(new Date(), 0).split(":");
    // var hour = date[0];
    // var minu = date[1];
    //手机号

    // confirm.onclick = function () {
    //     if (inputAddress.value == "") {
    //         alert("Please enter the shipping address");
    //     } else {
    //         //alert(peisong.style.background);
    //         //判断选择配送还是自提
    //         // if (peisong.style.background == "" || peisong.style.background.toString().colorHex() == "#ff004") {
    //
    //
    //             // if ("11" <= hour <= "18") {
    //             //     alert("During the delivery time");
    //             //     window.open("/pages/payment.jsp?totalCost=" + sumMoney);
    //             // } else {
    //             //     alert("Not during the delivery time, the delivery time is 11:00-18:00");
    //             // }
    //         // } else {
    //         //     if ("11" <= hour <= "17" || ((hour == "17") && (minu < "45"))) {
    //         //         alert("In self - lift time");
    //                 askToCompleteOrder();
    //             // } else {
    //             //     alert("It is not during self - lift time, self - lift time is 11:00-17:45");
    //             // }
    //         }
    //
    //     }
    // }


    // //判断地址是否可用
    // var inputAddress = document.getElementById("inputAddress");
    // address.onclick = function () {
    //     if (inputAddress == "") {
    //         alert("Please enter the shipping address");
    //     }
    //     window.open("map.html?" + inputAddress.value);



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
        "customerID": "<%=((Customer) session.getAttribute("cust")).getCustomerID()%>", //the customersID in the website
        "date": dateToSend,
        "time": timeToSend,
        "timeZone": "GMT",
        "transactionAmount": String(sumMoney), //the totalCost of the order
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
            text: "Confirm order for  £"+sumMoney+ " ?",
            showCancelButton: true,
            confirmButtonText: 'Confirm order',

            //cannot make click outside of the box
            allowOutsideClick: false

            //if Confirm Order is clicked then send HorsePayJSON
        }).then((result) => {
                if (result.isConfirmed) {
                    this.sendHorsePayJson()
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
    function sendHorsePayJson() {
        let xhr = new XMLHttpRequest();
        let url = '/horsePay';



        // open a connection to post (add the totalCost as a requestParameter
        xhr.open("POST", url, true);


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



    iceCreamOrderStringify=JSON.stringify(iceCreamOrderList);




    function sendIceCreamJson(){
        let xhr = new XMLHttpRequest();
        let url ='/getIceCreams';

        xhr.open("POST",url,true);

        xhr.setRequestHeader("Content-Type", "application/json");
        xhr.send(iceCreamOrderStringify);

        xhr.onreadystatechange=function(){
            if (xhr.readyState == XMLHttpRequest.DONE) {

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
     */
    function getAlertMessage(result) {
        if (result.paymentResult["Status"]) {
             sendIceCreamJson();
            Swal.fire({
                icon: 'success',
                title: result.paymentResult["reason"],
                text: "Thank you for shopping with Cavallo! If you wish to purchase more ice cream, there will be" +
                    " a 60 second timeout before you can start shopping again",
                showCancelButton: true,
                confirmButtonText: 'Logout',
                cancelButtonText: 'make another order',
                allowOutsideClick: false // do not allow user to leave box by clickig outside of it.
            }).then((result) => {
                if (result.isConfirmed) {

                    //remove the customerId from the session

                    window.location.replace("/");

                } else {

                    window.location.replace("/pages/shopping.jsp");
                }
            })
        } else {

            Swal.fire({
                icon: 'error',
                title: "HorsePay Error",
                text: result.paymentResult["reason"],
                showCancelButton: true,
                confirmButtonText: 'stay on page and try again',
                cancelButtonText: 'logout',

                allowOutsideClick: false // do not allow user to leave box by clickig outside of it.
            }).then((result) => {
                if (result.isConfirmed) {
                    //stay here do nothing

                } else {
                    window.location.replace("/");
                }

            })
        }
    }







</script>
</html>
