package com.web_employeemanagementsystem.servlet;

import com.web_employeemanagementsystem.dao.UserDao;
import com.web_employeemanagementsystem.entities.User;
import com.web_employeemanagementsystem.helper.ValidateForm;

import java.io.IOException;

import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "registerServlet", urlPatterns = {"/registerServlet"})
public class RegisterServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String user_name = request.getParameter("user_name");
            String user_email = request.getParameter("user_email");
            String user_pwd = request.getParameter("user_pwd");
            String repeat_user_pwd = request.getParameter("repeat_user_pwd");
            String user_type = request.getParameter("user_type");

            User user = new User(user_name, user_email, user_pwd, user_type, false);

            HttpSession httpSession = request.getSession();

            //Name Validation..................
            if (!ValidateForm.validateName(user_name)) {
                httpSession.setAttribute("msg", "Invalid Name!!");
                response.sendRedirect("register.jsp");
            }
            if (!ValidateForm.validateEmail(user_email)) {
                httpSession.setAttribute("msg", "Invalid Email!!");
                response.sendRedirect("register.jsp");
            }

            int responseVal = ValidateForm.validatePwds(user_pwd, repeat_user_pwd);
            if (responseVal == 1) {
                httpSession.setAttribute("msg", "Passwords did not match!!");
                response.sendRedirect("register.jsp");
            } else if (responseVal == 2) {
                httpSession.setAttribute("msg", "Invalid Password.");
                response.sendRedirect("register.jsp");
            }

            if (UserDao.saveUser(user)) {
                httpSession.setAttribute("msg", "Hurray!! Successfully Registered!!_bg-success");
                response.sendRedirect("login.jsp");
            } else {
                httpSession.setAttribute("msg", "Email is already resgistered!! Please use another email");
                response.sendRedirect("register.jsp");
            }
        }
    }

// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        processRequest(request, response);

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
