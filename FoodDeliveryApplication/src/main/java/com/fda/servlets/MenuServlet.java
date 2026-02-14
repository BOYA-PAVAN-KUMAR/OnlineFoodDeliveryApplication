package com.fda.servlets;

import com.fda.dao.MenuDAO;
import com.fda.daoimpl.MenuDAOImpl;
import com.fda.models.Menu;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.math.BigDecimal;

@WebServlet("/menu")
public class MenuServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

    private MenuDAO menuDAO = new MenuDAOImpl();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String action = req.getParameter("action");

        if ("add".equals(action)) {
            Menu m = new Menu();
            m.setMenuName(req.getParameter("menuName"));
            m.setPrice(new BigDecimal(req.getParameter("price")));
            m.setDescription(req.getParameter("description"));
            m.setImageURL(req.getParameter("imageUrl"));
            m.setRestaurantId(Integer.parseInt(req.getParameter("restaurantId")));
            m.setAvailable(true);

            menuDAO.addMenu(m);
            resp.sendRedirect("menu.jsp");
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String restaurantIdStr = req.getParameter("restaurantId");

        if (restaurantIdStr != null) {
            int restaurantId = Integer.parseInt(restaurantIdStr);

            req.setAttribute("menuList",
                    menuDAO.getMenusByRestaurantId(restaurantId));

            req.getRequestDispatcher("menu.jsp").forward(req, resp);
        }
    }

}
