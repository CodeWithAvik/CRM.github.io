<%-- 
    Document   : index
    Created on : 10 Mar, 2023, 1:33:41 AM
    Author     : Avik
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="icon" type="image/x-icon" href="asset/images/logo.png">
        <title>Home</title>
        <style>
            .container-div {
                position: relative;
                text-align: center;
                color: black;
            }
            .centered-left1 {
                position: absolute;
                top: 30%;
                left: 10%;
                transform: translate(0%, -50%);
            }
            .centered-left2 {
                position: absolute;
                top: 40%;
                left: 10%;
                transform: translate(0%, -50%);
            }
            .centered-left3 {
                position: absolute;
                top: 45%;
                left: 10%;
                transform: translate(0%, -50%);
            }
            .centered-left4 {
                position: absolute;
                top: 50%;
                left: 10%;
                transform: translate(0%, -50%);
            }
            .centered-left5 {
                position: absolute;
                top: 60%;
                left: 10%;
                transform: translate(0%, -50%);
            }

            .logo{
                height:50px;
                width:50px;
                border-radius:50%;
            }

        </style>
    </head>

    <body>

        <!--Navigation Bar-->

        <nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top">
            <div class="container-fluid">
                <a class="navbar-brand" href="#"><img class="logo" src="asset/images/logo.png"></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                        aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link" aria-current="page" href="#">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#process">Process</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#about">About</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#contact">Contact Us</a>
                        </li>
                    </ul>
                    <span class="navbar-nav">
                        <li class="nav-item dropdown">
                            <a class="btn btn-primary dropdown-toggle" href="#" id="navbarDropdown" role="button"
                               data-bs-toggle="dropdown" aria-expanded="false" style="background: linear-gradient(135deg, #ae85f1, #598eb6);">
                                Login
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="emplogin.jsp">Employee</a></li>
                                <li><a class="dropdown-item" href="login.jsp">Enterprise</a></li>
                            </ul>
                        </li>
                        &nbsp;&nbsp;
                        <li class="nav-item">
                            <a class="btn btn-danger" href="registration.jsp" style="background: linear-gradient(135deg, #e671cf, #9b59b6);">Sign Up</a>
                        </li>
                    </span>
                </div>
            </div>
        </nav>

        <div class="container-fluid container-div">
            <img src="asset/images/crm.png" class="img-fluid d-block " style="height: 600px; width:100%;" >
            <div class="centered-left1"><h2 style="color: #752dfa;">WELCOME TO NEXUS CRM</h2></div>
            <div class="centered-left2"><p style="color: #006dc0">Nexus CRM provides world class tools for customer </p></div>
            <div class="centered-left3"><p style="color: #006dc0">relationship management. Nexus CRM has user friendly </p></div>
            <div class="centered-left4"><p style="color: #006dc0">interface which provides employees a good work experience.</p></div>
            <div class="centered-left5"><a href="registration.jsp" class="btn btn-outline-primary" style="background: linear-gradient(135deg, #ae85f1, #598eb6);color:whitesmoke;">Let's Start</a></div>
        </div>

        <!--Process-->
        <div class="card-group" id="process">
            <div class="card text-white bg-danger mb-3">
                <div class="card-header" style="background: rgb(225, 20, 143);">REGISTER</div>
                <div class="card-body" style="background: linear-gradient(135deg, #ea6ed5, #9b59b6);">
                    <h5 class="card-title">Register Your Business</h5>
                    <p class="card-text">To register, businesses will likely need to provide some basic information such as
                        their company name, contact details, and business address. They may also need to provide additional
                        information related to their business operations or goals, depending on the services or benefits
                        they are looking to access through our site.</p>
                </div>
            </div>
            <div class="card text-white bg-primary mb-3">
                <div class="card-header" style="background: rgb(250, 17, 99);">LOGIN</div>
                <div class="card-body" style="background: rgb(223, 136, 150);">
                    <h5 class="card-title">Choose Enterprise Login</h5>
                    <p class="card-text">Login to our website by choosing "Enterprise Login" option and add employees.Adding
                        employees may involve filling out a form or inputting information such as the employee's name,
                        contact details, job title, and other relevant information. The employees can login afterwards.</p>
                </div>
            </div>
            <div class="card text-white bg-dark mb-3">
                <div class="card-header" style="background: rgb(9, 175, 205);">AUTOMATE</div>
                <div class="card-body" style="background: linear-gradient(135deg, #ae85f1, #598eb6);">
                    <h5 class="card-title">Automate your business</h5>
                    <p class="card-text">Our website can provide several benefits, including improving customer experiences,
                        reducing manual effort, increasing productivity, and enhancing overall efficiency.</p>
                </div>
            </div>
        </div>

        <!--About-->

        <div class="card mb-3 mg" id="about">
            <div class="row g-0">
                <div class="col-md-4">
                    <img src="asset/images/1.jpg" class="img-fluid rounded-start" alt="image">
                </div>
                <div class="col-md-8">
                    <div class="card-body">
                        <h5 class="card-title">About Us</h5>
                        <p class="card-text">Welcome to our CRM website, where we specialize in providing businesses
                            with the tools they need to manage their customer relationships more effectively. Our team of
                            experts has years of experience in the industry and a deep understanding of the challenges that
                            businesses face when it comes to customer relationship management. We offer a comprehensive
                            range of solutions to help businesses of all sizes, from small startups to large corporations,
                            to streamline their processes, improve customer satisfaction, and boost their bottom line.

                            Our team is made up of highly skilled professionals with a passion for customer relationship
                            management. We understand that every business is unique, and that's why we take a personalized
                            approach to every project we work on. We work closely with our clients to understand their
                            needs, challenges, and goals, and then develop customized solutions to help them achieve
                            success. We pride ourselves on our ability to listen and communicate effectively, and we are
                            committed to delivering exceptional results.

                            At our expert CRM website, we offer a range of services to help businesses improve their
                            customer relationships. Our solutions include customer data management, sales automation,
                            marketing automation, customer service and support, and analytics and reporting. We also provide
                            training and support to ensure that our clients are equipped with the knowledge and tools they
                            need to get the most out of our products and services.

                            We are dedicated to providing our clients with the highest level of service and support.</p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Contact & Feedback -->

        <footer class="text-center text-lg-start bg-dark text-muted" id="contact">
            <div class="container text-center text-md-start mt-5">
                <div class="row mt-3">
                    <div class="row mt-3">
                        <div class="col-md-3 col-lg-4 col-xl-3 mb-4" >
                            <h6 class="text-uppercase fw-bold mb-4">Feedback</h6>
                            <form action="http://localhost:8080/CustomerRelationshipManagement/Feedback" method="POST">
                                <div class="form-floating mb-3">
                                    <input type="email" class="form-control" name="email" id="floatingInput" placeholder="name@example.com"
                                           required>
                                    <label for="floatingInput">Email address</label>
                                </div>
                                <div class="form-floating">
                                    <textarea class="form-control" placeholder="Leave a comment here"
                                              name="feedback" id="floatingTextarea"></textarea>
                                    <label for="floatingTextarea">Comments</label>
                                </div>
                                <br>
                                <button type="submit" class="btn btn-outline-primary">Send Feedback</button>
                            </form>
                        </div>
                        <div class="col-md-4 col-lg-3 mx-auto col-xl-3 mb-md-0 mb-4">
                            <h6 class="text-uppercase fw-bold mb-4">Contact</h6>
                            <p>EM4/1, Sector V, Salt Lake City, Kolkata, West Bengal, India</p>
                            <p>info@projectxsoftware.com</p>
                            <p> + 01 234 567 88</p>
                            <p> + 01 234 567 89</p>
                        </div>
                        <div class="embed-responsive embed-responsive-16by9 mapsize col-md-4 col-lg-3 col-xl-3 mb-md-0 mb-4">
                            <h6 class="text-uppercase fw-bold mb-4">Reach Us</h6>
                            <iframe class="embed-responsive-item" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3097.8966590594423!2d88.427204080627!3d22.577579234933555!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x39f970ae9a2e19b5%3A0x16c43b9069f4b159!2sTechno%20India%20University!5e0!3m2!1sen!2sin!4v1675974140543!5m2!1sen!2sin" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Footer -->
            <div class="text-center bg-dark p-4">
                <p class="text-reset fw-bold">© 2021 Copyright: PROJECTX SOFTWARE LTD.</p>
            </div>
        </footer>
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
    </body>

</html>