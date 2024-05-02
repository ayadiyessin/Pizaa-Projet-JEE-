package modele;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "Client")
public class Client {
	@Id 
	@Column(name = "login")
	private String login;
	@Column(name = "password")
	private String password;
	@Column(name = "nom")
	private String nom;
	@Column(name = "prenom")
	private String prenom;
	@Column(name = "adresse")
	private String adresse;
	@Column(name = "numtel")
	private int numtel;
	public Client(String login, String password, String nom, String prenom,String adresse, int numtel) {
		super();
		this.login = login;
		this.password = password;
		this.nom = nom;
		this.prenom = prenom;
		this.adresse = adresse;
		this.numtel = numtel;
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
	public String getAdresse() {
		return adresse;
	}
	public void setAdresse(String adresse) {
		this.adresse = adresse;
	}
	public int getNumtel() {
		return numtel;
	}
	public void setNumtel(int numtel) {
		this.numtel = numtel;
	}
	@Override
	public String toString() {
		return "Client [login=" + login + ", password=" + password + ", nom=" + nom + ", prenom=" + prenom
				+ ", adresse=" + adresse + ", numtel=" + numtel + "]";
	}

}
