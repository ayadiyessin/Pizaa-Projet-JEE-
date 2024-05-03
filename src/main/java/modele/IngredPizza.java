package modele;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "IngredPizza")
public class IngredPizza {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id_ingredpiz;
	@ManyToOne
	@JoinColumn(name = "id_ingred")
	private Ingredient ingredient;
	@ManyToOne
	@JoinColumn(name = "id_pizzachois")
	private Pizzachoisie pizzachoisie;
	public IngredPizza(Ingredient ingredient, Pizzachoisie pizzachoisie) {
		super();
		this.ingredient = ingredient;
		this.pizzachoisie = pizzachoisie;
	}
	public Ingredient getIngredient() {
		return ingredient;
	}
	public void setIngredient(Ingredient ingredient) {
		this.ingredient = ingredient;
	}
	public Pizzachoisie getPizzachoisie() {
		return pizzachoisie;
	}
	public void setPizzachoisie(Pizzachoisie pizzachoisie) {
		this.pizzachoisie = pizzachoisie;
	}
	public Long getId_ingredpiz() {
		return id_ingredpiz;
	}
	@Override
	public String toString() {
		return "IngredPizza [id_ingredpiz=" + id_ingredpiz + ", ingredient=" + ingredient + ", pizzachoisie="
				+ pizzachoisie + "]";
	}
	
	
}
