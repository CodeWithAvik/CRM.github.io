<%-- 
    Document   : login
    Created on : 10 Mar, 2023, 1:34:48 AM
    Author     : ayanp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="asset/css/login.css">
    <link rel="icon" type="image/x-icon" href="asset/images/logo.png">
    <title>Login</title>
  </head>
  <body class="body">
    <div class="container">
      <div class="title">Login</div>
      <form action="http://localhost:8080/CustomerRelationshipManagement/Login" method="post">
          <h4 style="color:red;font-style:italic;font-size:100%"><b>${requestScope.message}</b></h4>
        <div class="main">
        <div class="imgcontainer">
            <img src="https://cdn-icons-png.flaticon.com/512/5087/5087579.png" alt="Avatar" class="avatar">
        </div>
        <div class="container">
          <label for="uname"><b>Email</b></label>
          <input type="text" placeholder="Enter Email" name="email" required>
          <label for="psw"><b>Password</b></label>
          <input type="password" placeholder="Enter Password" name="psw" required>
          <button type="submit" class="btn-primary">Login</button>
          <label>
            <input type="checkbox" checked="checked" name="remember"> Remember me
          </label>
          <span class="psw"><a href="recovery.jsp">Forgot password?</a></span>
        </div>
        <div class="container" >
            <a href="index.jsp"><button type="button" class="cancelbtn">Cancel Login</button></a>
          <span class="bt">Don't have an account?<a href="registration.jsp" class="btn btn-success">Register</a></span>
        </div>
        </div>
      </form>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
  </body>
</html>