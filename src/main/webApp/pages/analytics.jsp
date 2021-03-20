<%@ page import="com.project.cavallo.dao.StatisticsRepository" %>
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
            <p><%=statsInfo.getOrdersToday()%>
            </p>
        </div>

        <div id="order_week">
            <p>Number of orders in the last 7 days:</p>
            <p><%=statsInfo.getOrdersThisWeek()%>
            </p>
        </div>

        <div id="order_month">
            <p>Number of orders this month/last 30 days:</p>
            <p><%=statsInfo.getOrdersPastThirty()%>
            </p>
        </div>

        <div id="order_calendar">
            <p>Select a date to view orders:</p>
            <script>
                var dateChosen;
                $(function () {
                    $("#datepicker2").datepicker({
                        onSelect: function (dateText) {
                            let dateAsString = dateText;
                            sendJSONDate(dateAsString);
                        }
                    });
                });


                function sendJSONDate(dateToGet) {
                    let xhr = new XMLHttpRequest();
                    let url = '/analyticsDate';
                    xhr.open("POST", url, true);
                    xhr.setRequestHeader("Content-Type", "application/json");
                    xhr.send(dateToGet);
                    xhr.onreadystatechange = function () {
                        if (xhr.readyState == XMLHttpRequest.DONE) {
                            dateChosen = JSON.parse(xhr.response);
                        }
                    }
                }







            </script>
            <p>Date:
            <div id="datepicker2"></div>
            </p>
        </div>

        <div id="order_chosen_day">
            <p>Total number of orders this day:</p>
            <p>X</p>
        </div>

        <div id="order_graph">
            <p>Graph</p>
            <canvas id="myChart2" width="300" height="300"></canvas>
            <script>
                var ctx = document.getElementById('myChart2');
                var myChart = new Chart(ctx, {
                    type: 'line',
                    data: {
                        labels: ['11:00 - 12:00', '12:00 - 13:00', '13:00 -14:00', '14:00 - 15:00', '15:00 - 16:00', '16:00 - 17:00', '17:00 - 18:00'],
                        datasets: [{
                            label: 'Number of orders',
                            data: [12, 19, 3, 5, 2, 3, 5],
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
            <p>X</p>
        </div>

        <div id="flavour_graph">
            <p>Graph</p>
            <canvas id="myChart" width="400" height="400"></canvas>
            <script>
                var ctx = document.getElementById('myChart');
                var myChart = new Chart(ctx, {
                    type: 'bar',
                    data: {
                        labels: ['Vanilla', 'Dairy Free Vanilla', 'Honeycomb', 'Rum and Raisin', 'Mint', 'Cherry', 'Chocolate', 'Salted Caramel', 'Strawberry'],
                        datasets: [{
                            label: 'Ice creams sold',
                            data: [12, 19, 3, 5, 2, 3, 5, 10, 1]
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

<script>
    var totalOrders = "<%=statsInfo.getTotalOrders()%>";

</script>
</html>