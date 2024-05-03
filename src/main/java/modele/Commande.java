package modele;

import java.util.Date;
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
@Table(name = "Commande")
public class Commande {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id_com;
	@Column(name = "num_com")
	private int num_com;
	@Column(name = "date_com")
	private Date date_com;
	@Column(name = "retard")
	private int retard;
	@Column(name = "etat_com")
	private String etat_com;
	@Column(name = "valid_com")
	private int valid_com;
	@ManyToOne
	@JoinColumn(name = "id_cli")
	private Client client;
	@ManyToOne
	@JoinColumn(name = "id_liv")
	private Livreur livreur;
	@ManyToOne
	@JoinColumn(name = "id_chefc")
	private Chefcuisiner chefcuisiner;
	@OneToMany(mappedBy = "commande")
	private List<Lignecommande> lignecommandes;
	public Commande(int num_com, Date date_com, int retard, String etat_com, int valid_com, Client client,
			Livreur livreur, Chefcuisiner chefcuisiner) {
		super();
		this.num_com = num_com;
		this.date_com = date_com;
		this.retard = retard;
		this.etat_com = etat_com;
		this.valid_com = valid_com;
		this.client = client;
		this.livreur = livreur;
		this.chefcuisiner = chefcuisiner;
	}
	public List<Lignecommande> getLignecommandes() {
		return lignecommandes;
	}
	public void setLignecommandes(List<Lignecommande> lignecommandes) {
		this.lignecommandes = lignecommandes;
	}
	public int getNum_com() {
		return num_com;
	}
	public void setNum_com(int num_com) {
		this.num_com = num_com;
	}
	public Date getDate_com() {
		return date_com;
	}
	public void setDate_com(Date date_com) {
		this.date_com = date_com;
	}
	public int getRetard() {
		return retard;
	}
	public void setRetard(int retard) {
		this.retard = retard;
	}
	public String getEtat_com() {
		return etat_com;
	}
	public void setEtat_com(String etat_com) {
		this.etat_com = etat_com;
	}
	public int getValid_com() {
		return valid_com;
	}
	public void setValid_com(int valid_com) {
		this.valid_com = valid_com;
	}
	public Client getClient() {
		return client;
	}
	public void setClient(Client client) {
		this.client = client;
	}
	public Livreur getLivreur() {
		return livreur;
	}
	public void setLivreur(Livreur livreur) {
		this.livreur = livreur;
	}
	public Chefcuisiner getChefcuisiner() {
		return chefcuisiner;
	}
	public void setChefcuisiner(Chefcuisiner chefcuisiner) {
		this.chefcuisiner = chefcuisiner;
	}
	public Long getId_com() {
		return id_com;
	}
	@Override
	public String toString() {
		return "Commande [id_com=" + id_com + ", num_com=" + num_com + ", date_com=" + date_com + ", retard=" + retard
				+ ", etat_com=" + etat_com + ", valid_com=" + valid_com + ", client=" + client + ", livreur=" + livreur
				+ ", chefcuisiner=" + chefcuisiner + ", lignecommandes=" + lignecommandes + "]";
	}
	
	
}
