<%-- 
    Document   : recovery
    Created on : 9 Apr, 2023, 10:22:52 PM
    Author     : ayanp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="asset/css/recovery.css">
        <link rel="icon" type="image/x-icon" href="asset/images/logo.png">
        <title>Account Recovery</title>
    </head>

    <body class="body">
        <div class="form">
            <form action="http://localhost:8080/CustomerRelationshipManagement/Recovery" method="POST">
                <h2>Account Recovery</h2>
                <span><b><i>*Step 1</i></b></span>
                <h4 style="color:red;font-style:italic;font-size:100%">${requestScope.message}</h4>

                <div class="imgcontainer">
                    <img src="asset/images/password.png" class="avatar">
                </div>
                <div class="form-group">
                    <label for="exampleInputEmail1"><strong>Enter your registered email address...</strong></label>
                    <input type="email" class="form-control" id="exampleInputEmail1" name="email" aria-describedby="emailHelp"
                           placeholder="Enter email" required>
                </div>
                <a href="index.jsp" class="btn btn-danger">Cancel</a>
                <button type="submit" class="btn btn-primary" style="float: right">Submit</button>
            </form>
        </div>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
                integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js"
                integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js"
                integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
    </body>

</html>
