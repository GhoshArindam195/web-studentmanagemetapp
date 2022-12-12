<%@page import="com.web_employeemanagementsystem.entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

    User user = (User) session.getAttribute("user");

    if (user == null) {
        session.setAttribute("msg", "Please Login First!!_bg-danger");
        response.sendRedirect("login.jsp");
    } else 
    {
        if (!(user.getUser_type().equals("Admin") || user.getUser_type().equals("Manager"))) {
            session.setAttribute("msg", "You don't have Access to Register");
            response.sendRedirect("home.jsp");
        }
    }



%>
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
        <%if (user != null && user.getUser_type().equals("Admin")) {%>
        <%@include file="admin_nav.jsp" %>
        <%} else if (user != null && user.getUser_type().equals("Manager")) {%>
        <%@include file="emp_nav.jsp" %>
        <%}
        %>
        <!--Navbar ending-->
        <section class="" style="background-color: #eee;">
            <%
                try {

                    if (session.getAttribute("msg") != null) {
                        String msg = session.getAttribute("msg").toString();
                        session.removeAttribute("msg");
            %>
            <div class="alert alert-danger alert-dismissible fade show text-center" role="alert">
                <strong><%= msg%></strong> Please Try Again!!
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

            <!--Change Pwd Modal--> 
            <!-- Modal -->
            <div class="modal fade" id="change_pwd" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5 text-center" id="exampleModalLabel">Enter New Password</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <div clas="card">
                                <div class="card-body">
                                    <label for="new_pwd" class="form-label">Enter Your New Password</label>
                                    <input type="password" class="form-control" id="new_pwd" name="new_pwd" aria-describedby="emailHelp" required>

                                    <label for="repeat_pwd" class="form-label">Repeat Your New Password</label>
                                    <input type="password" class="form-control" id="repeat_pwd" name="repeat_pwd" aria-describedby="emailHelp" required>
                                    <center>
                                        <button type="button" class="btn btn-success mt-2" id="change_pwd_button">Change Password</button>
                                    </center>

                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
            <!--Change Pwd Modal End--> 

        </section>


        <!--Sweet Alert JS-->
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> 
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>


        <!--JS for change password-->
        <script>
            $(document).ready(function () {
                $("#change_pwd_button").click(function () {
//                    alert("The Button was clicked.");

                    var new_pwd = $('#new_pwd').val();
                    var repeat_pwd = $('#repeat_pwd').val();
                    if (!(new_pwd === repeat_pwd))
                    {
                        swal({
                            title: "Password Did Not Matched",
                            text: "Please enter passwords correctly",
                            icon: "error",
                            button: "Close",
                        });
                    } else
                    {
                        const d = {'newpwd': new_pwd, 'repeatPwd': repeat_pwd};

                        $.ajax({
                            url: "changePasswordServlet",
                            data: d,
                            success: function (data, textStatus, jqXHR) {
//                                                            alert(data)
                                if (data.trim() === "invalid password")
                                {
                                    swal({
                                        title: "Failed",
                                        text: "Oh No!! Passwords entered are invalid",
                                        icon: "error",
                                        button: "Close",
                                    });
                                } else if (data.trim() === "failed")
                                {
                                    swal({
                                        title: "Failed",
                                        text: "Something Went Wrong!! Plase try again after sometime.",
                                        icon: "error",
                                        button: "Close",
                                    });
                                } else if (data.trim() === "success")
                                {
                                    swal({
                                        title: "Success",
                                        text: "Hurray!! Password got changed",
                                        icon: "success",
                                        button: "Close",
                                    });

                                } else if (data.trim() === "passwords did not match")
                                {
                                    swal({
                                        title: "Password Did Not Matched",
                                        text: "Please enter passwords correctly",
                                        icon: "error",
                                        button: "Close",
                                    });
                                }
                            },
                            error: function (jqXHR, textStatus, errorThrown) {
                                console.log(data);
                            }
                        })


                    }



                    /*
                     
                     */

                });
            });
        </script> 




    </body>
</html>
