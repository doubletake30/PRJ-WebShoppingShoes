/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.user;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author ADMIN
 */
public class UserErrorDAO {

    public boolean isValidEmail(String email) {
        // Biểu thức chính quy cho định dạng email
        String emailRegex = "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Z|a-z]{2,}$";

        // Tạo đối tượng Pattern
        Pattern pattern = Pattern.compile(emailRegex);

        // Tạo đối tượng Matcher
        Matcher matcher = pattern.matcher(email);

        // Kiểm tra chuỗi với biểu thức chính quy
        return matcher.matches();
    }
}
