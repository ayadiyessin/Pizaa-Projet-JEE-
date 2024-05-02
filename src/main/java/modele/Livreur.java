package modele;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "Livreur")
public class Livreur {
	@Id 
	@Column(name = "login")
	private String login;
	public Livreur(String login, String password, String nom, String prenom) {
		super();
		this.login = login;
		this.password = password;
		this.nom = nom;
		this.prenom = prenom;
		this.etatdispo = 0;
	}
	@Override
	public String toString() {
		return "Livreur [login=" + login + ", password=" + password + ", nom=" + nom + ", prenom=" + prenom
				+ ", etatdispo=" + etatdispo + "]";
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
	@Column(name = "password")
	private String password;
	@Column(name = "nom")
	private String nom;
	@Column(name = "prenom")
	private String prenom;
	@Column(name = "etatdispo")
	private int etatdispo;
}
