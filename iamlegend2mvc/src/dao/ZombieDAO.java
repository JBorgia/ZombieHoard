package dao;

import java.util.List;

import entities.Cart;
import entities.Customer;
import entities.InventoryItem;

public interface ZombieDAO {
	public List<InventoryItem> getRandomItems();
	public InventoryItem getInventoryItemById(int id);
	public List<InventoryItem> getInvetoryItemsBySearch(InventoryItem inventoryItem);
	public String addItemToCart(InventoryItem inventoryItem, Integer quantity);
	public Cart fetchCart();
	public void updateItemQuantity(int id, int quantity);
	public void removeFromCart(int id);
	public void persistCart(Cart cart);
	public Cart fetchLastActiveCart(Customer customer);
	public Cart getCart();
	public void mergeCart();
	public void setCart(Cart cart);
}
