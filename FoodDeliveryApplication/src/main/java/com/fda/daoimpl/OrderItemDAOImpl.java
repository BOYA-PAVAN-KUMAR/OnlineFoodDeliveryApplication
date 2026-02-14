package com.fda.daoimpl;


import com.fda.dao.OrderItemDAO;
import com.fda.models.OrderItem;
import com.fda.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderItemDAOImpl implements OrderItemDAO {

    @Override
    public boolean addOrderItem(OrderItem oi) {
        String sql = "INSERT INTO orderitem (orderId, menuId, itemName, quantity, totalPrice) " +
                     "VALUES (?, ?, ?, ?, ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, oi.getOrderId());
            ps.setInt(2, oi.getMenuId());
            ps.setString(3, oi.getItemName());
            ps.setInt(4, oi.getQuantity());
            ps.setBigDecimal(5, oi.getTotalPrice());

            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean updateOrderItem(OrderItem oi) {
        String sql = "UPDATE orderitem SET quantity=?, totalPrice=? WHERE orderItemId=?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, oi.getQuantity());
            ps.setBigDecimal(2, oi.getTotalPrice());
            ps.setInt(3, oi.getOrderItemId());

            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean deleteOrderItem(int orderItemId) {
        String sql = "DELETE FROM orderitem WHERE orderItemId=?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, orderItemId);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public OrderItem getOrderItemById(int orderItemId) {
        String sql = "SELECT * FROM orderitem WHERE orderItemId=?";
        OrderItem oi = null;

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, orderItemId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                oi = new OrderItem();
                oi.setOrderItemId(rs.getInt("orderItemId"));
                oi.setOrderId(rs.getInt("orderId"));
                oi.setMenuId(rs.getInt("menuId"));
                oi.setItemName(rs.getString("itemName"));
                oi.setQuantity(rs.getInt("quantity"));
                oi.setTotalPrice(rs.getBigDecimal("totalPrice"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return oi;
    }

    @Override
    public List<OrderItem> getAllOrderItems() {
        List<OrderItem> list = new ArrayList<>();
        String sql = "SELECT * FROM orderitem";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                OrderItem oi = new OrderItem();
                oi.setOrderItemId(rs.getInt("orderItemId"));
                oi.setOrderId(rs.getInt("orderId"));
                oi.setMenuId(rs.getInt("menuId"));
                oi.setItemName(rs.getString("itemName"));
                oi.setQuantity(rs.getInt("quantity"));
                oi.setTotalPrice(rs.getBigDecimal("totalPrice"));

                list.add(oi);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}

