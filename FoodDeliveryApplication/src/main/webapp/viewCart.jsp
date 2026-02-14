<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Your Cart | FoodieHub</title>

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">

    <style>
        body {
            margin: 0;
            padding: 40px 60px;
            font-family: 'Poppins', sans-serif;
            background: #0f172a;
            color: #e5e7eb;
        }

        h2 {
            margin-bottom: 25px;
            font-size: 28px;
            font-weight: 600;
        }

        .cart-container {
            max-width: 900px;
            margin: auto;
        }

        .cart-item {
            display: grid;
            grid-template-columns: 2fr 1fr 1fr 1fr 0.5fr;
            align-items: center;
            background: #020617;
            padding: 18px 22px;
            border-radius: 16px;
            margin-bottom: 16px;
            box-shadow: 0 15px 35px rgba(0,0,0,0.6);
        }

        .cart-item h3 {
            margin: 0;
            font-size: 17px;
            font-weight: 600;
        }

        .price {
            font-weight: 600;
            color: #fb923c;
        }

        .qty-control {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .qty-btn {
            width: 32px;
            height: 32px;
            border-radius: 50%;
            border: none;
            background: #1e293b;
            color: white;
            font-size: 18px;
            cursor: pointer;
        }

        .qty-btn:hover {
            background: #334155;
        }

        .qty {
            min-width: 20px;
            text-align: center;
            font-weight: 600;
        }

        .item-total {
            font-weight: 600;
        }

        .delete-btn {
            background: transparent;
            border: none;
            color: #ef4444;
            font-size: 20px;
            cursor: pointer;
        }

        .delete-btn:hover {
            color: #dc2626;
        }

        .total-box {
            background: #020617;
            margin-top: 30px;
            padding: 22px;
            border-radius: 18px;
            box-shadow: 0 15px 35px rgba(0,0,0,0.6);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .grand-total {
            font-size: 24px;
            font-weight: 700;
            color: #22c55e;
        }

        .checkout-btn {
            background: linear-gradient(135deg, #22c55e, #16a34a);
            color: #020617;
            border: none;
            padding: 12px 26px;
            border-radius: 12px;
            font-size: 15px;
            font-weight: 600;
            cursor: pointer;
        }

        .empty {
            text-align: center;
            color: #94a3b8;
            margin-top: 80px;
        }

        /* TOAST */
        #toast {
            position: fixed;
            bottom: 30px;
            right: 30px;
            background: #22c55e;
            color: #020617;
            padding: 14px 22px;
            border-radius: 12px;
            opacity: 0;
            transition: 0.4s;
            font-weight: 600;
        }

        #toast.show {
            opacity: 1;
        }
    </style>
</head>

<body>



<div class="cart-container">

<h2>🛒 Your Cart</h2>

<c:if test="${empty sessionScope.cart}">
    <p class="empty">Your cart is empty.</p>
</c:if>

<c:forEach var="item" items="${sessionScope.cart}">
    <div class="cart-item"
         data-menuid="${item.menuId}"
         data-price="${item.price}"
         data-qty="${item.quantity}">

        <h3>${item.itemName}</h3>
        <div class="price">₹ ${item.price}</div>

        <div class="qty-control">
            <button class="qty-btn minus">−</button>
            <span class="qty">${item.quantity}</span>
            <button class="qty-btn plus">+</button>
        </div>

        <div class="item-total">₹ ${item.price * item.quantity}</div>
        <button class="delete-btn">🗑</button>
    </div>
</c:forEach>

<c:if test="${not empty sessionScope.cart}">
    <div class="total-box">
        <div>
            <h3>Total Payable</h3>
            <div class="grand-total">₹ <span id="grandTotal">0</span></div>
        </div>

        <form action="orders.jsp" method="get">

            <input type="hidden" name="totalAmount" id="totalAmountInput">
            
            
            <button type="submit" class="checkout-btn">💳 Place Order</button>
        </form>
    </div>
</c:if>

</div>

<div id="toast"></div>

<script>
const CART_URL = "${pageContext.request.contextPath}/CartItemServlet";

function showToast(msg) {
    const t = document.getElementById("toast");
    t.innerText = msg;
    t.classList.add("show");
    setTimeout(() => t.classList.remove("show"), 2500);
}

function updateCart(menuId, action, quantity = 0) {
    const params = new URLSearchParams();
    params.append("menuId", menuId);
    params.append("action", action);
    if (quantity > 0) params.append("quantity", quantity);

    fetch(CART_URL, {
        method: "POST",
        headers: { "Content-Type": "application/x-www-form-urlencoded" },
        body: params.toString()
    });
}

function calculateGrandTotal() {
    let total = 0;
    document.querySelectorAll('.cart-item').forEach(item => {
        total += item.dataset.price * item.dataset.qty;
    });
    document.getElementById("grandTotal").innerText = total.toFixed(2);
    document.getElementById("totalAmountInput").value = total.toFixed(2);
}

document.querySelectorAll('.cart-item').forEach(item => {
    let price = parseFloat(item.dataset.price);
    let qty = parseInt(item.dataset.qty);

    const qtySpan = item.querySelector(".qty");
    const totalDiv = item.querySelector(".item-total");

    item.querySelector(".plus").onclick = () => {
        qty++;
        item.dataset.qty = qty;
        qtySpan.innerText = qty;
        totalDiv.innerText = "₹ " + (price * qty).toFixed(2);
        updateCart(item.dataset.menuid, "update", qty);
        calculateGrandTotal();
        showToast("Quantity updated");
    };

    item.querySelector(".minus").onclick = () => {
        if (qty > 1) {
            qty--;
            item.dataset.qty = qty;
            qtySpan.innerText = qty;
            totalDiv.innerText = "₹ " + (price * qty).toFixed(2);
            updateCart(item.dataset.menuid, "update", qty);
        } else {
            updateCart(item.dataset.menuid, "delete");
            item.remove();
        }
        calculateGrandTotal();
        showToast("Cart updated");
    };

    item.querySelector(".delete-btn").onclick = () => {
        updateCart(item.dataset.menuid, "delete");
        item.remove();
        calculateGrandTotal();
        showToast("Item removed");
    };
});

calculateGrandTotal();
</script>

</body>
</html>
