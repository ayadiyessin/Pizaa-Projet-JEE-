package modele;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "Livreur")
public class Livreur {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id_liv; 
	@Column(name = "login")
	private String login;
	@Column(name = "password")
	private String password;
	@Column(name = "nom")
	private String nom;
	@Column(name = "prenom")
	private String prenom;
	@Column(name = "image")
	private String image;
	@Column(name = "numtel")
	private int numtel;
	@Column(name = "etatdispo")
	private int etatdispo;
	public Livreur() {
    }
	public Livreur(String login, String password, String nom, String prenom, String image, int numtel, int etatdispo) {
		super();
		this.login = login;
		this.password = password;
		this.nom = nom;
		this.prenom = prenom;
		this.image = image;
		this.numtel = numtel;
		this.etatdispo = etatdispo;
	}

	public Long getId() {
		return id_liv;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public int getNumtel() {
		return numtel;
	}

	public void setNumtel(int numtel) {
		this.numtel = numtel;
	}

	@Override
	public String toString() {
		return "Livreur [id=" + id_liv + ", login=" + login + ", password=" + password + ", nom=" + nom + ", prenom="
				+ prenom + ", image=" + image + ", numtel=" + numtel + ", etatdispo=" + etatdispo + "]";
	}
	public String getLogin() {
		return login;
	}
	public void setLogin(String login) {
		this.login = login;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public String getPrenom() {
		return prenom;
	}
	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}
	public int getEtatdispo() {
		return etatdispo;
	}
	public void setEtatdispo(int etatdispo) {
		this.etatdispo = etatdispo;
	}
	
}
