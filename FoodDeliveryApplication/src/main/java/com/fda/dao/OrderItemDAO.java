package com.fda.dao;

import java.util.List;
import com.fda.models.OrderItem;

public interface OrderItemDAO {

    boolean addOrderItem(OrderItem orderItem);

    boolean updateOrderItem(OrderItem orderItem);

    boolean deleteOrderItem(int orderItemId);

    OrderItem getOrderItemById(int orderItemId);

    List<OrderItem> getAllOrderItems();
}
