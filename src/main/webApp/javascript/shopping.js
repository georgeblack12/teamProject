
    var num_jia = document.getElementsByClassName("num-jia");
    var num_jian = document.getElementsByClassName("num-jian");
    var input_num = document.getElementsByClassName("input-num");
    for (var i = 0; i < num_jia.length; i++) {
        num_jia[i].id = i;
        num_jia[i].onclick = function () {
            input_num[this.id].value = parseInt(input_num[this.id].value) + 1;
        }
        num_jian[i].id = i;
        num_jian[i].onclick = function () {
            if (input_num[this.id].value <= 0) {
                input_num[this.id].value = 0;
            } else {
                input_num[this.id].value = parseInt(input_num[this.id].value) - 1;
            }
        }
    }

    //Essentially this whole chunk is used to add an item/items to the order basket.
    var add = document.getElementsByClassName("add");
    var select = document.getElementsByClassName("select");
    var count = document.getElementById("count");
    var type = document.getElementsByClassName("type");
    var information = document.getElementById("orderInformation");

    //used to store the entire order so it can be sent to the order page.
    var type_arr = [];
    var size_arr = [];
    var number_arr = [];
    var sizeMoney_arr = [];
    var sumMoney = 0;
    var date = [];
    var ice_json;
    for (var i = 0; i < add.length; i++) {
        add[i].id = i;

        add[i].onclick = function () {
            if (input_num[this.id].value <= 0) {

                //sweet alert added to make the look nicer, Thanks George Black.
                swal.fire({
                    icon: 'info',
                    text: "Unable to add zero items",
                });

            } else {
                var num = input_num[this.id].value;
                var size = select[this.id].value;
                var ice_name = type[this.id].innerHTML;
                var sizeMoney;
                if (ice_name == "Salted Caramel") {
                    switch (size) {
                        case "Small":
                            sizeMoney = 1.75 + 0.75;
                            break;
                        case "Medium":
                            sizeMoney = 2.25 + 0.75;
                            break;
                        case "Large":
                            sizeMoney = 2.75 + 0.75;
                            break;
                        case "Extra Large":
                            sizeMoney = 3.50 + 0.75;
                            break;
                        case "Extra Extra Large":
                            sizeMoney = 5.75 + 0.75;
                            break;
                    }
                } else {
                    switch (size) {
                        case "Small":
                            sizeMoney = 1.75;
                            break;
                        case "Medium":
                            sizeMoney = 2.25;
                            break;
                        case "Large":
                            sizeMoney = 2.75;
                            break;
                        case "Extra Large":
                            sizeMoney = 3.50;
                            break;
                        case "Extra Extra Large":
                            sizeMoney = 5.75;
                            break;
                    }
                }
                sumMoney += sizeMoney * num;
                count.value = parseInt(count.value) + 1;

                //used to get an appropriate message to display when the client adds something to their basket.
                //This is in the case of getting the proper wording based on if they add a single or multiple
                //items to their basket at once. Thanks, George Black.
                var orderString;
                var hasHave;
                if (num > 1) {
                    orderString = " orders of ";
                    hasHave = "have";
                } else {
                    orderString = " order of ";
                    hasHave = "has";
                }

                //display a message when something is added to the Customer's basket telling them
                //what they have added and how much of it they have added.
                swal.fire({
                    text: num + " " + size + orderString + ice_name + " ice cream "
                        + hasHave + " been added to your total order"
                });

                //adds the ice cream added by the customer to an array to be used to show the orders on the
                //order page.
                information.innerHTML += "Type:" + ice_name + "; &nbsp;&nbsp;&nbsp;&nbsp;" + "Size:" + size + "; &nbsp;&nbsp;&nbsp;&nbsp;" + "Number:" + num + ";&nbsp;&nbsp;&nbsp;&nbsp;Money:" + sizeMoney + "<br>";
                type_arr.push(ice_name);
                size_arr.push(size);
                sizeMoney_arr.push(sizeMoney);
                number_arr.push(num);
            }
        }
    }

    // The count is the number of times the client has added something to their account.
    var count = document.getElementById("count")

    //production order is the proceed to check out button
    var productionOrder = document.getElementById("productionOrder");

    //If te customer tries to checkout with over 50 items and error message is displayed and their order is restarted.
    //If the customer tries to checkout with 0 items an error message is displayed and the Customer stays on the
    //shopping page.
    //If the Customer has 1-50 ice Creams in their cart then they are sent to the order page to checkout.
    productionOrder.onclick = function () {
        //冰淇淋数量
        var s = 0;
        for (var i = 0; i < number_arr.length; i++) {
            s += parseInt(number_arr[i]);
        }
        if (s > 50) {

            //changed wording and used swal. Thanks, George Black
            swal.fire({
                icon: "error",
                text: "Maximum number of ice creams per order is 50"
            }).then((result) => {
                location.reload();
            })
        } else {
            if (count.value <= 0) {

                //changed wording and used swal. Thanks, George Black
                swal.fire({
                    icon: "error",
                    text: "Unable to make an order with 0 items"
                });

                return false;
            } else {
                //take them to the order page.
                window.location.replace("order.jsp?" + sumMoney + "&" + type_arr + "&" + size_arr + "&" + sizeMoney_arr + "&" + number_arr);
            }
        }


    }

    //If the user clicks the logout page then they are sent back to the homepage.
    var cancellation = document.getElementById("logout");
    cancellation.onclick = function () {
        location.replace("/"); // "/" takes a Customer back to the homepage due to WebStartController.
    }


