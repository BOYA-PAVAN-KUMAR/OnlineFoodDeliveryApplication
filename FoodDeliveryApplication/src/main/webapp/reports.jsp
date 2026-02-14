<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.fda.models.Users" %>
<%
Users admin = (Users) session.getAttribute("user");

if(admin == null || !"ADMIN".equalsIgnoreCase(admin.getRole())){
    response.sendRedirect("login.jsp");
    return;
}

/*
 These values should ideally come from servlet:
 request.setAttribute("totalUsers", totalUsers);
 request.setAttribute("totalOrders", totalOrders);
 request.setAttribute("totalRevenue", totalRevenue);
*/

Integer totalUsers = (Integer) request.getAttribute("totalUsers");
Integer totalOrders = (Integer) request.getAttribute("totalOrders");
Double totalRevenue = (Double) request.getAttribute("totalRevenue");

if(totalUsers == null) totalUsers = 0;
if(totalOrders == null) totalOrders = 0;
if(totalRevenue == null) totalRevenue = 0.0;
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Analytics | FoodieHub Admin</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Poppins',sans-serif;
}

body{
    background:linear-gradient(135deg,#0f2027,#203a43,#2c5364);
    min-height:100vh;
    color:#fff;
}

/* HEADER */
.header{
    display:flex;
    justify-content:space-between;
    align-items:center;
    padding:20px 50px;
    background:rgba(255,255,255,0.05);
    backdrop-filter:blur(12px);
}

.header h2{
    font-weight:600;
}

.back-btn{
    text-decoration:none;
    color:#00ffcc;
    font-weight:500;
}

.back-btn:hover{
    transform:translateX(-5px);
}

/* CONTAINER */
.container{
    padding:40px 50px;
}

/* STAT CARDS */
.stats{
    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(250px,1fr));
    gap:30px;
    margin-bottom:40px;
}

.card{
    background:rgba(255,255,255,0.08);
    backdrop-filter:blur(18px);
    border-radius:18px;
    padding:30px;
    box-shadow:0 20px 50px rgba(0,0,0,0.6);
    transition:0.4s;
}

.card:hover{
    transform:translateY(-10px);
}

.card h3{
    font-size:14px;
    color:#bbb;
    margin-bottom:10px;
}

.card h1{
    font-size:32px;
    color:#00ffcc;
}

/* SECTION */
.section{
    background:rgba(255,255,255,0.08);
    backdrop-filter:blur(18px);
    border-radius:18px;
    padding:30px;
    box-shadow:0 20px 50px rgba(0,0,0,0.6);
}

.section h3{
    margin-bottom:20px;
}

/* SIMPLE BAR VISUAL */
.bar-container{
    margin-bottom:15px;
}

.bar-label{
    margin-bottom:5px;
    font-size:14px;
}

.bar{
    height:10px;
    background:rgba(255,255,255,0.1);
    border-radius:20px;
    overflow:hidden;
}

.bar-fill{
    height:100%;
    background:linear-gradient(45deg,#00ffcc,#00b894);
    width:70%;
    border-radius:20px;
}

/* RESPONSIVE */
@media(max-width:768px){
    .container{
        padding:20px;
    }
}

</style>
</head>

<body>

<div class="header">
    <h2>📊 Analytics Dashboard</h2>
    <a href="adminDashboard.jsp" class="back-btn">← Back to Dashboard</a>
</div>

<div class="container">

    <!-- STAT CARDS -->
    <div class="stats">

        <div class="card">
            <h3>Total Users</h3>
            <h1><%= totalUsers %></h1>
        </div>

        <div class="card">
            <h3>Total Orders</h3>
            <h1><%= totalOrders %></h1>
        </div>

        <div class="card">
            <h3>Total Revenue</h3>
            <h1>₹ <%= totalRevenue %></h1>
        </div>

    </div>

    <!-- SALES SECTION -->
    <div class="section">
        <h3>📈 Sales Performance</h3>

        <div class="bar-container">
            <div class="bar-label">Orders Completion Rate</div>
            <div class="bar">
                <div class="bar-fill"></div>
            </div>
        </div>

        <div class="bar-container">
            <div class="bar-label">Revenue Growth</div>
            <div class="bar">
                <div class="bar-fill" style="width:85%;"></div>
            </div>
        </div>

        <div class="bar-container">
            <div class="bar-label">Customer Retention</div>
            <div class="bar">
                <div class="bar-fill" style="width:60%;"></div>
            </div>
        </div>

    </div>

</div>

</body>
</html>
