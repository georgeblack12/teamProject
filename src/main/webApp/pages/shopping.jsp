<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>



<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>shopping</title>
<link href="../css/shopping_style.css" type="text/css" rel="stylesheet">
</head>

<body>
<img id="logo" src="../images/logo.png" >
<br>



<div id="head">
	<img src="../images/head.png">
</div>

<div id="tit"><h2>--menu--</h2></div>



<div id="menu">
<!--	one-->
	<div class="menu_information">
		<img src="../images/ice01.jpg">
		<h3 class="type">Plainvanilla</h3>
		<p>Vanilla ice cream is a kind of desserts, the main raw materials are fresh milk, eggs, sugar, solid cream and vanilla essence. The process of adding milk must be slow, slow and not impatient.</p>
		<div class="select_box">
			<span>Size:</span>
			<select class="select">
				<option value="Small">Small</option>
				<option value="Medium">Medium</option>
				<option value="Large">Large</option>
				<option value="ExtraLarge">ExtraLarge</option>
				<option value="ExtraExtraLarge">ExtraExtraLarge</option>
			</select>
		</div>

		<div class="jiaOrJian">
			<span>Number:</span>
			<span id="num-jian" class="num-jian">-</span>
			<input type="text" class="input-num" id="input-num" value="0" />
			<span id="num-jia" class="num-jia">+</span>
		</div>
		<div class="add">
			<span>Add To Cart</span>
		</div>
	</div>
<!--	two-->
	<div class="menu_information">
		<img src="../images/ice02.jpg">
		<h3 class="type">Honeycomb</h3>
		<p>The original beehive ice cream has honey and beehive, which is pure natural and has no added flavor. If you like cheese, you can recommend cheese cake. It's cool with the mellow smell of cheese. It feels great to melt in the mouth.</p>
		<div class="select_box">
			<span>Size:</span>
			<select class="select">
				<option value="Small">Small</option>
				<option value="Medium">Medium</option>
				<option value="Large">Large</option>
				<option value="ExtraLarge">ExtraLarge</option>
				<option value="ExtraExtraLarge">ExtraExtraLarge</option>
			</select>
		</div>

		<div class="jiaOrJian">
			<span>Number:</span>
			<span id="num-jian" class="num-jian">-</span>
			<input type="text" class="input-num" id="input-num" value="0" />
			<span id="num-jia" class="num-jia">+</span>
		</div>
		<div class="add">
			<span>Add To Cart</span>
		</div>
	</div>
<!--	three-->
	<div class="menu_information">
		<img src="../images/ice03.jpg">
		<h3 class="type">RumandRaisi</h3>
		<p>Soak the raisins in rum for a while. (you can also omit this step. I soaked all night, and the raisins tasted a little alcoholic.)</p>
		<div class="select_box">
			<span>Size:</span>
			<select class="select">
				<option value="Small">Small</option>
				<option value="Medium">Medium</option>
				<option value="Large">Large</option>
				<option value="ExtraLarge">ExtraLarge</option>
				<option value="ExtraExtraLarge">ExtraExtraLarge</option>
			</select>
		</div>

		<div class="jiaOrJian">
			<span>Number:</span>
			<span id="num-jian" class="num-jian">-</span>
			<input type="text" class="input-num" id="input-num" value="0" />
			<span id="num-jia" class="num-jia">+</span>
		</div>
		<div class="add">
			<span>Add To Cart</span>
		</div>
	</div>
<!--	four-->
	<div class="menu_information">
		<img src="../images/ice04.jpg">
		<h3 class="type">Mint</h3>
		<p>Mint ice cream is a delicious dish, the main ingredients include 2 egg yolks, 200 grams of milk, 100 grams of light cream.</p>
		<div class="select_box">
			<span>Size:</span>
			<select class="select">
				<option value="Small">Small</option>
				<option value="Medium">Medium</option>
				<option value="Large">Large</option>
				<option value="ExtraLarge">ExtraLarge</option>
				<option value="ExtraExtraLarge">ExtraExtraLarge</option>
			</select>
		</div>

		<div class="jiaOrJian">
			<span>Number:</span>
			<span id="num-jian" class="num-jian">-</span>
			<input type="text" class="input-num" id="input-num" value="0" />
			<span id="num-jia" class="num-jia">+</span>
		</div>
		<div class="add">
			<span>Add To Cart</span>
		</div>
	</div>
<!--	five-->
	<div class="menu_information">
		<img src="../images/ice05.jpg">
		<h3 class="type">Cherry</h3>
		<p>Cherry ice cream is mainly made of yolk, sugar, milk, cream, cherry sauce and so on.</p>
		<div class="select_box">
			<span>Size:</span>
			<select class="select">
				<option value="Small">Small</option>
				<option value="Medium">Medium</option>
				<option value="Large">Large</option>
				<option value="ExtraLarge">ExtraLarge</option>
				<option value="ExtraExtraLarge">ExtraExtraLarge</option>
			</select>
		</div>

		<div class="jiaOrJian">
			<span>Number:</span>
			<span id="num-jian" class="num-jian">-</span>
			<input type="text" class="input-num" id="input-num" value="0" />
			<span id="num-jia" class="num-jia">+</span>
		</div>
		<div class="add">
			<span>Add To Cart</span>
		</div>
	</div>
