package com.fda.models;

import java.time.LocalDateTime;

public class Users {

    private int userId;
    private String userName;
    private String email;
    private String phoneNumber;
    private String password;
    private String address;
    private String role;
    private LocalDateTime createdDate;
    private LocalDateTime lastLoginDate;

    public Users() {}

    public Users(int userId, String userName, String email, String phoneNumber,
                 String password, String address, String role,
                 LocalDateTime createdDate, LocalDateTime lastLoginDate) {
        this.userId = userId;
        this.userName = userName;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.password = password;
        this.address = address;
        this.role = role;
        this.createdDate = createdDate;
        this.lastLoginDate = lastLoginDate;
    }

    // Getters and Setters
    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }

    public String getUserName() { return userName; }
    public void setUserName(String userName) { this.userName = userName; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPhoneNumber() { return phoneNumber; }
    public void setPhoneNumber(String phoneNumber) { this.phoneNumber = phoneNumber; }

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }

    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }

    public String getRole() { return role; }
    public void setRole(String role) { this.role = role; }

    public LocalDateTime getCreatedDate() { return createdDate; }
    public void setCreatedDate(LocalDateTime createdDate) { this.createdDate = createdDate; }

    public LocalDateTime getLastLoginDate() { return lastLoginDate; }
    public void setLastLoginDate(LocalDateTime lastLoginDate) { this.lastLoginDate = lastLoginDate; }
}
