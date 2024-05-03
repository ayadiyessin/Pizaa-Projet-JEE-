package modele;

import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "Pizzachoisie")
public class Pizzachoisie {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id_pizzachois;
	@Column(name = "valid")
	private int valid;
	@ManyToOne
	@JoinColumn(name = "id_tailpiz")
	private Taillepizza taillepizza;
	@ManyToOne
	@JoinColumn(name = "id_pizza")
	private Pizza pizza; 
	@OneToMany(mappedBy = "pizzachoisie")
	private List<IngredPizza> ingredpizzas;
	@OneToMany(mappedBy = "pizzachoisie")
	private List<Lignecommande> lignecommande;
	public Pizzachoisie(int valid, Taillepizza taillepizza, Pizza pizza) {
		super();
		this.valid = valid;
		this.taillepizza = taillepizza;
		this.pizza = pizza;
	}
	public int getValid() {
		return valid;
	}

	public void setValid(int valid) {
		this.valid = valid;
	}
	public Taillepizza getTaillepizza() {
		return taillepizza;
	}
	public void setTaillepizza(Taillepizza taillepizza) {
		this.taillepizza = taillepizza;
	}
	public Pizza getPizza() {
		return pizza;
	}
	public void setPizza(Pizza pizza) {
		this.pizza = pizza;
	}

	public Long getId_pizzachois() {
		return id_pizzachois;
	}
	@Override
	public String toString() {
		return "Pizzachoisie [id_pizzachois=" + id_pizzachois + ", valid=" + valid + ", taillepizza=" + taillepizza
				+ ", pizza=" + pizza + "]";
	}
	
	
}
