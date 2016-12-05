package entities;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="cart_items")
public class CartItems {
	// +-------------------+---------+------+-----+---------+----------------+
	// | Field | Type | Null | Key | Default | Extra |
	// +-------------------+---------+------+-----+---------+----------------+
	// | cart_id | int(11) | NO | MUL | NULL | |
	// | inventory_item_id | int(11) | NO | MUL | NULL | |
	// | id | int(11) | NO | PRI | NULL | auto_increment |
	// | quantity | int(11) | YES | | NULL | |
	// +-------------------+---------+------+-----+---------+----------------+

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinColumn(name = "inventory_item_id")
	private InventoryItem inventoryItem;
	@ManyToOne
	@JoinColumn(name = "cart_id")
	private Cart cart;
	private Integer quantity = 0;
	

	public Double getItemsWeight() {
		return this.getInventoryItem().getWeight() * this.getQuantity();
	}

	public Double getItemsCost() {
		return this.getInventoryItem().getPrice() * this.getQuantity();
	}


	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public void calcQuantity() {
		this.quantity = 0;
		List<CartItems> cartItems = this.getCart().getCartItems();
		for (CartItems cartItem : cartItems) {
			if (cartItem.getId() == this.id)
				this.quantity++;
		}
	}

	@Override
	public String toString() {
		return "CartItems [id=" + id + ", inventoryItem=" + inventoryItem.getId() + ", cart=" + cart.getId() + ", quantity=" + quantity
				+ "]";
	}

	public InventoryItem getInventoryItem() {
		return inventoryItem;
	}

	public void setInventoryItem(InventoryItem inventoryItem) {
		this.inventoryItem = inventoryItem;
	}

	public Cart getCart() {
		return cart;
	}

	public void setCart(Cart cart) {
		this.cart = cart;
	}

	public int getId() {
		return id;
	}

}
