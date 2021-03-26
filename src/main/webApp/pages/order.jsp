<%--Original Author: Shiyao Ding, Haolei Ning--%>
<%--Modifying Authors: Madeleine Towes, Aggrey Nhiwatiwa, George Black (23/03/21)--%>


<%--NOTE: In my opinion keeping the javascript and html of the JSP together was the best approach to keep things as
clean as possible. Even though there is a lot of javascript here, I found keeping it together was the cleanest and best
overall option. Thanks, George Black.--%>

<%@ page import="com.project.cavallo.domain.Customer" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>


<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>order</title>


    <link href="../css/order_style.css" type="text/css" rel="stylesheet">

    <!--    Files needed to be added in order to get Sweet alert 2. These are used in the pop ups when the person wishes
    to make-a payment. Thanks, George Black-->
    <script src="../javascript/sweetalert2.min.js"></script>
    <link rel="stylesheet" href="../css/sweetalert2.css">


    <%--    All the following scripts are needed in order to properly use the maps geoCode api. Thanks, George Black--%>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>


    <script
            src="https://code.jquery.com/jquery-3.6.0.min.js"
            integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
            crossorigin="anonymous"></script>


    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
            crossorigin="anonymous"></script>


    <script rel="javascript" type="text/javascript" href="js/jquery-1.11.3.min.js"></script>


</head>

<body>
<header>
    <img id="logo" src="../images/logo1.png"
         alt="Yellow circle with red text reading Cavallo, black text of traditional Italian ice cream and a picture of an ice cream.">
</header>

<div id="intro">
    <h1>Checkout</h1>
    <p>Complete or restart your order below</p>
</div>

