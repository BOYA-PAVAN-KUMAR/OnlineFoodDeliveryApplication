package com.fda.daoimpl;



import com.fda.dao.MenuDAO;
import com.fda.models.Menu;
import com.fda.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MenuDAOImpl implements MenuDAO {

    @Override
    public boolean addMenu(Menu m) {
        String sql = "INSERT INTO menu (menuName, price, isAvailable, description, imageURL, restaurantId) " +
                     "VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, m.getMenuName());
            ps.setBigDecimal(2, m.getPrice());
            ps.setBoolean(3, m.isAvailable());
            ps.setString(4, m.getDescription());
            ps.setString(5, m.getImageURL());
            ps.setInt(6, m.getRestaurantId());

            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean updateMenu(Menu m) {
        String sql = "UPDATE menu SET menuName=?, price=?, isAvailable=?, description=?, imageURL=? WHERE menuId=?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, m.getMenuName());
            ps.setBigDecimal(2, m.getPrice());
            ps.setBoolean(3, m.isAvailable());
            ps.setString(4, m.getDescription());
            ps.setString(5, m.getImageURL());
            ps.setInt(6, m.getMenuId());

            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean deleteMenu(int menuId) {
        String sql = "DELETE FROM menu WHERE menuId=?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, menuId);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public Menu getMenuById(int menuId) {
        String sql = "SELECT * FROM menu WHERE menuId=?";
        Menu m = null;

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, menuId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                m = new Menu();
                m.setMenuId(rs.getInt("menuId"));
                m.setMenuName(rs.getString("menuName"));
                m.setPrice(rs.getBigDecimal("price"));
                m.setAvailable(rs.getBoolean("isAvailable"));
                m.setDescription(rs.getString("description"));
                m.setImageURL(rs.getString("imageURL"));
                m.setRestaurantId(rs.getInt("restaurantId"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return m;
    }

    @Override
    public List<Menu> getAllMenus() {
        List<Menu> list = new ArrayList<>();
        String sql = "SELECT * FROM menu";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Menu m = new Menu();
                m.setMenuId(rs.getInt("menuId"));
                m.setMenuName(rs.getString("menuName"));
                m.setPrice(rs.getBigDecimal("price"));
                m.setAvailable(rs.getBoolean("isAvailable"));
                m.setDescription(rs.getString("description"));
                m.setImageURL(rs.getString("imageURL"));
                m.setRestaurantId(rs.getInt("restaurantId"));

                list.add(m);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public List<Menu> getMenusByRestaurantId(int restaurantId) {

        List<Menu> list = new ArrayList<>();
        String sql = "SELECT * FROM menu WHERE restaurantId=? AND isAvailable=1";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, restaurantId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Menu m = new Menu();
                m.setMenuId(rs.getInt("menuId"));
                m.setMenuName(rs.getString("menuName"));
                m.setPrice(rs.getBigDecimal("price"));
                m.setAvailable(rs.getBoolean("isAvailable"));
                m.setDescription(rs.getString("description"));
                m.setImageURL(rs.getString("imageURL"));
                m.setRestaurantId(rs.getInt("restaurantId"));

                list.add(m);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

}

