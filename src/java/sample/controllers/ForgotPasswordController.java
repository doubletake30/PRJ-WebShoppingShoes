/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controllers;

import java.io.IOException;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sample.mail.MailDAO;
import sample.user.UserErrorDAO;
import sample.utils.SecurityMail;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "ForgotPasswordController", urlPatterns = {"/ForgotPasswordController"})
public class ForgotPasswordController extends HttpServlet {

    private static final String ERROR = "forgotPassword.jsp";
    private static final String SUCCESS = "resetCode.jsp";
    private static final String ERROR_MAIL_MESSAGE = "This email address does not exit!";
    private static final int max = 999999;
    private static final int min = 100000;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            HttpSession session = request.getSession();
            String email = request.getParameter("email");
            UserErrorDAO dao = new UserErrorDAO();
            if (dao.isValidEmail(email)) {
                url = SUCCESS;
                session.setAttribute("MAIL_CODE", email);
                SecurityMail securityMail = new SecurityMail();
                MailDAO mailDAO = new MailDAO();
                Random random = new Random();
                String code = String.valueOf(random.nextInt((max - min) + 1) + min);
                session.setAttribute("CODE", code);
                mailDAO.sendMail(email, code, securityMail.USER, securityMail.PASS);
            } else {
                request.setAttribute("ERROR_MAIL", ERROR_MAIL_MESSAGE);
            }
        } catch (Exception e) {
            log("Error at ForgotPasswordController: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).include(request, response);
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
