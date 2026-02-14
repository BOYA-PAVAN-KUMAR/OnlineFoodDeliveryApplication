<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Success</title>

<!-- Google Font -->
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">

<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Poppins', sans-serif;
}

body {
    height: 100vh;
    background: linear-gradient(135deg, #0f2027, #203a43, #2c5364);
    display: flex;
    justify-content: center;
    align-items: center;
    overflow: hidden;
}

/* Glass Card */
.card {
    background: rgba(255, 255, 255, 0.08);
    backdrop-filter: blur(15px);
    padding: 50px 60px;
    border-radius: 20px;
    text-align: center;
    color: #fff;
    box-shadow: 0 15px 40px rgba(0,0,0,0.5);
    animation: fadeIn 1s ease forwards;
    transform: scale(0.8);
}

/* Animation */
@keyframes fadeIn {
    to {
        opacity: 1;
        transform: scale(1);
    }
}

/* Success Icon */
.checkmark {
    font-size: 80px;
    color: #00ff9d;
    margin-bottom: 20px;
    animation: pop 0.6s ease-in-out;
}

@keyframes pop {
    0% { transform: scale(0); }
    70% { transform: scale(1.2); }
    100% { transform: scale(1); }
}

h2 {
    font-weight: 600;
    margin-bottom: 15px;
}

p {
    font-weight: 300;
    margin-bottom: 30px;
    color: #ddd;
}

/* Button */
.btn {
    text-decoration: none;
    padding: 12px 30px;
    border-radius: 30px;
    background: linear-gradient(45deg, #00ff9d, #00c3ff);
    color: #000;
    font-weight: 600;
    transition: 0.4s;
    display: inline-block;
}

.btn:hover {
    transform: translateY(-5px);
    box-shadow: 0 10px 25px rgba(0, 255, 157, 0.5);
}

/* Floating circles background effect */
body::before,
body::after {
    content: '';
    position: absolute;
    border-radius: 50%;
    background: rgba(0,255,157,0.1);
    animation: float 6s infinite ease-in-out;
}

body::before {
    width: 300px;
    height: 300px;
    top: -100px;
    left: -100px;
}

body::after {
    width: 400px;
    height: 400px;
    bottom: -150px;
    right: -150px;
    animation-delay: 3s;
}

@keyframes float {
    0%,100% { transform: translateY(0px); }
    50% { transform: translateY(30px); }
}

</style>

</head>
<body>

<div class="card">
    <div class="checkmark">✔</div>
    <h2>Order Placed Successfully!</h2>
    <p>Your delicious food is on its way 🚀</p>
    <a href="restaurants" class="btn">Go Back to Menu</a>
</div>

</body>
</html>
