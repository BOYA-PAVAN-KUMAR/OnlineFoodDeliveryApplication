<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FoodieHub | Login</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:'Poppins',sans-serif;
}

body{
height:100vh;
background: url('<%=request.getContextPath()%>/images/allImages/burger.png') no-repeat center center/cover;
position:relative;
color:white;
}

/* DARK OVERLAY */
body::before{
content:"";
position:absolute;
width:100%;
height:100%;
background:rgba(0,0,0,0.65);
z-index:0;
}

/* NAVBAR */
.navbar{
position:absolute;
top:20px;
left:50%;
transform:translateX(-50%);
width:90%;
background:rgba(255,255,255,0.05);
backdrop-filter:blur(12px);
border-radius:20px;
padding:18px 40px;
display:flex;
justify-content:space-between;
align-items:center;
z-index:2;
}

.logo{
font-size:24px;
font-weight:700;
color:#ff7a00;
}

.logo span{
color:white;
}

.nav-links{
display:flex;
gap:40px;
}

.nav-links a{
text-decoration:none;
color:#ddd;
font-weight:500;
position:relative;
}

.nav-links a.active{
color:#ff7a00;
}

.nav-links a.active::after{
content:"";
position:absolute;
bottom:-6px;
left:0;
width:100%;
height:3px;
background:#ff7a00;
border-radius:5px;
}

/* LOGIN SECTION */

.container{
position:relative;
z-index:2;
height:100%;
display:flex;
justify-content:center;
align-items:center;
}

.login-box{
width:420px;
padding:40px;
background:rgba(255,255,255,0.08);
border-radius:20px;
backdrop-filter:blur(20px);
box-shadow:0 15px 40px rgba(0,0,0,0.6);
animation:fadeIn 0.8s ease-in-out;
}

@keyframes fadeIn{
from{opacity:0;transform:translateY(20px);}
to{opacity:1;transform:translateY(0);}
}

.login-box h2{
margin-bottom:30px;
font-size:26px;
font-weight:600;
}

.login-box h2 span{
color:#ff7a00;
}

/* INPUT */

.input-group{
margin-bottom:20px;
position:relative;
}

.input-group i{
position:absolute;
top:50%;
left:15px;
transform:translateY(-50%);
color:#aaa;
}

.input-group input{
width:100%;
padding:12px 12px 12px 45px;
border-radius:12px;
border:none;
outline:none;
background:rgba(255,255,255,0.12);
color:white;
}

.input-group input:focus{
background:rgba(255,255,255,0.2);
box-shadow:0 0 8px #ff7a00;
}

/* LOGIN BUTTON */

.btn-login{
width:100%;
padding:12px;
border:none;
border-radius:12px;
background:#ff7a00;
color:white;
font-weight:600;
cursor:pointer;
transition:0.3s;
margin-top:10px;
}

.btn-login:hover{
background:#ff6200;
transform:translateY(-2px);
box-shadow:0 10px 20px rgba(255,122,0,0.4);
}

/* EXTRA OPTIONS */

.options{
display:flex;
justify-content:space-between;
align-items:center;
margin-top:15px;
font-size:14px;
}

.options a{
color:#ff7a00;
text-decoration:none;
}

.options a:hover{
text-decoration:underline;
}

.register{
margin-top:25px;
text-align:center;
font-size:14px;
}

.register a{
color:#ff7a00;
font-weight:500;
text-decoration:none;
}

.register a:hover{
text-decoration:underline;
}

.error-message{
margin-top:15px;
text-align:center;
color:#ff6b6b;
font-size:14px;
background:rgba(255,0,0,0.1);
padding:8px;
border-radius:8px;
}

</style>
</head>

<body>

<!-- NAVBAR -->
<div class="navbar">
<div class="logo">🍴 Foodie<span>Hub</span></div>

<div class="nav-links">
<a href="home.jsp">Home</a>
<a href="restaurants.jsp">Restaurants</a>
<a href="#">My Orders</a>
<a href="#" class="active">Login</a>
</div>
</div>

<!-- LOGIN BOX -->
<div class="container">
<div class="login-box">

<h2><span>Login</span> to Your Account</h2>

<form action="login" method="post">

<div class="input-group">
<i class="fa-solid fa-envelope"></i>
<input type="email" name="email" placeholder="Enter your email" required>
</div>

<div class="input-group">
<i class="fa-solid fa-lock"></i>
<input type="password" name="password" placeholder="Enter your password" required>
</div>

<button type="submit" class="btn-login">Login</button>

<div class="options">
<label>
<input type="checkbox"> Remember Me
</label>
<a href="#">Forgot Password?</a>
</div>

</form>

<div class="register">
Don't have an account? <a href="register.jsp">Register</a>
</div>

<% if(request.getAttribute("error") != null){ %>
<div class="error-message">
<%= request.getAttribute("error") %>
</div>
<% } %>

</div>
</div>

</body>
</html>