<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*, com.fda.models.CartItem" %>

<%
    List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
    double total = 0;
%>

<!DOCTYPE html>
<html>
<head>
<title>FoodieHub | Checkout</title>

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

/* CONTAINER */
.container{
    max-width:950px;
    margin:30px auto 60px;
    background:rgba(255,255,255,0.08);
    backdrop-filter:blur(18px);
    border-radius:20px;
    padding:40px;
    box-shadow:0 20px 50px rgba(0,0,0,0.6);
}

h2{
    margin-bottom:20px;
    font-weight:600;
}

/* TABLE */
table{
    width:100%;
    border-collapse:collapse;
    margin-bottom:25px;
}

th, td{
    padding:14px;
    text-align:left;
}

th{
    background:rgba(255,255,255,0.1);
    border-radius:6px;
}

tr{
    border-bottom:1px solid rgba(255,255,255,0.1);
}

tr:hover{
    background:rgba(255,255,255,0.05);
}

.total{
    text-align:right;
    font-size:18px;
    font-weight:600;
    margin-top:10px;
    color:#00ffcc;
}

/* FORM */
.form-group{
    margin-bottom:20px;
}

label{
    display:block;
    margin-bottom:6px;
    font-weight:500;
    color:#ccc;
}

input, textarea{
    width:100%;
    padding:12px;
    border-radius:12px;
    border:none;
    outline:none;
    background:rgba(255,255,255,0.12);
    color:#fff;
    font-size:14px;
    transition:0.3s;
}

input:focus, textarea:focus{
    background:rgba(255,255,255,0.2);
    box-shadow:0 0 10px rgba(0,255,204,0.4);
}

/* ===== IMPROVED SELECT ===== */

select{
    width:100%;
    padding:12px 40px 12px 12px;
    border-radius:12px;
    border:none;
    outline:none;
    background:rgba(255,255,255,0.12);
    color:#fff;
    font-size:14px;
    cursor:pointer;
    appearance:none;
    -webkit-appearance:none;
    -moz-appearance:none;
    transition:0.3s;

    /* Custom Arrow */
    background-image: url("data:image/svg+xml;utf8,<svg fill='white' height='20' viewBox='0 0 24 24' width='20' xmlns='http://www.w3.org/2000/svg'><path d='M7 10l5 5 5-5z'/></svg>");
    background-repeat:no-repeat;
    background-position:right 12px center;
    background-size:18px;
}

select:focus{
    background:rgba(255,255,255,0.2);
    box-shadow:0 0 10px rgba(0,255,204,0.4);
}

/* Option Styling (Supported Browsers) */
select option{
    background:#1c1c1c;
    color:#fff;
    padding:10px;
}

/* BUTTON */
.btn{
    background:linear-gradient(45deg,#00ffcc,#00b894);
    color:#000;
    padding:14px;
    border:none;
    border-radius:14px;
    font-size:16px;
    font-weight:600;
    cursor:pointer;
    width:100%;
    transition:0.4s;
}

.btn:hover{
    transform:translateY(-4px);
    box-shadow:0 15px 30px rgba(0,255,204,0.4);
}

@media(max-width:768px){
    .container{
        margin:20px;
        padding:25px;
    }
}

</style>
</head>

<body>

<div class="container">

    <h2>🛒 Order Summary</h2>

    <table>
        <tr>
            <th>Item</th>
            <th>Qty</th>
            <th>Price</th>
            <th>Total</th>
        </tr>

<%
if (cart != null) {
    for (CartItem item : cart) {
        double itemTotal = item.getPrice() * item.getQuantity();
        total += itemTotal;
%>
<tr>
    <td><%= item.getItemName() %></td>
    <td><%= item.getQuantity() %></td>
    <td>₹ <%= item.getPrice() %></td>
    <td>₹ <%= itemTotal %></td>
</tr>
<%
    }
}
%>

    </table>

    <div class="total">
        Grand Total: ₹ <%= total %>
    </div>

    <hr style="margin:35px 0; border:1px solid rgba(255,255,255,0.1)">

    <h2>🚚 Delivery Details</h2>

    <form action="order" method="post">

        <input type="hidden" name="totalAmount" value="<%= total %>">

        <div class="form-group">
            <label>Delivery Address</label>
            <textarea name="deliveryAddress" required></textarea>
        </div>

        <div class="form-group">
            <label>Payment Method</label>
            <select name="paymentMethod" required>
                <option value="">Select Payment Method</option>
                <option value="UPI">💳 UPI</option>
                <option value="Card">🏦 Credit / Debit Card</option>
                <option value="Cash on Delivery">💵 Cash on Delivery</option>
            </select>
        </div>

        <button class="btn">🚀 Place Order</button>
    </form>

</div>

</body>
</html>
