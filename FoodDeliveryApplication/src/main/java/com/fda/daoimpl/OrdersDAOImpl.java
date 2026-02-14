package com.fda.daoimpl;

import com.fda.dao.OrdersDAO;
import com.fda.models.Orders;
import com.fda.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrdersDAOImpl implements OrdersDAO {

    @Override
    public boolean addOrder(Orders o) {
        String sql = "INSERT INTO orders (orderDate, restaurantId, userId, totalAmount, paymentMethod, status, deliveryAddress) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setDate(1, Date.valueOf(o.getOrderDate()));
            ps.setInt(2, o.getRestaurantId());
            ps.setInt(3, o.getUserId());
            ps.setBigDecimal(4, o.getTotalAmount());
            ps.setString(5, o.getPaymentMethod());
            ps.setString(6, o.getStatus());
            ps.setString(7, o.getDeliveryAddress());

            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean updateOrder(Orders o) {
        String sql = "UPDATE orders SET totalAmount=?, paymentMethod=?, status=?, deliveryAddress=? WHERE orderId=?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setBigDecimal(1, o.getTotalAmount());
            ps.setString(2, o.getPaymentMethod());
            ps.setString(3, o.getStatus());
            ps.setString(4, o.getDeliveryAddress());
            ps.setInt(5, o.getOrderId());

            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean deleteOrder(int orderId) {
        String sql = "DELETE FROM orders WHERE orderId=?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, orderId);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public Orders getOrderById(int orderId) {
        String sql = "SELECT * FROM orders WHERE orderId=?";
        Orders o = null;

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, orderId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                o = new Orders();
                o.setOrderId(rs.getInt("orderId"));
                o.setOrderDate(rs.getDate("orderDate").toLocalDate());
                o.setRestaurantId(rs.getInt("restaurantId"));
                o.setUserId(rs.getInt("userId"));
                o.setTotalAmount(rs.getBigDecimal("totalAmount"));
                o.setPaymentMethod(rs.getString("paymentMethod"));
                o.setStatus(rs.getString("status"));
                o.setDeliveryAddress(rs.getString("deliveryAddress"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return o;
    }

    @Override
    public List<Orders> getAllOrders() {
        List<Orders> list = new ArrayList<>();
        String sql = "SELECT * FROM orders";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Orders o = new Orders();
                o.setOrderId(rs.getInt("orderId"));
                o.setOrderDate(rs.getDate("orderDate").toLocalDate());
                o.setRestaurantId(rs.getInt("restaurantId"));
                o.setUserId(rs.getInt("userId"));
                o.setTotalAmount(rs.getBigDecimal("totalAmount"));
                o.setPaymentMethod(rs.getString("paymentMethod"));
                o.setStatus(rs.getString("status"));
                o.setDeliveryAddress(rs.getString("deliveryAddress"));

                list.add(o);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    @Override
    public int addOrderAndReturnId(Orders o) {

        int orderId = 0;
        String sql = "INSERT INTO orders " +
                "(orderDate, restaurantId, userId, totalAmount, paymentMethod, status, deliveryAddress) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps =
                 con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            ps.setDate(1, Date.valueOf(o.getOrderDate()));
            ps.setInt(2, o.getRestaurantId());
            ps.setInt(3, o.getUserId());
            ps.setBigDecimal(4, o.getTotalAmount());
            ps.setString(5, o.getPaymentMethod());
            ps.setString(6, o.getStatus());
            ps.setString(7, o.getDeliveryAddress());

            ps.executeUpdate();
            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) orderId = rs.getInt(1);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return orderId;
    }

    
}

