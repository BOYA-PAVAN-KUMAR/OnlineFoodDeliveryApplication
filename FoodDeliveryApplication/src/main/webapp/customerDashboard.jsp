<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.fda.models.Users" %>
<%
Users user = (Users) session.getAttribute("user");

if(user == null || !"CUSTOMER".equalsIgnoreCase(user.getRole())){
    response.sendRedirect("login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FoodieHub | Customer Dashboard</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">

<style>
*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Poppins',sans-serif;
}

body{
    background: linear-gradient(135deg,#0f2027,#203a43,#2c5364);
    color:#fff;
    min-height:100vh;
}

/* HEADER */
header{
    display:flex;
    justify-content:space-between;
    align-items:center;
    padding:20px 60px;
    background:rgba(255,255,255,0.05);
    backdrop-filter:blur(10px);
}

.logo{
    font-size:22px;
    font-weight:700;
    color:#00ffcc;
}

.logout-btn{
    background:#ff4b5c;
    padding:8px 18px;
    border-radius:20px;
    text-decoration:none;
    color:#fff;
    font-weight:500;
    transition:0.3s;
}

.logout-btn:hover{
    background:#ff1e38;
}

/* WELCOME */
.welcome{
    padding:60px 60px 20px;
}

.welcome h1{
    font-size:32px;
    font-weight:600;
}

.welcome span{
    color:#00ffcc;
}

.welcome p{
    margin-top:8px;
    color:#bbb;
}

/* DASHBOARD GRID */
.container{
    padding:40px 60px 60px;
}

.grid{
    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(250px,1fr));
    gap:30px;
}

.card{
    background:rgba(255,255,255,0.08);
    backdrop-filter:blur(15px);
    border-radius:20px;
    padding:30px;
    text-align:center;
    cursor:pointer;
    transition:all 0.4s ease;
    box-shadow:0 10px 30px rgba(0,0,0,0.4);
}

.card:hover{
    transform:translateY(-12px);
    box-shadow:0 20px 50px rgba(0,0,0,0.6);
}

.card h3{
    margin-bottom:12px;
    font-size:20px;
}

.card p{
    font-size:14px;
    color:#ccc;
}

.card-icon{
    font-size:40px;
    margin-bottom:15px;
}

/* RESPONSIVE */
@media(max-width:768px){
    header,.welcome,.container{
        padding-left:25px;
        padding-right:25px;
    }
}
</style>

</head>
<body>

<!-- HEADER -->
<header>
    <div class="logo">🍴 FoodieHub</div>
    <a href="logout" class="logout-btn">Logout</a>
</header>

<!-- WELCOME SECTION -->
<div class="welcome">
    <h1>Welcome, <span><%= user.getUserName() %></span> 👋</h1>
    <p>Ready to explore delicious food today?</p>
</div>

<!-- DASHBOARD CARDS -->
<div class="container">
    <div class="grid">

        <div class="card" onclick="location.href='restaurants'">
            <div class="card-icon">🍽</div>
            <h3>Browse Restaurants</h3>
            <p>Explore top rated restaurants near you</p>
        </div>

        <div class="card" onclick="location.href='viewCart.jsp'">
            <div class="card-icon">🛒</div>
            <h3>My Cart</h3>
            <p>View and manage your cart items</p>
        </div>

        <div class="card" onclick="location.href='orders.jsp'">
            <div class="card-icon">📦</div>
            <h3>My Orders</h3>
            <p>Track your previous and current orders</p>
        </div>

        <div class="card" onclick="location.href='profile.jsp'">
            <div class="card-icon">👤</div>
            <h3>My Profile</h3>
            <p>Update your personal information</p>
        </div>

    </div>
</div>

</body>
</html>
