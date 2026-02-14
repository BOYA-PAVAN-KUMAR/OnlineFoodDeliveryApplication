package com.fda.daoimpl;

import java.util.*;
import com.fda.dao.CartItemDAO;
import com.fda.models.CartItem;

public class CartItemDAOImpl implements CartItemDAO {

    // userId → cart items
    private static Map<Integer, List<CartItem>> cartDB = new HashMap<>();

    @Override
    public List<CartItem> getCartItemsByUserId(int userId) {
        return cartDB.getOrDefault(userId, new ArrayList<>());
    }

    @Override
    public boolean addCartItem(CartItem cartItem, int userId) {
        List<CartItem> cart = cartDB.getOrDefault(userId, new ArrayList<>());

        for (CartItem item : cart) {
            if (item.getMenuId() == cartItem.getMenuId()) {
                item.setQuantity(item.getQuantity() + cartItem.getQuantity());
                cartDB.put(userId, cart);
                return true;
            }
        }

        cart.add(cartItem);
        cartDB.put(userId, cart);
        return true;
    }

    @Override
    public boolean updateCartItem(CartItem cartItem, int userId) {
        List<CartItem> cart = cartDB.get(userId);
        if (cart == null) return false;

        for (CartItem item : cart) {
            if (item.getMenuId() == cartItem.getMenuId()) {
                item.setQuantity(cartItem.getQuantity());
                return true;
            }
        }
        return false;
    }

    @Override
    public boolean deleteCartItem(int menuId, int userId) {
        List<CartItem> cart = cartDB.get(userId);
        if (cart == null) return false;

        return cart.removeIf(item -> item.getMenuId() == menuId);
    }
}
