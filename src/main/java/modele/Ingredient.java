package modele;

import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "Ingredient")
public class Ingredient {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id_ingred;
	@Column(name = "nom")
	private String nom;
	@Column(name = "prix")
	private float prix;
	@Column(name = "archive")
	private int archive;
	@OneToMany(mappedBy = "ingredient")
	private List<IngredPizza> ingredpizzas;
	public Ingredient(String nom, float prix, int archive) {
		super();
		this.nom = nom;
		this.prix = prix;
		this.archive = archive;
	}

	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public float getPrix() {
		return prix;
	}
	public void setPrix(float prix) {
		this.prix = prix;
	}
	public int getArchive() {
		return archive;
	}
	public void setArchive(int archive) {
		this.archive = archive;
	}
	public Long getId_ingred() {
		return id_ingred;
	}
	@Override
	public String toString() {
		return "Ingredient [id_ingred=" + id_ingred + ", nom=" + nom + ", prix=" + prix + ", archive=" + archive
				+ "]";
	}
	
}
