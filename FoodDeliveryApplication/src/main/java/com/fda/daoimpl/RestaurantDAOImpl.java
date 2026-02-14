package com.fda.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import com.fda.dao.RestaurantDAO;
import com.fda.models.Restaurant;
import com.fda.util.DBConnection;


public class RestaurantDAOImpl implements RestaurantDAO {

	@Override
    public boolean addRestaurant(Restaurant r) {
        String sql = "INSERT INTO restaurant" +
                "(restaurantName, address, phoneNumber, rating, cuisine, deliveryTime, isActive, imageUrl, adminUserId) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, r.getRestaurantName());
            ps.setString(2, r.getAddress());
            ps.setString(3, r.getPhoneNumber());
            ps.setBigDecimal(4, r.getRating());
            ps.setString(5, r.getCuisine());
            ps.setInt(6, r.getDeliveryTime());
            ps.setBoolean(7, r.isActive());
            ps.setString(8, r.getImageUrl());
            ps.setInt(9, r.getAdminUserId());

            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

	@Override
    public boolean updateRestaurant(Restaurant r) {
        String sql = "UPDATE restaurant SET restaurantName=?, address=?, phoneNumber=?, rating=?, cuisine=?, " +
                     "deliveryTime=?, isActive=?, imageUrl=? WHERE restaurantId=?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, r.getRestaurantName());
            ps.setString(2, r.getAddress());
            ps.setString(3, r.getPhoneNumber());
            ps.setBigDecimal(4, r.getRating());
            ps.setString(5, r.getCuisine());
            ps.setInt(6, r.getDeliveryTime());
            ps.setBoolean(7, r.isActive());
            ps.setString(8, r.getImageUrl());
            ps.setInt(9, r.getRestaurantId());

            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean deleteRestaurant(int restaurantId) {
        String sql = "DELETE FROM restaurant WHERE restaurantId=?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, restaurantId);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public Restaurant getRestaurantById(int restaurantId) {
        String sql = "SELECT * FROM restaurant WHERE restaurantId=?";
        Restaurant r = null;

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, restaurantId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                r = new Restaurant();
                r.setRestaurantId(rs.getInt("restaurantId"));
                r.setRestaurantName(rs.getString("restaurantName"));
                r.setAddress(rs.getString("address"));
                r.setPhoneNumber(rs.getString("phoneNumber"));
                r.setRating(rs.getBigDecimal("rating"));
                r.setCuisine(rs.getString("cuisine"));
                r.setDeliveryTime(rs.getInt("deliveryTime"));
                r.setActive(rs.getBoolean("isActive"));
                r.setImageUrl(rs.getString("imageUrl"));
                r.setAdminUserId(rs.getInt("adminUserId"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return r;
    }
    
    

    @Override
    public List<Restaurant> getAllRestaurants() {
        List<Restaurant> list = new ArrayList<>();
        String sql = "SELECT * FROM restaurant";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Restaurant r = new Restaurant();
                r.setRestaurantId(rs.getInt("restaurantId"));
                r.setRestaurantName(rs.getString("restaurantName"));
                r.setAddress(rs.getString("address"));
                r.setPhoneNumber(rs.getString("phoneNumber"));
                r.setRating(rs.getBigDecimal("rating"));
                r.setCuisine(rs.getString("cuisine"));
                r.setDeliveryTime(rs.getInt("deliveryTime"));
                r.setActive(rs.getBoolean("isActive"));
                r.setImageUrl(rs.getString("imageUrl"));
                r.setAdminUserId(rs.getInt("adminUserId"));

                list.add(r);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
//    display all the restaurants on the eclipse console for testing
//	public static void main(String[] args) {
//		RestaurantDAO restaurantDAO = new RestaurantDAOImpl();
//		List<Restaurant> restaurants = restaurantDAO.getAllRestaurants();
//		for (Restaurant r : restaurants) {
//			System.out.println(r.getRestaurantName() + " - " + r.getImageUrl());
//		}
//	}
    
    

}
