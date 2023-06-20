<%-- 
    Document   : bill
    Created on : 9 May, 2023, 12:45:55 PM
    Author     : ayanp
--%>

<%@page import="beans.EmployeeBean"%>
<%@page import="beans.EnterpriseBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="beans.CustomerBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Document</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" crossorigin="anonymous">
        <link rel="stylesheet" href="asset/css/bill.css" />
        <script src="asset/js/bill.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.2/html2pdf.bundle.js"></script>

    </head>

    <body>
        <%
            CustomerBean cb = new CustomerBean();
            CustomerBean customer = cb.search(String.valueOf(request.getAttribute("contact")));
            String percentage = request.getAttribute("percentage").toString();
            String tax = String.valueOf(request.getAttribute("tax"));
            String amount = String.valueOf(request.getAttribute("amount"));
           
            EnterpriseBean eb = new EnterpriseBean();
            EmployeeBean emb = new EmployeeBean();
            HttpSession sess = request.getSession();
            String id = sess.getAttribute("id").toString();
            String path="";
            if (eb.ifExist(id)) {
                path = "invoice.jsp";
            }
            else if(emb.ifExist(id)){
                path = "empinvoice.jsp";
            }
            else{
                request.setAttribute("message", "You have to login first");
                request.getRequestDispatcher("emplogin.jsp").forward(request, response);
            }
        %>
        <div class="container d-flex justify-content-center mt-50 mb-50">
            <div class="row">
                <div class="col-md-12 text-right mb-3">
                    <button class="btn btn-info" id="download">Print Invoice</button>
                    <a href="<%out.print(path);%>" class="btn btn-primary">Done</a>
                </div>
                <div class="col-md-12">
                    <div class="card" id="invoice">
                        <div class="card-header bg-transparent header-elements-inline">
                            <h6 class="card-title text-primary">Sale Invoice</h6>
                        </div>
                        <div class="card-body">
                            <div class="d-md-flex flex-md-wrap">
                                <div class="mb-4 mb-md-2 text-left"> <span class="text-muted">Invoice To:</span>
                                    <ul class="list list-unstyled mb-0">
                                        <li>
                                            <h5 class="my-2"><%=customer.getCustName()%></h5>
                                        </li>
                                        <li><%=customer.getCustContact()%></li>
                                        <li><a href="#" data-abc="true"><%=customer.getCustEmail()%></a></li>
                                    </ul>
                                </div>
                                <div class="col-sm-8">
                                    <div class="mb-4 ">
                                        <div class="text-sm-right">
                                            <h4 class="invoice-color mb-2 mt-md-2">Invoice #BBB1243</h4>
                                            <ul class="list list-unstyled mb-0">
                                                <li>Date: <span class="font-weight-semibold"><%=customer.getDate()%></span></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="table-responsive col-sm-20">
                            <table class="table table-lg">
                                <thead>
                                    <tr>
                                        <th>Items</th>
                                        <th>Quantity</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>
                                            <%=customer.getCustItemPurchased()%>
                                        </td>
                                        <td><%=customer.getCustTotalItems()%></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="card-body">
                            <div class="d-md-flex flex-md-wrap">
                                <div class="pt-2 mb-3 wmin-md-400 ml-auto">
                                    <h6 class="mb-3 text-left">Total Amount</h6>
                                    <div class="table-responsive">
                                        <table class="table">
                                            <tbody>
                                                <tr>
                                                    <th class="text-left">Subtotal:</th>
                                                    <td class="text-right">&#8377;<%out.print(amount);%></td>
                                                </tr>
                                                <tr>
                                                    <th class="text-left">Tax: <span class="font-weight-normal">(<%out.print(percentage);%>%)</span></th>
                                                    <td class="text-right">&#8377;<%out.print(tax);%></td>
                                                </tr>
                                                <tr>
                                                    <th class="text-left">Total:</th>
                                                    <td class="text-right text-primary">
                                                        <h5 class="font-weight-semibold">&#8377;<%=customer.getCustTotalAmount()%></h5>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>  
                        <span style="color:gray;">
                            <b><em>*This bill is generated on NEXUS CRM.</em><b>
                        </span>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
