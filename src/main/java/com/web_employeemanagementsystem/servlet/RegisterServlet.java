package com.web_employeemanagementsystem.servlet;

import com.web_employeemanagementsystem.dao.UserDao;
import com.web_employeemanagementsystem.entities.User;

import java.io.IOException;

import java.io.PrintWriter;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "registerServlet", urlPatterns = {"/registerServlet"})
public class RegisterServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String user_name = request.getParameter("user_name");
            String user_email = request.getParameter("user_email");
            String user_pwd = request.getParameter("user_pwd");
            String user_type = request.getParameter("user_type");

            User user = new User(user_name, user_email, user_pwd, user_type, false);
            if (UserDao.saveUser(user))
            {
                 response.sendRedirect("login.jsp");
            } else {
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
