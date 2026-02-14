package com.fda.servlets;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.fda.daoimpl.UserDAOImpl;
import com.fda.models.Users;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        UserDAOImpl dao = new UserDAOImpl();
        Users user = dao.getUserByEmail(email);

        if (user != null && user.getPassword().equals(password)) {

            HttpSession session = request.getSession();
            session.setAttribute("user", user);

            if ("ADMIN".equalsIgnoreCase(user.getRole())) {
                response.sendRedirect("adminDashboard.jsp");
            } else {
                response.sendRedirect("customerDashboard.jsp");
            }

        } else {
            request.setAttribute("error", "Invalid Email or Password!");
            request.getRequestDispatcher("login.jsp")
                    .forward(request, response);
        }
    }
}
