<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Signup - App</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">


        <!--Customized CSS-->
        <link rel="stylesheet" href="css/custom.css"/>

        <!--Font Awesome CSS-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
        <!--Navbar-->
        <%@include file="normal_nav.jsp" %>
        <!--Navbar ending-->
        <section class="" style="background-color: #eee;">
            <%
                try {

                    if (session.getAttribute("msg") != null) {
                        String msg = session.getAttribute("msg").toString();
                        session.removeAttribute("msg");
            %>
            <div class="alert alert-danger alert-dismissible fade show text-center" role="alert">
                <strong><%= msg %></strong> Please Try Again!!
            </div>
            <%}
                } catch (Exception e) {
                }
            %>
            <div class="container h-100 py-4">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-lg-12 col-xl-11">
                        <div class="card text-black" style="border-radius: 25px;">
                            <div class="card-body p-md-5">

                                <div class="row justify-content-center">
                                    <div class="col-md-10 col-lg-6 col-xl-5 order-2 order-lg-1">

                                        <p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4">Sign up</p>

                                        <form id="reg-form" action="registerServlet" class="mx-1 mx-md-4" method="post" >

                                            <div class="d-flex flex-row align-items-center mb-4">
                                                <i class="fa fa-user fa-lg me-3 fa-fw"></i>
                                                <div class="form-outline flex-fill mb-0">
                                                    <input type="text" id="user_name" name="user_name" class="form-control" />
                                                    <label id="user_name_lebel" class="form-label" for="user_name">Your Name</label>
                                                </div>
                                            </div>

                                            <div class="d-flex flex-row align-items-center mb-4">
                                                <i class="fa fa-envelope fa-lg me-3 fa-fw"></i>
                                                <div class="form-outline flex-fill mb-0">
                                                    <input type="email" id="user_email" name="user_email" class="form-control" />
                                                    <label id="user_email_lebel" class="form-label" for="user_email">Your Email</label>
                                                </div>
                                            </div>

                                            <div class="d-flex flex-row align-items-center mb-4">
                                                <i class="fa fa-lock fa-lg me-3 fa-fw"></i>
                                                <div class="form-outline flex-fill mb-0">
                                                    <input type="password" id="user_pwd" class="form-control" name="user_pwd"/>
                                                    <label id="user_pwd_lebel" class="form-label" for="user_pwd">Password</label>
                                                </div>
                                            </div>

                                            <div class="d-flex flex-row align-items-center mb-4">
                                                <i class="fa fa-key fa-lg me-3 fa-fw"></i>
                                                <div class="form-outline flex-fill mb-0">
                                                    <input type="password" id="repeat_user_pwd" name="repeat_user_pwd" class="form-control" />
                                                    <label id="repeat_user_pwd_lebel" class="form-label" for="repeat_user_pwd">Repeat your password</label>
                                                </div>
                                            </div>
                                            <div class="d-flex flex-row align-items-center mb-4">
                                                <i class="fa fa-list fa-lg me-3 fa-fw"></i>
                                                <div class="form-outline flex-fill mb-0">
                                                    <select id="user_type" name="user_type" class="form-select" >
                                                        <option >Employee</option>
                                                    </select>
                                                    <label class="form-label" for="repeat_user_pwd">User type</label>
                                                </div>
                                            </div>

                                            <div class="form-check d-flex justify-content-center mb-5">
                                                <input class="form-check-input me-2" type="checkbox" value="" id="form2Example3c" required/>
                                                <label class="form-check-label" for="form2Example3">
                                                    I agree all statements in <a href="#!">Terms of service</a>
                                                </label>
                                            </div>

                                            <div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
                                                <button type="submit" id="submit-btn" class="btn btn-primary btn-lg">Register</button>
                                            </div>

                                        </form>

                                    </div>
                                    <div class="col-md-10 col-lg-6 col-xl-7 d-flex align-items-center order-1 order-lg-2">

                                        <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-registration/draw1.webp"
                                             class="img-fluid" alt="Sample image">

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>
