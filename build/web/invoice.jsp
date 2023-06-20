<%-- 
    Document   : invoice
    Created on : 9 May, 2023, 12:02:15 PM
    Author     : Avik
--%>

<%@page import="beans.EnterpriseBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html>

    <head>
        <meta charset="utf-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
              integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

        <link rel="stylesheet" href="asset/css/sidenav.css">
        <link rel="stylesheet" href="asset/css/table.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="icon" type="image/x-icon" href="asset/images/logo.png">
        <script src="asset/js/search.js"></script>
        <style type="text/css">
            label.bold{
                font-weight:bolder;
            }
        </style>
        <title>Invoice</title>
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
            <a href="#" data-target="#sidebar" data-toggle="collapse" aria-expanded="false"><i
                    class="fa fa-navicon fa-2x py-2 p-1"></i></a>
            <a class="navbar-brand text-light col-10" href="dashboard.jsp"><img class="logo" src="asset/images/logo.png"></a>

            <span class="navbar-nav">
                <li class="nav-item dropdown">
                    <span style="color:white"><b><i><%=eb.getCompany_name()%></i></b></span>
                    <a href="" class="btn btn-primary dropdown-toggle" id="navbar-dropdown" role="button"
                       data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" 
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
                <div class="col-sm-2 float-left col-1 pl-0 pr-0 width" id="sidebar" class="sidebar">
                    <div class="list-group border-0 card text-center text-sm-left">
                        <a href="dashboard.jsp" class="list-group-item d-inline-block" data-parent="#sidebar"><i
                                class="fa fa-dashboard"></i> <span class="d-none d-sm-inline"><b
                                    class="font">Dashboard</b></span> </a>
                        <a href="lead.jsp" class="list-group-item d-inline-block" data-parent="#sidebar"><i class="fa fa-star"></i>
                            <span class="d-none d-sm-inline"><b class="font">Lead</b></span> </a>
                        <a href="customer.jsp" class="list-group-item d-inline-block" data-parent="#sidebar"><i class="fa fa-user"></i>
                            <span class="d-none d-sm-inline"><b class="font">Customer</b></span></a>
                        <a href="product.jsp" class="list-group-item d-inline-block" data-parent="#sidebar"><i
                                class="fa fa-cubes"></i> <span class="d-none d-sm-inline"><b
                                    class="font">Product</b></span></a>
                        <a href="mail.jsp" class="list-group-item d-inline-block" data-parent="#sidebar"><i
                                class="fa fa-envelope"></i> <span class="d-none d-sm-inline"><b
                                    class="font">Mail</b></span></a>
                        <a href="invoice.jsp" class="list-group-item d-inline-block" data-parent="#sidebar"><i class="fa fa-file"></i>
                            <span class="d-none d-sm-inline"><b class="font">Invoice</b></span></a>
                        <a href="assign.jsp" class="list-group-item d-inline-block" data-parent="#sidebar"><i
                                class="fa fa-calendar"></i> <span class="d-none d-sm-inline"><b
                                    class="font">Tasks</b></span></a>
                        <a href="employee.jsp" class="list-group-item d-inline-block collapsed" data-parent="#sidebar"><i
                                class="fa fa-gear"></i> <span class="d-none d-md-inline"><b class="font">Manage
                                    Employees</b></span></a>
                    </div>
                </div>

                <main class="col-sm-10 col px-5 pl-sm-2 pt-2 main mx-auto">   
                    <div class="row">
                        <div class="col-sm-6">
                            <h2><em><b>Invoice</b></em></h2>
                        </div>
                    </div>
                    <hr>
                    <div class="row">
                        <div class="col-sm-10" >
                            <form action="http://localhost:8080/CustomerRelationshipManagement/Invoice" method="POST">

                                <div class="form-group">
                                    <label for="name" class="bold">Name<span style="color:red;font-size:15px;">&#42;</span></label>
                                    <input type="name" class="form-control" name="name" placeholder="Enter Name" required>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <label for="ph_no." class="bold">Phone No.<span style="color:red;font-size:15px;">&#42;</span></label>
                                        <input type="text" class="form-control" name="contact" placeholder="Phone No." required>
                                    </div>
                                    <div class="col">
                                        <label for="ph_no." class="bold">Email Address<span style="color:red;font-size:15px;">&#42;</span></label>
                                        <input type="email" class="form-control " name="email" placeholder="Email Address" required>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <label for="item_p" class="bold">Item Purchased<span style="color:red;font-size:15px;">&#42;</span></label>
                                        <input type="text" class="form-control" name="items" placeholder="Item Purchased" required>
                                    </div>
                                    <div class="col">
                                        <label for="item" class="bold">Total Items<span style="color:red;font-size:15px;">&#42;</span></label>
                                        <input type="text" class="form-control" name="totalitems" placeholder="Total Items" required>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <label for="gst" class="bold">GST Tax.(%)<span style="color:red;font-size:15px;">&#42;</span></label>
                                        <input type="number" class="form-control" name="tax" placeholder="GST Tax." required>
                                    </div>
                                    <div class="col">
                                        <label for="amout" class="bold">Amount (<span style='font-size:15px;'>&#8377;</span>)<span style="color:red;font-size:15px;">&#42;</span></label>
                                        <input type="number" class="form-control" name="amount" placeholder="Amount" required>
                                    </div>
                                </div>
                                <div class="row">

                                    <div class="col-6">
                                        <label for="pm" class="bold">Payment Method</label><span style="color:red;font-size:15px;">&#42;</span>
                                        <select class="form-control" aria-label="Payment Method" name="paymentmethod" required>
                                            <option selected>-- Select Payment Method --</option>
                                            <option value="UPI">UPI</option>
                                            <option value="Debit Card">Debit Card</option>
                                            <option value="Credit Card">Credit Card</option>
                                            <option value="Net Banking">Net Banking</option>
                                            <option value="Cash">Cash</option>
                                        </select>
                                    </div>
                                    <div class="col-6">
                                        <label for="date" class="bold">Date</label><span style="color:red;font-size:15px;">&#42;</span>
                                        <input type="date" class="form-control" name="date" placeholder="date" required> 
                                    </div>
                                </div>

                                &nbsp;
                                <div class="d-grid gap-2 d-md-flex justify-content-md-end"> 
                                    <label>
                                        <button type="reset" class="btn btn-danger">Reset</button>
                                        <button type="submit" class="btn btn-info">Generate Invoice</button> 
                                    </label>
                                </div>
                            </form>
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