<!--	six-->
	<div class="menu_information">
		<img src="../images/ice06.jpg">
		<h3 class="type">Chocolate</h3>
		<p>Chocolate ice cream is the prince of freezing all over the world. It is famous for its noble and attractive appearance, indescribable delicacy and irresistible charm.</p>
		<div class="select_box">
			<span>Size:</span>
			<select class="select">
				<option value="Small">Small</option>
				<option value="Medium">Medium</option>
				<option value="Large">Large</option>
				<option value="ExtraLarge">ExtraLarge</option>
				<option value="ExtraExtraLarge">ExtraExtraLarge</option>
			</select>
		</div>
		<div class="jiaOrJian">
			<span>Number:</span>
			<span id="num-jian" class="num-jian">-</span>
			<input type="text" class="input-num" id="input-num" value="0" />
			<span id="num-jia" class="num-jia">+</span>
		</div>
		<div class="add">
			<span>Add To Cart</span>
		</div>
	</div>
<!--	seven-->
	<div class="menu_information">
		<img src="../images/ice07.jpg">
		<h3 class="type">SaltedCaramel</h3>
		<p>Salted caramel ice cream is a mixture of two flavors: salted caramel. Some salty caramel ice cream is a simple vanilla ice cream mixed with salty caramel.</p>
		<div class="select_box">
			<span>Size:</span>
			<select class="select">
				<option value="Small">Small</option>
				<option value="Medium">Medium</option>
				<option value="Large">Large</option>
				<option value="ExtraLarge">ExtraLarge</option>
				<option value="ExtraExtraLarge">ExtraExtraLarge</option>
			</select>
		</div>
		<div class="jiaOrJian">
			<span>Number:</span>
			<span id="num-jian" class="num-jian">-</span>
			<input type="text" class="input-num" id="input-num" value="0" />
			<span id="num-jia" class="num-jia">+</span>
		</div>
		<div class="add">
			<span>Add To Cart</span>
		</div>
	</div>
<!--	eight-->
	<div class="menu_information">
		<img src="../images/ice08.jpg">
		<h3 class="type">Strawberry</h3>
		<p>Strawberry ice cream, the world's most popular ice princess. It is famous for its noble and attractive appearance, indescribable delicacy and irresistible charm.</p>
		<div class="select_box">
			<span>Size:</span>
			<select class="select">
				<option value="Small">Small</option>
				<option value="Medium">Medium</option>
				<option value="Large">Large</option>
				<option value="ExtraLarge">Extra Large</option>
				<option value="ExtraExtraLarge">ExtraExtraLarge</option>
			</select>
		</div>
		<div class="jiaOrJian">
			<span>Number:</span>
			<span id="num-jian" class="num-jian">-</span>
			<input type="text" class="input-num" id="input-num" value="0" />
			<span id="num-jia" class="num-jia">+</span>
		</div>
		<div class="add">
			<span>Add To Cart</span>
		</div>
	</div>
</div>

<div id="order">
	<a id="productionOrder">Production order</a>
	<input type="text" class="count" id="count" value="0" />
	<div class="orderInformation" id="orderInformation"></div>
</div>

</body>

<script type="text/javascript">



	//数量加减
	var num_jia = document.getElementsByClassName("num-jia");
	var num_jian = document.getElementsByClassName("num-jian");
	var input_num = document.getElementsByClassName("input-num");
	for(var i = 0 ;i<num_jia.length;i++){
		num_jia[i].id=i;
		num_jia[i].onclick = function() {
			input_num[this.id].value = parseInt(input_num[this.id].value) + 1;
		}
		num_jian[i].id=i;
		num_jian[i].onclick = function() {
			if(input_num[this.id].value <= 0) {
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
	var size_arr =[];
	var number_arr=[];
	var sizeMoney_arr=[];
	var sumMoney=0;
	for(var i = 0;i<add.length;i++){
		add[i].id = i;
		add[i].onclick=function(){
			if(input_num[this.id].value<=0){
				alert("Additional purchase quantity cannot be zero!");
			}else{
				var num = input_num[this.id].value;
				var size = select[this.id].value;
				var ice_name = type[this.id].innerHTML;
				var sizeMoney;
				switch(size){
					case "Small":sizeMoney=1.75;break;
					case "Medium":sizeMoney=2.25;break;
					case "Large":sizeMoney=2.75;break;
					case "ExtraLarge":sizeMoney=3.50;break;
					case "ExtraExtraLarge":sizeMoney=5.75;break;
					   }
				sumMoney+=sizeMoney;
				count.value=parseInt(count.value)+1;
				alert("Type:"+ice_name+"; "+"Size:"+size+";"+"Number:"+num+"Money:"+sizeMoney);
				information.innerHTML+="Type:"+ice_name+"; &nbsp;&nbsp;&nbsp;&nbsp;"+"Size:"+size+"; &nbsp;&nbsp;&nbsp;&nbsp;"+"Number:"+num+";&nbsp;&nbsp;&nbsp;&nbsp;Money:"+sizeMoney+"<br>";
				type_arr.push(ice_name);
				size_arr.push(size);
				sizeMoney_arr.push(sizeMoney);
				number_arr.push(num);
				//alert(type_arr);
			}
		}
	}

	//查看已选
	var count = document.getElementById("count");
	var information = document.getElementById("orderInformation");
	count.onmouseover=function(){
		information.style.display="block";
	}
	count.onmouseout=function(){
		information.style.display="none";
	}
	information.onmouseover=function(){
		information.style.display="block";
	}
	information.onmouseout=function(){
		information.style.display="none";
	}

	//生成订单
	var productionOrder = document.getElementById("productionOrder");
	productionOrder.onclick = function(){
		if(count.value<=0){
			alert("Currently, there is no order, no need to generate!");
			return false;
		}else{
			//alert(sumMoney);

			window.open("order.html?"+sumMoney+"&"+type_arr+"&"+size_arr+"&"+sizeMoney_arr+"&"+number_arr);
		}
	}

</script>
</html>