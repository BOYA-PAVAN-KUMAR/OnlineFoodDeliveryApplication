package com.fda.models;

import java.math.BigDecimal;

public class Menu {

    private int menuId;
    private String menuName;
    private BigDecimal price;
    private boolean isAvailable;
    private String description;
    private String imageURL;
    private int restaurantId;

    public Menu() {}

    public Menu(int menuId, String menuName, BigDecimal price, boolean isAvailable,
                String description, String imageURL, int restaurantId) {
        this.menuId = menuId;
        this.menuName = menuName;
        this.price = price;
        this.isAvailable = isAvailable;
        this.description = description;
        this.imageURL = imageURL;
        this.restaurantId = restaurantId;
    }

    // Getters and Setters
    public int getMenuId() { return menuId; }
    public void setMenuId(int menuId) { this.menuId = menuId; }

    public String getMenuName() { return menuName; }
    public void setMenuName(String menuName) { this.menuName = menuName; }

    public BigDecimal getPrice() { return price; }
    public void setPrice(BigDecimal price) { this.price = price; }

    public boolean isAvailable() { return isAvailable; }
    public void setAvailable(boolean available) { isAvailable = available; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public String getImageURL() { return imageURL; }
    public void setImageURL(String imageURL) { this.imageURL = imageURL; }

    public int getRestaurantId() { return restaurantId; }
    public void setRestaurantId(int restaurantId) { this.restaurantId = restaurantId; }
}
