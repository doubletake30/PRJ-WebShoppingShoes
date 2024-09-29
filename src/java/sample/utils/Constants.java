/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.utils;

/**
 *
 * @author ADMIN
 */
public class Constants {

    public static final String GOOGLE_CLIENT_ID = "339200532962-i91mich9qruh2p0t8d791f2bs3a081tn.apps.googleusercontent.com";

    public static final String GOOGLE_CLIENT_SECRET = "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";

    public static final String GOOGLE_REDIRECT_URI = "http://localhost:8080/SE182028_Assignment/LoginGoogleController";

    public static final String GOOGLE_LINK_GET_TOKEN = "https://accounts.google.com/o/oauth2/token";

    public static final String GOOGLE_LINK_GET_USER_INFO = "https://www.googleapis.com/oauth2/v1/userinfo?access_token=";

    public static final String GOOGLE_GRANT_TYPE = "authorization_code";

    public static final String FACEBOOK_CLIENT_ID = "346460678505348";
    
    public static final String FACEBOOK_CLIENT_SECRET = "ee60afba2f59835640310dcea25ced57";
    
    public static final String FACEBOOK_REDIRECT_URI = "http://localhost:8080/SE182028_Assignment/LoginFaceBookController";
    
    public static final String FACEBOOK_LINK_GET_TOKEN = "https://graph.facebook.com/v19.0/oauth/access_token";
    
    public static final String FACEBOOK_LINK_GET_USER_INFO = "https://graph.facebook.com/me?fields=id,name,email,picture&access_token=";
}
