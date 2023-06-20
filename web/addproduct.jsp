<%-- 
    Document   : addproduct
    Created on : 30 Apr, 2023, 1:16:45 AM
    Author     : Avik
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
        <title>Add Product</title>
    </head>

    <body class="body">
        <%
            EnterpriseBean eb = new EnterpriseBean();
            EmployeeBean emb = new EmployeeBean();
            HttpSession sess = request.getSession();
            String id = sess.getAttribute("id").toString();
            String path = "";
            if (eb.ifExist(id)) {
                path = "product.jsp";
            } else if (emb.ifExist(id)) {
                path = "empproduct.jsp";
            }
        %>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>

        <div class="container">
            <div class="title">Product Details</div>
            <form action="http://localhost:8080/CustomerRelationshipManagement/AddProduct" method="POST">
                <h4 style="color:red;font-style:italic;font-size:100%"><b>${requestScope.message}</b></h4>
                <div class="row g-2">
                    <div class="col-md">
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="floatingInputId" name="pid" placeholder="Product ID" required>
                            <label for="floatingInputId">Product ID</label>
                        </div>
                    </div>
                    <div class="col-md">
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="floatingInputName" name="pname" placeholder="Product" required>
                            <label for="floatingInputName">Product Name</label>
                        </div>
                    </div>
                </div>

                <div class="form-floating mb-3">
                    <input type="text" class="form-control" id="floatingInputCategory" name="category" placeholder="Product Category/Type" required>
                    <label for="floatingInputCategory">Product Category/Type</label>
                </div>

                <div class="form-floating mb-3">
                    <input type="date" class="form-control" id="floatingInputExp" name="expdate" placeholder="Exp Date(if any)">
                    <label for="floatingInputExp">Exp Date(if any)</label>
                </div>

                <div class="form-floating mb-3">
                    <input type="text" class="form-control" id="floatingInputPrice" name="price" placeholder="Price" required>
                    <label for="floatingInputPrice">Price(<span>&#8377;</span>)</label>

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
