<%-- 
    Document   : editemp
    Created on : 30 Apr, 2023, 1:53:29 PM
    Author     : Devanjana Ghosh
--%>

<%@page import="beans.EmployeeBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="asset/css/add.css">
        <link rel="icon" type="image/x-icon" href="asset/images/logo.png">
        <title>Update Employee Details</title>
    </head>
    <body class="body">

        <%
            HttpSession sess = request.getSession();
            Object obj = sess.getAttribute("id");
            if (obj == null) {
                request.setAttribute("message", "You have to login first!");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
            String id = request.getParameter("id");
            EmployeeBean eb = new EmployeeBean();
            EmployeeBean emps = eb.search(id);

        %>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

        <div class="container">
            <div class="title">Employee Details</div>
            <form action="http://localhost:8080/CustomerRelationshipManagement/UpdateEmployee" method="POST">

                <div class="row g-2">
                    <div class="col-md">
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="floatingInputId" name="empid" value="<%=emps.getEmpId()%>" placeholder="Employee Id" readonly>
                            <label for="floatingInputId">Employee ID</label>
                        </div>
                    </div>
                    <div class="col-md">
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="floatingInputName" name="empname" value="<%=emps.getEmpName()%>" placeholder="Employee Name" required>
                            <label for="floatingInputName">Employee Name</label>
                        </div>
                    </div>
                </div>

                <div class="gender"><b>Gender</b></div>
                <div class="form-check">
                    <input class="form-check-input" type="radio" id="flexRadioDefault1" name="empgender" <%if (emps.getEmpGender().equals("Male")) {
                            out.print("checked");
                        };%> value="Male" required>
                    <label class="form-check-label" for="flexRadioDefault1">
                        Male
                    </label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="radio" id="flexRadioDefault2" name="empgender" <%if (emps.getEmpGender().equals("Female")) {
                            out.print("checked");
                        };%> value="Female" required>
                    <label class="form-check-label" for="flexRadioDefault2">
                        Female
                    </label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="radio" id="flexRadioDefault3" name="empgender" <%if (emps.getEmpGender().equals("Others")) {
                            out.print("checked");
                        };%> value="Others" required>
                    <label class="form-check-label" for="flexRadioDefault2">
                        Others
                    </label>
                </div>

                <div class="row g-2">
                    <div class="col-md">
                        <div class="form-floating mb-3">
                            <input type="email" class="form-control" id="floatingInputEmail" name="empemail" value="<%=emps.getEmpEmail()%>" placeholder="name@example.com" required>
                            <label for="floatingInputEmail">Email address</label>
                        </div>
                    </div>
                    <div class="col-md">
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="floatingInputContact" name="empcontact" value="<%=emps.getEmpContact()%>" placeholder="[0-9]{10}" pattern="[0-9]{10}" required>
                            <label for="floatingInputContact">Contact Number</label>
                        </div>
                    </div>
                </div>

                <div class="form-floating mb-3">
                    <input type="text" class="form-control" id="floatingInputAddress" name="empaddress" value="<%=emps.getEmpAddress()%>" placeholder="Enter address" required>
                    <label for="floatingInputAddress">Enter address</label>
                </div>

                <div class="form-check">
                    <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" required>
                    <label class="form-check-label" for="flexCheckDefault">
                        I hereby confirm that the above information is true
                    </label>
                </div>
                &nbsp;
                <div class="d-grid gap-2 d-md-flex justify-content-md-end" style="float:left;"> 
                    <a href="employee.jsp" type="button" class="btn btn-danger">Cancel</a>
                </div>
                <div class="d-grid gap-2 d-md-flex justify-content-md-end" style="float:right;"> 
                    <button type="submit" class="btn btn-success">Update</button> 
                    <button type="reset" class="btn btn-info">Reset</button>
                </div>

            </form>
        </div>
    </body>
</html>
