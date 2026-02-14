<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FoodieHub | Login</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">

<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        font-family: 'Poppins', sans-serif;
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        background: linear-gradient(135deg, #0f2027, #203a43, #2c5364);
    }

    .login-container {
        width: 380px;
        padding: 40px;
        border-radius: 20px;
        backdrop-filter: blur(15px);
        background: rgba(255, 255, 255, 0.08);
        box-shadow: 0 15px 40px rgba(0,0,0,0.4);
        color: #fff;
        animation: fadeIn 0.8s ease-in-out;
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(20px); }
        to { opacity: 1; transform: translateY(0); }
    }

    .login-container h2 {
        text-align: center;
        margin-bottom: 25px;
        font-weight: 600;
    }

    .input-group {
        margin-bottom: 20px;
    }

    .input-group label {
        display: block;
        margin-bottom: 6px;
        font-size: 14px;
    }

    .input-group input {
        width: 100%;
        padding: 12px;
        border-radius: 10px;
        border: none;
        outline: none;
        font-size: 14px;
        background: rgba(255,255,255,0.15);
        color: #fff;
        transition: 0.3s;
    }

    .input-group input:focus {
        background: rgba(255,255,255,0.25);
        box-shadow: 0 0 10px #ff7043;
    }

    .btn-login {
        width: 100%;
        padding: 12px;
        border-radius: 12px;
        border: none;
        font-size: 16px;
        font-weight: 500;
        cursor: pointer;
        background: #ff7043;
        color: #fff;
        transition: 0.3s ease;
    }

    .btn-login:hover {
        background: #ff5722;
        transform: translateY(-2px);
        box-shadow: 0 8px 20px rgba(255,87,34,0.4);
    }

    .register-link {
        margin-top: 18px;
        text-align: center;
        font-size: 14px;
    }

    .register-link a {
        color: #ffab91;
        text-decoration: none;
        font-weight: 500;
    }

    .register-link a:hover {
        text-decoration: underline;
    }

    .error-message {
        margin-top: 15px;
        text-align: center;
        color: #ff6b6b;
        font-size: 14px;
        background: rgba(255, 0, 0, 0.1);
        padding: 8px;
        border-radius: 8px;
    }

    @media (max-width: 420px) {
        .login-container {
            width: 90%;
            padding: 30px;
        }
    }
</style>

</head>
<body>

<div class="login-container">
    <h2>🍽 FoodieHub Login</h2>

    <form action="login" method="post">

        <div class="input-group">
            <label>Email</label>
            <input type="email" name="email" placeholder="Enter your email" required>
        </div>

        <div class="input-group">
            <label>Password</label>
            <input type="password" name="password" placeholder="Enter your password" required>
        </div>

        <button type="submit" class="btn-login">Login</button>

    </form>

    <div class="register-link">
        New User? <a href="register.jsp">Create Account</a>
    </div>

    <% if(request.getAttribute("error") != null){ %>
        <div class="error-message">
            <%= request.getAttribute("error") %>
        </div>
    <% } %>

</div>

</body>
</html>
