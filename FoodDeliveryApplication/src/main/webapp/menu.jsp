<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<title>FoodieHub | Explore Menu</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:'Poppins',sans-serif;
}

body{
background:#020617;
padding:40px 70px;
color:#fff;
}

/* NAVBAR */

.navbar{
width:100%;
display:flex;
justify-content:space-between;
align-items:center;
background:#0f172a;
padding:18px 40px;
border-radius:18px;
box-shadow:0 0 20px rgba(0,0,0,0.6);
margin-bottom:35px;
}

.logo{
font-size:26px;
font-weight:700;
color:#f97316;
}

.nav-links{
display:flex;
gap:40px;
font-size:15px;
}

.nav-links a{
text-decoration:none;
color:#e5e7eb;
}

.nav-links a:hover{
color:#f97316;
}

.icons{
display:flex;
gap:20px;
font-size:18px;
}

/* BACK BUTTON */

.back-btn{
text-decoration:none;
background:#0f172a;
padding:8px 16px;
border-radius:8px;
color:#f97316;
font-weight:600;
}

.back-btn:hover{
background:#1e293b;
}

/* TITLE */

.heading{
margin:30px 0;
font-size:30px;
font-weight:600;
}

/* MENU CARD LAYOUT */

.menu-container{
display:flex;
flex-direction:column;
gap:28px;
}

/* CARD */

.menu-card{
display:flex;
justify-content:space-between;
align-items:center;
background:#0f172a;
border-radius:16px;
padding:16px;
box-shadow:0 8px 30px rgba(0,0,0,0.5);
transition:0.3s;
}

.menu-card:hover{
transform:scale(1.02);
}

.menu-left{
display:flex;
align-items:center;
gap:18px;
}

.menu-left img{
width:160px;
height:100px;
border-radius:12px;
object-fit:cover;
}

.menu-details h3{
font-size:18px;
margin-bottom:6px;
}

.menu-details p{
font-size:13px;
color:#9ca3af;
margin-bottom:10px;
}

.price{
color:#22c55e;
font-weight:600;
}

/* ADD BUTTON */

.add-btn{
background:linear-gradient(135deg,#f97316,#fb923c);
border:none;
padding:8px 20px;
border-radius:8px;
font-weight:600;
cursor:pointer;
color:#000;
}

.add-btn:hover{
transform:scale(1.05);
}

/* PAGINATION */

.pagination{
margin-top:30px;
display:flex;
justify-content:center;
gap:10px;
}

.page{
background:#0f172a;
padding:6px 12px;
border-radius:6px;
}

.active{
background:#f97316;
}

</style>
</head>

<body>

<!-- NAVBAR -->

<div class="navbar">
<div class="logo">🍴 FoodieHub</div>

<div class="nav-links">
<a href="index.jsp">Home</a>
<a href="${pageContext.request.contextPath}/restaurants">Restaurants</a>
<a href="${pageContext.request.contextPath}/orders">My Orders</a>
<a href="profile.jsp">Profile</a>
</div>

<div class="icons">
🛒 ☰
</div>
</div>

<a href="${pageContext.request.contextPath}/restaurants" class="back-btn">← Back</a>

<div class="heading">Explore Menu</div>

<c:if test="${empty menuList}">
<p>No menu items available</p>
</c:if>

<div class="menu-container">

<c:forEach var="m" items="${menuList}">

<div class="menu-card">

<div class="menu-left">

<img src="${pageContext.request.contextPath}/${m.imageURL}">

<div class="menu-details">
<h3>${m.menuName}</h3>
<p>${m.description}</p>
<div class="price">₹ ${m.price}</div>
</div>

</div>

<form action="${pageContext.request.contextPath}/CartItemServlet" method="post">
<input type="hidden" name="action" value="add">
<input type="hidden" name="menuId" value="${m.menuId}">
<input type="hidden" name="itemName" value="${m.menuName}">
<input type="hidden" name="price" value="${m.price}">
<input type="hidden" name="quantity" value="1">

<button class="add-btn">Add</button>
</form>

</div>

</c:forEach>

</div>

<div class="pagination">
<div class="page active">1</div>
<div class="page">2</div>
<div class="page">❯</div>
</div>

</body>
</html>
