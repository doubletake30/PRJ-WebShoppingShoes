<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <link rel="stylesheet" href="css/login.css">
        <title>Login</title>
    </head>
    <body>

        <div class="container d-flex justify-content-center align-items-center min-vh-100">
            <div class="row border rounded-5 p-3 bg-white shadow box-area">
                <div class="col-md-6 rounded-4 d-flex justify-content-center align-items-center flex-column left-box" style="">
                    <img src="assets/wp7713761.jpg" class="img-fluid" style="width: 100%;">
                </div> 
                <div class="col-md-6 right-box">
                    <div class="row align-items-center">
                        <div class="header-text mb-4">
                            <h2>Hello, Again</h2>
                            <p>We are happy to have you back.</p>
                        </div>
                        <form action="MainController" method="POST" id ="login-form">
                            <div class="input-group mb-3">
                                <input type="text" class="form-control form-control-lg bg-light fs-6" placeholder="User ID" id="userID" name="userID" required>
                            </div>
                            <div class="input-group mb-1">
                                <input type="password" class="form-control form-control-lg bg-light fs-6" placeholder="Password" id="password" name="password" required>
                            </div>
                            <div class="input-group mb-3 d-flex justify-content-between">
                                <div class="form-check">
                                    <input type="checkbox" class="form-check-input" id="formCheck">
                                    <label for="formCheck" class="form-check-label text-secondary"><small>Remember Me</small></label>
                                </div>
                                <div class="forgot">
                                    <small><a href="MainController?action=ForgotPassword">Forgot Password?</a></small>
                                </div>
                            </div>
                            <div class="g-recaptcha" data-sitekey="6LcFcQsqAAAAAAsA060dMWw7rrmq4YQuytVXcRmp" style="display:flex; justify-content: center;"></div>
                            <div id="error"></div>
                            <div class="input-group mb-3">
                                <button type="submit" class="btn btn-lg btn-primary w-100 fs-6" name="action" value="Login" style="margin-top: 20px;">Login</button>
                            </div>
                        </form>
                        <div class="input-group mb-3">
                            <a href="https://accounts.google.com/o/oauth2/auth?scope=openid%20email%20profile&redirect_uri=http://localhost:8080/SE182028_Assignment/LoginGoogleController&response_type=code
                               &client_id=339200532962-i91mich9qruh2p0t8d791f2bs3a081tn.apps.googleusercontent.com&approval_prompt=force" class="btn btn-lg btn-light w-100 fs-6">
                                <img src="assets/google.png" style="width:20px" class="me-2">
                                <small>Sign In with Google</small>
                            </a>
                        </div>

                        <div class="input-group mb-3">
                            <a href="https://www.facebook.com/v19.0/dialog/oauth?fields=id,name,emails&client_id=346460678505348&redirect_uri=http://localhost:8080/SE182028_Assignment/LoginFaceBookController&scope=email" class="btn btn-lg btn-light w-100 fs-6">
                                <img src="assets/facebook.png" style="width:20px" class="me-2">
                                <small>Sign In with Facebook</small>
                            </a>
                        </div>
                        <div class="row">
                            <small>Don't have account? <a href="MainController?action=Create">Sign Up</a></small>
                            <small>Shopping now <a href="MainController?action=Shopping_Page">Go to Tu Tu Store</a></small>
                        </div>
                        <div class="text-center text-danger">
                            ${requestScope.ERROR_LOGIN_USER}
                            ${requestScope.ERROR}
                        </div>
                        <div>
                            <a href="MainController?action=Top1">
                                <div>Top1</div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://www.google.com/recaptcha/api.js" async defer></script>
        <script>
            window.onload = function () {
                const form = document.getElementById("login-form");
                const error = document.getElementById("error");

                form.addEventListener("submit", function (event) {
                    const response = grecaptcha.getResponse();
                    if (!response) {
                        event.preventDefault();
                        error.innerHTML = "Please complete the reCAPTCHA.";
                    }
                });
            }
        </script>
    </body>
</html>