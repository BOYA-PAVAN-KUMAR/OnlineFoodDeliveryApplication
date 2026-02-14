package com.fda.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fda.dao.RestaurantDAO;
import com.fda.daoimpl.RestaurantDAOImpl;
import com.fda.models.Restaurant;

@WebServlet("/restaurants")
public class RestaurantsServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        RestaurantDAO dao = new RestaurantDAOImpl();
        List<Restaurant> restaurants = dao.getAllRestaurants();

        request.setAttribute("restaurants", restaurants);

        request.getRequestDispatcher("restaurants.jsp")
               .forward(request, response);
    }
    
    
}
