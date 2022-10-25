<%@page import="com.web_employeemanagementsystem.entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    User user = (User) session.getAttribute("user");

    if (user == null) {
        response.sendRedirect("login.jsp");
    }
    
    else if(!user.getUser_type().equals("Admin"))
    {
        session.setAttribute("msg", "You Don't have permission to Add new Employee. Please Contact Admin");
        response.sendRedirect("home.jsp");
    }
    
%>


<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Add Employee</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">

        <!--Customized CSS-->
        <link rel="stylesheet" href="css/custom.css"/>

        <!--Font Awesome CSS-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    </head>
    <body>

        <!--Navbar-->
        <%
            if (user != null && user.getUser_type().equals("Admin")) {
        %>
        <%@include file="admin_nav.jsp" %>
        <%
        } else if (user != null && user.getUser_type().equals("Employee")){
        %>
        <%@include file="emp_nav.jsp" %>
        <%
        }
        %>
        <!--Navbar ending-->


        <div class="container my-5">
            <div class="row">
                <div class="offset-sm-3 col-sm-6">
                    <div class="card">
                        <div class="card-header text-center display-6 bg-custom text-light">
                            <p><span class="fa fa-user-plus"></span> <b>Add New Employee</b></p>
                        </div>
                        <form action="addEmployeeServlet" method="post">
                            <div class="card-body">
                                <div class="mb-3">
                                    <!--<label for="name" class="form-label">Full Name</label>-->
                                    <input type="text" class="form-control" id="name" aria-describedby="emailHelp" name="name" placeholder="Full Name">
                                </div>
                                <div class="mb-3">
                                    <!--<label for="email" class="form-label">Email address</label>-->
                                    <input type="email" class="form-control" id="email" aria-describedby="emailHelp" name="email" placeholder="Email address">
                                    <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                                </div>  
                                <div class="mb-3">
<!--                                    <label for="phone" class="form-label">Phone Number</label>-->
                                    <input type="text" class="form-control" id="phone" name="phone" placeholder="Phone Number">
                                </div>
                                
                                <div class="form-floating mb-3">
                                    <textarea class="form-control" name="address" id="address" style="height: 70px"></textarea>
                                    <label for="address">Mailing Address</label>
                                </div>
                                
                                
                                <div class="mb-3 form-floating">
                                    <select class="form-select" id="dept" name="dept">
                                        <option value="SELECT" selected>SELECT</option>
                                        <option value="Development" >Development</option>
                                        <option value="Management" >Management</option>
                                        <option value="Account" >Account</option>
                                        <option value="Admin" >Admin</option>
                                    </select>
                                    <label for="dept">Department</label>
                                </div>
                                
                                <div class="mb-3">
                                    <!--<label for="salary" class="form-label">Employee Salary</label>-->
                                    <input type="text" class="form-control" id="salary" name="salary" placeholder="Employee Salary">
                                </div>

                            </div>
                            <div class="card-footer text-center">
                                <button type="submit" class="btn btn-outline-success">Submit</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
    </body>
</html>
