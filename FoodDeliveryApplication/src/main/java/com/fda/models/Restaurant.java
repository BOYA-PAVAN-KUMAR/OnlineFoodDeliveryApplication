package com.fda.models;

import java.math.BigDecimal;

public class Restaurant {

    private int restaurantId;
    private String restaurantName;
    private String address;
    private String phoneNumber;
    private BigDecimal rating;
    private String cuisine;
    private int deliveryTime;
    private boolean isActive;
    private String imageUrl;
    private Integer adminUserId; // Nullable (ON DELETE SET NULL)

    public Restaurant() {}

    public Restaurant(int restaurantId, String restaurantName, String address,
                      String phoneNumber, BigDecimal rating, String cuisine,
                      int deliveryTime, boolean isActive,
                      String imageUrl, Integer adminUserId) {
        this.restaurantId = restaurantId;
        this.restaurantName = restaurantName;
        this.address = address;
        this.phoneNumber = phoneNumber;
        this.rating = rating;
        this.cuisine = cuisine;
        this.deliveryTime = deliveryTime;
        this.isActive = isActive;
        this.imageUrl = imageUrl;
        this.adminUserId = adminUserId;
    }

    // Getters and Setters
    public int getRestaurantId() { return restaurantId; }
    public void setRestaurantId(int restaurantId) { this.restaurantId = restaurantId; }

    public String getRestaurantName() { return restaurantName; }
    public void setRestaurantName(String restaurantName) { this.restaurantName = restaurantName; }

    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }

    public String getPhoneNumber() { return phoneNumber; }
    public void setPhoneNumber(String phoneNumber) { this.phoneNumber = phoneNumber; }

    public BigDecimal getRating() { return rating; }
    public void setRating(BigDecimal rating) { this.rating = rating; }

    public String getCuisine() { return cuisine; }
    public void setCuisine(String cuisine) { this.cuisine = cuisine; }

    public int getDeliveryTime() { return deliveryTime; }
    public void setDeliveryTime(int deliveryTime) { this.deliveryTime = deliveryTime; }

    public boolean isActive() { return isActive; }
    public void setActive(boolean active) { isActive = active; }

    public String getImageUrl() { return imageUrl; }
    public void setImageUrl(String imageUrl) { this.imageUrl = imageUrl; }

    public Integer getAdminUserId() { return adminUserId; }
    public void setAdminUserId(Integer adminUserId) { this.adminUserId = adminUserId; }
}
