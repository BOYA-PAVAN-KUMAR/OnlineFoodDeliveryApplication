<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>FoodieHub | Menu</title>

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            padding: 40px 60px;
            font-family: 'Poppins', sans-serif;
            background: #0f172a;
            color: #e5e7eb;
        }

        h2 {
            margin-bottom: 30px;
            font-size: 28px;
            font-weight: 600;
            color: #f9fafb;
        }

        /* GRID */
        .menu-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
            gap: 28px;
        }

        /* CARD */
        .menu-card {
            background: #020617;
            border-radius: 18px;
            overflow: hidden;
            box-shadow: 0 12px 40px rgba(0,0,0,0.45);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .menu-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 20px 60px rgba(0,0,0,0.6);
        }

        .menu-card img {
            width: 100%;
            height: 190px;
            object-fit: cover;
        }

        /* BODY */
        .menu-body {
            padding: 18px;
        }

        .menu-body h3 {
            margin: 0;
            font-size: 18px;
            font-weight: 600;
            color: #f8fafc;
        }

        .desc {
            font-size: 13px;
            color: #9ca3af;
            margin: 8px 0 14px;
            line-height: 1.4;
        }
        
        /* BACK BUTTON */
.back-btn {
    display: inline-block;
    margin-bottom: 25px;
    text-decoration: none;
    color: #f97316;
    font-weight: 600;
    font-size: 14px;
    transition: 0.3s ease;
}

.back-btn:hover {
    color: #fb923c;
    transform: translateX(-5px);
}
        

        /* FOOTER */
        .menu-footer {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .price {
            font-size: 17px;
            font-weight: 600;
            color: #22c55e;
        }

        .add-btn {
            background: linear-gradient(135deg, #f97316, #fb923c);
            border: none;
            color: #020617;
            padding: 8px 18px;
            border-radius: 999px;
            font-size: 13px;
            font-weight: 600;
            cursor: pointer;
            transition: transform 0.2s ease, box-shadow 0.2s ease;
        }

        .add-btn:hover {
            transform: scale(1.05);
            box-shadow: 0 6px 18px rgba(249,115,22,0.5);
        }

        .add-btn:active {
            transform: scale(0.95);
        }

        /* EMPTY STATE */
        .empty {
            color: #9ca3af;
            font-size: 15px;
        }

        /* MOBILE */
        @media (max-width: 768px) {
            body {
                padding: 25px;
            }
        }
    </style>
</head>

<body>

<a href="${pageContext.request.contextPath}/restaurants" class="back-btn">
    ← Back
</a>


<h2>🍽️ Explore Menu</h2>

<c:if test="${empty menuList}">
    <p class="empty">No menu items available.</p>
</c:if>

<div class="menu-grid">
<c:forEach var="m" items="${menuList}">
    <div class="menu-card">

        <img src="${pageContext.request.contextPath}/${m.imageURL}" alt="${m.menuName}">

        <div class="menu-body">
            <h3>${m.menuName}</h3>
            <div class="desc">${m.description}</div>

            <div class="menu-footer">
                <div class="price">₹ ${m.price}</div>

                <!-- ADD TO CART -->
                <form action="${pageContext.request.contextPath}/CartItemServlet" method="post">
                		 <input type="hidden" name="action" value="add">
                    <input type="hidden" name="menuId" value="${m.menuId}">
                    <input type="hidden" name="itemName" value="${m.menuName}">
                    <input type="hidden" name="price" value="${m.price}">
                    <input type="hidden" name="quantity" value="1">

                    <button type="submit" class="add-btn">Add</button>
                </form>
            </div>
        </div>

    </div>
</c:forEach>
</div>

</body>
</html>
