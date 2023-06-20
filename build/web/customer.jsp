<%-- 
    Document   : customer
    Created on : 30 Apr, 2023, 12:29:08 AM
    Author     : Ananya
--%>

<%@page import="beans.EnterpriseBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="beans.EmployeeBean"%>
<%@page import="beans.CustomerBean"%>
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
        <script src="asset/js/searchCustomer.js"></script>
        <title>Customer</title>
    </head>

    <body style="background: linear-gradient(135deg, white, #f8cbf8da) ;">
        <%
            HttpSession sess = request.getSession();
            String id = sess.getAttribute("id").toString();
            EnterpriseBean eb = new EnterpriseBean().show(id);
            
            
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
                            <h2><em><b>Customer</b></em></h2>
                        </div>
                    </div>
                    <hr>
                    <div class="row">
                        <div class="col-sm-6">
                            <input type="text" id="Input" onkeyup="searchCustomer()" placeholder="Search by Contact No..">
                        </div>
                        <div class="col-sm-6">
                            <a href="addcust.jsp" class="btn btn-success">Add New Customer</a>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12" style="max-height:500px;overflow-y:scroll;">
                            <table id="Table">
                                <tr class="header">
                                    <th>Customer Name</th>
                                    <th>Email</th>
                                    <th>Mobile No.</th>
                                    <th>Item Purchased</th>
                                    <th>Total Items</th>
                                    <th>Total Amount</th>
                                    <th>Date</th>
                                    <th colspan="2">Operations</th>
                                </tr>
                                <%
                                    CustomerBean cb = new CustomerBean();
                                    ArrayList<CustomerBean> arr = cb.show(id);
                                    for(CustomerBean customer: arr){
                                %>
                                <tr>
                                    <td><%=customer.getCustName()%></td>
                                    <td><%=customer.getCustEmail()%></td>
                                    <td><%=customer.getCustContact()%></td>
                                    <td><%=customer.getCustItemPurchased()%></td>
                                    <td><%=customer.getCustTotalItems()%></td>
                                    <td><%=customer.getCustTotalAmount()%></td>
                                    <td><%=customer.getDate()%></td>
                                    <td style="border:0px"><a href="editcust.jsp?contact=<%=customer.getCustContact()%>" class="btn btn-primary">Edit</a></td>
                                    <td style="border:0px"><a href="http://localhost:8080/CustomerRelationshipManagement/DeleteCustomer?contact=<%=customer.getCustContact()%>" class="btn btn-danger" onclick="
                                                              return confirm('are you sure? This will delete the entire data row')">Delete</a></td>
                                </tr>
                                <%}%>
                            </table>
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
