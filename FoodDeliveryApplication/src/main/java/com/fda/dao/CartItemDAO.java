package com.fda.dao;

import java.util.List;

import com.fda.models.CartItem;

public interface CartItemDAO {
	
	List<CartItem> getCartItemsByUserId(int userId);
	
	boolean addCartItem(CartItem cartItem, int userId);
	
	boolean updateCartItem(CartItem cartItem, int userId);
	
	boolean deleteCartItem(int menuId, int userId);
	
	

}
