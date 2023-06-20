<%-- 
    Document   : dashboard.jsp
    Created on : 25 Apr, 2023, 11:40:00 PM
    Author     : Avik
--%>

<%@page import="beans.EmployeeBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="beans.CustomerBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html>

    <head>
        <meta charset="utf-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
              integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="asset/css/sidenav.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="icon" type="image/x-icon" href="asset/images/logo.png">
        <%
            HttpSession sess = request.getSession();
            Object obj = sess.getAttribute("id");
            String enterpriseId="";
            if (obj == null) {
                request.setAttribute("message", "You have to login first");
                request.getRequestDispatcher("emplogin.jsp").forward(request, response);
            } else {
                EmployeeBean eb = new EmployeeBean();
                enterpriseId = eb.getEnterpriseId(obj.toString());
            }
        %>
        <script src="asset/js/search.js"></script>
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <script type="text/javascript">
            google.charts.load('current', {'packages': ['corechart']});
            google.charts.setOnLoadCallback(drawChart);

            function drawChart() {
                var data = google.visualization.arrayToDataTable([
                    ['Revenue', 'Date'],
            <%  CustomerBean cb = new CustomerBean();
                ArrayList<CustomerBean> dataList = cb.getChartData(enterpriseId);
                for (CustomerBean data : dataList) {
            %>
                    ['<%= data.getDate()%>', <%= data.getCustTotalAmount()%>],
            <%
                }
            %>
                ]);

                var options = {
                    title: 'Last 7 Days Sales Report:'
                };

                var chart = new google.visualization.PieChart(document.getElementById('pie_chart'));
                chart.draw(data, options);
                var chart = new google.visualization.BarChart(document.getElementById('bar_chart'));
                chart.draw(data, options);
                var chart = new google.visualization.SteppedAreaChart(document.getElementById('chart_div'));
                chart.draw(data, options);
                var chart = new google.visualization.AreaChart(document.getElementById('area_chart'));
                chart.draw(data, options);
            }
        </script>
        <title>Dashboard</title>
    </head>

    <body style="background: linear-gradient(135deg, white, #f8cbf8da);">
        <nav class="navbar navbar-expand-xl navbar-light bg-dark sticky-top">
            <a href="#" data-target="#sidebar" data-toggle="collapse" aria-expanded="false"><i
                    class="fa fa-navicon fa-2x py-2 p-1"></i></a>
            <a class="navbar-brand text-light col-10" href="empdashboard.jsp"><img class="logo" src="asset/images/logo.png"></a>

            <span class="navbar-nav">
                <li class="nav-item dropdown">
                    <a href="" class="btn btn-primary dropdown-toggle" id="navbar-dropdown" role="button"
                       data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
                       style="background: linear-gradient(135deg, #ae85f1, #598eb6);">Actions</a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a href="http://localhost:8080/CustomerRelationshipManagement/Logout" class="dropdown-item">Log Out</a>
                    </div>
                </li>
            </span>

        </nav>
        <div class="container-fluid">
            <div class="row d-flex d-sm-block flex-nowrap wrapper">
                <div class="col-sm-2 float-left col-1 pl-0 pr-0 width" id="sidebar" class="sidebar">
                    <div class="list-group border-0 card text-center text-sm-left">
                        <a href="empdashboard.jsp" class="list-group-item d-inline-block" data-parent="#sidebar"><i
                                class="fa fa-dashboard"></i> <span class="d-none d-sm-inline"><b
                                    class="font">Dashboard</b></span> </a>
                        <a href="emplead.jsp" class="list-group-item d-inline-block" data-parent="#sidebar"><i class="fa fa-star"></i>
                            <span class="d-none d-sm-inline"><b class="font">Lead</b></span> </a>
                        <a href="empcustomer.jsp" class="list-group-item d-inline-block" data-parent="#sidebar"><i class="fa fa-user"></i>
                            <span class="d-none d-sm-inline"><b class="font">Customer</b></span></a>
                        <a href="empproduct.jsp" class="list-group-item d-inline-block" data-parent="#sidebar"><i
                                class="fa fa-cubes"></i> <span class="d-none d-sm-inline"><b
                                    class="font">Product</b></span></a>
                        <a href="empmail.jsp" class="list-group-item d-inline-block" data-parent="#sidebar"><i
                                class="fa fa-envelope"></i> <span class="d-none d-sm-inline"><b
                                    class="font">Mail</b></span></a>
                        <a href="empinvoice.jsp" class="list-group-item d-inline-block" data-parent="#sidebar"><i class="fa fa-file"></i>
                            <span class="d-none d-sm-inline"><b class="font">Invoice</b></span></a>
                        <a href="task.jsp" class="list-group-item d-inline-block" data-parent="#sidebar"><i
                                class="fa fa-calendar"></i> <span class="d-none d-sm-inline"><b
                                    class="font">Tasks</b></span></a>

                    </div>
                </div>

                <main class="col-sm-10 col px-5 pl-sm-2 pt-2 main mx-auto">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2><em><b>Dashboard</b></em></h2>
                        </div>
                    </div>
                    <hr>
                    <div class="row">
                        <div class="col-sm-6">
                            <div id="pie_chart" style="height:300px;width:550px"> </div>
                        </div>
                        <div class="col-sm-6">
                            <div id="area_chart" style="height:300px;width:550px" ></div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6">
                            <div id="chart_div" style="height:250px;width:550px" ></div>    
                        </div>
                    
                        <div class="col-sm-6">
                            <div id="bar_chart" style="height:250px;width:550px" ></div>    
                        </div>
                    </div>
            </div>
        </main>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"
        integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh"
crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"
        integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ"
crossorigin="anonymous"></script>
</body>

</html>
