package com.fda.dao;

import java.util.List;
import com.fda.models.Restaurant;

public interface RestaurantDAO {

    boolean addRestaurant(Restaurant restaurant);

    boolean updateRestaurant(Restaurant restaurant);

    boolean deleteRestaurant(int restaurantId);

    Restaurant getRestaurantById(int restaurantId);

    List<Restaurant> getAllRestaurants();
    
    
    
}
