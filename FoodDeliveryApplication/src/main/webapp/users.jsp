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
   You should pass user list from servlet:
   request.setAttribute("usersList", users);
*/
List<Users> usersList = (List<Users>) request.getAttribute("usersList");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manage Users | FoodieHub Admin</title>

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
    transition:0.3s;
}

.back-btn:hover{
    transform:translateX(-5px);
}

/* CONTAINER */
.container{
    padding:40px 50px;
}

/* TABLE */
.table-container{
    background:rgba(255,255,255,0.08);
    backdrop-filter:blur(20px);
    border-radius:18px;
    padding:30px;
    box-shadow:0 20px 50px rgba(0,0,0,0.5);
    overflow-x:auto;
}

table{
    width:100%;
    border-collapse:collapse;
}

th, td{
    padding:14px;
    text-align:left;
}

th{
    background:rgba(255,255,255,0.1);
    font-weight:600;
}

tr{
    border-bottom:1px solid rgba(255,255,255,0.1);
    transition:0.3s;
}

tr:hover{
    background:rgba(255,255,255,0.05);
}

/* ROLE BADGE */
.role{
    padding:6px 14px;
    border-radius:20px;
    font-size:12px;
    font-weight:600;
    display:inline-block;
}

.admin-role{
    background:#ff7a18;
    color:#000;
}

.customer-role{
    background:#00ffcc;
    color:#000;
}

/* DELETE BUTTON */
.delete-btn{
    padding:8px 14px;
    border:none;
    border-radius:8px;
    background:#ff4b5c;
    color:#fff;
    cursor:pointer;
    transition:0.3s;
}

.delete-btn:hover{
    background:#ff1e38;
    transform:scale(1.05);
}

/* EMPTY STATE */
.empty{
    text-align:center;
    padding:40px;
    color:#aaa;
}

@media(max-width:768px){
    .container{
        padding:20px;
    }
}

</style>
</head>

<body>

<div class="header">
    <h2>👥 Manage Users</h2>
    <a href="adminDashboard.jsp" class="back-btn">← Back to Dashboard</a>
</div>

<div class="container">

<div class="table-container">

<%
if(usersList != null && !usersList.isEmpty()){
%>

<table>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Email</th>
        <th>Phone</th>
        <th>Role</th>
        <th>Action</th>
    </tr>

<%
for(Users u : usersList){
%>
<tr>
    <td><%= u.getUserId() %></td>
    <td><%= u.getUserName() %></td>
    <td><%= u.getEmail() %></td>
    <td><%= u.getPhoneNumber() %></td>
    <td>
        <span class="role <%= 
            "ADMIN".equalsIgnoreCase(u.getRole()) ? "admin-role" : "customer-role" 
        %>">
            <%= u.getRole() %>
        </span>
    </td>
    <td>
        <form action="deleteUser" method="post" style="display:inline;">
            <input type="hidden" name="userId" value="<%= u.getUserId() %>">
            <button class="delete-btn">Delete</button>
        </form>
    </td>
</tr>
<%
}
%>

</table>

<%
}else{
%>
<div class="empty">
    🚫 No users found in the system.
</div>
<%
}
%>

</div>
</div>

</body>
</html>
