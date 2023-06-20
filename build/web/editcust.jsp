<%-- 
    Document   : editcust
    Created on : 5 May, 2023, 12:53:11 PM
    Author     : Ananya
--%>

<%@page import="beans.CustomerBean"%>
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
        <title>Update Customer Details</title>
    </head>

    <body class="body">
        <%
            HttpSession sess = request.getSession();
            Object obj = sess.getAttribute("id");
            if (obj == null) {
                request.setAttribute("message", "You have to login first!");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
            String id = request.getParameter("contact");
            CustomerBean cb = new CustomerBean();
            CustomerBean customers = cb.search(id);
        %>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>

        <div class="container">
            <div class="title">Customer Details</div>
            <form action="http://localhost:8080/CustomerRelationshipManagement/UpdateCustomer" method="POST">

                <div class="row g-2">
                    <div class="col-md">
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="floatingInputName" name="name" value="<%=customers.getCustName()%>" placeholder="Customer Name" required>
                            <label for="floatingInputName">Customer Name</label>
                        </div>
                    </div>
                </div>
                <div class="row g-2">
                    <div class="col-md">
                        <div class="form-floating mb-3">
                            <input type="email" class="form-control" id="floatingInputEmail" name="email" value="<%=customers.getCustEmail()%>" placeholder="name@example.com" required>
                            <label for="floatingInputEmail">Email</label>
                        </div>
                    </div>
                    <div class="col-md">
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="floatingInputMobileNo" name="contact" value="<%=customers.getCustContact()%>" placeholder="[0-9]{10}"
                                   pattern="[0-9]{10}" readonly>
                            <label for="floatingInputMobileNo">Mobile Number</label>
                        </div>
                    </div>
                </div>

                <div class="form-floating mb-3">
                    <input type="text" class="form-control" id="floatingInputItems" name="items" value="<%=customers.getCustItemPurchased()%>" placeholder="Item Purchesed" required>
                    <label for="floatingInputItems">Item Purchesed</label>

                </div>
                <div class="row g-2">
                    <div class="col-md">
                        <div class="form-floating">
                            <input type="number" class="form-control" id="floatingInputTotal" name="totalitems" value="<%=customers.getCustTotalItems()%>" placeholder="Total Items" required>
                            <label for="floatingInputTotal">Total Items</label>
                        </div>
                    </div>

                    <div class="col-md">
                        <div class="form-floating">
                            <input type="number" class="form-control" id="floatingInputAmount" name="amount" value="<%=customers.getCustTotalAmount()%>" placeholder="Total Amount" required>
                            <label for="floatingPasswordAmount">Total Amount(<span>&#8377;</span>)
                            </label>
                        </div>
                    </div>
                    <div class="col-md">
                        <div class="form-floating mb-3">
                            <input type="date" class="form-control" id="floatingInputDate" name="date" value="<%=customers.getDate()%>" placeholder="Date" required>
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
                    <a href="customer.jsp" type="button" class="btn btn-danger">Cancel</a>
                </div>
                <div class="d-grid gap-2 d-md-flex justify-content-md-end" style="float:right">
                    <button type="submit" class="btn btn-success">Update</button>
                    <button type="reset" class="btn btn-info">Reset</button>
                </div>
            </form>
    </body>

</html>
