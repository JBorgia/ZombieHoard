package dao;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.transaction.annotation.Transactional;

import entities.Cart;
import entities.CartItems;
import entities.Customer;
import entities.InventoryItem;
import searchfilters.Filter;

@Transactional
public class ZombieDAOImpl implements ZombieDAO {
	Filter filter = new Filter();
	Cart cart = new Cart();

	@PersistenceContext
	EntityManager em;

	// +----------------------+
	// | Tables_in_iamlegend2 |
	// +----------------------+
	// | ammo |
	// | cart |
	// | cart_items |
	// | customer |
	// | equipment |
	// | inventory_item |
	// | nutrition |
	// | optic |
	// | weapon |
	// +----------------------+

	public List<InventoryItem> getRandomItems() {
		List<InventoryItem> inventoryItems = new ArrayList<>();
		String sqlAllInCategory = "SELECT i FROM InventoryItem AS i WHERE i.category=?1 AND i.quantityInStock>0";
		String[] categories = { "WEAPON", "AMMO", "EQUIPMENT", "NUTRITION", "OPTIC", "WEAPON" };

		for (String category : categories) {
			List<InventoryItem> allInCategory = em.createQuery(sqlAllInCategory).setParameter(1, category)
					.getResultList();
			Collections.shuffle(allInCategory);
			inventoryItems.add(allInCategory.get(0));
		}

		return inventoryItems;
	}

	public void updateItemQuantity(int id, int quantity) {
		this.cart.getCartItems().get(id).setQuantity(quantity);
	}

	public void removeFromCart(int id) {
		this.cart.getCartItems().remove(id);
	}

	public List<InventoryItem> getInvetoryItemsBySearch(InventoryItem inventoryItem) {
		System.out.println(inventoryItem);
		ArrayList<String> sql = filter.makeSQLbyInventoryItem(inventoryItem);
		Query query = em.createQuery(sql.get(0));
		for (int i = 1; i < sql.size(); i++) {
			query.setParameter(i, sql.get(i));
		}
		List<InventoryItem> inventoryItems = query.getResultList();

		// EntityTransaction tx = em.getTransaction();
		// tx.begin();
		// em.persist(a); //for additon of new inventoryItems only
		// tx.commit();

		return inventoryItems;
	}

	public String addItemToCart(InventoryItem inventoryItem, Integer quantity) {
		System.out.println(inventoryItem);
		int countAdded = 0;
		boolean soldOut = false;
		if (cart == null) {
			cart = new Cart();
		}
		int cartCount = 0;

		try {
			for (InventoryItem i : cart.getInventoryItems()) {
				System.out.println("Try succeeded");
				if (i.getId() == inventoryItem.getId()) {
					cartCount++;
				}
			}
		} catch (Exception e) {
			System.err.println("Cart is created");
		}

		for (int i = 0; i < quantity && !soldOut; i++) {
			InventoryItem item = em.find(InventoryItem.class, inventoryItem.getId());
			if (i + cartCount < item.getQuantityInStock()) {
				cart.addInventoryItem(inventoryItem);
				countAdded++;
			} else {
				soldOut = true;
			}
		}

		String report = null;
		if (countAdded > 0) {
			report = countAdded + "";
			if (countAdded > 1) {
				report += " have ";
			} else {
				report += " has ";
			}
			report += " been added to your cart. ";
		}
		if (soldOut) {
			report += "Sorry, we have no more " + inventoryItem.getName() + "s.";
		}
		if (cart.getCustomer() != null) {
			em.merge(cart);
		}

		return report;
	}

	public InventoryItem getInventoryItemById(int id) {
		return em.find(InventoryItem.class, id);
	}

	public Cart fetchCart() {
		return this.cart;
	}

	public Cart fetchLastActiveCart(Customer customer) {
		String activeCart = "SELECT c FROM Cart AS c WHERE c.customer.accountNumber=?1 AND c.active=?2";
		List<Cart> carts;
		System.out.println("CUSTOMER ACCOUNT NUMBER: " + customer.getAccountNumber());
		carts = em.createQuery(activeCart).setParameter(1, customer.getAccountNumber()).setParameter(2, true)
				.getResultList();

		System.out.println("CUSTOMER ACCOUNT NUMBER: " + customer.getAccountNumber());
		for (Cart cart : carts) {
			System.out.println(cart);
		}
		// Cart c = carts.get(carts.size()-1);
		return carts.get(carts.size() - 1);
	}

	public void persistCart(Cart cart) {
		System.out.println(cart.getId());
		if (this.cart.getCartItems() != null) {
			for (CartItems cartItem : this.cart.getCartItems()) {
				cartItem.setCart(cart);
			}

			Iterator<CartItems> cartItem1 = this.cart.getCartItems().iterator();
			Iterator<CartItems> cartItem2 = cart.getCartItems().iterator();
			while (cartItem1.hasNext()) {
				while (cartItem1.hasNext()) {
					if (cartItem1.next().getInventoryItem().getId() == cartItem2.next().getInventoryItem().getId()) {
						cartItem2.next().setQuantity(cartItem1.next().getQuantity() + cartItem2.next().getQuantity());
					} else {
						cart.getCartItems().add(cartItem1.next());
					}
				}
			}

			cart.getCartItems().addAll(this.cart.getCartItems());
		}

		this.cart = cart;
		em.merge(cart);

	}

	public void mergeCart() {
		em.merge(this.cart);
	}

	public Cart getCart() {
		return cart;
	}

	public void setCart(Cart cart) {
		this.cart = cart;
	}

}
