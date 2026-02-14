package com.fda.servlets;

import com.fda.dao.UserDAO;
import com.fda.models.Users;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/user")
public class UserServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

    private UserDAO userDAO = new com.fda.daoimpl.UserDAOImpl();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String action = req.getParameter("action");

        if ("add".equals(action)) {
            Users user = new Users();
            user.setUserName(req.getParameter("username"));
            user.setEmail(req.getParameter("email"));
            user.setPhoneNumber(req.getParameter("phone"));
            user.setPassword(req.getParameter("password"));
            user.setAddress(req.getParameter("address"));
            user.setRole(req.getParameter("role"));

            userDAO.addUser(user);
            resp.sendRedirect("users.jsp");
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String action = req.getParameter("action");

        if ("delete".equals(action)) {
            int userId = Integer.parseInt(req.getParameter("id"));
            userDAO.deleteUser(userId);
            resp.sendRedirect("users.jsp");
        }
    }
}
