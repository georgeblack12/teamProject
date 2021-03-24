<%@ page import="jdk.swing.interop.SwingInterOpUtils" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>Shopping</title>
    <link href="../css/shopping_style.css" type="text/css" rel="stylesheet">

    <script src="../javascript/sweetalert2.min.js"></script>
    <link rel="stylesheet" href="../css/sweetalert2.css">


</head>

<body>

<%if (session.getAttribute("orderID") != null) {%>
<%
        session.removeAttribute("orderID");
    }
%>

<header>
    <img id="logo" src="../images/logo1.png">
    <input type="button" id="logout" value="logout">
    <script>
        var cancellation = document.getElementById("logout");
        cancellation.onclick = function () {
            location.replace("/");
        }
    </script>
</header>

<div id="intro">
    <h1>Prices</h1>
    <p> Please note that all of our ice creams are sold as tubs</p>
    <p>Small (100ml) - £1.75 | Medium (200ml) - £2.25 | Large (300ml) - £2.75 | Extra Large (500ml) - £3.50 | Extra Extra Large (750ml) - £5.75</p>
    <p>(75p surcharge for Salted Caramel) </p>
</div>

<%--<div id="all">--%>
<%--    <div id="top">--%>
<%--        <li class="menu">--%>
<%--            &lt;%&ndash;        <a href="register.jsp">register</a> does not make sense to register since they are alread logged in, thanks--%>
<%--            george black &ndash;%&gt;--%>
<%--            &lt;%&ndash;        <a href="/pages/admin.html">admin</a>&ndash;%&gt;--%>
<%--            <input type="button" id="logout" value="logout">--%>
<%--        </li>--%>
<%--    </div>--%>


