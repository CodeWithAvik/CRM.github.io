<%-- 
    Document   : addlead
    Created on : 6 May, 2023, 9:29:46 PM
    Author     : Devanjana Ghosh
--%>

<%@page import="beans.EmployeeBean"%>
<%@page import="beans.EnterpriseBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="asset/css/add.css">
        <title>Add Lead</title>
    </head>
    <body class="body">
        <%
            EnterpriseBean eb = new EnterpriseBean();
            EmployeeBean emb = new EmployeeBean();
            HttpSession sess = request.getSession();
            String id = sess.getAttribute("id").toString();
            String path="";
            if (eb.ifExist(id)) {
                path = "lead.jsp";
            }
            else if(emb.ifExist(id)){
                path = "emplead.jsp";
            }
        %>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

        <div class="container">
            <div class="title">Lead Details</div>
            <form action="http://localhost:8080/CustomerRelationshipManagement/AddLead" method="post">
                <div class="form-floating mb-3">
                    <input type="text" class="form-control" id="floatingInput" placeholder="Lead Name" name="leadname" required>
                    <label for="floatingInput">Lead Name</label>
                </div>
                <div class="row g-2">
                    <div class="col-md">
                        <div class="form-floating mb-3">
                            <input type="email" class="form-control" id="floatingInput" placeholder="name@example.com" name="leadmail" required>
                            <label for="floatingInput">Email</label>
                        </div>
                    </div>
                    <div class="col-md">
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="floatingInput" placeholder="[0-9]{10}" pattern="[0-9]{10}" name="leadph" required>
                            <label for="floatingInput">Mobile No.</label>
                        </div>
                    </div>
                </div>

                <div class="row g-2">
                    <div class="col-md">
                        <div class="form-floating">
                            <select class="form-select" aria-label="Default select example" id="interin" name="interin" required>
                                <option selected>-- Interested in --</option>
                                <option value="Fashion">Fashion</option>
                                <option value="Cosmatics & Personal Care">Cosmetics & Personal Care</option>
                                <option value="Medicine">Medicine</option>
                                <option value="Foods">Foods</option>
                                <option value="Electronics and gadgets">Electronics and gadgets</option>
                                <option value="Apps & Services">Apps & Services</option>
                            </select>
                        </div>
                    </div>

                    <div class="col-md">
                        <div class="form-floating">
                            <select class="form-select" aria-label="Default select example" id="interact" name="interact" required>
                                <option selected>-- Interacted In --</option>
                                <option value="Google">Google</option>
                                <option value="Facebook">Facebook</option>
                                <option value="Instagram">Instagram</option>
                                <option value="YouTube">YouTube</option>
                                <option value="Affiliate Link">Affiliate Link</option>
                                <option value="Friends/Family">Friends/Family</option>
                                <option value="Others">Others</option>
                            </select>
                        </div>
                    </div>
                </div>
                &nbsp;
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" required>
                    <label class="form-check-label" for="flexCheckDefault">
                        I hereby confirm that the above information is true
                    </label>
                </div>
                &nbsp;
                <div class="d-grid gap-2 d-md-flex justify-content-md-end" style="float:left;"> 
                    <a href="<%out.print(path);%>" type="button" class="btn btn-primary">Done</a>
                </div>
                <div class="d-grid gap-2 d-md-flex justify-content-md-end" style="float:right;"> 
                    <button type="submit" class="btn btn-success">Add</button> 
                    <button type="reset" class="btn btn-danger">Reset</button>
                </div>
            </form>
    </body>
</html>
