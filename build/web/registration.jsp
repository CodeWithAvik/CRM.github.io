<%-- 
    Document   : registration
    Created on : 10 Mar, 2023, 1:35:22 AM
    Author     : Devanjana Ghosh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="asset/css/registration.css">
        <link rel="icon" type="image/x-icon" href="asset/images/logo.png">
        <title>Registration</title>
    </head>
    <body class="body">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <div class="container">
            <div class="title">Registration</div>
            <form action="http://localhost:8080/CustomerRelationshipManagement/Register" method="post">
                 <h4 style="color:red;font-style:italic;font-size:100%"><b>${requestScope.message}</b></h4>
                <div class="form-floating mb-3">
                    <input type="text" class="form-control" id="floatingInput" name="cname" placeholder="Company Name" required>
                    <label for="floatingInput">Company Name</label>
                </div>

                <div class="row g-2">
                    <div class="col-md">
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="floatingInput" name="ctype" placeholder="Company Type" required>
                            <label for="floatingInput">Company Type</label>
                        </div>
                    </div>
                    <div class="col-md">
                        <div class="form-floating mb-3">
                            <input type="number" class="form-control" id="floatingInput" name="totalemp"  placeholder="Employees" required>
                            <label for="floatingInput">No. Of Employees</label>
                        </div>
                    </div>
                </div>

                <div class="row g-2">
                    <div class="col-md">
                        <div class="form-floating mb-3">
                            <input type="email" class="form-control" id="floatingInput" name="email" placeholder="name@example.com" required>
                            <label for="floatingInput">Email address</label>
                        </div>
                    </div>
                    <div class="col-md">
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="floatingInput" name="contact" placeholder="[0-9]{10}" pattern="[0-9]{10}" required>
                            <label for="floatingInput">Contact Number</label>
                        </div>
                    </div>
                </div>

                <div class="row g-2">
                    <div class="col-md">
                        <div class="form-floating">
                            <select class="form-select" aria-label="Default select example" id="city" name="city" required>
                                <option selected>-- Select City --</option>
                                <option value="Mumbai">Mumbai</option>
                                <option value="Delhi">Delhi</option>
                                <option value="Bengaluru">Bengaluru</option>
                                <option value="Kolkata">Kolkata</option>
                                <option value="Chennai">Chennai</option>
                                <option value="Hyderabad">Hyderabad</option>
                                <option value="Ahmedabad">Ahmedabad</option>
                                <option value="Pune">Pune</option>
                                <option value="Jaipur">Jaipur</option>
                                <option value="Lucknow">Lucknow</option>
                                <option value="Nagpur">Nagpur</option>
                                <option value="Surat">Surat</option>
                                <option value="Visakhapatnam">Visakhapatnam</option>
                                <option value="Thane">Thane</option>
                                <option value="Bhopal">Bhopal</option>
                                <option value="Ludhiana">Ludhiana</option>
                                <option value="Agra">Agra</option>
                                <option value="Nashik">Nashik</option>
                                <option value="Patna">Patna</option>
                                <option value="Vadodara">Vadodara</option>
                                <option value="Ghaziabad">Ghaziabad</option>
                                <option value="Faridabad">Faridabad</option>
                                <option value="Rajkot">Rajkot</option>
                                <option value="Meerut">Meerut</option>
                            </select>
                        </div>
                    </div>

                    <div class="col-md">
                        <div class="form-floating">
                            <select class="form-select" aria-label="Default select example" id="state" name="state" required>
                                <option selected>-- Select State --</option>
                                <option value="Andhra Pradesh">Andhra Pradesh</option>
                                <option value="Arunachal Pradesh">Arunachal Pradesh</option>
                                <option value="Assam">Assam</option>
                                <option value="Bihar">Bihar</option>
                                <option value="Chhattisgarh">Chhattisgarh</option>
                                <option value="Delhi">Delhi</option>
                                <option value="Goa">Goa</option>
                                <option value="Gujarat">Gujarat</option>
                                <option value="Haryana">Haryana</option>
                                <option value="Himachal Pradesh">Himachal Pradesh</option>
                                <option value="Jharkhand">Jharkhand</option>
                                <option value="Karnataka">Karnataka</option>
                                <option value="Kerala">Kerala</option>
                                <option value="Madhya Pradesh">Madhya Pradesh</option>
                                <option value="Maharashtra">Maharashtra</option>
                                <option value="Manipur">Manipur</option>
                                <option value="Meghalaya">Meghalaya</option>
                                <option value="Mizoram">Mizoram</option>
                                <option value="Nagaland">Nagaland</option>
                                <option value="Odisha">Odisha</option>
                                <option value="Punjab">Punjab</option>
                                <option value="Rajasthan">Rajasthan</option>
                                <option value="Sikkim">Sikkim</option>
                                <option value="Tamil Nadu">Tamil Nadu</option>
                                <option value="Telangana">Telangana</option>
                                <option value="Tripura">Tripura</option>
                                <option value="Uttar Pradesh">Uttar Pradesh</option>
                                <option value="Uttarakhand">Uttarakhand</option>
                                <option value="West Bengal">West Bengal</option>
                            </select>
                        </div>
                    </div>
                </div>

                &nbsp;

                <div class="form-floating mb-3">
                    <input type="text" class="form-control" id="floatingInput" placeholder="Enter address" name="address" required>
                    <label for="floatingInput">Enter address</label>
                </div>

                <div class="row g-2">
                    <div class="col-md">
                        <div class="form-floating">
                            <input type="password" class="form-control" id="floatingPassword" name="password" placeholder="Password" required>
                            <label for="floatingPassword">Password</label>
                        </div>
                    </div>
                    <div class="col-md">
                        <div class="form-floating">
                            <input type="text" class="form-control" id="floatingConfirmPassword" placeholder="Confirm Password" required>
                            <label for="floatingPassword">Confirm Password</label>
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
                <div class="d-grid gap-2 d-md-flex justify-content-md-start" style="float:left;"> 
                    <a href="index.jsp" type="button" class="btn btn-danger">Back</a>
                </div>
                <div class="d-grid gap-2 d-md-flex justify-content-md-end" style="float:right;"> 
                    <button type="submit" class="btn btn-success" onclick="validatePassword(), validPlace()">Register</button> 
                    <a href="login.jsp" type="button" class="btn btn-primary">Login</a>
                    <button type="reset" class="btn btn-info">Reset</button>
                </div>
            </form>
            <script src="asset/js/password.js"></script>
        </div>
    </body>
</html>
