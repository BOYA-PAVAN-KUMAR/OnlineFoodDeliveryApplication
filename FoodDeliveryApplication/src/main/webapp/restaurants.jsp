<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<title>FoodieHub | Restaurants</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:'Poppins',sans-serif;
}

body{
height:100vh;
background: url('<%=request.getContextPath()%>/images/allImages/BgImg.png') no-repeat center center/cover;
position:relative;
color:white;
}

/* NAVBAR */

.navbar{
display:flex;
justify-content:space-between;
align-items:center;
padding:18px 60px;
background:rgba(255,255,255,0.05);
backdrop-filter:blur(12px);
box-shadow:0 0 20px rgba(0,0,0,0.4);
}

.logo{
font-size:22px;
font-weight:700;
color:#f97316;
}

.nav-links a{
margin:0 15px;
text-decoration:none;
color:#ccc;
font-size:14px;
}

.nav-icons{
display:flex;
align-items:center;
gap:15px;
}

.cart{
background:#1e293b;
padding:8px 14px;
border-radius:10px;
}

/* HEADING */

.heading{
display:flex;
justify-content:space-between;
align-items:center;
padding:40px 60px 20px;
}

.heading h2{
font-size:34px;
}

.heading span{
color:#f97316;
}

/* SEARCH */

.search-box{
display:flex;
gap:10px;
}

.search-box input{
padding:10px 16px;
border-radius:10px;
border:none;
background:#1e293b;
color:#fff;
width:300px;
}

.search-box button{
background:linear-gradient(45deg,#f97316,#fb923c);
border:none;
padding:10px 18px;
border-radius:10px;
color:#000;
font-weight:600;
cursor:pointer;
}

/* MAIN */

.main{
display:grid;
grid-template-columns:3fr 1fr;
gap:25px;
padding:0 60px 60px;
}

/* CARDS */

.cards{
display:grid;
grid-template-columns:repeat(auto-fit,minmax(280px,1fr));
gap:25px;
}

.card{
background:rgba(255,255,255,0.05);
border-radius:18px;
overflow:hidden;
backdrop-filter:blur(15px);
cursor:pointer;
transition:.3s;
box-shadow:0 10px 30px rgba(0,0,0,0.6);
}

.card:hover{
transform:translateY(-8px);
box-shadow:0 15px 50px rgba(0,0,0,0.8);
}

.card img{
width:100%;
height:180px;
object-fit:cover;
}

.card-body{
padding:18px;
}

.card-body h3{
margin-bottom:5px;
}

.card-body p{
color:#bbb;
font-size:13px;
margin-bottom:10px;
}

.card-footer{
display:flex;
justify-content:space-between;
align-items:center;
}

.rating{
background:#f97316;
padding:5px 10px;
border-radius:8px;
font-size:12px;
}

.view-btn{
background:#1e293b;
padding:6px 12px;
border-radius:8px;
font-size:12px;
color:#fff;
}

/* FILTER */

.filter{
background:rgba(255,255,255,0.05);
padding:20px;
border-radius:18px;
backdrop-filter:blur(15px);
height:fit-content;
}

.filter h3{
margin-bottom:15px;
}

.filter label{
display:block;
margin:10px 0;
font-size:14px;
}

/* PAGINATION */

.pagination{
display:flex;
justify-content:center;
margin-top:30px;
gap:10px;
}

.page{
background:#1e293b;
padding:8px 14px;
border-radius:8px;
cursor:pointer;
}

.active{
background:#f97316;
color:#000;
}

</style>
</head>

<body>

<!-- NAVBAR -->
<div class="navbar">
<div class="logo">🍴 FoodieHub</div>

<div class="nav-links">
<a href="index.jsp">Home</a>
<a href="restaurants">Restaurants</a>
<a href="orders.jsp">My Orders</a>
<a href="profile.jsp">Profile</a>
</div>

<div class="nav-icons">
<div class="cart">🛒</div>
</div>
</div>

<!-- HEADING -->
<div class="heading">
<h2><span>Restaurants</span> Near You</h2>

<div class="search-box">
<input type="text" placeholder="Search restaurants...">
<button>Search</button>
</div>
</div>

<!-- MAIN -->
<div class="main">

<!-- RESTAURANTS -->
<div>

<div class="cards">

<c:forEach var="r" items="${restaurants}">
<div class="card"
onclick="location.href='menu?restaurantId=${r.restaurantId}'">

<img src="${pageContext.request.contextPath}/${r.imageUrl}">

<div class="card-body">
<h3>${r.restaurantName}</h3>
<p>${r.cuisine}</p>

<div class="card-footer">
<div class="rating">⭐ ${r.rating}</div>
<div class="view-btn">View Menu</div>
</div>

</div>

</div>
</c:forEach>

</div>

<div class="pagination">
<div class="page active">1</div>
<div class="page">2</div>
<div class="page">3</div>
</div>

</div>

<!-- FILTER -->
<div class="filter">
<h3>Filter</h3>

<label><input type="checkbox"> All</label>
<label><input type="checkbox"> Fast Food</label>
<label><input type="checkbox"> Healthy</label>
<label><input type="checkbox"> Burgers</label>
<label><input type="checkbox"> Pizza</label>
<label><input type="checkbox"> Indian</label>

</div>

</div>

</body>
</html>
