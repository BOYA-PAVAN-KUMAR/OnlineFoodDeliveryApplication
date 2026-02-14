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
<meta charset="UTF-8">
<title>My Profile</title>

<style>
    *{
        margin:0;
        padding:0;
        box-sizing:border-box;
        font-family: 'Segoe UI', sans-serif;
    }

    body{
        background: linear-gradient(135deg,#0f2027,#203a43,#2c5364);
        min-height:100vh;
        display:flex;
        justify-content:center;
        align-items:center;
    }

    .profile-container{
        width:900px;
        background:#1e1e2f;
        border-radius:15px;
        display:flex;
        overflow:hidden;
        box-shadow:0 0 40px rgba(0,0,0,0.6);
    }

    /* LEFT SIDE */
    .profile-left{
        width:35%;
        background:linear-gradient(180deg,#ff7a18,#ffb347);
        display:flex;
        flex-direction:column;
        align-items:center;
        justify-content:center;
        padding:30px;
        color:white;
    }

    .profile-avatar{
        width:120px;
        height:120px;
        border-radius:50%;
        background:white;
        display:flex;
        align-items:center;
        justify-content:center;
        font-size:45px;
        font-weight:bold;
        color:#ff7a18;
        margin-bottom:20px;
    }

    .profile-left h2{
        margin-bottom:5px;
    }

    .role-badge{
        background:rgba(0,0,0,0.3);
        padding:5px 15px;
        border-radius:20px;
        font-size:14px;
    }

    /* RIGHT SIDE */
    .profile-right{
        width:65%;
        padding:40px;
        color:white;
    }

    .profile-right h2{
        margin-bottom:30px;
        border-bottom:1px solid #444;
        padding-bottom:10px;
    }

    .form-group{
        margin-bottom:20px;
    }

    label{
        display:block;
        margin-bottom:5px;
        font-size:14px;
        color:#aaa;
    }

    input{
        width:100%;
        padding:12px;
        border:none;
        border-radius:8px;
        background:#2e2e3f;
        color:white;
        font-size:14px;
        transition:0.3s;
    }

    input:focus{
        outline:none;
        background:#3b3b52;
        box-shadow:0 0 10px rgba(255,122,24,0.5);
    }

    .btn-group{
        margin-top:20px;
        display:flex;
        gap:15px;
    }

    .btn{
        flex:1;
        padding:12px;
        border:none;
        border-radius:8px;
        cursor:pointer;
        font-weight:bold;
        transition:0.3s;
    }

    .save-btn{
        background:#ff7a18;
        color:white;
    }

    .save-btn:hover{
        background:#ff8f3c;
        transform:translateY(-2px);
    }

    .logout-btn{
        background:#444;
        color:white;
        text-decoration:none;
        display:flex;
        align-items:center;
        justify-content:center;
    }

    .logout-btn:hover{
        background:#666;
        transform:translateY(-2px);
    }

    /* Responsive */
    @media(max-width:900px){
        .profile-container{
            flex-direction:column;
            width:95%;
        }
        .profile-left, .profile-right{
            width:100%;
        }
    }

</style>
</head>

<body>

<div class="profile-container">

    <!-- LEFT SIDE -->
    <div class="profile-left">
        <div class="profile-avatar">
            <%= user.getUserName().substring(0,1).toUpperCase() %>
        </div>
        <h2><%= user.getUserName() %></h2>
        <div class="role-badge">
            <%= user.getRole() %>
        </div>
    </div>

    <!-- RIGHT SIDE -->
    <div class="profile-right">
        <h2>My Profile</h2>

        <form action="updateProfile" method="post">

            <div class="form-group">
                <label>Full Name</label>
                <input type="text" name="username" value="<%= user.getUserName() %>" required>
            </div>

            <div class="form-group">
                <label>Email</label>
                <input type="email" name="email" value="<%= user.getEmail() %>" readonly>
            </div>

            <div class="form-group">
                <label>Phone</label>
                <input type="text" name="phone" value="<%= user.getPhoneNumber() %>" required>
            </div>

            <div class="form-group">
                <label>Address</label>
                <input type="text" name="address" value="<%= user.getAddress() %>" required>
            </div>

            <div class="btn-group">
                <a href="updateProfile.jsp" class="btn save-btn" style="text-align:center; text-decoration:none;">Update Profile</a>
                <a href="logout" class="btn logout-btn">Logout</a>
            </div>

        </form>
    </div>

</div>

</body>
</html>
    