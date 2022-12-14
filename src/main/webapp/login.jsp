<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Login - App</title>
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


        <div class="container my-4">
            <div class="row">
                <div class="offset-sm-3 col-sm-6">
                    <div class="card">
                        <div class="card-header text-center display-6 bg-custom text-light">
                            <p><span class="fa fa-key"></span> <b>Login</b></p>
                        </div>

                        <form method="post" action="loginServlet">
                            <%
                                if (session.getAttribute("msg") != null) {
                                    String str = session.getAttribute("msg").toString();
                                } 
                                if (session.getAttribute("msg") != null && session.getAttribute("msg").toString().contains("_")) {
                                    String msg = session.getAttribute("msg").toString().split("_")[0];
                                    String cssClass = session.getAttribute("msg").toString().split("_")[1];
                                    session.removeAttribute("msg");
                            %>

                            <div class="alert alert-success text-center" role="alert">
                                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-check-circle-fill" viewBox="0 0 16 16">
                                <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
                                </svg>&nbsp;&nbsp;<b><%= msg%></b>
                            </div>
                            <%}%>
                            <div class="card-body">
                                <div class="mb-3">
                                    <label for="email" class="form-label">Email address</label>
                                    <input type="email" class="form-control" id="email" aria-describedby="emailHelp" name="email">
                                    <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                                </div>
                                <div class="mb-3">
                                    <label for="pwd" class="form-label">Password</label>
                                    <input type="password" class="form-control" id="pwd" name="pwd">
                                </div>
                            </div>

                            <div class="card-footer text-center ">
                                <button type="button" class="btn bg-warning text-light" data-bs-toggle="modal" data-bs-target="#exampleModal">Forget Password</button>
                                <button type="submit" class="btn bg-success text-light">Submit</button>
                            </div>
                        </form>

                    </div>
                </div>
            </div>
        </div>


        <!--Forget Password Modal-->    
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">Remember Your Password</h1>
                    </div>
                    <div class="modal-body">
                        <div clas="card">
                            <div class="card-body">
                                <label for="user_email" class="form-label">Enter Your Verified Email Address</label>
                                <input type="email" class="form-control" id="user_email" name="user_email" aria-describedby="emailHelp">
                                <button type="button" class="btn btn-success mt-2" id="forget_pwd_button">Get A Password</button>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
        <!--Forget Password Modal Ends-->




        <!--Sweet Alert JS-->
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> 
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>

        <script>
            $(document).ready(function () {
                $("#forget_pwd_button").click(function () {
//                    alert("The Button was clicked.");

                    var email = $('#user_email').val();
                    //alert(email)

                    const d = {'email': email};

                    $.ajax({
                        url: "resetServlet",
                        data: d,
                        success: function (data, textStatus, jqXHR) {
//                                                            alert(data)
                            if (data.trim() === "not exist")
                            {
                                swal({
                                    title: "Failed",
                                    text: "Email doesn't Exist!! Plase provide correct email.",
                                    icon: "error",
                                    button: "Close",
                                });
                            } else if (data.trim() === "Failed")
                            {
                                swal({
                                    title: "Failed",
                                    text: "Something Went Wrong!! Plase try gain after sometime.",
                                    icon: "error",
                                    button: "Close",
                                });
                            } else if (data.trim() === "Success")
                            {
                                swal({
                                    title: "Success",
                                    text: "Hurray!! Password got reset",
                                    icon: "success",
                                    button: "Close",
                                }).then(function () {
                                    window.location = "login.jsp";
                                });

                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            console.log(data);
                        }
                    })


                });
            });
        </script>



    </body>
</html>