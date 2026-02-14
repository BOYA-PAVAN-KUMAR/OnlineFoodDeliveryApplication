package com.fda.servlets;

import com.fda.dao.*;
import com.fda.daoimpl.*;
import com.fda.models.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;

@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

    private OrdersDAO ordersDAO = new OrdersDAOImpl();
    private OrderItemDAO orderItemDAO = new OrderItemDAOImpl();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession();
        @SuppressWarnings("unchecked")
		List<CartItem> cart =
                (List<CartItem>) session.getAttribute("cart");

        if (cart == null || cart.isEmpty()) {
            resp.sendRedirect("viewcart.jsp");
            return;
        }

        int userId = (int) session.getAttribute("userId");
        int restaurantId = Integer.parseInt(req.getParameter("restaurantId"));
        String address = req.getParameter("deliveryAddress");
        String paymentMethod = req.getParameter("paymentMethod");

        BigDecimal grandTotal = BigDecimal.ZERO;

        for (CartItem c : cart) {
            grandTotal = grandTotal.add(
                    BigDecimal.valueOf(c.getPrice() * c.getQuantity())
            );
        }

        // 1️⃣ Create Order
        Orders order = new Orders();
        order.setOrderDate(LocalDate.now());
        order.setRestaurantId(restaurantId);
        order.setUserId(userId);
        order.setTotalAmount(grandTotal);
        order.setPaymentMethod(paymentMethod);
        order.setStatus("Placed");
        order.setDeliveryAddress(address);

        ordersDAO.addOrder(order);

        // 2️⃣ Get latest orderId
        Orders latestOrder = ordersDAO.getAllOrders()
                .get(ordersDAO.getAllOrders().size() - 1);

        int orderId = latestOrder.getOrderId();

        // 3️⃣ Insert OrderItems
        for (CartItem c : cart) {
            OrderItem oi = new OrderItem();
            oi.setOrderId(orderId);
            oi.setMenuId(c.getMenuId());
            oi.setItemName(c.getItemName());
            oi.setQuantity(c.getQuantity());
            oi.setTotalPrice(
                    BigDecimal.valueOf(c.getPrice() * c.getQuantity())
            );
            orderItemDAO.addOrderItem(oi);
        }

        // 4️⃣ Clear cart
        session.removeAttribute("cart");

        resp.sendRedirect("orders.jsp");
    }
}
