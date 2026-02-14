<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
    backdrop-filter: blur(10px);
}

.logo{
    font-size:22px;
    font-weight:700;
    letter-spacing:1px;
}

nav a{
    color:#ddd;
    margin-left:20px;
    text-decoration:none;
    font-weight:500;
    transition:0.3s;
}

nav a:hover{
    color:#00ffcc;
}

/* PAGE TITLE */
.page-title{
    padding:40px 60px 10px;
}

.page-title h2{
    font-size:32px;
    font-weight:600;
}

.page-title p{
    color:#bbb;
    font-size:14px;
    margin-top:5px;
}

/* BACK BUTTON */
.back-btn{
    display:inline-flex;
    align-items:center;
    margin:20px 60px 0;
    text-decoration:none;
    color:#00ffcc;
    font-weight:500;
    transition:0.3s;
}

.back-btn:hover{
    transform:translateX(-5px);
}

.back-btn span{
    font-size:20px;
    margin-right:8px;
}

/* CONTAINER */
.container{
    padding:40px 60px 60px;
}

.grid{
    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(260px,1fr));
    gap:30px;
}

/* CARD */
.card{
    background:rgba(255,255,255,0.08);
    backdrop-filter: blur(15px);
    border-radius:20px;
    overflow:hidden;
    cursor:pointer;
    transition:all 0.4s ease;
    box-shadow:0 10px 30px rgba(0,0,0,0.4);
}

.card:hover{
    transform:translateY(-12px);
    box-shadow:0 20px 50px rgba(0,0,0,0.6);
}

.card img{
    width:100%;
    height:180px;
    object-fit:cover;
}

.card-body{
    padding:20px;
}

.card-body h3{
    margin:0;
    font-size:18px;
    font-weight:600;
}

.cuisine{
    font-size:13px;
    color:#ccc;
    margin:6px 0;
}

/* FOOTER */
.card-footer{
    display:flex;
    justify-content:space-between;
    align-items:center;
    margin-top:12px;
}

.rating{
    padding:6px 12px;
    border-radius:8px;
    font-size:13px;
    font-weight:600;
    background:linear-gradient(45deg,#00ffcc,#00b894);
    color:#000;
}

.view-btn{
    font-size:13px;
    font-weight:600;
    color:#00ffcc;
    transition:0.3s;
}

.card:hover .view-btn{
    letter-spacing:1px;
}

/* RESPONSIVE */
@media(max-width:768px){
    header,.container,.page-title{
        padding-left:25px;
        padding-right:25px;
    }

    .back-btn{
        margin-left:25px;
    }
}

</style>
</head>

<body>

<!-- HEADER -->
<header>
    <div class="logo">🍴 FoodieHub</div>
    <nav>
        <a href="index.jsp">Home</a>
        <a href="restaurants">Restaurants</a>
        <a href="login.jsp">Login</a>
    </nav>
</header>

<!-- BACK BUTTON -->
<a href="index.jsp" class="back-btn">
    <span>←</span> Back to Home
</a>

<!-- TITLE -->
<div class="page-title">
    <h2>Top Restaurants For You</h2>
    <p>Discover the best places to eat around you</p>
</div>

<!-- RESTAURANTS GRID -->
<div class="container">
    <div class="grid">

        <c:forEach var="r" items="${restaurants}">
            <div class="card"
                 onclick="location.href='menu?restaurantId=${r.restaurantId}'">

                <img src="${pageContext.request.contextPath}/${r.imageUrl}"
                     alt="${r.restaurantName}">

                <div class="card-body">
                    <h3>${r.restaurantName}</h3>
                    <div class="cuisine">${r.cuisine}</div>
                    <div class="cuisine">${r.address}</div>

                    <div class="card-footer">
                        <div class="rating">⭐ ${r.rating}</div>
                        <span class="view-btn">View Menu →</span>
                    </div>
                </div>
            </div>
        </c:forEach>

    </div>
</div>

</body>
</html>
