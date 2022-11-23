
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

@WebServlet(name = "verificationServlet", urlPatterns = {"/verificationServlet"})
public class VerificationServlet extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           
            
            String first = request.getParameter("first");
            String second = request.getParameter("second");
            String third = request.getParameter("third");
            String fourth = request.getParameter("fourth");
            String fifth = request.getParameter("fifth");
            String sixth = request.getParameter("sixth");
            
            String userSubmittedOTP = first+second+third+fourth+fifth+sixth;
            System.out.println(userSubmittedOTP);
            
            String originalOTP = request.getSession().getAttribute("otp").toString();
            System.out.println(originalOTP);
            
            
            if(userSubmittedOTP.equals(originalOTP))
            {
                User user = (User)request.getSession().getAttribute("user");
                UserDao.makeVaifiedEmail(user.getUser_id());
                user.setIs_verified(true);
                request.getSession().setAttribute("user", user);
                
                
                response.sendRedirect("home.jsp");
                
                
            }
            else
            {
                request.getSession().removeAttribute("msg");
                request.getSession().setAttribute("msg", "Incorrect OTP!!_bg-danger");
                response.sendRedirect("emailVerification.jsp");
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
