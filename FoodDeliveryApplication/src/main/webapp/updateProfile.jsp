<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.fda.models.Users" %>
<%
Users user = (Users) session.getAttribute("user");

if(user == null){
    response.sendRedirect("login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
<title>Update Profile | FoodieHub</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">

<style>
*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Poppins',sans-serif;
}

body{
    background:linear-gradient(135deg,#0f0f0f,#1a1a1a);
    height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;
    color:#fff;
}

.container{
    background:#1e1e1e;
    padding:40px;
    width:400px;
    border-radius:15px;
    box-shadow:0 0 30px rgba(255,122,24,0.2);
    animation:fadeIn 0.8s ease;
}

h2{
    text-align:center;
    margin-bottom:25px;
    color:#ff7a18;
}

.form-group{
    margin-bottom:20px;
}

label{
    font-size:14px;
    color:#bbb;
}

input{
    width:100%;
    padding:10px;
    margin-top:6px;
    border:none;
    border-radius:8px;
    background:#2a2a2a;
    color:#fff;
    outline:none;
    transition:0.3s;
}

input:focus{
    box-shadow:0 0 8px #ff7a18;
}

button{
    width:100%;
    padding:12px;
    border:none;
    border-radius:25px;
    background:#ff7a18;
    color:#fff;
    font-weight:600;
    cursor:pointer;
    transition:0.3s;
}

button:hover{
    background:#ff5500;
    transform:scale(1.05);
}

.back-link{
    display:block;
    text-align:center;
    margin-top:15px;
    color:#bbb;
    text-decoration:none;
    font-size:14px;
}

.back-link:hover{
    color:#ff7a18;
}

@keyframes fadeIn{
    from{opacity:0; transform:translateY(20px);}
    to{opacity:1; transform:translateY(0);}
}
</style>
</head>

<body>

<div class="container">
    <h2>Update Profile</h2>

    <form action="updateProfile" method="post">

        <div class="form-group">
            <label>Name</label>
            <input type="text" name="username"
                value="<%= user.getUserName() %>" required>
        </div>

        <div class="form-group">
            <label>Email</label>
            <input type="email"
                value="<%= user.getEmail() %>" disabled>
        </div>

        <div class="form-group">
            <label>Phone</label>
            <input type="text" name="phone"
                value="<%= user.getPhoneNumber() %>" required>
        </div>

        <div class="form-group">
            <label>Address</label>
            <input type="text" name="address"
                value="<%= user.getAddress() %>" required>
        </div>

        <button type="submit">Update Profile</button>
    </form>

    <a href="profile.jsp" class="back-link">← Back to Profile</a>
</div>

</body>
</html>
    