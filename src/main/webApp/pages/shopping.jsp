<%@ page import="jdk.swing.interop.SwingInterOpUtils" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>shopping</title>
    <link href="../css/shopping_style.css" type="text/css" rel="stylesheet">
    <script src="../SweetAlertJavaScript/sweetalert2.min.js"></script>
    <link rel="stylesheet" href="../css/sweetalert2.css">
</head>

<body>

<%if (session.getAttribute("orderID") != null) {%>
<%
        session.removeAttribute("orderID");
    }
%>




<div id="all">
    <div id="top">
        <img id="logo" src="../images/logo.png" >
        <li class="menu">
        <%--        <a href="register.jsp">register</a> does not make sense to register since they are alread logged in, thanks
        george black --%>
        <%--        <a href="/pages/admin.html">admin</a>--%>
            <input type="button" id="logout" value="logout">
    </li>
</div>


<div id="head">
    <img src="../images/head.png">
</div>

<div id="tit"><h2>--menu--</h2></div>


<div id="menu">
    <!--   one-->
    <div class="menu_information">
        <img src="../images/vanilla.jpg">
        <h3 class="type">Vanilla</h3>
<%--        <p>Vanilla ice cream is a kind of desserts, the main raw materials are fresh milk, eggs, sugar, solid cream and--%>
<%--            vanilla essence. The process of adding milk must be slow, slow and not impatient.</p>--%>
        <p>Rich and creamy vanilla. Made fresh everyday using our secret family recipe!</p>
        <div class="select_box">
            <span>Size:</span>
            <select class="select">
                <option value="Small">Small</option>
                <option value="Medium">Medium</option>
                <option value="Large">Large</option>
                <option value="Extra Large">Extra Large</option>
                <option value="Extra Extra Large">Extra Extra Large</option>
            </select>
        </div>

        <div class="jiaOrJian">
            <span>Number:</span>
            <span id="num-jian" class="num-jian">-</span>
            <input type="text" class="input-num" id="input-num" value="0"/>
            <span id="num-jia" class="num-jia">+</span>
        </div>
        <div class="add">
            <span>Add To Cart</span>
        </div>
    </div>
    <div class="menu_information">
        <img src="../images/vanilla.jpg">
        <h3 class="type">Dairy Free Vanilla</h3>
        <%--        <p>Strawberry ice cream, the world's most popular ice princess. It is famous for its noble and attractive--%>
        <%--            appearance, indescribable delicacy and irresistible charm.</p>--%>
        <p>Rich and dairy free vanilla. Made fresh everyday using our super duper secret family recipe!</p>
        <div class="select_box">
            <span>Size:</span>
            <select class="select">
                <option value="Small">Small</option>
                <option value="Medium">Medium</option>
                <option value="Large">Large</option>
                <option value="Extra Large">Extra Large</option>
                <option value="Extra Extra Large">Extra Extra Large</option>
            </select>
        </div>
        <div class="jiaOrJian">
            <span>Number:</span>
            <span id="num-jian" class="num-jian">-</span>
            <input type="text" class="input-num" id="input-num" value="0"/>
            <span id="num-jia" class="num-jia">+</span>
        </div>
        <div class="add">
            <span>Add To Cart</span>
        </div>
    </div>


    <!--   two-->
    <div class="menu_information">
        <img src="../images/honeycomb.jpg">
        <h3 class="type">Honeycomb</h3>
<%--        <p>The original beehive ice cream has honey and beehive, which is pure natural and has no added flavor. If you--%>
<%--            like cheese, you can recommend cheese cake. It's cool with the mellow smell of cheese. It feels great to--%>
<%--            melt in the mouth.</p>--%>
        <p>Sweet caramel flavour ice cream with delicious and crunchy honeycomb pieces</p>
        <div class="select_box">
            <span>Size:</span>
            <select class="select">
                <option value="Small">Small</option>
                <option value="Medium">Medium</option>
                <option value="Large">Large</option>
                <option value="Extra Large">Extra Large</option>
                <option value="Extra Extra Large">Extra Extra Large</option>
            </select>
        </div>

        <div class="jiaOrJian">
            <span>Number:</span>
            <span id="num-jian" class="num-jian">-</span>
            <input type="text" class="input-num" id="input-num" value="0"/>
            <span id="num-jia" class="num-jia">+</span>
        </div>
        <div class="add">
            <span>Add To Cart</span>
        </div>
    </div>
    <!--   three-->
    <div class="menu_information">
        <img src="../images/rum raisin.jpg">
        <h3 class="type">Rum and Raisin</h3>
