<%@page import="com.web_employeemanagementsystem.entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
    User user = (User) session.getAttribute("user");

    if (user == null) {
        response.sendRedirect("login.jsp");
    }

    if (user.isIs_verified()) {
        response.sendRedirect("home.jsp");
    }


%>



<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Bootstrap demo</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
        <!--Customized CSS-->
        <link rel="stylesheet" href="css/custom.css"/>

        <!--Font Awesome CSS-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <style>
            .height-100 {
                height: 100vh
            }

            .card {
                width: 400px;
                border: none;
                height: 300px;
                box-shadow: 0px 5px 20px 0px #d2dae3;
                z-index: 1;
                display: flex;
                justify-content: center;
                align-items: center
            }

            .card h6 {
                color: black;
                font-size: 20px
            }

            .inputs input {
                width: 40px;
                height: 40px
            }

            input[type=number]::-webkit-inner-spin-button,
            input[type=number]::-webkit-outer-spin-button {
                -webkit-appearance: none;
                -moz-appearance: none;
                appearance: none;
                margin: 0
            }

            .card-2 {
                background-color: #fff;
                padding: 10px;
                width: 350px;
                height: 100px;
                bottom: -50px;
                left: 20px;
                position: absolute;
                border-radius: 5px
            }

            .card-2 .content {
                margin-top: 50px
            }

            .card-2 .content a {
                color: #7633f9
            }

            .form-control:focus {
                box-shadow: none;
                border: 2px solid #7633f9
            }

            .validate {
                border-radius: 20px;
                height: 40px;
                width: 140px
            }
        </style>

    </head>
    <body>

        <!--Navbar-->
        <%@include file="normal_nav.jsp" %>
        <!--Navbar ending-->


        <div class="container height-100 d-flex justify-content-center align-items-center">
            <div class="position-relative">
                <div class="card p-2 text-center">
                    <h6>Please enter the one time password <br> to verify your account</h6>
                    <div> 
                        <span>A code has been sent to</span> <b><small> <%= user.getUser_email()%> </small></b> 
                    </div>
                    <form method="post" action="verificationServlet">
                        <div id="otp" class="inputs d-flex flex-row justify-content-center mt-2"> 
                            <input class="m-2 text-center form-control rounded" type="text" id="first" name="first" maxlength="1" />
                            <input class="m-2 text-center form-control rounded" type="text" id="second" name="second" maxlength="1" />
                            <input class="m-2 text-center form-control rounded" type="text" id="third" name="third" maxlength="1" />
                            <input class="m-2 text-center form-control rounded" type="text" id="fourth" name="fourth" maxlength="1" />
                            <input class="m-2 text-center form-control rounded" type="text" id="fifth" name="fifth" maxlength="1" />
                            <input class="m-2 text-center form-control rounded" type="text" id="sixth" name="sixth" maxlength="1" /> 
                        </div>
                        <div class="mt-4"> 
                            <button type="submit" class="btn btn-danger validate" style="background-color: #7633f9; border-style: none">Validate</button> 
                        </div>
                    </form>
                </div>
            </div>
        </div>



        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>


        <!--        <script>
                    document.addEventListener("DOMContentLoaded", function (event) {
        
                        function OTPInput() {
                            const inputs = document.querySelectorAll('#otp > *[id]');
                            for (let i = 0; i < inputs.length; i++) {
                                inputs[i].addEventListener('keydown', function (event) {
                                    if (event.key === "Backspace") {
                                        inputs[i].value = '';
                                        if (i !== 0)
                                            inputs[i - 1].focus();
                                    } else {
                                        if (i === inputs.length - 1 && inputs[i].value !== '') {
                                            return true;
                                        } else if (event.keyCode > 47 && event.keyCode < 58) {
                                            inputs[i].value = event.key;
                                            if (i !== inputs.length - 1)
                                                inputs[i + 1].focus();
                                            event.preventDefault();
                                        } else if (event.keyCode > 64 && event.keyCode < 91) {
                                            inputs[i].value = String.fromCharCode(event.keyCode);
                                            if (i !== inputs.length - 1)
                                                inputs[i + 1].focus();
                                            event.preventDefault();
                                        }
                                    }
                                });
                            }
                        }
                        OTPInput();
                    });
                </script>-->



    </body>
</html>