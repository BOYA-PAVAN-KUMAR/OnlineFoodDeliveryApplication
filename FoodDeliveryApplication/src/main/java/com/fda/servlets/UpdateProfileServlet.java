package com.fda.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.fda.models.Users;

@WebServlet("/updateProfile")
public class UpdateProfileServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        Users user = (Users) session.getAttribute("user");

        String name = request.getParameter("username");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");

        // Update user object
        user.setUserName(name);
        user.setPhoneNumber(phone);
        user.setAddress(address);

        // TODO: Update database here if you have DAO

        session.setAttribute("user", user);

        response.sendRedirect("profile.jsp");
    }
}
