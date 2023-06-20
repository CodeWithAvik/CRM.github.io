<%-- 
    Document   : assign
    Created on : 11 May, 2023, 11:45:02 AM
    Author     : Devanjana Ghosh
--%>

<%@page import="beans.TaskBean"%>
<%@page import="beans.EmployeeBean"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html>
    <head>
        <meta charset="utf-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="asset/css/Email_CSS.css">
        <link rel="stylesheet" href="asset/css/sidenav.css">
        <link rel="icon" type="image/x-icon" href="asset/images/logo.png">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>Tasks</title>
    </head>

    <body style="background: linear-gradient(135deg, white, #f8cbf8da) ;">
        <%  
            HttpSession sess = request.getSession();
            Object obj = sess.getAttribute("id");
            String entId = "";
            if (obj == null) {
                request.setAttribute("message", "You have to login first");
                request.getRequestDispatcher("emplogin.jsp").forward(request, response);
            }
            else{
                EmployeeBean eb = new EmployeeBean();
                entId = eb.getEnterpriseId(obj.toString());
            }
        %>

        <nav class="navbar navbar-expand-xl navbar-light bg-dark sticky-top">
            <a  href="#" data-target="#sidebar" data-toggle="collapse" aria-expanded="false"><i class="fa fa-navicon fa-2x py-2 p-1"></i></a>
          <a class="navbar-brand text-light col-10" href="empdashboard.jsp"><img class="logo" src="asset/images/logo.png"></a>
            <span class="navbar-nav">
                <li class="nav-item dropdown">
                    <a href="" class="btn btn-primary dropdown-toggle" id="navbar-dropdown" role="button" data-toggle="dropdown" 
                       style="background: linear-gradient(135deg, #ae85f1, #598eb6);" aria-haspopup="true" aria-expanded="false">Actions</a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a href="http://localhost:8080/CustomerRelationshipManagement/Logout" class="dropdown-item">Log Out</a>
                    </div>
                </li>
            </span>
        </nav>
        <div class="container-fluid">
            <div class="row d-flex d-sm-block flex-nowrap wrapper">
                <div class="col-sm-2 float-left col-1 pl-0 pr-0 width" id="sidebar">
                    <div class="list-group border-0 card text-center text-sm-left">
                        <a href="empdashboard.jsp" class="list-group-item d-inline-block" data-parent="#sidebar"><i class="fa fa-dashboard"></i> <span class="d-none d-sm-inline"><b class="font">Dashboard</b></span> </a>
                        <a href="emplead.jsp" class="list-group-item d-inline-block" data-parent="#sidebar"><i class="fa fa-star"></i> <span class="d-none d-sm-inline"><b class="font">Lead</b></span> </a>
                        <a href="empcustomer.jsp" class="list-group-item d-inline-block" data-parent="#sidebar"><i class="fa fa-user"></i> <span class="d-none d-sm-inline"><b class="font">Customer</b></span></a>
                        <a href="empproduct.jsp" class="list-group-item d-inline-block" data-parent="#sidebar"><i class="fa fa-cubes"></i> <span class="d-none d-sm-inline"><b class="font">Product</b></span></a>
                        <a href="empmail.jsp" class="list-group-item d-inline-block" data-parent="#sidebar"><i class="fa fa-envelope"></i> <span class="d-none d-sm-inline"><b class="font">Mail</b></span></a>
                        <a href="empinvoice.jsp" class="list-group-item d-inline-block" data-parent="#sidebar"><i class="fa fa-file"></i> <span class="d-none d-sm-inline"><b class="font">Invoice</b></span></a>
                        <a href="task.jsp" class="list-group-item d-inline-block" data-parent="#sidebar"><i class="fa fa-calendar"></i> <span class="d-none d-sm-inline"><b class="font">Tasks</b></span></a>
                    </div>
                </div>

                <div class="container" style="height:450px;">
                    <div class="title">Tasks</div>
                    &nbsp;
                    <h6 style="color:green;"><em>${requestScope.message}</em></h6>
                    <form action="http://localhost:8080/CustomerRelationshipManagement/ManageTasks" method="POST">
                        <%
                            TaskBean tb = new TaskBean();
                            ArrayList<HashMap> tasks = tb.getTasks(obj.toString(),entId);
                            for(HashMap<String,String> task: tasks){
                        %>
                        <div class="mb-3 row">
                            <div class="col-sm-8">
                                <div style="float:left;margin-right:4em">
                                    <input class="form-control" type="checkbox" id="task" name="tasks" value="<%=task.get("task")%>">
                                </div>
                                <div style="float:left">
                                    <label for="task"><%=task.get("task")%></label><br>
                                </div>
                            </div>
                        </div>
                        <%}%>
                        <div class="d-grid gap-2 d-md-flex justify-content-md-end"> 
                            <label>
                                <button type="submit" class="btn btn-success">Done</button> 
                            </label>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>
    </body>
</html>