<div id="checkout">


    <p id="numMoney">Total: £</p>

    <table>
        <tbody id="tbody1">
        <tr class="tit">
            <td>Flavour</td>
            <td>Size</td>
            <td>Price</td>
            <td>Quantity</td>
        </tr>
        </tbody>
    </table>

    <div id="buttons">
        <input type="button" id="restart" value="Restart order">
        <script>
            //If the user clicks restart they order is restarted and taken back to the shopping page and the order
            //is restarted.
            var cancellation = document.getElementById("restart");
            cancellation.onclick = function () {
                location.replace("/pages/shopping.jsp");
            }
        </script>
        <%--    If the user clicks complete order it asks if the order is for Delivery or carry out--%>
        <div id="confirm" onclick=getDeliveryInfo()>Complete Order</div>
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

    /**
     * Method intended to take a cost and adds any O's needed to make sure the price displayed contains two decimals
     * places.
     * @param cost The cost of a value in the order that may need 0s added to it so that it contains two decimal places.
     * places.
     * @returns The cost from the parameter containing two decimal places.
     * @author George Black
     */
    function getDecimals(cost){
        if(!cost.includes(".")){
            cost=cost.concat(".00");
        }else{
            cost=cost.concat("00");
            cost=cost.slice(0,4);
        }
        return cost;
    }


    /**
     * Method to replace each "%20" in a String with a space. This method is used to get the names and sized of each
     * iceCream in the Customer's cart.
     * @param The String to have .
     * @return {String} the String entered in the parameter but without "%20 (if it contained it before(.
     * @author George Black
     */
    function getSpaces(typeOfIceCream) {
        while (typeOfIceCream.includes("%20")) {
            typeOfIceCream = typeOfIceCream.replace("%20", " ");
        }
        return typeOfIceCream;
    }

    var infor = window.location.search.substring(1).split("&");
    infor[1] = getSpaces(infor[1]);
    infor[2] = getSpaces(infor[2]);


    var sumMoney = infor[0];	//The total cost of the iceCream
    var type_arr = infor[1].split(",");	//the types of iceCream potentially being purchased

    var size_arr = infor[2].split(",");	//the size of each iceCream value in the potential order.
    var sizeMoney_arr = infor[3].split(",");	//The cost for each iceCream value that was added to the cart
    var number_arr = infor[4].split(",");	// the amount of the iceCream value the Customer will potentially purchase.
    var iceCreamOrderList = []; //The orderList to potentially be sent to the server when the Customer completes an
                                //order


    //area the ice cream values that are potentially going to be purchases are displayed
    var tbody = document.getElementById("tbody1");
    var tableData = "";


    //Takes each iceCream value in the potential order
    for (var i = 0; i < type_arr.length; i++) {
        var costToDisplay=getDecimals(sizeMoney_arr[i]);


        //displays each ice cream value that is potentially going to be purchased.
        tableData += "<tr><td>" + type_arr[i] + "</td>" + "<td>" + size_arr[i] + "</td>" + "<td>" + costToDisplay +
            "</td>" + "<td>" + number_arr[i] + "</td></tr>";

        //takes each ice cream value that is potentially going to be purchased and converts it to JSON and then
        //adds it to the iceCreamOrder array.
        for (j = 0; j < number_arr[i]; j++) {
            var iceCreamOrder = {
                "flavour": String(type_arr[i]),
                "size": String(size_arr[i]),
                "price": String(sizeMoney_arr[i])
            }
            iceCreamOrderList.push(iceCreamOrder);
        }

    }

    tbody.innerHTML += tableData; //to display the ice Cream values that are potentially going to be purchased.


    //to get the overall total Cost.
    var numMoney = document.getElementById("numMoney");
    numMoney.innerHTML += getDecimals(sumMoney);





    /**
     * A method that displays the form delivery or not based on if showQuestion is true or false.
     * If showQuestion is true, a form is displayed to get the delivery address. Otherwise, no form is shown.
     * @param showQuestion A boolean that states if the form should be visible or not.
     * @author George Black
     */
    function showAddressQuestion(showQuestion) {
        if (showQuestion) {
            document.getElementById("getAddress").style.visibility = "visible";
        } else {
            document.getElementById("getAddress").style.visibility = "hidden";
        }
    }

    /**
     * A method that displays the form delivery or not based on if the Customer has the Delivery type set to carry out
     * or Delivery. If the Delivery type is "delivery," a form is displayed to get the delivery address. Otherwise,
     * the order is for carry out, then no form is shown. Once the person has chosen to complete the order after deciding
     * the delivery type. They are then to be taken to an area where they are to confirm/check their order.
     * @author George Black
     */
    function getDeliveryInfo() {
        swal.fire({
            title: 'Get Order Information',
            allowOutsideClick: false,
            showCancelButton: true,
            html: `
<div class="form-delivery">
    <label for="deliveryType">Is this order for delivery or carry out?</label>
    <p>
        <input type="radio" name="deliveryType" onclick="showAddressQuestion(true)" value="delivery"
               checked>Delivery</input>
    </p>
    <p>
        <input type="radio" name="deliveryType" onclick="showAddressQuestion(false)" value="carryOut"
        >Collection</input>
    </p>

</div>
<div class="form-delivery" id="getAddress">
    <label for="deliverAddress">Note: Delivery is free, but we only deliver to places that are within a 5 mile distance from the store.</label>

    <input type="text" name="address" id="deliveryAddress" placeholder="Enter Delivery Address Here">

    <input type="text" name="city" id="deliveryCity" placeholder="Enter Delivery City Here">

    <input type="text" name="zipCode" id="deliveryZip" placeholder="Enter Delivery Post Code Here">

</div>
`
        }).then((result) => {
            if (result.isConfirmed) {
                //if the order type is confirmed they are taken to an specific area to complete/check their order.
                goToCarryOrDelivery(getRadioValue("deliveryType"));
            }
            //else do nothing stay here
        })
    }


    // https:stackoverflow.com/questions/604167/how-can-we-access-the-value-of-a-radio-button-using-the-dom
    /**
     * A method used to take the radioButton entered by the Customer and gets which radio button value they have chosen.
     * @author Canuckster, Felix Kling
     * @see https:stackoverflow.com/questions/604167/how-can-we-access-the-value-of-a-radio-button-using-the-dom
     *
     * Modifying author: George Black
     *
     */
    function getRadioValue(theRadioGroup) {
        var elements = document.getElementsByName(theRadioGroup);
        for (var i = 0, l = elements.length; i < l; i++) {
            if (elements[i].checked) {
                return elements[i].value;
            }
        }
    }

    /**
     * A method that takes the type of order in the parameter, and if it is "carryOut" they are sent to a page to
     * confirm their order. Otherwise, the typeOfOrder will be "delivery" causing a function to be started, which
     * makes sure the entered address is legit and within a 5 mile radius of the store.
     * @param typeOfOrder The type of Order the Customer is placing.
     * @author George Black
     */
    function goToCarryOrDelivery(typeOfOrder) {
        if (typeOfOrder === "carryOut") {
            askToCompleteCarry();
        } else {
            doGeocode();
        }
    }


    /**
     * Method used in doGeoCode() to make sure the Customer has entered all the required values needed to get the
     * address. If the value is empty, an error message is displayed, and false is returned. Otherwise, true is returned.
     * @param value The String we want to see if it has at least one character.
     * @return {boolean} Returns true if value has at least one character. Otherwise, false is returned
     * @author George Black
     */
    function checkValueLength(value) {
        if (value.length == 0) {
            Swal.fire({
                icon: 'error',
                text: "You did not enter in all the values needed for a delivery address. Please try again."
            })
            return true;
        } else {
            return false;
        }

    }

    //so that we automatically have the stores coordinates as soon as the page is loaded
    //source: https://www.youtube.com/watch?v=pRiQeo17u6c
    var storeCoordinates = [];
    axios.get('https://maps.googleapis.com/maps/api/geocode/json', {
        params: {
            address: "Avenue Cres, Seaton Delaval, Whitley Bay NE25 0DN, UK",
            key: 'AIzaSyDwC5IMKz7knixriHKausCU2N7IamWno6s'

        }
    })
        .then(function (response) {
            storeCoordinates.push(response.data.results[0].geometry.location.lat);
            storeCoordinates.push(response.data.results[0].geometry.location.lng);
            return storeCoordinates;

        })

    /**
     * Method to make sure the address entered by the Customer is not the stores address. If the address entered
     * by the customer is the Stores address true is returned and an error message is displayed. Otherwise, false is
     * returned.
     * @param address The delivery address of the Customer
     * @returns {boolean} A boolean that is true if the address is the store's address and is false if the address
     * is not the stores address.
     * @author George Black.
     */
    function checkNotStore(address) {
        if (address.toUpperCase() === "AVENUE CRESCENT, SEATON DELAVAL" ||
            address.toUpperCase() === "AVENUE CRESCENT SEATON DELAVAL"
            || address.toUpperCase() === "AVENUE CRES, SEATON DELAVAL" ||
            address.toUpperCase() === "AVENUE CRES SEATON DELAVAL") {
            Swal.fire({
                icon: 'error',
                text: "You have entered the store's address. Please choose carry out if you would like to " +
                    "pick the ice cream up from the store. Thank you. "
            })
            return true;
        } else {
            return false;
        }
    }


    /**
     * Method that takes the Customer's delivery address and makes sure it is an accepted address within
     * a five-mile radius of the Store. If the address is not accepted, an appropriate error message is displayed.
     * Otherwise, the Customer is given a popup asking them to confirm the order to the given address.
     * @author George Black
     */
    function doGeocode() {
        var haveError;

        //get the entered in values from the form.
        var city = document.getElementById("deliveryCity").value;
        var address = document.getElementById("deliveryAddress").value;
        var zip = document.getElementById("deliveryZip").value;

        //make sure all the values entered are not empty
        haveError = checkValueLength(address);
        if (!haveError) {
            haveError = checkValueLength(city);
        }
        if (!haveError) {
            haveError = checkValueLength(zip);
        }
        if (!haveError) {
            haveError = checkNotStore(address);
        }
        //look up the given address in the Uk.
        if (!haveError) {
            axios.get('https://maps.googleapis.com/maps/api/geocode/json', {
                params: {
                    components: 'country:UK',
                    city: city,
                    address: address,
                    zip: zip,
                    key: 'AIzaSyDwC5IMKz7knixriHKausCU2N7IamWno6s'

                }
            }) //if the address is not found dislay an appropriate error message.
                .then(function (response) {
                    console.log(response);
                    if (response.data.status != "OK") {
                        Swal.fire({
                            icon: 'error',
                            text: 'There was an issue finding your address.' +
                                'Please try again. '
                        })
                        //if address is found make sure it is a proper location and not just some large
                        //like a town or city. This way we know exactly where to send the delivery to.
                    } else if ((response.data.results[0].types[0] != "premise"
                        && response.data.results[0].types[0] != "subpremise"
                        && response.data.results[0].types[0] != "street_address")) {

                        Swal.fire({
                            icon: 'error',
                            text: "The address " + response.data.results[0].formatted_address + " is not " +
                                "specific enough for delivery. Please enter a more specific address."
                        })
                        //if the address is legit and precise make sure the address is withing a five mile radius
                        //of the store.
                    } else {
                        //use an array because that is what get distance accepts, makes passing the function
                        //look a little more clean
                        var deliveryCoordinates = [];
                        deliveryCoordinates.push(response.data.results[0].geometry.location.lat);
                        deliveryCoordinates.push(response.data.results[0].geometry.location.lng);

                        var distance = getDistance(storeCoordinates, deliveryCoordinates);

                        //If the delivery address is not within a five mile radius display an error. Otherwise,
                        //ask the Customer to confirm the order to the address with askToCompleteDelivery.
                        if (distance > 5) {
                            Swal.fire({
                                icon: 'error',
                                text: "We are sorry " + address + " is too far away for us to deliver to."
                            })
                        } else {
                            askToCompleteDelivery(address, city, zip);
                        }
                    }
                })
        }
    }


    /**
     * Function that converts x to radians. This method is used in getDistance.
     * @param x a value we want to convert to radians.
     * @returns x converted to radians.
     * @author Mike Williams, Mathias Bynens
     * @see https://stackoverflow.com/questions/1502590/calculate-distance-between-two-points-in-google-maps-v3
     */
    var rad = function (x) {
        return x * Math.PI / 180;
    };


    /**
     * Method used to calculate the straight line distance (in miles) between two addresses/places with their given
     * coordinates. This method is used in doGeoCode()
     * @param p1 The coordinates for the first place/address
     * @param p2 The coordinates for second place/address
     * @returns {float} Returns the straight line distance (in miles) between p1 and p2.
     * @author Mike Williams, Mathias Bynens
     * @see https://stackoverflow.com/questions/1502590/calculate-distance-between-two-points-in-google-maps-v3
     * Modifying Author: George Black
     */
    var getDistance = function (p1, p2) {
        var R = 6378137; // Earth’s mean radius in meter
        var dLat = rad(p2[0] - p1[0]);
        var dLong = rad(p2[1] - p1[1]);
        var a = Math.sin(dLat / 2) * Math.sin(dLat / 2) +
            Math.cos(rad(p1[0])) * Math.cos(rad(p2[0])) *
            Math.sin(dLong / 2) * Math.sin(dLong / 2);
        var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
        var d = R * c; //in meters need to change to miles
        var toReturn = d / 1609.344
        console.log(d);
        console.log(toReturn);
        return toReturn; //convert to miles
    };


    /**
     * Method to get the current date and turn it into a String with the required format.
     * @returns {string} A string of the current date with the required format for the project.
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
     * Method to get the current time and turn it into a String with the required format.
     * Note: If the client is doing delivery, we know their time is the same as the store.
     * If the order is for delivery, the Customer's time does not make too much of
     * a difference. If there are in another time zone and the iceCreamOrder is accepted, we already have
     * their money.
     * @returns {string} A string of the current time with the required format for the project.
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


    /**
     * Method to create the HorsePay JSON to be sent to the server.
     * @return The horsePay JSON to be sent to the server with the required formatt/values.
     * @author George Black
     */
    function createHorsePay() {
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

        return JSON.stringify(originalHorseObject);
    }


    /**
     * A method that ensures the order entered by the Customer is an order that can be placed during the given time.
     * If the order can be placed. Then the HorsePay JSON is sent. Otherwise, an error message is displayed saying
     * the typeOfOrder can not be placed during this time.
     * @param typeOfOrder The type of order the Customer wishes to complete.
     * @param address The address for the delivery of the iceCreamOrder. Note: if the order is for carryOut, the address
     * will be set to "NA."
     * @author George Black
     */
    function checkWithinTime(typeOfOrder, address) {

        var time = getUKTime();
        var hours = possibleRemoveZeros(time.substring(0, 2));

        var minutes = possibleRemoveZeros(time.substring(3));

        if (typeOfOrder == "carryOut") {
            if ((hours < 11) || (hours >= 18) || (hours == 17 && minutes >= 45)) {
                Swal.fire({
                    icon: 'error',
                    text: 'We are sorry. We are unable to collect orders for carry out during ' +
                        'this time. Please try again during the times between 11:00 and 17:45'
                })
            } else {
                sendHorsePayJson(address);
            }

        } else {
            if (hours < 11 || hours > 17) {
                Swal.fire({
                    icon: 'error',
                    text: "We are sorry, The store is not open during this time. " +
                        "Please try again during the times between 11:00 and 18:00"
                })
            } else {
                sendHorsePayJson(address);
            }
        }
    }

    /**
     * Method that gets the current Time in London England. This is used in the checkWithinTime method.
     * @return {date} Returns the current time in London England.
     * @author Shiva
     * @see https://stackoverflow.com/questions/53862778/how-to-get-the-current-london-time-and-date-using-javascript/53862828
     * Modifying Author: George Black
     */
    function getUKTime() {
        let options = {
                timeZone: 'Europe/London',
                hour: 'numeric',
                hour12: false,
                minute: 'numeric',
            },
            formatter = new Intl.DateTimeFormat([], options);
        return formatter.format(new Date());
    }


    /**
     * Method that removes any 0s in the string parameter. This method is used to get the minutes and hours in the
     * checkWithinTime function, so that we can easily see if the current time is an acceptable time to make an order.
     * @param  string The String we want to remove its zeros (if it has any).
     * @return {String} returns the original String entered in the parameter, but without any 0s
     * @author George Black
     */
    function possibleRemoveZeros(string) {
        if (string.charAt(0) == 0) {
            string = string.substring(1);
        }
        console.log(string);
        return string
    }

    //NOTE: Seperating askToCompleteCarry and askToCompleteDelivery made the code much smoother and easier to read in
    //my opinion. Thanks, George Black.
    /**
     * Method that is run after the user hits ok after deciding the order is for carry out.
     * It does a pop-up asking if they are sure they want to make this purchase. If "confirm order" is clicked,
     * then it makes sure the order is within the accepted time. If "cancel" is clicked, then the user stays on the
     * page.
     * @author George Black
     */
    function askToCompleteCarry() {
        Swal.fire({
            title: "Confirm Order",

//displays the companies logo
            imageUrl: "../images/logo1.png",
            text: "Confirm carry out order for  £" + sumMoney + " ? After placing the order" +
                " it will be ready for collection in 10 minutes time. The store is located at " +
                "Avenue Crescent, Seaton Delaval, Whitley Bay NE25 0DN",
            showCancelButton: true,
            confirmButtonText: 'Confirm order',

//cannot make click outside of the box
            allowOutsideClick: false

//if Confirm Order is clicked then send HorsePayJSON
        }).then((result) => {
                if (result.isConfirmed) {
                    checkWithinTime("carryOut", "Na");
                }
            }
        )
    }

    /**
     * Method that is run after the user hits ok after deciding the order is for delivery and the address is accepted.
     * It does a pop-up asking if they are sure they want to make this purchase. If "confirm order" is clicked,
     * then it makes sure the order is within the accepted time. If "cancel" is clicked, then the user stays on the
     * page.
     * @author George Black
     */
    function askToCompleteDelivery(address, city, zip) {
        Swal.fire({
            title: "Confirm Order",

//displays the companies logo
            imageUrl: "../images/logo1.png",
            text: "Confirm delivery order to " + address + ", " + city + ", " + zip + " for £" + sumMoney + "?",
            showCancelButton: true,
            confirmButtonText: 'Confirm order',

//cannot make click outside of the box
            allowOutsideClick: false

//if Confirm Order is clicked then send HorsePayJSON
        }).then((result) => {
                if (result.isConfirmed) {
                    checkWithinTime("delivery", address);
                }
            }
        )
    }


    /**
     * Method to send the horsePayJSON over post to the server and then get the JSON back with the paymentResults.
     * Then with the paymentResults, a proper sweet alert 2 alert is displayed telling the user if the horsePayment is
     * successful.
     * @author sheikh005 on Geek for Geeks
     * @see https://www.geeksforgeeks.org/how-to-send-a-json-object-to-a-server-using-javascript/
     * Modifying author: George Black
     *
     */
    function sendHorsePayJson(address) {
        let xhr = new XMLHttpRequest();
        let url = '/horsePay';


        xhr.open("POST", url + "?address=" + address, true);


        xhr.setRequestHeader("Content-Type", "application/json");
        xhr.send(createHorsePay());


        //if the sending back and forth is successful  then the horsePay with the PaymentResult added is
        //sent to getlAlert message to see if the transaction was complete or not in order to display the proper alert.
        xhr.onreadystatechange = function () {
            if (xhr.readyState == XMLHttpRequest.DONE) {
                getAlertMessage(JSON.parse(xhr.response));
            }
        }
    }

    //take the array that contains all the JSONs of the iceCream values and Stringifies it so the values can be sent to
    // the server to have them added to the orderContains table in the databse.
    iceCreamOrderStringify = JSON.stringify(iceCreamOrderList);

    /**
     * Method that sends the stringified JSON containing all the iceCream values to the server so the ice Cream values
     * can properly be added to the order contains method. This method is used in getAlertMessage.
     * @author George Black
     */
    function sendIceCreamJson() {
        let xhr = new XMLHttpRequest();
        let url = '/getIceCreams';

        xhr.open("POST", url, true);

        xhr.setRequestHeader("Content-Type", "application/json");
        xhr.send(iceCreamOrderStringify);
    }

    /**
     * A method that displays if the horsePayment was successful or not. A proper message is displayed based on what the
     * paymentSuccess result is.
     * If the payment was successful, the iceCream values from the order are first added to the database.
     * Then, the Customer is given the option to logout, or make another purchase. If the payment was not successful, the reason
     * for the error is displayed, and the Customer is given the option to stay on the page, try to make the payment again,
     * or logout.
     * @param result The horsePay JSON with the paymentResult
     * @author George Black
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


                    window.location.replace("/");

                } else {
                    //Initially needed to make it, so there was not an error in the database. Changed how orderContains
                    //was added, so this is no longer needed. It was left in because I think it helps the Customer
                    //understand what is going on, and I like the way it looks. Thanks, George Black.
                    setTimeout(function () {
                        window.location.replace("/pages/shopping.jsp");
                    }, 5000);
                    Swal.fire({
                        imageUrl: "../images/horseRunningGif.gif",
                        imageHeight: 200,
                        imageWidth: 300,
                        allowOutsideClick: false,
                        showConfirmButton: false,
                        timer: 5000,
                        html: "Thank you for shopping with Cavallo! You will be sent back to the shopping page in <b></b> seconds.",
                        willOpen: () => {
                            timerInterval = setInterval(() => {
                                Swal.getContent().querySelector('b')
                                    .textContent = (Swal.getTimerLeft() / 1000)
                                    .toFixed(0)
                            }, 100)
                        }
                    })

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


                } else {
                    window.location.replace("/");// "/" takes a Customer back to the homepage due to WebStartController.
                }

            })
        }
    }
</script>

</html>
