package com.fda.servlets;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.fda.daoimpl.UserDAOImpl;
import com.fda.models.Users;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        Users user = new Users();

        user.setUserName(request.getParameter("username"));
        user.setEmail(request.getParameter("email"));
        user.setPhoneNumber(request.getParameter("phone"));
        user.setPassword(request.getParameter("password"));
        user.setAddress(request.getParameter("address"));
        user.setRole("CUSTOMER");

        UserDAOImpl dao = new UserDAOImpl();
        dao.addUser(user);

        response.sendRedirect("login.jsp");
    }
}
