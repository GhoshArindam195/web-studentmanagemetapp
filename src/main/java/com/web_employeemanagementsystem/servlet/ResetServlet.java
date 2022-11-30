
package com.web_employeemanagementsystem.servlet;

import com.web_employeemanagementsystem.dao.UserDao;
import com.web_employeemanagementsystem.email.GoogleTest;
import com.web_employeemanagementsystem.helper.Helper;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "resetServlet", urlPatterns = {"/resetServlet"})
public class ResetServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) 
        {
            String email = request.getParameter("email");
            
            if(UserDao.isEmailExists(email))
            {
                //Generate a Random Password
                String randomPwd = Helper.get_Random_Password(10);
                
                //Update that random generated pwd to db table for that email user
                UserDao.updatePasswordbyEmail(email, randomPwd);
                
                //Send an email mentioning the System generated pwd with a message to change it by the user.
                String recipient = email;
                String subject = "Password Reset for Employee Management App";
                String content = randomPwd;
                try
                {
                    new GoogleTest().sendSSLMessage(new String[]{recipient}, subject, content);
                } 
                catch (Exception ex)
                {
                    ex.printStackTrace();
                    out.print("Failed");
                }
                //Email code end..................
                
                out.print("Success");
 
            }
            else
            {
                out.print("not exist");
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

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
