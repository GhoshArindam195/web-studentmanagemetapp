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
                                if (session.getAttribute("msg") != null && session.getAttribute("msg").toString().contains("_")) 
                                {
                                    String msg = session.getAttribute("msg").toString().split("_")[0];
                                    String cssClass = session.getAttribute("msg").toString().split("_")[1];
                                    session.removeAttribute("msg");
                            %>
                                <div class="mb-3 <%= cssClass%> text-center text-light">
                                    <%= msg%>
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
                                <button type="submit" class="btn bg-success text-light">Submit</button>
                            </div>
                        </form>

                    </div>
                </div>
            </div>
        </div>




        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
    </body>
</html>