/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sample.user.UserDAO;
import sample.user.UserDTO;
import sample.user.UserErrorDAO;
import sample.user.UserErrorDTO;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "CreateController", urlPatterns = {"/CreateController"})
public class CreateController extends HttpServlet {

    private static final String ERROR = "create.jsp";
    private static final String SUCCESS = "login.html";
           
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        UserErrorDTO userError = new UserErrorDTO();
        try {
            UserDAO dao = new UserDAO();
            UserErrorDAO userErrorDAO = new UserErrorDAO();
            boolean checkValidation = true;
            String userID = request.getParameter("userID");
            String fullName = request.getParameter("fullName");
            String email = request.getParameter("email");
            String roleID = request.getParameter("roleID");
            String password = request.getParameter("password");
            String confirm = request.getParameter("confirm");
//          Validation            
            if (userID.length() < 2 || userID.length() > 10) {
                checkValidation = false;
                userError.setUserIDError("UserID must be between 2 and 10 characters");
            }
            
            if (fullName.length() < 5 || fullName.length() > 50) {
                checkValidation = false;
                userError.setFullNameError("Full Name must be between 5 and 50 characters");
            }
            
            if (!confirm.equals(password)) {
                checkValidation = false;
                userError.setConfirmError("Passwords do not match");
            }
            
            if (!userErrorDAO.isValidEmail(email)){
                checkValidation = false;
                userError.setConfirmError("Email is not match");
            }

            if (checkValidation) {
                UserDTO user = new UserDTO(userID, fullName, email, roleID, password);
                boolean checkInsert = dao.insert(user);
                if (checkInsert) {
                    url = SUCCESS;
                } else {
                    userError.setError("Unknown Error!");
                    request.setAttribute("REGISTER_ERROR", userError);
                }
            } else {
                request.setAttribute("REGISTER_ERROR", userError);
            }
                    
        } catch(Exception e) {
            log("Error at CreateController: " + e.toString());
            if(e.toString().contains("duplicate")) {
                userError.setUserIDError("Duplicate userID!");
                request.setAttribute("REGISTER_ERROR", userError);
            }
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
                    
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