<%--        <p>Soak the raisins in rum for a while. (you can also omit this step. I soaked all night, and the raisins tasted--%>
<%--            a little alcoholic.)</p>--%>
        <p>Creamy and rich rum ice cream with punchy rum soaked raisins</p>
        <div class="select_box">
            <span>Size:</span>
            <select class="select">
                <option value="Small">Small</option>
                <option value="Medium">Medium</option>
                <option value="Large">Large</option>
                <option value="Extra Large">Extra Large</option>
                <option value="Extra Extra Large">Extra Extra Large</option>
            </select>
        </div>

        <div class="jiaOrJian">
            <span>Number:</span>
            <span id="num-jian" class="num-jian">-</span>
            <input type="text" class="input-num" id="input-num" value="0"/>
            <span id="num-jia" class="num-jia">+</span>
        </div>
        <div class="add">
            <span>Add To Cart</span>
        </div>
    </div>
    <!--   four-->
    <div class="menu_information">
        <img src="../images/mint.jpg">
        <h3 class="type">Mint</h3>
<%--        <p>Mint ice cream is a delicious dish, the main ingredients include 2 egg yolks, 200 grams of milk, 100 grams of--%>
<%--            light cream.</p>--%>
        <p>Delightfully fresh and smooth mint ice cream!</p>
        <div class="select_box">
            <span>Size:</span>
            <select class="select">
                <option value="Small">Small</option>
                <option value="Medium">Medium</option>
                <option value="Large">Large</option>
                <option value="Extra Large">Extra Large</option>
                <option value="Extra Extra Large">Extra Extra Large</option>
            </select>
        </div>

        <div class="jiaOrJian">
            <span>Number:</span>
            <span id="num-jian" class="num-jian">-</span>
            <input type="text" class="input-num" id="input-num" value="0"/>
            <span id="num-jia" class="num-jia">+</span>
        </div>
        <div class="add">
            <span>Add To Cart</span>
        </div>
    </div>
    <!--   five-->
    <div class="menu_information">
        <img src="../images/cherry.jpg">
        <h3 class="type">Cherry</h3>
<%--        <p>Cherry ice cream is mainly made of yolk, sugar, milk, cream, cherry sauce and so on.</p>--%>
        <p>Tangy cherry ice cream perfect for fruit lovers</p>
        <div class="select_box">
            <span>Size:</span>
            <select class="select">
                <option value="Small">Small</option>
                <option value="Medium">Medium</option>
                <option value="Large">Large</option>
                <option value="Extra Large">Extra Large</option>
                <option value="Extra Extra Large">Extra Extra Large</option>
            </select>
        </div>

        <div class="jiaOrJian">
            <span>Number:</span>
            <span id="num-jian" class="num-jian">-</span>
            <input type="text" class="input-num" id="input-num" value="0"/>
            <span id="num-jia" class="num-jia">+</span>
        </div>
        <div class="add">
            <span>Add To Cart</span>
        </div>
    </div>
    <!--   six-->
    <div class="menu_information">
        <img src="../images/chocolate.jpg">
        <h3 class="type">Chocolate</h3>
