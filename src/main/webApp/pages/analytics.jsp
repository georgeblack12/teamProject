<%--Original Author: Madeleine Towes, Yotam Chan Cheng (20/03/21)--%>
<%--Modifying Authors: Madeleine Towes, Aggrey Nhiwatiwa, George Black (23/03/21)--%>

<%@ page import="com.project.cavallo.dao.StatisticsRepository" %>
<%@ page import="java.time.LocalDate" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>


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
    <link href="../css/analytics_style.css" type="text/css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>


<body>

<%
    //gets the StatisticsRepository attribute that was set in the StatisticsController. This will allow us to easily
    //obtain and display the Statistics we need.
    StatisticsRepository statsInfo = (StatisticsRepository) session.getAttribute("statsRepo");
%>

<script>


    /**
     * Method to get the current date in a specific format. This method is also found in the order page.
     * NOTE: This program will be running on the Cavallo shop so that a new date will be registered at the date in
     * Newcastle.
     * @author John Selgers
     * @see https://stackoverflow.com/questions/3605214/javascript-add-leading-zeroes-to-date
     * Modifying Author: George Black
     *
     * @returns {string} A String of the current date with the format dd/MM/yyyy.
     */
    function getFormattedDate() {
        var adminDate = new Date()

        //Add 0 and then slice to get the last two numbers. If there already two number ex: 12 then it will have
        //012 so 12 will be sent to MM. If the date is a single number  ex:5 then the number 05 is
        //returned

        //+1 added with montn because month goes 0-11 and we need 1-12
        var MM = ('0' + String(adminDate.getMonth() + 1)).slice(-2);

        var yyyy = String(adminDate.getFullYear());
        var DD = ('0' + String(adminDate.getDate())).slice(-2);
        return DD + "/" + MM + "/" + yyyy;
    }

</script>


<header>
    <img id="logo" src="../images/logo1.png"
         alt="Yellow circle with red text reading Cavallo, black text of traditional Italian ice cream and a picture of an ice cream.">
    <input type="button" id="logout" value="logout">
    <script>
        //If person hits the logout button they are sent to the homepage.
        var cancellation = document.getElementById("logout");
        cancellation.onclick = function () {
            location.replace("/"); // "/" takes a Customer back to the homepage due to WebStartController.
        }
    </script>

</header>

<div id="intro">
    <h1>Analytics</h1>
    <p>See store statistics here!</p>
    <nav>
        <ul>
            <li><a href="#orders">Number of orders</a></li>
            <li><a href="#flavours">Popularity of flavours</a></li>
        </ul>
    </nav>
</div>

