<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>FoodieHub | Order Food Online</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Poppins',sans-serif;
}

body{
    background:#0f0f0f;
    color:#fff;
    overflow-x:hidden;
}

/* ================= NAVBAR ================= */

.navbar{
    position:fixed;
    top:0;
    width:100%;
    display:flex;
    justify-content:space-between;
    align-items:center;
    padding:18px 80px;
    background:rgba(0,0,0,0.4);
    backdrop-filter:blur(10px);
    z-index:1000;
}

.logo{
    font-size:26px;
    font-weight:700;
    background:linear-gradient(45deg,#ff7a18,#ffb347);
    -webkit-background-clip:text;
    -webkit-text-fill-color:transparent;
}

.nav-links a{
    color:#ddd;
    margin:0 18px;
    text-decoration:none;
    font-weight:500;
    position:relative;
    transition:0.3s;
}

.nav-links a::after{
    content:'';
    position:absolute;
    width:0%;
    height:2px;
    left:0;
    bottom:-5px;
    background:#ff7a18;
    transition:0.3s;
}

.nav-links a:hover{
    color:#fff;
}

.nav-links a:hover::after{
    width:100%;
}

.login-btn{
    padding:8px 20px;
    border-radius:25px;
    background:linear-gradient(45deg,#ff7a18,#ffb347);
    color:#fff;
    text-decoration:none;
    font-weight:600;
    transition:0.3s;
}

.login-btn:hover{
    transform:scale(1.05);
    box-shadow:0 0 15px rgba(255,122,24,0.6);
}

/* ================= HERO ================= */

.hero{
    height:100vh;
    display:flex;
    align-items:center;
    justify-content:space-between;
    padding:0 80px;
    background:
        linear-gradient(to right, rgba(0,0,0,0.9), rgba(0,0,0,0.5)),
        url("images/allImages/BgImg.png") center/cover no-repeat;
}

.hero-content{
    max-width:600px;
    animation:fadeUp 1s ease;
}

.hero-content h1{
    font-size:52px;
    line-height:1.3;
    margin-bottom:20px;
}

.hero-content h1 span{
    background:linear-gradient(45deg,#ff7a18,#ffb347);
    -webkit-background-clip:text;
    -webkit-text-fill-color:transparent;
}

.hero-content p{
    font-size:16px;
    color:#ccc;
    margin-bottom:35px;
}

/* BUTTON */

.order-btn{
    padding:15px 35px;
    border-radius:30px;
    text-decoration:none;
    font-weight:600;
    font-size:15px;
    color:#fff;
    background:linear-gradient(45deg,#ff7a18,#ffb347);
    transition:0.4s;
    display:inline-block;
}

.order-btn:hover{
    transform:translateY(-5px);
    box-shadow:0 15px 40px rgba(255,122,24,0.5);
}

/* ================= IMAGE SIDE ================= */

.food-circle{
    width:420px;
    height:420px;
    border-radius:50%;
    background:url("images/allImages/Circle.png") center/cover no-repeat;
    box-shadow:0 0 80px rgba(255,122,24,0.5);
    animation:float 4s ease-in-out infinite;
}

/* ================= FEATURES SECTION ================= */

.features{
    padding:100px 80px;
    text-align:center;
    background:#121212;
}

.features h2{
    font-size:32px;
    margin-bottom:50px;
}

.feature-grid{
    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(250px,1fr));
    gap:40px;
}

.feature-card{
    background:#1b1b1b;
    padding:30px;
    border-radius:20px;
    transition:0.4s;
}

.feature-card:hover{
    transform:translateY(-10px);
    box-shadow:0 20px 40px rgba(0,0,0,0.6);
}

.feature-card h3{
    margin-bottom:15px;
    color:#ff7a18;
}

.feature-card p{
    font-size:14px;
    color:#bbb;
}

/* ================= ANIMATIONS ================= */

@keyframes fadeUp{
    from{opacity:0; transform:translateY(30px);}
    to{opacity:1; transform:translateY(0);}
}

@keyframes float{
    0%{transform:translateY(0);}
    50%{transform:translateY(-15px);}
    100%{transform:translateY(0);}
}

/* ================= RESPONSIVE ================= */

@media(max-width:900px){
    .hero{
        flex-direction:column;
        justify-content:center;
        text-align:center;
    }

    .food-circle{
        margin-top:40px;
        width:300px;
        height:300px;
    }

    .navbar{
        padding:15px 30px;
    }

    .hero{
        padding:0 30px;
    }

    .features{
        padding:80px 30px;
    }
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
        <a href="#">Foods</a>
        <a href="#">Why Us</a>
        <a href="#">Contact</a>
    </div>

    <a href="${pageContext.request.contextPath}/login.jsp" class="login-btn">Login</a>
</div>

<!-- HERO -->
<section class="hero">
    <div class="hero-content">
        <h1>
            Order <span>Food Online</span><br>
            From Bengaluru’s Best
        </h1>

        <p>
            Discover top-rated restaurants, fast delivery, and mouth-watering dishes delivered fresh to your doorstep.
        </p>

        <a href="${pageContext.request.contextPath}/restaurants" class="order-btn">
            Order Now
        </a>
    </div>

    <div class="food-circle"></div>
</section>

<!-- FEATURES -->
<section class="features">
    <h2>Why Choose FoodieHub?</h2>

    <div class="feature-grid">
        <div class="feature-card">
            <h3>⚡ Fast Delivery</h3>
            <p>Get your favorite food delivered within minutes from top restaurants near you.</p>
        </div>

        <div class="feature-card">
            <h3>🍽 500+ Restaurants</h3>
            <p>Explore a wide variety of cuisines from trusted and verified restaurants.</p>
        </div>

        <div class="feature-card">
            <h3>💳 Secure Payments</h3>
            <p>Safe and secure payment options with seamless checkout experience.</p>
        </div>
    </div>
</section>

</body>
</html>
