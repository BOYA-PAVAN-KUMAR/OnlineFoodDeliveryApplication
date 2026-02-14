package com.fda.models;
import java.math.BigDecimal;
import java.time.LocalDate;

public class Orders {

    private int orderId;
    private LocalDate orderDate;
    private Integer restaurantId;
    private Integer userId;
    private BigDecimal totalAmount;
    private String paymentMethod;
    private String status;
    private String deliveryAddress;

    public Orders() {}

    public Orders(int orderId, LocalDate orderDate, Integer restaurantId,
                  Integer userId, BigDecimal totalAmount, String paymentMethod,
                  String status, String deliveryAddress) {
        this.orderId = orderId;
        this.orderDate = orderDate;
        this.restaurantId = restaurantId;
        this.userId = userId;
        this.totalAmount = totalAmount;
        this.paymentMethod = paymentMethod;
        this.status = status;
        this.deliveryAddress = deliveryAddress;
    }

    // Getters and Setters
    public int getOrderId() { return orderId; }
    public void setOrderId(int orderId) { this.orderId = orderId; }

    public LocalDate getOrderDate() { return orderDate; }
    public void setOrderDate(LocalDate orderDate) { this.orderDate = orderDate; }

    public Integer getRestaurantId() { return restaurantId; }
    public void setRestaurantId(Integer restaurantId) { this.restaurantId = restaurantId; }

    public Integer getUserId() { return userId; }
    public void setUserId(Integer userId) { this.userId = userId; }

    public BigDecimal getTotalAmount() { return totalAmount; }
    public void setTotalAmount(BigDecimal totalAmount) { this.totalAmount = totalAmount; }

    public String getPaymentMethod() { return paymentMethod; }
    public void setPaymentMethod(String paymentMethod) { this.paymentMethod = paymentMethod; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public String getDeliveryAddress() { return deliveryAddress; }
    public void setDeliveryAddress(String deliveryAddress) { this.deliveryAddress = deliveryAddress; }
}
