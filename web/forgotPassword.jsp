<%-- 
    Document   : forgotPassword
    Created on : Jul 9, 2024, 11:32:49 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Forgot Password</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/forgotPassword.css">
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-md-4 offset-md-4 form">
                    <form action="MainController" method="POST" >
                        <h2 class="text-center">Forgot Password</h2>
                        <p class="text-center">Enter your email address</p>
                        <p class ="text-center text-danger">${requestScope.ERROR_MAIL}</p>
                        <div class="form-group">
                            <input class="form-control" type="text" name="email" placeholder="Enter email address" required>
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn-lg btn-primary w-100 fs-6" name="action" value="ForgotPassword">Continute</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

    </body>
</html>
