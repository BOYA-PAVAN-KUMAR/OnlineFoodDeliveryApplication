<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<title>Your Cart | FoodieHub</title>

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
color:white;
}

/* NAVBAR */

.navbar{
display:flex;
justify-content:space-between;
align-items:center;
background:#0f172a;
padding:18px 40px;
border-radius:18px;
margin-bottom:30px;
box-shadow:0 0 20px rgba(0,0,0,0.5);
}

.logo{
font-size:26px;
font-weight:700;
color:#f97316;
}

.nav-links{
display:flex;
gap:40px;
}

.nav-links a{
text-decoration:none;
color:#e5e7eb;
}

.nav-links a:hover{
color:#f97316;
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

/* CART ITEM */

.cart-item{
display:flex;
justify-content:space-between;
align-items:center;
background:#0f172a;
padding:16px;
border-radius:16px;
margin-bottom:16px;
box-shadow:0 8px 25px rgba(0,0,0,0.6);
transition:0.3s;
}

.cart-item:hover{
transform:scale(1.01);
}

.item-left{
display:flex;
gap:18px;
align-items:center;
}

.item-left img{
width:110px;
height:80px;
border-radius:12px;
object-fit:cover;
}

.item-details h3{
margin-bottom:5px;
}

.item-details p{
font-size:13px;
color:#9ca3af;
}

/* QTY */

.qty-box{
display:flex;
gap:10px;
align-items:center;
}

.qty-btn{
width:32px;
height:32px;
border:none;
background:#1e293b;
color:white;
border-radius:6px;
cursor:pointer;
}

/* PRICE */

.price{
color:#22c55e;
font-weight:600;
}

/* DELETE */

.delete-btn{
background:#f97316;
border:none;
color:white;
padding:8px 10px;
border-radius:8px;
cursor:pointer;
}

/* TOTAL BOX */

.total-box{
background:#0f172a;
padding:20px;
border-radius:18px;
display:flex;
justify-content:space-between;
align-items:center;
margin-top:30px;
box-shadow:0 8px 30px rgba(0,0,0,0.6);
}

.place-btn{
background:linear-gradient(135deg,#84cc16,#65a30d);
border:none;
padding:12px 26px;
border-radius:10px;
font-weight:600;
cursor:pointer;
color:black;
}

/* TOAST */

#toast{
position:fixed;
bottom:30px;
right:30px;
background:#22c55e;
padding:12px 20px;
border-radius:10px;
opacity:0;
transition:0.4s;
}

#toast.show{
opacity:1;
}

</style>
</head>

<body>

<div class="navbar">
<div class="logo">🍴 FoodieHub</div>
<div class="nav-links">
<a href="index.jsp">Home</a>
<a href="${pageContext.request.contextPath}/restaurants">Restaurants</a>
<a href="#">My Orders</a>
<a href="profile.jsp">Profile</a>
</div>
</div>

<a href="index.jsp" class="back-btn">← Back</a>

<h2 style="margin:20px 0;">Your Cart</h2>

<c:forEach var="item" items="${sessionScope.cart}">

<div class="cart-item"
data-menuid="${item.menuId}"
data-price="${item.price}"
data-qty="${item.quantity}">

<div class="item-left">
<img src="${pageContext.request.contextPath}/${m.imageURL}">

<div class="item-details">
<h3>${item.itemName}</h3>
<p>Delicious food item</p>
</div>
</div>

<div class="qty-box">
<button class="qty-btn minus">-</button>
<span class="qty">${item.quantity}</span>
<button class="qty-btn plus">+</button>
</div>

<div class="price">₹ ${item.price}</div>

<button class="delete-btn">🗑</button>

</div>

</c:forEach>

<div class="total-box">
<div>
<h3>Total Payable</h3>
<h2>₹ <span id="grandTotal">0</span></h2>
</div>

<form action="orders.jsp">
<input type="hidden" name="totalAmount" id="totalAmountInput">
<button class="place-btn">Place Order</button>
</form>
</div>

<div id="toast"></div>

<script>

const CART_URL = "${pageContext.request.contextPath}/CartItemServlet";

function showToast(msg){
let t=document.getElementById("toast");
t.innerText=msg;
t.classList.add("show");
setTimeout(()=>t.classList.remove("show"),2000);
}

function calculateGrandTotal(){
let total=0;
document.querySelectorAll('.cart-item').forEach(item=>{
total+=item.dataset.price*item.dataset.qty;
});
document.getElementById("grandTotal").innerText=total.toFixed(2);
document.getElementById("totalAmountInput").value=total.toFixed(2);
}

document.querySelectorAll('.cart-item').forEach(item=>{

let price=parseFloat(item.dataset.price);
let qty=parseInt(item.dataset.qty);
const qtySpan=item.querySelector(".qty");

item.querySelector(".plus").onclick=()=>{
qty++;
item.dataset.qty=qty;
qtySpan.innerText=qty;
updateCart(item.dataset.menuid,"update",qty);
calculateGrandTotal();
showToast("Quantity updated");
};

item.querySelector(".minus").onclick=()=>{
if(qty>1){
qty--;
item.dataset.qty=qty;
qtySpan.innerText=qty;
updateCart(item.dataset.menuid,"update",qty);
}else{
updateCart(item.dataset.menuid,"delete");
item.remove();
}
calculateGrandTotal();
showToast("Cart updated");
};

item.querySelector(".delete-btn").onclick=()=>{
updateCart(item.dataset.menuid,"delete");
item.remove();
calculateGrandTotal();
showToast("Item removed");
};

});

function updateCart(menuId,action,quantity=0){
let params=new URLSearchParams();
params.append("menuId",menuId);
params.append("action",action);
if(quantity>0) params.append("quantity",quantity);

fetch(CART_URL,{
method:"POST",
headers:{"Content-Type":"application/x-www-form-urlencoded"},
body:params.toString()
});
}

calculateGrandTotal();

</script>

</body>
</html>