/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.mail;

import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;

/**
 *
 * @author ADMIN
 */
public class MailDAO {
    private static String subject = "Your reset code";
    
    public void sendMail(String to, String msg, final String user, final String pass){
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        
        Session session = Session.getInstance(props, new javax.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication(){
                return new PasswordAuthentication(user, pass);
            }
        });
        
        try{
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(user));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            message.setSubject(subject);
            message.setContent(msg, "text/html");
            
            Transport.send(message);
        } catch (MessagingException e){
            e.printStackTrace();
        }
    }

}
