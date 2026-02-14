package com.fda.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import com.fda.dao.UserDAO;
import com.fda.models.Users;
import com.fda.util.DBConnection;


public class UserDAOImpl implements UserDAO {

	@Override
    public boolean addUser(Users u) {
        String sql = "INSERT INTO users (userName, email, phoneNumber, password, address, role) " +
                     "VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, u.getUserName());
            ps.setString(2, u.getEmail());
            ps.setString(3, u.getPhoneNumber());
            ps.setString(4, u.getPassword());
            ps.setString(5, u.getAddress());
            ps.setString(6, u.getRole());

            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean updateUser(Users u) {
        String sql = "UPDATE users SET userName=?, email=?, phoneNumber=?, address=?, role=? WHERE userId=?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, u.getUserName());
            ps.setString(2, u.getEmail());
            ps.setString(3, u.getPhoneNumber());
            ps.setString(4, u.getAddress());
            ps.setString(5, u.getRole());
            ps.setInt(6, u.getUserId());

            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean deleteUser(int userId) {
        String sql = "DELETE FROM users WHERE userId=?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, userId);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public Users getUserById(int userId) {
        String sql = "SELECT * FROM users WHERE userId=?";
        Users u = null;

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                u = new Users();
                u.setUserId(rs.getInt("userId"));
                u.setUserName(rs.getString("userName"));
                u.setEmail(rs.getString("email"));
                u.setPhoneNumber(rs.getString("phoneNumber"));
                u.setAddress(rs.getString("address"));
                u.setRole(rs.getString("role"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return u;
    }

    
    @Override
    public List<Users> getAllUsers() {
        List<Users> list = new ArrayList<>();
        String sql = "SELECT * FROM users";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Users u = new Users();
                u.setUserId(rs.getInt("userId"));
                u.setUserName(rs.getString("userName"));
                u.setEmail(rs.getString("email"));
                u.setPhoneNumber(rs.getString("phoneNumber"));
                u.setAddress(rs.getString("address"));
                u.setRole(rs.getString("role"));

                list.add(u);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    @Override
    public Users loginUser(String email, String password) {

        String sql = "SELECT * FROM users WHERE email=? AND password=?";
        Users user = null;

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                user = new Users();
                user.setUserId(rs.getInt("userId"));
                user.setUserName(rs.getString("userName"));
                user.setEmail(rs.getString("email"));
                user.setRole(rs.getString("role"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }
    
    
    public Users getUserByEmail(String email) {

        Users u = null;
        String sql = "SELECT * FROM users WHERE email=?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                u = new Users();
                u.setUserId(rs.getInt("userId"));
                u.setUserName(rs.getString("userName"));
                u.setEmail(rs.getString("email"));
                u.setPhoneNumber(rs.getString("phoneNumber"));
                u.setPassword(rs.getString("password")); // IMPORTANT
                u.setAddress(rs.getString("address"));
                u.setRole(rs.getString("role"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return u;
    }

    

}
