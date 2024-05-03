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
@Table(name = "Pizza")
public class Pizza {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id_pizza;
	@Column(name = "nom")
	private String nom;
	@Column(name = "image")
	private String image;
	@Column(name = "prix")
	private float prix;
	@Column(name = "archive")
	private int archive;
	@OneToMany(mappedBy = "pizza")
	private List<Pizzachoisie> pizzachoisie;
	public Pizza(String nom, String image, float prix, int archive) {
		super();
		this.nom = nom;
		this.image = image;
		this.prix = prix;
		this.archive = archive;
	}
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
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

	public Long getId_pizza() {
		return id_pizza;
	}
	@Override
	public String toString() {
		return "Pizza [id_pizza=" + id_pizza + ", nom=" + nom + ", image=" + image + ", prix=" + prix + ", archive="
				+ archive +"]";
	} 
	
}
