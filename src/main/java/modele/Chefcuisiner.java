package modele;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "Chefcuisiner")
public class Chefcuisiner {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id_chefc;
	@Column(name = "login")
	private String login;
	@Column(name = "password")
	private String password;
	public String getLogin() {
		return login;
	}
	public Long getId() {
		return id_chefc;
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
	public Chefcuisiner() {
		
	}
	public Chefcuisiner(String login, String password) {
		super();
		this.login = login;
		this.password = password;
	}
	@Override
	public String toString() {
		return "Chefcuisiner [id=" + id_chefc + ", login=" + login + ", password=" + password + "]";
	}
	
}
