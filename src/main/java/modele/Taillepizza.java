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
@Table(name = "Taillepizza")
public class Taillepizza {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id_tailpiz;
	@Column(name = "taille")
	private String taille;
	@Column(name = "prix")
	private float prix;
	@Column(name = "archive")
	private int archive;
	@OneToMany(mappedBy = "taillepizza")
	private List<Pizzachoisie> pizzachoisie;
	public Taillepizza() {
		
	}
	public Taillepizza(String taille, float prix, int archive) {
		super();
		this.taille = taille;
		this.prix = prix;
		this.archive = archive;
	}
	public String getTaille() {
		return taille;
	}
	public void setTaille(String taille) {
		this.taille = taille;
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
	public Long getId_tailpiz() {
		return id_tailpiz;
	}
	@Override
	public String toString() {
		return "Taillepizza [id_tailpiz=" + id_tailpiz + ", taille=" + taille + ", prix=" + prix + ", archive="
				+ archive + "]";
	}
	
}
