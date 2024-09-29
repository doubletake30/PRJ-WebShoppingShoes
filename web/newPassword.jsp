<%-- 
    Document   : newPassword
    Created on : Jul 9, 2024, 11:36:54 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New Password</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/forgotPassword.css">
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-md-4 offset-md-4 form">
                    <form action="MainController" method="POST">
                        <h2 class="text-center">New Password</h2>
                        <div class="alert alert-success text-center">
                            Please enter your new password
                        </div>
                        <div class="text-center text-danger">
                            ${requestScope.NEWPASSWORD_ERROR}
                        </div>
                        <div class="form-group">
                            <input class="form-control" type="password" name="password" placeholder="Create new password" required>
                        </div>
                        <div class="form-group">
                            <input class="form-control" type="password" name="cpassword" placeholder="Confirm your password" required>
                            <span class="error-message">${requestScope.REGISTER_ERROR.confirmError}</span>
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn-lg btn-primary w-100 fs-6" name="action" value="NewPassword">Submit</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
