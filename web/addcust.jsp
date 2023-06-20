<%-- 
    Document   : addcust
    Created on : 30 Apr, 2023, 12:46:00 AM
    Author     : Ananya
--%>

<%@page import="beans.EmployeeBean"%>
<%@page import="beans.EnterpriseBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="asset/css/add.css">
        <link rel="icon" type="image/x-icon" href="asset/images/logo.png">
        <title>Add Customer</title>
    </head>

    <body class="body">
        <%
            EnterpriseBean eb = new EnterpriseBean();
            EmployeeBean emb = new EmployeeBean();
            HttpSession sess = request.getSession();
            String id = sess.getAttribute("id").toString();
            String path="";
            if (eb.ifExist(id)) {
                path = "customer.jsp";
            }
            else if(emb.ifExist(id)){
                path = "empcustomer.jsp";
            }
        %>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>

        <div class="container">
            <div class="title">Customer Details</div>
            <form action="http://localhost:8080/CustomerRelationshipManagement/AddCustomer" method="POST">

                <div class="row g-2">
                    <div class="col-md">
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="floatingInputName" name="name" placeholder="Customer Name" required>
                            <label for="floatingInputName">Customer Name</label>
                        </div>
                    </div>
                </div>
                <div class="row g-2">
                    <div class="col-md">
                        <div class="form-floating mb-3">
                            <input type="email" class="form-control" id="floatingInputEmail" name="email" placeholder="name@example.com" required>
                            <label for="floatingInputEmail">Email</label>
                        </div>
                    </div>
                    <div class="col-md">
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="floatingInputMobileNo" name="contact" placeholder="[0-9]{10}"
                                   pattern="[0-9]{10}" required>
                            <label for="floatingInputMobileNo">Mobile Number</label>
                        </div>
                    </div>
                </div>

                <div class="form-floating mb-3">
                    <input type="text" class="form-control" id="floatingInputItems" name="items" placeholder="Item Purchesed" required>
                    <label for="floatingInputItems">Item Purchesed</label>

                </div>
                <div class="row g-2">
                    <div class="col-md">
                        <div class="form-floating">
                            <input type="number" class="form-control" id="floatingInputTotal" name="totalitems" placeholder="Total Items" required>
                            <label for="floatingInputTotal">Total Items</label>
                        </div>
                    </div>

                    <div class="col-md">
                        <div class="form-floating">
                            <input type="number" class="form-control" id="floatingInputAmount" name="amount" placeholder="Total Amount" required>
                            <label for="floatingPasswordAmount">Total Amount(<span>&#8377;</span>)
                            </label>
                        </div>
                    </div>
                    <div class="col-md">
                        <div class="form-floating mb-3">
                            <input type="date" class="form-control" id="floatingInputDate" name="date" placeholder="Date" required>
                            <label for="floatingInputDate">Date</label>
                        </div>
                    </div>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" required>
                    <label class="form-check-label" for="flexCheckDefault">
                        I hereby confirm that the above information is true
                    </label>
                </div>
                &nbsp;
                <div class="d-grid gap-2 d-md-flex justify-content-md-end" style="float:left">
                    <a href="<%out.print(path);%>" type="button" class="btn btn-primary">Done</a>
                </div>
                <div class="d-grid gap-2 d-md-flex justify-content-md-end" style="float:right">
                    <button type="submit" class="btn btn-success">Add</button>
                    <button type="reset" class="btn btn-info">Reset</button>
                </div>
            </form>
    </body>

</html>
