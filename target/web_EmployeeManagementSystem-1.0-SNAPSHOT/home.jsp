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

        <%
            if (session.getAttribute("msg") != null) {
                String msg = session.getAttribute("msg").toString();
                session.removeAttribute("msg");

                String title = "Welcome";
                String icon = "success";
                if (msg.contains("Don't have permission")) {
                    title = "Please Contact Admin";
                    msg = "You Don't have permission to Add new Employee.";
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
        } else if (user != null && user.getUser_type().equals("Employee")) {
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
                                    <% for(User person : users){ %>
                                    <tr>
                                        <th scope="row"><%= person.getUser_id() %></th>
                                        <td><%= person.getUser_name() %></td>
                                        <td><%= person.getUser_type()%></td>
                                        <td>
                                            <%
                                                if(person.getUser_type().equals("Employee")){
                                            %>
                                            <button class="btn btn-success">Promote to Manager</button>
                                            <%
                                                }else{
                                            %>
                                            <button class="btn btn-danger">Demote to Employee</button>
                                            <% } %>
                                        </td>
                                    </tr>
                                    <% } %>
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




        <!--Sweet Alert JS-->
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> 
        <!--<Bootstrap JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
    </body>
</html>
