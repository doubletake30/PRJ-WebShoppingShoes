/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controllers;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;
import sample.user.UserDAO;
import sample.user.UserDTO;
import sample.user.UserFaceBookDTO;
import sample.utils.Constants;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "LoginFaceBookController", urlPatterns = {"/LoginFaceBookController"})
public class LoginFaceBookController extends HttpServlet {

    private static final String ERROR = "login.jsp";
    private static final String SUCCESS = "user.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String code = request.getParameter("code");
            String error = request.getParameter("error");
            String accessToken = getToken(code);
            UserFaceBookDTO userFacebook = getUserInfo(accessToken);
            HttpSession session = request.getSession();
            if (error != null) {
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
            if (userFacebook != null) {
                url = SUCCESS;
                UserDAO userDAO = new UserDAO();
                UserDTO newUser = new UserDTO(userFacebook.getEmail(), userFacebook.getName(), userFacebook.getEmail(), "US", "1");
                boolean checkDuplicate = userDAO.checkDuplicate(userFacebook.getEmail());
                if (!checkDuplicate) {
                    userDAO.insert(newUser);
                }
                session.setAttribute("LOGIN_USER", newUser);
            }
        } catch (Exception e) {
            log("Error at LoginFaceBookController: " + e.toString());
        } finally {
            response.sendRedirect(url);
        }
    }

    public static String getToken(String code) throws ClientProtocolException, IOException {
        String response = Request.Post(Constants.FACEBOOK_LINK_GET_TOKEN)
                .bodyForm(
                        Form.form()
                                .add("client_id", Constants.FACEBOOK_CLIENT_ID)
                                .add("client_secret", Constants.FACEBOOK_CLIENT_SECRET)
                                .add("redirect_uri", Constants.FACEBOOK_REDIRECT_URI)
                                .add("code", code)
                                .build()
                )
                .execute().returnContent().asString();
        JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
        String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");
        return accessToken;
    }

    public static UserFaceBookDTO getUserInfo(final String accessToken) throws ClientProtocolException, IOException {
        String link = Constants.FACEBOOK_LINK_GET_USER_INFO + accessToken;
        String response = Request.Get(link).execute().returnContent().asString();
        UserFaceBookDTO fbAccount = new Gson().fromJson(response, UserFaceBookDTO.class);
        return fbAccount;
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
