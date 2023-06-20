<%-- 
    Document   : profile
    Created on : 26 Apr, 2023, 12:02:43 AM
    Author     : Devanjana Ghosh
--%>

<%@page import="beans.EnterpriseBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="asset/css/profile.css">
        <link rel="icon" type="image/x-icon" href="asset/images/logo.png">
        <title>Profile</title>
    </head>
    <body class="body">

        <%
            HttpSession sess = request.getSession();
            EnterpriseBean eb = new EnterpriseBean();
            EnterpriseBean e = eb.show(String.valueOf(sess.getAttribute("id")));
            String image = e.getImage();
            if(image==null){
                image = "Profile.png"; 
            }
            
        %>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

        <div class="profile" style="float:left;" >
            <form action="http://localhost:8080/CustomerRelationshipManagement/UpdateImage" method="POST" enctype="multipart/form-data">
                <div class="user">
                    <h1>Profile</h1>
                    <input type="hidden" name="id" value="<%=e.getEmail()%>">
                    <p>@user</p>
                    <img src="UploadedImages/<%out.print(image);%>" id="profile-pic">
                    <label for="input-file">Upload Image</label>
                    <input type="file" accept="image/jpeg, image/png, image/jpg" id="input-file" name="image">
                    <button type="submit" class="upload">Save</button>
                </div>
            </form>
        </div>
        <script src="asset/js/profile.js"></script>
    </div>


    <div class="container" style="float:right;">
        <div class="title">Profile Details</div>
        <form action="http://localhost:8080/CustomerRelationshipManagement/Update" method="POST" enctype="multipart/form-data">
            <div class="form-floating mb-3">
                <input type="text" class="form-control" placeholder="Company Name" id="name" name="cname" value="<%=e.getCompany_name()%>" disabled>
                <label for="floatingInput">Company Name</label>
            </div>

            <div class="row g-2">
                <div class="col-md">
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" placeholder="Company Type" id="type" name="ctype" value="<%=e.getCompany_type()%>" disabled>
                        <label for="floatingInput">Company Type</label>
                    </div>
                </div>
                <div class="col-md">
                    <div class="form-floating mb-3">
                        <input type="number" class="form-control"  placeholder="Employees" id="count" name="totalemp" value="<%=e.getTotal_employee()%>" disabled>
                        <label for="floatingInput">No. Of Employees</label>
                    </div>
                </div>
            </div>

            <div class="row g-2">
                <div class="col-md">
                    <div class="form-floating mb-3">
                        <input type="email" class="form-control"  placeholder="name@example.com" id="email" name="email" value="<%=e.getEmail()%>" readonly disabled>
                        <label for="floatingInput">Email address</label>
                    </div>
                </div>
                <div class="col-md">
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" placeholder="[0-9]{10}" pattern="[0-9]{10}" id="phone" name="phone" value="<%=e.getContact()%>" disabled>
                        <label for="floatingInput">Contact Number</label>
                    </div>
                </div>
            </div>

            <div class="row g-2">
                <div class="col-md">
                    <div class="form-floating">
                        <select class="form-select" aria-label="Default select example" id="city" name="city" disabled>
                            <option selected><%=e.getCity()%></option>
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
                        <select class="form-select" aria-label="Default select example" id="state" name="state" disabled>
                            <option selected><%=e.getState()%></option>
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
                <input type="text" class="form-control" placeholder="Enter address" id="address" name="address" value="<%=e.getAddress()%>" disabled>
                <label for="floatingInput">Enter address</label>
            </div>

            &nbsp;
            <div class="d-grid gap-2 d-md-flex justify-content-md-end"> 
                <label>
                    <button type="button" class="edit" id="editButton">Edit</button>
                </label>
                <label>
                    <button type="submit" class="save" id="saveButton" disabled>Save</button>
                </label>
            </div>
            <script>
                let editButton = document.getElementById("editButton");
                let nameField = document.getElementById("name");
                let typeField = document.getElementById("type");
                let countField = document.getElementById("count");
                let emailField = document.getElementById("email");
                let phoneField = document.getElementById("phone");
                let cityField = document.getElementById("city");
                let stateField = document.getElementById("state");
                let addressField = document.getElementById("address");

                editButton.addEventListener("click", function () {
                    if (nameField.disabled) {
                        nameField.disabled = false;
                        typeField.disabled = false;
                        countField.disabled = false;
                        emailField.disabled = false;
                        phoneField.disabled = false;
                        cityField.disabled = false;
                        stateField.disabled = false;
                        addressField.disabled = false;
                        saveButton.disabled = false;
                    } else {
                        nameField.disabled = true;
                        typeField.disabled = true;
                        countField.disabled = true;
                        emailField.disabled = true;
                        phoneField.disabled = true;
                        cityField.disabled = true;
                        stateField.disabled = true;
                        addressField.disabled = true;
                    }
                });

            </script>
        </form>
    </div>
</body>
</html>