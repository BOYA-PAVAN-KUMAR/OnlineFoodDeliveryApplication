package com.fda.dao;

import java.util.List;
import com.fda.models.Menu;

public interface MenuDAO {

    boolean addMenu(Menu menu);

    boolean updateMenu(Menu menu);

    boolean deleteMenu(int menuId);

    Menu getMenuById(int menuId);

    List<Menu> getAllMenus();
    
   List<Menu> getMenusByRestaurantId(int restaurantId);
}
