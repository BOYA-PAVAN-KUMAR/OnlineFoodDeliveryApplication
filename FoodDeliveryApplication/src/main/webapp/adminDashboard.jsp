<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.fda.models.Users" %>

<%
Users user = (Users) session.getAttribute("user");

if(user == null || !"ADMIN".equalsIgnoreCase(user.getRole())){
    response.sendRedirect("login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FoodieHub | Admin Dashboard</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
}

body{
    font-family:'Poppins', sans-serif;
    min-height:100vh;
    background: linear-gradient(135deg, #0f2027, #203a43, #2c5364);
    color:#fff;
}

/* HEADER */
header{
    display:flex;
    justify-content:space-between;
    align-items:center;
    padding:20px 50px;
    background:rgba(0,0,0,0.4);
    backdrop-filter:blur(12px);
    box-shadow:0 5px 25px rgba(0,0,0,0.5);
}

header h1{
    font-size:22px;
    font-weight:600;
    color:#ff7043;
}

.logout-btn{
    text-decoration:none;
    background:#ff7043;
    padding:8px 18px;
    border-radius:8px;
    color:white;
    font-size:14px;
    transition:0.3s;
}

.logout-btn:hover{
    background:#ff5722;
    transform:translateY(-2px);
    box-shadow:0 6px 20px rgba(255,87,34,0.4);
}

/* DASHBOARD */
.dashboard-container{
    padding:50px;
}

.welcome-box{
    background:rgba(255,255,255,0.08);
    padding:25px;
    border-radius:18px;
    backdrop-filter:blur(15px);
    box-shadow:0 15px 40px rgba(0,0,0,0.5);
    margin-bottom:40px;
}

.welcome-box h2{
    font-weight:600;
}

.welcome-box span{
    color:#ffab91;
}

/* GRID */
.grid{
    display:grid;
    grid-template-columns:repeat(auto-fit, minmax(230px,1fr));
    gap:25px;
}

/* CARD */
.card{
    background:rgba(255,255,255,0.08);
    padding:30px;
    border-radius:20px;
    text-align:center;
    backdrop-filter:blur(12px);
    transition:0.3s ease;
    cursor:pointer;
    box-shadow:0 10px 35px rgba(0,0,0,0.4);
}

.card:hover{
    transform:translateY(-10px);
    background:rgba(255,255,255,0.15);
    box-shadow:0 20px 50px rgba(0,0,0,0.6);
}

.card-icon{
    font-size:38px;
    margin-bottom:15px;
}

.card h3{
    margin-bottom:10px;
    font-size:18px;
}

.card p{
    font-size:14px;
    color:#ccc;
}

/* RESPONSIVE */
@media(max-width:768px){
    header{
        padding:15px 25px;
    }

    .dashboard-container{
        padding:30px 20px;
    }
}

</style>
</head>

<body>

<header>
    <h1>🍽 FoodieHub Admin</h1>
    <a href="logout" class="logout-btn">Logout</a>
</header>

<div class="dashboard-container">

    <div class="welcome-box">
        <h2>Welcome Back, <span><%= user.getUserName() %></span> 👋</h2>
        <p>Manage your FoodieHub platform efficiently from here.</p>
    </div>

    <div class="grid">

        <!-- Manage Users -->
        <div class="card" onclick="location.href='users.jsp'">
            <div class="card-icon">👥</div>
            <h3>Manage Users</h3>
            <p>View, add, update or delete users</p>
        </div>

        <!-- Manage Restaurants -->
        <div class="card" onclick="location.href='restaurants'">
            <div class="card-icon">🏬</div>
            <h3>Manage Restaurants</h3>
            <p>Control restaurant listings</p>
        </div>

        <!-- Orders -->
        <div class="card" onclick="location.href='orders.jsp'">
            <div class="card-icon">🛒</div>
            <h3>View Orders</h3>
            <p>Track and manage customer orders</p>
        </div>

        <!-- Analytics -->
        <div class="card" onclick="location.href='reports'">
            <div class="card-icon">📊</div>
            <h3>Analytics</h3>
            <p>View sales & performance reports</p>
        </div>

    </div>

</div>

</body>
</html>
