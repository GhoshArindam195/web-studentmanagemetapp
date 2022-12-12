<%@page import="com.web_employeemanagementsystem.dao.UserDao"%>
<%@page import="com.web_employeemanagementsystem.entities.User"%>

<%@page import="java.util.List"%>
<%@page import="com.web_employeemanagementsystem.entities.Employee"%>
<%@page import="com.web_employeemanagementsystem.dao.EmployeeDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    User user = (User) session.getAttribute("user");

    if (user == null) {
        response.sendRedirect("login.jsp");
    }

    if (!user.isIs_verified()) {
        response.sendRedirect("emailVerification.jsp");
    }


%>


<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>App Home</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">

        <!--Customized CSS-->
        <link rel="stylesheet" href="css/custom.css"/>

        <!--Font Awesome CSS-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    </head>
    <body onload="myFunction()">

        <%            if (session.getAttribute("msg") != null) {
                String msg = session.getAttribute("msg").toString();
                session.removeAttribute("msg");

                String title = "Welcome";
                String icon = "success";
                if (msg.contains("Don't have")) {
                    title = "Please Contact Admin";
                    msg = "You Don't have permission";
                    icon = "error";
                }
        %>

        <script>
            function myFunction()
            {
                swal({
                    title: "<%= title%>",
                    text: "<%= msg%>",
                    icon: "<%= icon%>",
                    button: "Close",
                });
            }
        </script>
        <%}%>
        <%
            List<Employee> emps = EmployeeDao.getEmployees();
            List<User> users = UserDao.getUsersExcludeAdmin();
        %>


        <!--Navbar-->
        <%
            if (user != null && user.getUser_type().equals("Admin")) {
        %>
        <%@include file="admin_nav.jsp" %>
        <%
        } else if (user != null && !user.getUser_type().equals("Admin")) {
        %>
        <%@include file="emp_nav.jsp" %>
        <%
            }
        %>
        <!--Navbar ending-->

        <div class="container-fluid my-3 mx-0">
            <div class="row">
                <!--Side Menu-->
                <div class="col-sm-2">
                    <ul class="list-group text-center">
                        <li class="list-group-item bg-custom text-light" aria-current="true"><b>Menu</b></li>
                        <a href="addEmployee.jsp" class="list-group-item list-group-item-info">Add Employee</a>
                        <a href="#" class="list-group-item list-group-item-info">Update Employee</a>
                        <a href="#" class="list-group-item list-group-item-info">Delete Employee</a>
                    </ul>
                </div>

                <!--Main Conent-->
                <div class="col-sm-10">
                    <!--<div class="">-->

                    <table class="table table-responsive-sm">
                        <thead>
                            <tr class="bg-custom text-light">
                                <th scope="col">Id</th>
                                <th scope="col">Name</th>
                                <th scope="col">Department</th>
                                <th scope="col">Phone</th>
                                <th scope="col">Email</th>
                                <th scope="col">Salary</th>
                                <th scope="col">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%                                for (Employee emp : emps) {
                            %>
                            <tr>
                                <th scope="row"> <%= emp.getEmp_id()%> </th>
                                <td><%= emp.getEmp_name()%></td>

                                <td><%= emp.getEmp_dept()%></td>
                                <td><%= emp.getEmp_phone()%></td>
                                <td><%= emp.getEmp_email()%></td>
                                <td><%= emp.getSalary()%></td>
                                <td>
                                    <a href="updateEmployee.jsp?emp_id=<%= emp.getEmp_id()%>" class="btn btn-warning">Update</a>
                                    <a href="#" class="btn btn-danger">Delete</a>
                                </td>
                            </tr>
                            <%}%>
                        </tbody>
                    </table>
                    <!--</div>-->
                </div>
            </div>

            <!--Access Modal-->
            <!-- Modal -->
            <div class="modal fade" id="accessModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header text-center">
                            <h1 class="modal-title fs-5 w-100" id="exampleModalLabel">Access View</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <table class="table">
                                <thead>
                                    <tr class="table-dark">
                                        <th scope="col">Id</th>
                                        <th scope="col">Name</th>
                                        <th scope="col">Current Post</th>
                                        <th scope="col">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% for (User person : users) {%>
                                    <tr>
                                        <th scope="row"><%= person.getUser_id()%></th>
                                        <td><%= person.getUser_name()%></td>
                                        <td id="currentPost<%= person.getUser_id()%>"><%= person.getUser_type()%></td>
                                        <td>
                                            <%
                                                if (person.getUser_type().equals("Employee")) {
                                            %>
                                            <button id="promote<%= person.getUser_id()%>" class="btn btn-success" value="<%= person.getUser_id()%>" onclick="promote(<%= person.getUser_id()%>)">Promote to Manager</button>
                                            <button id="demote<%= person.getUser_id()%>" class="btn btn-danger" value="<%= person.getUser_id()%>" onclick="demote(<%= person.getUser_id()%>)" hidden>Demote to Employee</button>
                                            <%
                                            } else {
                                            %>
                                            <button id="promote<%= person.getUser_id()%>" class="btn btn-success" value="<%= person.getUser_id()%>" onclick="promote(<%= person.getUser_id()%>)" hidden>Promote to Manager</button>
                                            <button id="demote<%= person.getUser_id()%>" class="btn btn-danger" value="<%= person.getUser_id()%>" onclick="demote(<%= person.getUser_id()%>)">Demote to Employee</button>
                                            <% } %>
                                        </td>
                                    </tr>
                                    <% }%>
                                </tbody>
                            </table>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
            <!--Access Modal End-->
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


        <!--Sweet Alert JS-->
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> 
        <!--<Bootstrap JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>


        <script>

                                                //Promote Function
                                                function promote(userid) {
//                                                    alert("The Promote was clicked.");
//                                                    alert(userid);
                                                    const d = {"user_id": userid};
                                                    $.ajax({
                                                        url: "promoterServlet",
                                                        data: d,
                                                        success: function (data, textStatus, jqXHR) {
//                                                            alert(data)
                                                            if (data.trim() == "success")
                                                            {

                                                                swal({
                                                                    title: "Hurray",
                                                                    text: "Promoted to Manager",
                                                                    icon: "success",
                                                                    button: "Close",
                                                                });



                                                                $('#demote' + userid).removeAttr('hidden');
                                                                $('#promote' + userid).attr('hidden', 'true');
                                                                $('#currentPost' + userid).text("Manager")
                                                            } else
                                                            {
                                                                swal({
                                                                    title: "Failed",
                                                                    text: "Something Went wrong!! Plase try again later.",
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



                                                //Demote..
                                                function demote(userid) {
                                                    const d = {"user_id": userid};
                                                    $.ajax({
                                                        url: "demoterServlet",
                                                        data: d,
                                                        success: function (data, textStatus, jqXHR) {
//                                                            alert(data)
                                                            if (data.trim() == "success")
                                                            {

                                                                swal({
                                                                    title: "Oh! No",
                                                                    text: "Demoted to Employee",
                                                                    icon: "success",
                                                                    button: "Close",
                                                                });



                                                                $('#promote' + userid).removeAttr('hidden');
                                                                $('#demote' + userid).attr('hidden', 'true');
                                                                $('#currentPost' + userid).text("Employee")
                                                            } else
                                                            {
                                                                swal({
                                                                    title: "Failed",
                                                                    text: "Something Went wrong!! Plase try again later.",
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

        </script>
        
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
