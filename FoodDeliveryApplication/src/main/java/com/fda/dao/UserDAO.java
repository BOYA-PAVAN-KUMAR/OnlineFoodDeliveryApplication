package com.fda.dao;

import java.util.List;
import com.fda.models.Users;

public interface UserDAO {

    boolean addUser(Users users);

    boolean updateUser(Users users);

    boolean deleteUser(int userId);

    Users getUserById(int userId);

    List<Users> getAllUsers();
    
    Users loginUser(String email, String password);

    public Users getUserByEmail(String email);
    
}