<main>
    <section id="orders">
        <div id="order_stats">
            <div class="stats" id="order_overall">
                <p>Number of orders overall:</p>
                <p><%=statsInfo.getTotalOrders()%>
                </p>
            </div>

            <div class="stats" id="order_today">
                <p>Number of orders today:</p>
                <%--            use JSP to get the total number of orders that have occurred. --%>
                <p><%=statsInfo.getTotalOrdersFromDate(LocalDate.now())%>
                </p>
            </div>

            <div class="stats" id="order_week">
                <p>Number of orders in the last 7 days:</p>
                <%--            use JSP to get the number of orders that have occurred the past 7 days. --%>
                <p><%=statsInfo.getTotalOrdersThisWeek()%>
                </p>
            </div>

            <div class="stats" id="order_month">
                <p>Number of orders in the last 30 days:</p>
                <%--            use JSP to get the number of orders that have occurred the past 30 days. --%>
                <p><%=statsInfo.getTotalOrdersPastThirty()%>
                </p>
            </div>
        </div>

        <div id="order_calendar">
            <div id="left">
                <p>Select a date to view orders:</p>
                <script>


                    //When a person picks a date using date picker the number of orders that occurred that day is returned
                    //and displayed. Additionally, a list that contains the needed y values for the "order_graph" is
                    // returned and uses the y values for the order graph. Also, the date entered by the client is
                    //displayed.
                    $(function () {
                        $("#datepicker2").datepicker({
                            dateFormat: "dd/mm/yy",
                            maxDate: "now", //makes it so they cannot pick future dates.
                            onSelect: function (dateText) {
                                let dateAsString = dateText;
                                //gets and displays the total number of orders that occurred on the date entered.
                                getDateAndOrderTotal(dateAsString);

                                //gets the list that contains the needed y values for the "order_graph" and uses the list
                                // as the new y values in the "order-graph".
                                getYForOrder(dateAsString);
                            }
                        });
                    });


                    /**
                     * Method that Takes the date entered (dateToGet) and then obtains the number of orders that have
                     * occurred on dateToGet and sets it as the value for "soldFromDate" (so it can be displayed).
                     * Then displays this number. Additionally, displays the date to get.
                     * @param dateToGet The day we want to know the number of orders that occurred on it.
                     * @author George Black
                     */
                    function getDateAndOrderTotal(dateToGet) {
                        let xhr = new XMLHttpRequest();
                        let url = '/analyticsDate';
                        xhr.open("POST", url, true);
                        xhr.setRequestHeader("Content-Type", "application/json");
                        xhr.send(dateToGet);

                        xhr.onreadystatechange = function () {
                            if (xhr.readyState == XMLHttpRequest.DONE) {
                                document.getElementById("soldFromDate").innerHTML = xhr.response;
                            }
                        }
                        document.getElementById("dateChosen").innerHTML = dateToGet;
                    }

                    /**
                     * A method that Takes the date entered (dateToGet) and then obtains a list to be used as the y values
                     * for "order_graph." NOTE: Dach value in the list is the number of iceCreamOrders that occurred
                     * during a related time on dateToGet. For example, the first number in the list is the number of
                     * iceCreamOrders that occurred between 11-12 on dateToGet, the second number in the list is the
                     * number of iceCreamOrders that occurred between 12-1 on dateToGet,..., the last number in the
                     * list is the number of iceCreamOrders that occurred between 17-18 on the entered date.
                     * occurred on dateToGet and sets it as the value for "soldFromDate" (so it can be displayed).
                     * Then displays this number. Additionally, displays the date to get.
                     * @param dateToGet The specified date we want know the orders of iceCreams that occurred
                     * throughout it.
                     * @author George Black
                     */
                    function getYForOrder(dateToGet) {
                        let xhr = new XMLHttpRequest();
                        let url = '/getYForOrder';
                        xhr.open("POST", url, true);
                        xhr.setRequestHeader("Content-Type", "application/json");
                        xhr.send(dateToGet);
                        xhr.onreadystatechange = function () {
                            if (xhr.readyState == XMLHttpRequest.DONE) {
                                //get the list and update the y values of the order-graph to be the list returned
                                myChartOrders.data.datasets[0].data = JSON.parse(xhr.response);
                                myChartOrders.update();
                            }
                        }
                    }

                </script>
                <div id="datepicker2"></div>
                <p>Date:
                <div id="dateChosen"></div>

                <script>
                    //When the admin logs in, the current date is displayed before they make any changes to the
                    //date picker.
                    document.getElementById("dateChosen").innerHTML = getFormattedDate();
                </script>
                </p>

                <div class="stats" id="order_chosen_day">
                    <p>Total number of orders this day:</p>
                    <div id="soldFromDate"></div>

                    <script>
                        //When the admin logs in, the number of orders that have occurred on the current date is
                        //displayed.
                        document.getElementById("soldFromDate").innerHTML =
                        <%=statsInfo.getTotalOrdersFromDate(LocalDate.now())%>
                    </script>
                </div>
            </div>


            <div id="order_graph">
                <canvas id="myChart2"></canvas>
                <script>
                    //chart to display the orders of iceCreams that occurred throughout a given date.
                    var ctx = document.getElementById('myChart2');
                    var myChartOrders = new Chart(ctx, {
                        type: 'line',
                        data: {
                            labels: ['11:00 - 12:00', '12:00 - 13:00', '13:00 -14:00', '14:00 - 15:00',
                                '15:00 - 16:00', '16:00 - 17:00', '17:00 - 18:00'],
                            datasets: [{
                                label: 'Number of orders',
                                //Set to be the list that contains the current number of iceCreamOrders throughout
                                //the current day. This way when the admin logs in they automatically have the graph
                                //being displayed.
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
        </div>
    </section>

    <section id="flavours">
        <div class="stats" id="popular">
            <p>Our most popular flavour is:</p>
<%--            uses JSP to Get the iceCream flavor that has been purchased the most--%>
            <p><%=statsInfo.getMostPopularFlavor()%>
            </p>
        </div>

        <div id="flavour_graph">
            <canvas id="myChart"></canvas>
            <script>
                //bar graph to display the number of times each ice cream flavor has been purchased.
                var ctxOther = document.getElementById('myChart');
                var myChart = new Chart(ctxOther, {
                    type: 'bar',
                    data: {
                        labels: ['Vanilla', 'Dairy Free Vanilla', 'Honeycomb', 'Rum and Raisin', 'Mint', 'Cherry',
                            'Chocolate', 'Salted Caramel', 'Strawberry'],
                        datasets: [{
                            label: 'Ice creams sold',
                            //Gets a list where each value is the number of purchases there have been for an ice
                            //cream flavor. The first number relates to vanilla, the second dairy free vanilla, etc.
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