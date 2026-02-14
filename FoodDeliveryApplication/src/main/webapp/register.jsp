<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FoodieHub | Register</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">

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
        background: linear-gradient(135deg, #141e30, #243b55);
        overflow: hidden;
    }

    .register-container {
        width: 380px;
        padding: 40px;
        border-radius: 20px;
        background: rgba(255, 255, 255, 0.08);
        backdrop-filter: blur(15px);
        box-shadow: 0 20px 50px rgba(0, 0, 0, 0.6);
        color: white;
        animation: fadeIn 0.8s ease-in-out;
    }

    .register-container h2 {
        text-align: center;
        margin-bottom: 25px;
        font-weight: 600;
        color: #ff7043;
    }

    .input-group {
        margin-bottom: 20px;
        position: relative;
    }

    .input-group input {
        width: 100%;
        padding: 12px 15px;
        border-radius: 10px;
        border: 1px solid rgba(255,255,255,0.2);
        background: rgba(255,255,255,0.1);
        color: white;
        font-size: 14px;
        transition: 0.3s;
    }

    .input-group input:focus {
        outline: none;
        border-color: #ff7043;
        box-shadow: 0 0 10px rgba(255,112,67,0.6);
    }

    .input-group input::placeholder {
        color: #ccc;
    }

    .register-btn {
        width: 100%;
        padding: 12px;
        border-radius: 12px;
        border: none;
        background: #ff7043;
        color: white;
        font-size: 15px;
        font-weight: 600;
        cursor: pointer;
        transition: 0.3s;
    }

    .register-btn:hover {
        background: #ff5722;
        transform: translateY(-3px);
        box-shadow: 0 8px 25px rgba(255,87,34,0.5);
    }

    .login-link {
        text-align: center;
        margin-top: 18px;
        font-size: 14px;
    }

    .login-link a {
        color: #ffab91;
        text-decoration: none;
        font-weight: 500;
        transition: 0.3s;
    }

    .login-link a:hover {
        color: #ffffff;
    }

    @keyframes fadeIn {
        from {
            opacity: 0;
            transform: translateY(30px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }

    @media(max-width: 480px) {
        .register-container {
            width: 90%;
            padding: 30px;
        }
    }
</style>
</head>

<body>

<div class="register-container">
    <h2>Create Account</h2>

    <form action="register" method="post">

        <div class="input-group">
            <input type="text" name="username" placeholder="Full Name" required>
        </div>

        <div class="input-group">
            <input type="email" name="email" placeholder="Email Address" required>
        </div>

        <div class="input-group">
            <input type="text" name="phone" placeholder="Phone Number" required>
        </div>

        <div class="input-group">
            <input type="password" name="password" placeholder="Password" required>
        </div>

        <div class="input-group">
            <input type="text" name="address" placeholder="Address" required>
        </div>

        <button type="submit" class="register-btn">Register</button>
    </form>

    <div class="login-link">
        Already have an account? 
        <a href="login.jsp">Login</a>
    </div>
</div>

</body>
</html>
