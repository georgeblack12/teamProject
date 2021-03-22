<%@ page import="com.project.cavallo.dao.StatisticsRepository" %>
<%@ page import="java.time.LocalDate" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Analytics</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js"
            integrity="sha512-d9xgZrVZpmmQlfonhQUvTR7lMPtO7NkZMkA0ABN3PHCbKA5nqylQ/yWlFAyY6hYgdF1Qh6nYiuADWwKB4C2WSw=="
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/resources/demos/style.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>




<body>
<%
    StatisticsRepository statsInfo = (StatisticsRepository) session.getAttribute("statsRepo");
%>

<script>



        function getFormattedDate(){
            var adminDate = new Date()

            //Add 0 and then slice to get the last two numbers. If there already two number ex: 12 then it will have
            //012 so 12 will be sent to MM. If the date is a single number  ex:5 then the number is 05 and 05 is
            //returned

            //+1 added with montn because month goes 0-11 and we need 1-12
            var MM = ('0' + String(adminDate.getMonth() + 1)).slice(-2);

            var yyyy = String(adminDate.getFullYear());
            var DD = ('0' + String(adminDate.getDate())).slice(-2);
            return DD + "/" + MM + "/" + yyyy;
        }

</script>




<header>
    <h1>Analytics</h1>


    <nav>
        <ul>
            <li><a href="#orders">Number of orders</a></li>
            <li><a href="#flavours">Popularity of flavours</a></li>
        </ul>
    </nav>
</header>

<main>
    <section id="orders">
        <div id="order_overall">
            <p>Number of orders overall:</p>
            <p><%=statsInfo.getTotalOrders()%>
            </p>
        </div>

        <div id="order_today">
            <p>Number of orders today:</p>
            <p><%=statsInfo.getTotalOrdersFromDate(LocalDate.now())%>
            </p>
        </div>

        <div id="order_week">
            <p>Number of orders in the last 7 days:</p>
            <p><%=statsInfo.getTotalOrdersThisWeek()%>
            </p>
        </div>

        <div id="order_month">
            <p>Number of orders this month/last 30 days:</p>
            <p><%=statsInfo.getTotalOrdersPastThirty()%>
            </p>
        </div>

        <div id="order_calendar">



            <p>Select a date to view orders:</p>
            <script>

                $(function () {
                    $("#datepicker2").datepicker({
                        dateFormat:"dd/mm/yy",
                        maxDate: "now",
                        onSelect: function (dateText) {
                            let dateAsString = dateText;
                            getDateAndOrderTotal(dateAsString);
                            getYForOrder(dateAsString);
                        }
                    });
                });




                function getDateAndOrderTotal(dateToGet) {
                    let xhr = new XMLHttpRequest();
                    let url = '/analyticsDate';
                    xhr.open("POST", url, true);
                    xhr.setRequestHeader("Content-Type", "application/json");
                    xhr.send(dateToGet);

                    xhr.onreadystatechange = function () {
                        if (xhr.readyState == XMLHttpRequest.DONE) {
                            console.log(xhr.response);
                            document.getElementById("soldFromDate").innerHTML = xhr.response;
                        }
                    }
                    document.getElementById("dateChosen").innerHTML=dateToGet;
                }

                function getYForOrder(dateToGet){
                    let xhr = new XMLHttpRequest();
                    let url = '/getYForOrder';
                    xhr.open("POST", url, true);
                    xhr.setRequestHeader("Content-Type", "application/json");
                    xhr.send(dateToGet);
                    xhr.onreadystatechange = function () {
                        if (xhr.readyState == XMLHttpRequest.DONE) {
                            myChartOrders.data.datasets[0].data=JSON.parse(xhr.response);
                            myChartOrders.update();
                        }
                    }
                }

            </script>
            <div id="datepicker2"></div>
            <p>Date:
            <div id="dateChosen"></div>

            <script>
                document.getElementById("dateChosen").innerHTML=getFormattedDate();
            </script>

            </p>
        </div>

        <div id="order_chosen_day">
            <p>Total number of orders this day:</p>
            <div id="soldFromDate"></div>

            <script>
                document.getElementById("soldFromDate").innerHTML=<%=statsInfo.getTotalOrdersFromDate(LocalDate.now())%>
            </script>
        </div>



        <div id="order_graph">
            <p>Graph</p>
            <canvas id="myChart2" width="300" height="300"></canvas>
            <script>

                    var ctx = document.getElementById('myChart2');
                    var myChartOrders = new Chart(ctx, {
                        type: 'line',
                        data: {
                            labels: ['11:00 - 12:00', '12:00 - 13:00', '13:00 -14:00', '14:00 - 15:00', '15:00 - 16:00', '16:00 - 17:00', '17:00 - 18:00'],
                            datasets: [{
                                label: 'Number of orders',
                                data: JSON.parse("<%=statsInfo.getYForOrderGraph(LocalDate.now())%>"),
                                fill: false
                            }]
                        },
                        options: {
                            legend: {
                                display: false
                            },
                            title: {
                                display: true,
                                text: 'Orders Throughout This Day'
                            },
                            scales: {
                                yAxes: [{
                                    ticks: {
                                        beginAtZero: true
                                    }
                                }]
                            }
                        }
                    });

            </script>
        </div>
    </section>

    <section id="flavours">
        <div id="popular">
            <p>Our most popular flavour is:</p>
            <p><%=statsInfo.getMostPopularFlavor()%></p>
        </div>

        <div id="flavour_graph">
            <p>Graph</p>
            <canvas id="myChart" width="400" height="400"></canvas>
            <script>
                var ctxOther = document.getElementById('myChart');
                var myChart = new Chart(ctxOther, {
                    type: 'bar',
                    data: {
                        labels: ['Vanilla', 'Dairy Free Vanilla', 'Honeycomb', 'Rum and Raisin', 'Mint', 'Cherry', 'Chocolate', 'Salted Caramel', 'Strawberry'],
                        datasets: [{
                            label: 'Ice creams sold',
                            data: <%=statsInfo.getYForCreamGraph()%>
                        }]
                    },
                    options: {
                        legend: {
                            display: false
                        },
                        title: {
                            display: true,
                            text: 'Total Number of Ice Creams of Each Flavour Sold'
                        },
                        scales: {
                            yAxes: [{
                                ticks: {
                                    beginAtZero: true
                                }
                            }]
                        }
                    }
                });
            </script>
        </div>
    </section>
</main>


</body>




</html>