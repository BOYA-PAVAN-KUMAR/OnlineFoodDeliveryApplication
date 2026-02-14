package com.fda.models;

import java.math.BigDecimal;

public class OrderItem {

    private int orderItemId;
    private int orderId;
    private Integer menuId;
    private String itemName;
    private int quantity;
    private BigDecimal totalPrice;

    public OrderItem() {}

    public OrderItem(int orderItemId, int orderId, Integer menuId,
                     String itemName, int quantity, BigDecimal totalPrice) {
        this.orderItemId = orderItemId;
        this.orderId = orderId;
        this.menuId = menuId;
        this.itemName = itemName;
        this.quantity = quantity;
        this.totalPrice = totalPrice;
    }

    // Getters and Setters
    public int getOrderItemId() { return orderItemId; }
    public void setOrderItemId(int orderItemId) { this.orderItemId = orderItemId; }

    public int getOrderId() { return orderId; }
    public void setOrderId(int orderId) { this.orderId = orderId; }

    public Integer getMenuId() { return menuId; }
    public void setMenuId(Integer menuId) { this.menuId = menuId; }

    public String getItemName() { return itemName; }
    public void setItemName(String itemName) { this.itemName = itemName; }

    public int getQuantity() { return quantity; }
    public void setQuantity(int quantity) { this.quantity = quantity; }

    public BigDecimal getTotalPrice() { return totalPrice; }
    public void setTotalPrice(BigDecimal totalPrice) { this.totalPrice = totalPrice; }
}
