package com.fda.servlets;

import com.fda.dao.OrderItemDAO;
import com.fda.dao.OrdersDAO;
import com.fda.daoimpl.OrderItemDAOImpl;
import com.fda.daoimpl.OrdersDAOImpl;
import com.fda.models.CartItem;
import com.fda.models.OrderItem;
import com.fda.models.Orders;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;


@WebServlet("/order")
public class OrderServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private OrdersDAO ordersDAO = new OrdersDAOImpl();
	private OrderItemDAO orderItemDAO = new OrderItemDAOImpl();

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		HttpSession session = req.getSession();
		List<CartItem> cart =
				(List<CartItem>) session.getAttribute("cart");

		if (cart == null || cart.isEmpty()) {
			resp.sendRedirect("viewCart.jsp");
			return;
		}

		try {

			// 1️⃣ Create Order
			Orders order = new Orders();
			order.setOrderDate(LocalDate.now());
			order.setRestaurantId(1);   // static for now
			order.setUserId(1);         // static for now
			order.setTotalAmount(
					new BigDecimal(req.getParameter("totalAmount"))
					);
			order.setPaymentMethod(req.getParameter("paymentMethod"));
			order.setStatus("Pending");
			order.setDeliveryAddress(req.getParameter("deliveryAddress"));

			int orderId = ordersDAO.addOrderAndReturnId(order);

			if (orderId <= 0) {
				resp.getWriter().println("Order failed!");
				return;
			}

			// 2️⃣ Insert Order Items
			for (CartItem c : cart) {

				OrderItem oi = new OrderItem();
				oi.setOrderId(orderId);
				oi.setMenuId(c.getMenuId());
				oi.setItemName(c.getItemName());
				oi.setQuantity(c.getQuantity());

				BigDecimal itemTotal =
						BigDecimal.valueOf(c.getPrice())
						.multiply(BigDecimal.valueOf(c.getQuantity()));

				oi.setTotalPrice(itemTotal);

				orderItemDAO.addOrderItem(oi);
			}

			// 3️⃣ Clear cart
			session.removeAttribute("cart");

			resp.sendRedirect("success.jsp");

		} catch (Exception e) {
			e.printStackTrace();
			resp.getWriter().println("Something went wrong!");
		}
	}

}
