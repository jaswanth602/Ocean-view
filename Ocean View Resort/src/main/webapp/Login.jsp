<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Staff Login | Ocean View Resort</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;700&family=Poppins:wght@300;400;500&display=swap" rel="stylesheet">

    <style>
        :root { --gold: #D4AF37; --navy: #0a192f; }
        body { 
            font-family: 'Poppins', sans-serif; 
            background: linear-gradient(rgba(0,15,30,0.65), rgba(0,15,30,0.65)), 
                        url('https://images.unsplash.com/photo-1542314831-068cd1dbfeeb?auto=format&fit=crop&w=1920&q=80');
            background-size: cover; background-position: center; height: 100vh;
            display: flex; flex-direction: column; overflow: hidden;
        }
        .login-card {
            background: rgba(10, 25, 47, 0.95); backdrop-filter: blur(15px);
            border: 1px solid rgba(212, 175, 55, 0.3); padding: 50px;
            width: 100%; max-width: 450px; box-shadow: 0 30px 60px rgba(0,0,0,0.8);
        }
        .gold-divider { height: 3px; width: 60px; background: var(--gold); margin: 20px auto; }
        .form-label { color: var(--gold); font-size: 0.85rem; letter-spacing: 2px; text-transform: uppercase; font-weight: 500; }
        .form-control { 
            background: rgba(255,255,255,0.05); border: 1px solid rgba(255,255,255,0.2); 
            color: white !important; border-radius: 0; padding: 12px; 
        }
        .form-control:focus { background: rgba(255,255,255,0.1); border-color: var(--gold); box-shadow: none; }
        .input-group-text { background: rgba(255,255,255,0.05); border: 1px solid rgba(255,255,255,0.2); border-left: none; color: var(--gold); cursor: pointer; }
        .btn-login { 
            background: var(--gold); color: black; border: none; width: 100%; 
            padding: 14px; font-weight: 800; letter-spacing: 3px; margin-top: 20px; transition: 0.4s; opacity: 0.5;
        }
        .btn-login:hover:not([disabled]) { background: white; transform: translateY(-2px); box-shadow: 0 10px 20px rgba(0,0,0,0.4); }
        .error-alert { 
            background: rgba(255, 77, 77, 0.15); border: 1px solid #ff4d4d; 
            color: #ff9999; padding: 10px; font-size: 0.85rem; text-align: center; margin-bottom: 20px; 
        }
        .val-msg { font-size: 0.75rem; margin-top: 5px; transition: 0.3s; }
        .text-invalid { color: #ff6b6b; }
        .text-valid { color: #51cf66; }
    </style>
</head>
<body>

    <div class="container d-flex flex-grow-1 justify-content-center align-items-center">
        <div class="login-card animate__animated animate__zoomIn">
            <div class="text-center">
                <h2 class="text-white font-serif" style="font-family: 'Playfair Display', serif;">Staff Login</h2>
                <div class="gold-divider"></div>
            </div>

            <% String error = request.getParameter("error"); 
               if(error != null) { %>
                <div class="error-alert animate__animated animate__shakeX">
                    <i class="bi bi-x-circle-fill me-2"></i>
                    <%= error.equals("db") ? "Connection error occurred!" : "Incorrect username or password!" %>
                </div>
            <% } %>

            <form action="LoginServlet" method="post" id="loginForm">
                <div class="mb-4">
                    <label class="form-label">Username</label>
                    <input type="text" name="username" class="form-control" placeholder="ID Number" required>
                </div>

                <div class="mb-2">
                    <label class="form-label">Password</label>
                    <div class="input-group">
                        <input type="password" name="password" id="password" class="form-control" placeholder="••••••••" required onkeyup="validatePassword()">
                        <span class="input-group-text" onclick="togglePassword()">
                            <i class="bi bi-eye-fill" id="toggleIcon"></i>
                        </span>
                    </div>
                    <div id="passValidation" class="val-msg text-invalid">
                        <i class="bi bi-info-circle me-1"></i> Minimum 8 characters required.
                    </div>
                </div>

                <button type="submit" class="btn-login" id="submitBtn" disabled>LOGIN</button>
            </form>
            
            <div class="text-center mt-4">
                <a href="Index.jsp" class="text-white-50 small text-decoration-none"><i class="bi bi-arrow-left me-2"></i>Back</a>
            </div>
        </div>
    </div>

    <script>
        function togglePassword() {
            const passwordField = document.getElementById("password");
            const toggleIcon = document.getElementById("toggleIcon");
            if (passwordField.type === "password") {
                passwordField.type = "text";
                toggleIcon.classList.replace("bi-eye-fill", "bi-eye-slash-fill");
            } else {
                passwordField.type = "password";
                toggleIcon.classList.replace("bi-eye-slash-fill", "bi-eye-fill");
            }
        }

        function validatePassword() {
            const pass = document.getElementById('password').value;
            const msg = document.getElementById('passValidation');
            const btn = document.getElementById('submitBtn');

            if (pass.length >= 8) {
                msg.innerHTML = '<i class="bi bi-check-circle me-1"></i> Security standards met.';
                msg.classList.replace('text-invalid', 'text-valid');
                btn.disabled = false;
                btn.style.opacity = "1";
            } else {
                msg.innerHTML = '<i class="bi bi-info-circle me-1"></i> Minimum 8 characters required.';
                msg.classList.replace('text-valid', 'text-invalid');
                btn.disabled = true;
                btn.style.opacity = "0.5";
            }
        }
    </script>
</body>
</html>