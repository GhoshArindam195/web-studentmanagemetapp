
package com.web_employeemanagementsystem.entities;

public class Employee
{
    private int emp_id;
    private String emp_name;
    private String emp_address;
    private String emp_dept;
    private String emp_phone;
    private String emp_email;
    private int salary;

    public Employee(int emp_id, String emp_name, String emp_address, String emp_dept, String emp_phone, String emp_email, int salary) {
        this.emp_id = emp_id;
        this.emp_name = emp_name;
        this.emp_address = emp_address;
        this.emp_dept = emp_dept;
        this.emp_phone = emp_phone;
        this.emp_email = emp_email;
        this.salary = salary;
    }

    public Employee(String emp_name, String emp_address, String emp_dept, String emp_phone, String emp_email, int salary) {
        this.emp_name = emp_name;
        this.emp_address = emp_address;
        this.emp_dept = emp_dept;
        this.emp_phone = emp_phone;
        this.emp_email = emp_email;
        this.salary = salary;
    }

    public Employee() {

    }

    public int getEmp_id() {
        return emp_id;
    }

    public String getEmp_name() {
        return emp_name;
    }

    public String getEmp_address() {
        return emp_address;
    }

    public String getEmp_dept() {
        return emp_dept;
    }

    public String getEmp_phone() {
        return emp_phone;
    }

    public String getEmp_email() {
        return emp_email;
    }

    public int getSalary() {
        return salary;
    }

    public void setEmp_name(String emp_name) {
        this.emp_name = emp_name;
    }

    public void setEmp_address(String emp_address) {
        this.emp_address = emp_address;
    }

    public void setEmp_dept(String emp_dept) {
        this.emp_dept = emp_dept;
    }

    public void setEmp_phone(String emp_phone) {
        this.emp_phone = emp_phone;
    }

    public void setEmp_email(String emp_email) {
        this.emp_email = emp_email;
    }

    public void setSalary(int salary)
    {
        this.salary = salary;
    }
}