<%--        <p>Chocolate ice cream is the prince of freezing all over the world. It is famous for its noble and attractive--%>
<%--            appearance, indescribable delicacy and irresistible charm.</p>--%>
        <p>This classic flavour is an indulgent combination of rich chocolate ice cream and tasty chocolate pieces</p>
        <div class="select_box">
            <span>Size:</span>
            <select class="select">
                <option value="Small">Small</option>
                <option value="Medium">Medium</option>
                <option value="Large">Large</option>
                <option value="Extra Large">Extra Large</option>
                <option value="Extra Extra Large">Extra Extra Large</option>
            </select>
        </div>
        <div class="jiaOrJian">
            <span>Number:</span>
            <span id="num-jian" class="num-jian">-</span>
            <input type="text" class="input-num" id="input-num" value="0"/>
            <span id="num-jia" class="num-jia">+</span>
        </div>
        <div class="add">
            <span>Add To Cart</span>
        </div>
    </div>
    <!--   seven-->
    <div class="menu_information">
        <img src="../images/salted caramel.jpg">
        <h3 class="type">Salted Caramel</h3>
<%--        <p>Salted caramel ice cream is a mixture of two flavors: salted caramel. Some salty caramel ice cream is a--%>
<%--            simple vanilla ice cream mixed with salty caramel.</p>--%>
        <p>Smooth salted caramel ice cream with moreish caramel sauce and pieces</p>
        <div class="select_box">
            <span>Size:</span>
            <select class="select">
                <option value="Small">Small</option>
                <option value="Medium">Medium</option>
                <option value="Large">Large</option>
                <option value="Extra Large">Extra Large</option>
                <option value="Extra Extra Large">Extra Extra Large</option>
            </select>
        </div>
        <div class="jiaOrJian">
            <span>Number:</span>
            <span id="num-jian" class="num-jian">-</span>
            <input type="text" class="input-num" id="input-num" value="0"/>
            <span id="num-jia" class="num-jia">+</span>
        </div>
        <div class="add">
            <span>Add To Cart</span>
        </div>
    </div>
    <!--   eight-->
    <div class="menu_information">
        <img src="../images/strawberry.jpg">
        <h3 class="type">Strawberry</h3>
<%--        <p>Strawberry ice cream, the world's most popular ice princess. It is famous for its noble and attractive--%>
<%--            appearance, indescribable delicacy and irresistible charm.</p>--%>
        <p>Delicious and creamy flavour made with fresh, juicy strawberries</p>
        <div class="select_box">
            <span>Size:</span>
            <select class="select">
                <option value="Small">Small</option>
                <option value="Medium">Medium</option>
                <option value="Large">Large</option>
                <option value="Extra Large">Extra Large</option>
                <option value="Extra Extra Large">Extra Extra Large</option>
            </select>
        </div>
        <div class="jiaOrJian">
            <span>Number:</span>
            <span id="num-jian" class="num-jian">-</span>
            <input type="text" class="input-num" id="input-num" value="0"/>
            <span id="num-jia" class="num-jia">+</span>
        </div>
        <div class="add">
            <span>Add To Cart</span>
        </div>
    </div>
</div>




<div id="order">
    <a id="productionOrder">Production order</a>
    <input type="text" class="count" id="count" value="0"/>
    <div class="orderInformation" id="orderInformation"></div>
</div>

</body>

<script type="text/javascript">


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
                //alert(type_arr);
                //封装为json
                // var ice = new Object();
                // ice.type = ice_name;
                // ice.size = size;
                // ice.number = num;
                // ice.price = sizeMoney;
                // date.push(ice)
                // ice_json = JSON.stringify(date)
                // //alert(ice_json);

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
            }).then((result) =>
            {
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
                //alert(sumMoney);
                //json对象
                // ice_json = JSON.parse(ice_json)
                // var li = new Object();
                // li.iceCreamList = ice_json;

                // var li_json = JSON.stringify(li);
                //alert(li_json); do not thing this is needed. Thanks, George Black

                window.location.replace("order.jsp?" + sumMoney + "&" + type_arr + "&" + size_arr + "&" + sizeMoney_arr + "&" + number_arr);
            }
        }


    }
    //管理员界面
    var admin = document.getElementById("")
    //login out
    var cancellation = document.getElementById("logout");
    cancellation.onclick = function(){
        location.replace("index.html");
    }

</script>
</html>

