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


@WebServlet(name = "changePasswordServlet", urlPatterns = {"/changePasswordServlet"})
public class ChangePasswordServlet extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            HttpSession session = request.getSession();
            User user = (User)session.getAttribute("user");
            
            String newPwd = request.getParameter("newpwd");
            String repeatPwd = request.getParameter("repeatPwd");
            
            int responseVal = ValidateForm.validatePwds(newPwd, repeatPwd);
            if (responseVal == 1) {
                out.print("passwords did not match");
            } else if (responseVal == 2) {
                out.print("invalid password");
            }
            else
            {
                if(UserDao.updatePasswordbyEmail(user.getUser_email(), newPwd))
                {
                    out.print("success");
                }
                else
                {
                    out.print("failed");
                }
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
