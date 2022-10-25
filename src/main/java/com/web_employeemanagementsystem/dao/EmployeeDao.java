package com.web_employeemanagementsystem.dao;

import com.web_employeemanagementsystem.entities.Employee;
import com.web_employeemanagementsystem.helper.CP;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class EmployeeDao {

    public static boolean insertEmployee(Employee emp) {
        boolean f = false;
        try {
            Connection con = CP.getCon();

            String query = "INSERT INTO employees(emp_name, emp_address, emp_dept, emp_phone, emp_email, salary) values(?,?,?,?,?,?)";

            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, emp.getEmp_name());   //emp.emp_name
            pstmt.setString(2, emp.getEmp_address());
            pstmt.setString(3, emp.getEmp_dept());
            pstmt.setString(4, emp.getEmp_phone());
            pstmt.setString(5, emp.getEmp_email());
            pstmt.setInt(6, emp.getSalary());

            pstmt.executeUpdate();

            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public static boolean deleteEmployee(int emp_id) {
        boolean f = false;
        try {
            Connection conn = CP.getCon();
            String query = "DELETE FROM EMPLOYEES WHERE EMP_ID=" + emp_id;
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public static List<Employee> getEmployees() {
        List<Employee> employees = new ArrayList<Employee>();
        try {

            Connection con = CP.getCon();
            String query = "SELECT * FROM Employees";
            Statement stmt = con.createStatement();
            ResultSet set = stmt.executeQuery(query);
            Employee emp = null;
            while (set.next()) {
                emp = new Employee(set.getInt(1), set.getString(2), set.getString(3), set.getString(4), set.getString(5), set.getString(6), set.getInt(7));
                employees.add(emp);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return employees;
    }

    public static boolean updateEmployees(int emp_id, int op, String newVal) {
        boolean flag = false;
        try {
            Connection con = CP.getCon();
            if (op == 1) //Updating Name
            {
//                String query = "UPDATE EMPLOYEES SET EMP_NAME = ? where emp_id = ?";

                String query = "UPDATE EMPLOYEES SET EMP_NAME = '" + newVal + "' where emp_id = " + emp_id;
                PreparedStatement pstmt = con.prepareStatement(query);
//                pstmt.setString(1, newVal);
//                pstmt.setInt(1, emp_id);
                pstmt.executeUpdate();
                flag = true;
            } else if (op == 2) {
                String sql = "UPDATE employees SET emp_address = '" + newVal + "' where emp_id = " + emp_id;
                PreparedStatement stmt = con.prepareStatement(sql);
                stmt.executeUpdate();
                flag = true;
            } else if (op == 3) {
                String sql = "UPDATE employees SET emp_dept = '" + newVal + "' where emp_id = " + emp_id;
                PreparedStatement stmt = con.prepareStatement(sql);
                stmt.executeUpdate();
                flag = true;
            } else if (op == 4) {
                String sql = "UPDATE employees SET emp_phone = '" + newVal + "' where emp_id = " + emp_id;
                PreparedStatement stmt = con.prepareStatement(sql);
                stmt.executeUpdate();
                flag = true;
            } else if (op == 5) {
                String sql = "UPDATE employees SET emp_email = '" + newVal + "' where emp_id = " + emp_id;
                PreparedStatement stmt = con.prepareStatement(sql);
                stmt.executeUpdate();
                flag = true;
            } else if (op == 6) {
                String query = "Update Employees Set salary = " + newVal + " where emp_id = " + emp_id;
                PreparedStatement pstmt = con.prepareStatement(query);
                pstmt.executeUpdate();
                flag = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;
    }

    public static Employee getEmployee(int emp_id) {
        Employee emp = null;
        try {
            Connection con = CP.getCon();
            String sql = "SELECT * FROM EMPLOYEES WHERE emp_id=" + emp_id;
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            if (rs.next()) {
                emp = new Employee(emp_id, rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getInt(7));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return emp;
    }
}
