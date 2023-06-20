<%-- 
    Document   : mail
    Created on : 26 Apr, 2023, 12:35:08 AM
    Author     : Devanjana Ghosh
--%>

<%@page import="beans.EnterpriseBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html>
    <head>
        <meta charset="utf-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="asset/css/Email_CSS.css">
        <link rel="stylesheet" href="asset/css/sidenav.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="icon" type="image/x-icon" href="asset/images/logo.png">
        <title>Email</title>
    </head>

    <body style="background: linear-gradient(135deg, white, #f8cbf8da) ;">
        
        <%
            HttpSession sess = request.getSession();
            Object obj = sess.getAttribute("id");
            if (obj == null) {
                request.setAttribute("message", "You have to login first");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
            EnterpriseBean eb = new EnterpriseBean().show(obj.toString());
        %>

        <nav class="navbar navbar-expand-xl navbar-light bg-dark sticky-top">
            <a  href="#" data-target="#sidebar" data-toggle="collapse" aria-expanded="false"><i class="fa fa-navicon fa-2x py-2 p-1"></i></a>
            <a class="navbar-brand text-light col-10" href="dashboard.jsp"><img class="logo" src="asset/images/logo.png"></a>
            <span class="navbar-nav">
                <li class="nav-item dropdown">
                    <span style="color:white"><b><i><%=eb.getCompany_name()%></i></b></span>
                    <a href="" class="btn btn-primary dropdown-toggle" id="navbar-dropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
                       style="background: linear-gradient(135deg, #ae85f1, #598eb6);">Actions</a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a href="profile.jsp" class="dropdown-item">Profile</a>
                        <div class="dropdown-divider"></div>
                        <a href="http://localhost:8080/CustomerRelationshipManagement/Logout" class="dropdown-item">Log Out</a>
                    </div>
                </li>
            </span>
        </nav>
        <div class="container-fluid">
            <div class="row d-flex d-sm-block flex-nowrap wrapper">
                <div class="col-sm-2 float-left col-1 pl-0 pr-0 width" id="sidebar">
                    <div class="list-group border-0 card text-center text-sm-left">
                        <a href="dashboard.jsp" class="list-group-item d-inline-block" data-parent="#sidebar"><i class="fa fa-dashboard"></i> <span class="d-none d-sm-inline"><b class="font">Dashboard</b></span> </a>
                        <a href="lead.jsp" class="list-group-item d-inline-block" data-parent="#sidebar"><i class="fa fa-star"></i> <span class="d-none d-sm-inline"><b class="font">Lead</b></span> </a>
                        <a href="customer.jsp" class="list-group-item d-inline-block" data-parent="#sidebar"><i class="fa fa-user"></i> <span class="d-none d-sm-inline"><b class="font">Customer</b></span></a>
                        <a href="product.jsp" class="list-group-item d-inline-block" data-parent="#sidebar"><i class="fa fa-cubes"></i> <span class="d-none d-sm-inline"><b class="font">Product</b></span></a>
                        <a href="mail.jsp" class="list-group-item d-inline-block" data-parent="#sidebar"><i class="fa fa-envelope"></i> <span class="d-none d-sm-inline"><b class="font">Mail</b></span></a>
                        <a href="invoice.jsp" class="list-group-item d-inline-block" data-parent="#sidebar"><i class="fa fa-file"></i> <span class="d-none d-sm-inline"><b class="font">Invoice</b></span></a>
                        <a href="assign.jsp" class="list-group-item d-inline-block" data-parent="#sidebar"><i class="fa fa-calendar"></i> <span class="d-none d-sm-inline"><b class="font">Tasks</b></span></a>
                        <a href="employee.jsp" class="list-group-item d-inline-block collapsed" data-parent="#sidebar"><i class="fa fa-gear"></i> <span class="d-none d-md-inline"><b class="font">Manage Employees</b></span></a>
                    </div>
                </div>

                <div class="container" style="height:550px">
                    <div class="title">Email</div>
                    &nbsp;
                    <form action="http://localhost:8080/CustomerRelationshipManagement/Mail" method="POST">
                         <h4 style="color:green;font-style:italic;font-size:100%"><b>${requestScope.message}</b></h4>
                        <div class="mb-3 row">
                            <label class="col-sm-2 col-form-label" style="font-size: 24px; font-family: 'Times New Roman', Times, serif;"><b>To</b></label>
                            <div class="col-sm-10">
                                <input class="form-control" type="email" name="to" aria-label="default input example" required>
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <label class="col-sm-2 col-form-label" style="font-size: 20px; font-family: 'Times New Roman', Times, serif;"><b>Subject</b></label>
                            <div class="col-sm-10">
                                <input class="form-control form-control-lg" type="text" name="sub" aria-label=".form-control-lg example" required>
                            </div>
                        </div>
                        <div class="form-floating">
                            <label for="floatingTextarea2" style="font-size: 20px; font-family: 'Times New Roman', Times, serif;"><b>Comments</b></label>
                            <textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea2" name="cont" style="height: 100px"></textarea required>
                        </div> 
                        &nbsp;
                        <div class="d-grid gap-2 d-md-flex justify-content-md-end"> 
                            <label>
                                <button type="reset" class="btn btn-danger">Discard</button>
                                <button type="submit" class="btn btn-success">Send</button> 
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
