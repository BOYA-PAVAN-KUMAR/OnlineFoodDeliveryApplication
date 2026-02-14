package com.fda.servlets;



import com.fda.dao.OrderItemDAO;
import com.fda.daoimpl.OrderItemDAOImpl;
import com.fda.models.OrderItem;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.math.BigDecimal;

@WebServlet("/orderitem")
public class OrderItemServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

    private OrderItemDAO orderItemDAO = new OrderItemDAOImpl();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String action = req.getParameter("action");

        if ("add".equals(action)) {
            OrderItem oi = new OrderItem();

            oi.setOrderId(Integer.parseInt(req.getParameter("orderId")));
            oi.setMenuId(Integer.parseInt(req.getParameter("menuId")));
            oi.setItemName(req.getParameter("itemName"));
            oi.setQuantity(Integer.parseInt(req.getParameter("quantity")));
            oi.setTotalPrice(new BigDecimal(req.getParameter("totalPrice")));

            orderItemDAO.addOrderItem(oi);
            resp.sendRedirect("orderitems.jsp");
        }

        if ("update".equals(action)) {
            OrderItem oi = new OrderItem();

            oi.setOrderItemId(Integer.parseInt(req.getParameter("orderItemId")));
            oi.setQuantity(Integer.parseInt(req.getParameter("quantity")));
            oi.setTotalPrice(new BigDecimal(req.getParameter("totalPrice")));

            orderItemDAO.updateOrderItem(oi);
            resp.sendRedirect("orderitems.jsp");
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String action = req.getParameter("action");

        if ("delete".equals(action)) {
            int id = Integer.parseInt(req.getParameter("id"));
            orderItemDAO.deleteOrderItem(id);
            resp.sendRedirect("orderitems.jsp");
        }
    }
}
