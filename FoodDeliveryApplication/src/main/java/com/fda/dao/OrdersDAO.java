package com.fda.dao;

import java.util.List;
import com.fda.models.Orders;

public interface OrdersDAO {

    boolean addOrder(Orders orders);

    boolean updateOrder(Orders orders);

    boolean deleteOrder(int orderId);

    Orders getOrderById(int orderId);

    List<Orders> getAllOrders();
    
    int addOrderAndReturnId(Orders order);

}
