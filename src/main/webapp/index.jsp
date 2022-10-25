
<%@page import="java.util.List"%>
<%@page import="com.web_employeemanagementsystem.entities.Employee"%>
<%@page import="com.web_employeemanagementsystem.dao.EmployeeDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>App index</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">

        <!--Customized CSS-->
        <link rel="stylesheet" href="css/custom.css"/>

        <!--Font Awesome CSS-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    </head>
    <body>

        <%
            List<Employee> emps = EmployeeDao.getEmployees();
        %>



        <!--Navbar-->
        <%@include file="normal_nav.jsp" %>
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
                            <%
                                for (Employee emp : emps) {
                            %>
                            <tr>
                                <th scope="row"> <%= emp.getEmp_id()%> </th>
                                <td><%= emp.getEmp_name()%></td>

                                <td><%= emp.getEmp_dept()%></td>
                                <td><%= emp.getEmp_phone()%></td>
                                <td><%= emp.getEmp_email()%></td>
                                <td><%= emp.getSalary()%></td>
                                <td>
                                    <a href="updateEmployee.jsp?emp_id=<%= emp.getEmp_id() %>" class="btn btn-warning">Update</a>
                                    <a href="#" class="btn btn-danger">Delete</a>
                                </td>
                            </tr>
                            <%}%>
                        </tbody>
                    </table>
                    <!--</div>-->
                </div>
            </div>
        </div>




        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
    </body>
</html>
