package com.fda.servlets;

import com.fda.models.CartItem;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.*;

@WebServlet("/CartItemServlet")
public class CartItemServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession();
        @SuppressWarnings("unchecked")
		List<CartItem> cart =
            (List<CartItem>) session.getAttribute("cart");

        if (cart == null) {
            cart = new ArrayList<>();
            session.setAttribute("cart", cart);
        }

        String action = req.getParameter("action");
        int menuId = Integer.parseInt(req.getParameter("menuId"));

        // ADD ITEM
        if ("add".equals(action)) {
            String name = req.getParameter("itemName");
            double price = Double.parseDouble(req.getParameter("price"));

            boolean found = false;
            for (CartItem c : cart) {
                if (c.getMenuId() == menuId) {
                    c.setQuantity(c.getQuantity() + 1);
                    found = true;
                    break;
                }
            }

            if (!found) {
                cart.add(new CartItem(menuId, name, price, 1));
            }
        }

        // UPDATE QTY
        if ("update".equals(action)) {
            int qty = Integer.parseInt(req.getParameter("quantity"));
            Iterator<CartItem> it = cart.iterator();
            while (it.hasNext()) {
                CartItem c = it.next();
                if (c.getMenuId() == menuId) {
                    if (qty <= 0) it.remove();
                    else c.setQuantity(qty);
                }
            }
        }

        // DELETE ITEM
        if ("delete".equals(action)) {
            cart.removeIf(c -> c.getMenuId() == menuId);
        }

        session.setAttribute("cart", cart);
        resp.sendRedirect(req.getContextPath() + "/viewCart.jsp");
        
        resp.setStatus(HttpServletResponse.SC_OK);
        
    }
    
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.getRequestDispatcher("viewCart.jsp").forward(req, resp);
	}
    
    
    
}