<%--    <div id="head">--%>
<%--        <img src="../images/head.png">--%>
<%--    </div>--%>

    <div id="tit"><h2>Menu</h2></div>


    <div id="menu">
        <!--   one-->
        <div class="menu_information">
            <img src="../images/vanilla.jpg">
            <h3 class="type">Vanilla</h3>
            <p>Rich and creamy vanilla. Made fresh everyday using our secret family recipe!</p>
            <div class="select_box">
                <span>Size:</span>
                <select class="select">
                    <option value="Small">Small - £1.75</option>
                    <option value="Medium">Medium - £2.25 </option>
                    <option value="Large">Large- £2.75 </option>
                    <option value="Extra Large">Extra Large- £3.50</option>
                    <option value="Extra Extra Large">Extra Extra Large - £5.75</option>
                </select>
            </div>

            <div class="jiaOrJian">
                <span>Number:</span>
                <span class="num-jian">-</span>
                <input type="text" class="input-num" value="0"/>
                <span class="num-jia">+</span>
            </div>
            <div class="add">
                <span>Add To Cart</span>
            </div>
        </div>

        <div class="menu_information">
            <img src="../images/dairy free final.jpg">
            <h3 class="type">Dairy Free Vanilla</h3>
            <p>Rich and dairy free vanilla. Made fresh everyday using our super duper secret family recipe!</p>
            <div class="select_box">
                <span>Size:</span>
                <select class="select">
                    <option value="Small">Small - £1.75</option>
                    <option value="Medium">Medium - £2.25 </option>
                    <option value="Large">Large- £2.75 </option>
                    <option value="Extra Large">Extra Large- £3.50</option>
                    <option value="Extra Extra Large">Extra Extra Large - £5.75</option>
                </select>
            </div>

            <div class="jiaOrJian">
                <span>Number:</span>
                <span class="num-jian">-</span>
                <input type="text" class="input-num" value="0"/>
                <span  class="num-jia">+</span>
            </div>
            <div class="add">
                <span>Add To Cart</span>
            </div>
        </div>


        <!--   two-->
        <div class="menu_information">
            <img src="../images/honeycomb.jpg">
            <h3 class="type">Honeycomb</h3>
            <p>Sweet caramel flavour ice cream with delicious and crunchy honeycomb pieces</p>
            <div class="select_box">
                <span>Size:</span>
                <select class="select">
                    <option value="Small">Small - £1.75</option>
                    <option value="Medium">Medium - £2.25 </option>
                    <option value="Large">Large- £2.75 </option>
                    <option value="Extra Large">Extra Large- £3.50</option>
                    <option value="Extra Extra Large">Extra Extra Large - £5.75</option>
                </select>
            </div>

            <div class="jiaOrJian">
                <span>Number:</span>
                <span class="num-jian">-</span>
                <input type="text" class="input-num" value="0"/>
                <span class="num-jia">+</span>
            </div>
            <div class="add">
                <span>Add To Cart</span>
            </div>
        </div>
        <!--   three-->
        <div class="menu_information">
            <img src="../images/rum raisin.jpg">
            <h3 class="type">Rum and Raisin</h3>
            <p>Creamy and rich rum ice cream with punchy rum soaked raisins</p>
            <div class="select_box">
                <span>Size:</span>
                <select class="select">
                    <option value="Small">Small - £1.75</option>
                    <option value="Medium">Medium - £2.25 </option>
                    <option value="Large">Large- £2.75 </option>
                    <option value="Extra Large">Extra Large- £3.50</option>
                    <option value="Extra Extra Large">Extra Extra Large - £5.75</option>
                </select>
            </div>

            <div class="jiaOrJian">
                <span>Number:</span>
                <span class="num-jian">-</span>
                <input type="text" class="input-num" value="0"/>
                <span class="num-jia">+</span>
            </div>
            <div class="add">
                <span>Add To Cart</span>
            </div>
        </div>
        <!--   four-->
        <div class="menu_information">
            <img src="../images/mint.jpg">
            <h3 class="type">Mint</h3>

            <p>Delightfully fresh and smooth mint ice cream!</p>
            <div class="select_box">
                <span>Size:</span>
                <select class="select">
                    <option value="Small">Small - £1.75</option>
                    <option value="Medium">Medium - £2.25 </option>
                    <option value="Large">Large- £2.75 </option>
                    <option value="Extra Large">Extra Large- £3.50</option>
                    <option value="Extra Extra Large">Extra Extra Large - £5.75</option>
                </select>
            </div>

            <div class="jiaOrJian">
                <span>Number:</span>
                <span class="num-jian">-</span>
                <input type="text" class="input-num" value="0"/>
                <span class="num-jia">+</span>
            </div>
            <div class="add">
                <span>Add To Cart</span>
            </div>
        </div>
        <!--   five-->
        <div class="menu_information">
            <img src="../images/cherry.jpg">
            <h3 class="type">Cherry</h3>
            <p>Tangy cherry ice cream perfect for fruit lovers</p>
            <div class="select_box">
                <span>Size:</span>
                <select class="select">
                    <option value="Small">Small - £1.75</option>
                    <option value="Medium">Medium - £2.25 </option>
                    <option value="Large">Large- £2.75 </option>
                    <option value="Extra Large">Extra Large- £3.50</option>
                    <option value="Extra Extra Large">Extra Extra Large - £5.75</option>
                </select>
            </div>

            <div class="jiaOrJian">
                <span>Number:</span>
                <span class="num-jian">-</span>
                <input type="text" class="input-num" value="0"/>
                <span class="num-jia">+</span>
            </div>
            <div class="add">
                <span>Add To Cart</span>
            </div>
        </div>
        <!--   six-->
        <div class="menu_information">
            <img src="../images/chocolate.jpg">
            <h3 class="type">Chocolate</h3>
            <p>This classic flavour is a combination of rich chocolate ice cream and tasty chocolate
                pieces</p>
            <div class="select_box">
                <span>Size:</span>
                <select class="select">
                    <option value="Small">Small - £1.75</option>
                    <option value="Medium">Medium - £2.25 </option>
                    <option value="Large">Large- £2.75 </option>
                    <option value="Extra Large">Extra Large- £3.50</option>
                    <option value="Extra Extra Large">Extra Extra Large - £5.75</option>
                </select>
            </div>
            <div class="jiaOrJian">
                <span>Number:</span>
                <span class="num-jian">-</span>
                <input type="text" class="input-num" value="0"/>
                <span class="num-jia">+</span>
            </div>
            <div class="add">
                <span>Add To Cart</span>
            </div>
        </div>
        <!--   seven-->
        <div class="menu_information">
            <img src="../images/salted caramel.jpg">
            <h3 class="type">Salted Caramel</h3>
            <p>Smooth salted caramel ice cream with moreish caramel sauce and pieces</p>
            <div class="select_box">
                <span>Size:</span>
                <select class="select">
                    <option value="Small">Small - £2.50</option>
                    <option value="Medium">Medium - £3.00 </option>
                    <option value="Large">Large- £3.50 </option>
                    <option value="Extra Large">Extra Large- £4.25</option>
                    <option value="Extra Extra Large">Extra Extra Large - £6.50</option>
                </select>
            </div>
            <div class="jiaOrJian">
                <span>Number:</span>
                <span class="num-jian">-</span>
                <input type="text" class="input-num" value="0"/>
                <span class="num-jia">+</span>
            </div>
            <div class="add">
                <span>Add To Cart</span>
            </div>
        </div>
        <!--   eight-->
        <div class="menu_information">
            <img src="../images/strawberry.jpg">
            <h3 class="type">Strawberry</h3>
            <p>Delicious and creamy flavour made with fresh, juicy strawberries</p>
            <div class="select_box">
                <span>Size:</span>
                <select class="select">
                    <option value="Small">Small - £1.75</option>
                    <option value="Medium">Medium - £2.25 </option>
                    <option value="Large">Large- £2.75 </option>
                    <option value="Extra Large">Extra Large- £3.50</option>
                    <option value="Extra Extra Large">Extra Extra Large - £5.75</option>
                </select>
            </div>
            <div class="jiaOrJian">
                <span>Number:</span>
                <span class="num-jian">-</span>
                <input type="text" class="input-num" value="0"/>
                <span class="num-jia">+</span>
            </div>
            <div class="add">
                <span>Add To Cart</span>
            </div>
        </div>
    </div>


    <div id="order">
        <a id="productionOrder">View Cart</a>
        <input type="text" class="count" id="count" value="0"/>
        <div class="orderInformation" id="orderInformation"></div>
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
<script type="text/javascript" src="../javascript/shopping.js"></script>

</html>

