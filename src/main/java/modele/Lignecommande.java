package modele;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "Lignecommande")
public class Lignecommande {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id_lignecom;
	@Column(name = "qte_lignecom")
	private int qte_lignecom;
	@Column(name = "valid_lignecom")
	private int valid_lignecom;
	@ManyToOne
	@JoinColumn(name = "id_pizzachois")
	private Pizzachoisie pizzachoisie;
	@ManyToOne
	@JoinColumn(name = "id_com")
	private Commande commande;
	public Lignecommande() {
		
	}
	public Lignecommande(int qte_lignecom, int valid_lignecom, Pizzachoisie pizzachoisie, Commande commande) {
		super();
		this.qte_lignecom = qte_lignecom;
		this.valid_lignecom = valid_lignecom;
		this.pizzachoisie = pizzachoisie;
		this.commande = commande;
	}
	public int getQte_lignecom() {
		return qte_lignecom;
	}
	public void setQte_lignecom(int qte_lignecom) {
		this.qte_lignecom = qte_lignecom;
	}
	public int getValid_lignecom() {
		return valid_lignecom;
	}
	public void setValid_lignecom(int valid_lignecom) {
		this.valid_lignecom = valid_lignecom;
	}
	public Pizzachoisie getPizzachoisie() {
		return pizzachoisie;
	}
	public void setPizzachoisie(Pizzachoisie pizzachoisie) {
		this.pizzachoisie = pizzachoisie;
	}
	public Commande getCommande() {
		return commande;
	}
	public void setCommande(Commande commande) {
		this.commande = commande;
	}
	public Long getId_lignecom() {
		return id_lignecom;
	}
	
	public Long getIdpiz_lignecom() {
		return pizzachoisie.getId_pizzachois();
	}
	@Override
	public String toString() {
		return "Lignecommande [id_lignecom=" + id_lignecom + ", qte_lignecom=" + qte_lignecom + ", valid_lignecom="
				+ valid_lignecom + ", pizzachoisie=" + pizzachoisie + ", commande=" + commande + "]";
	}
	
}
