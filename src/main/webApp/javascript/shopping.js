

    //数量加减
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

    //数量为零则提示,否则获取当前数量和尺寸
    var add = document.getElementsByClassName("add");
    var select = document.getElementsByClassName("select");
    var count = document.getElementById("count");
    var type = document.getElementsByClassName("type");
    var information = document.getElementById("orderInformation");
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
                // alert("Type:" + ice_name + "; " + "Size:" + size + ";" + "Number:" + num + "Money:" + sizeMoney);

                var orderString;
                var hasHave;
                if (num > 1) {
                    orderString = " orders of ";
                    hasHave = "have";
                } else {
                    orderString = " order of ";
                    hasHave = "has";
                }

                //changed wording and used swal. Thanks, George Black
                swal.fire({
                    text: num + " " + size + orderString + ice_name + " ice cream "
                        + hasHave + " been added to your total order"
                });


                information.innerHTML += "Type:" + ice_name + "; &nbsp;&nbsp;&nbsp;&nbsp;" + "Size:" + size + "; &nbsp;&nbsp;&nbsp;&nbsp;" + "Number:" + num + ";&nbsp;&nbsp;&nbsp;&nbsp;Money:" + sizeMoney + "<br>";
    type_arr.push(ice_name);
    size_arr.push(size);
    sizeMoney_arr.push(sizeMoney);
    number_arr.push(num);
    }
    }
    }

    //查看已选
    var count = document.getElementById("count");
    var information = document.getElementById("orderInformation");
    count.onmouseover = function () {
        information.style.display = "block";
    }
    count.onmouseout = function () {
        information.style.display = "none";
    }
    information.onmouseover = function () {
        information.style.display = "block";
    }
    information.onmouseout = function () {
        information.style.display = "none";
    }

    //生成订单
    var productionOrder = document.getElementById("productionOrder");
    productionOrder.onclick = function () {
        //冰淇淋数量
        var s = 0;
        for (var i = 0; i < number_arr.length; i++) {
        s += parseInt(number_arr[i]);
    }
        if (s > 20) {

        //changed wording and used swal. Thanks, George Black
        swal.fire({
        icon: "error",
        text: "Maximum number of ice creams per order is 20"
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
        window.location.replace("order.jsp?" + sumMoney + "&" + type_arr + "&" + size_arr + "&" + sizeMoney_arr + "&" + number_arr);
    }
    }


    }
    //管理员界面
    var admin = document.getElementById("")
    //login out
    var cancellation = document.getElementById("logout");
    cancellation.onclick = function () {
        location.replace("/");
    }

