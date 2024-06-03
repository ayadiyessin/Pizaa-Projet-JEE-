package DAO;

import java.util.Date;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import modele.Client;
import modele.Commande;
import modele.Livreur;

import java.util.List;

public class CommandeDAO {
	private SessionFactory sessionFactory;
	private Session session;
	public CommandeDAO()
	{
		sessionFactory = util.HibernateUtil.getSessionFactory();
		
	}
	public Commande create(Commande l) {
		Session session = sessionFactory.openSession();
		Transaction tx = null;
	
		try {
			tx = session.beginTransaction();
			session.persist(l);
			tx.commit();
		} catch (Exception e) {
			if (tx != null)
				tx.rollback();
			throw e;
		} finally {
			session.close();
		}
		return l;
	}
	public Commande findById(long id) {
		Session session = sessionFactory.openSession();
		Commande l = session.get(Commande.class, id);
		session.close();
		return l;
	}
	public boolean update(Long id,Date date_com, int retard, String etat_com) {
		Session session = sessionFactory.openSession();
		Commande l = session.get(Commande.class, id);
		boolean success = false;
		if (l != null) {
			l.setDate_com(date_com);
			l.setRetard(retard);
			l.setEtat_com(etat_com);
			Transaction tx = null;
			try {
				tx = session.beginTransaction();
				session.persist(l);
				tx.commit();
				success = true;
			} catch (Exception e) {
				if (tx != null)
					tx.rollback();
				throw e;
			} finally {
				session.close();
			}
		}
		return success;
	}
	public boolean delete(long id) {
		Session session = sessionFactory.openSession();
		Commande l = session.get(Commande.class, id);
		boolean success = false;
		if (l != null) {
			Transaction tx = null;
			try {
				tx = session.beginTransaction();
				session.remove(l);
				tx.commit();
				success = true;
			} catch (Exception e) {
				if (tx != null)
					tx.rollback();
				throw e;
			} finally {
				session.close();
			}
		}
		return success;
	}
	public List<Commande> findAll(){
		Session session=sessionFactory.openSession();
		List<Commande> results = session.createQuery("from Commande",Commande.class).getResultList();
		session.close();
		return results;
	}
	public boolean updateCalidCom(Long id,int valid_com) {
		Session session = sessionFactory.openSession();
		Commande l = session.get(Commande.class, id);
		boolean success = false;
		if (l != null) {
			l.setValid_com(valid_com);
			Transaction tx = null;
			try {
				tx = session.beginTransaction();
				session.persist(l);
				tx.commit();
				success = true;
			} catch (Exception e) {
				if (tx != null)
					tx.rollback();
				throw e;
			} finally {
				session.close();
			}
		}
		return success;
	}
	public boolean updateRetard(Long id,int retard) {
		Session session = sessionFactory.openSession();
		Commande l = session.get(Commande.class, id);
		boolean success = false;
		if (l != null) {
			l.setRetard(retard);
			Transaction tx = null;
			try {
				tx = session.beginTransaction();
				session.persist(l);
				tx.commit();
				success = true;
			} catch (Exception e) {
				if (tx != null)
					tx.rollback();
				throw e;
			} finally {
				session.close();
			}
		}
		return success;
	}
	public boolean updateLivreur(Long id,Livreur idliv) {
		Session session = sessionFactory.openSession();
		Commande l = session.get(Commande.class, id);
		boolean success = false;
		if (l != null) {
			l.setLivreur(idliv);
			Transaction tx = null;
			try {
				tx = session.beginTransaction();
				session.persist(l);
				tx.commit();
				success = true;
			} catch (Exception e) {
				if (tx != null)
					tx.rollback();
				throw e;
			} finally {
				session.close();
			}
		}
		return success;
	}
	public boolean updateEtatCom(Long id,String etat_com) {
		Session session = sessionFactory.openSession();
		Commande l = session.get(Commande.class, id);
		boolean success = false;
		if (l != null) {
			l.setEtat_com(etat_com);
			Transaction tx = null;
			try {
				tx = session.beginTransaction();
				session.persist(l);
				tx.commit();
				success = true;
			} catch (Exception e) {
				if (tx != null)
					tx.rollback();
				throw e;
			} finally {
				session.close();
			}
		}
		return success;
	}
	
	public List<Commande> getAllComNonValider(){
		//List<Commande> result = null;
		Session session=sessionFactory.openSession();
		List<Commande> results = session.createQuery("from Commande where valid_com = :validFlag", Commande.class)
			    .setParameter("validFlag", 0)
			    .getResultList();
		/*for (Commande l : results) {
			if(l.getValid_com()==0)
				result.add(l);
		}*/
		
		session.close();
		return results;
	}
	public List<Commande> getAllComValider(){
		//List<Commande> result = null;
		Session session=sessionFactory.openSession();
		List<Commande> results = session.createQuery("from Commande where valid_com = :validFlag order by date_com asc", Commande.class)
			    .setParameter("validFlag", 1)
			    .getResultList();
		/*for (Commande l : results) {
			if(l.getValid_com()==0)
				result.add(l);
		}*/
		
		session.close();
		return results;
	}
	public List<Commande> getAllComValiderDec(Long idcli){
		//List<Commande> result = null;
		Session session=sessionFactory.openSession();
		List<Commande> results = session.createQuery("from Commande where valid_com = :validFlag and client.id_cli = :idc order by date_com DESC", Commande.class)
			    .setParameter("validFlag", 1)
			    .setParameter("idc", idcli)
			    .getResultList();
		/*for (Commande l : results) {
			if(l.getValid_com()==0)
				result.add(l);
		}*/
		
		session.close();
		return results;
	}
	public List<Commande> getAllComNonValider(String etat_com){
		//List<Commande> result = null;
		Session session=sessionFactory.openSession();
		List<Commande> results = session.createQuery("from Commande where etat_com = :etat", Commande.class)
			    .setParameter("etat", etat_com)
			    .getResultList();
		/*for (Commande l : results) {
			if(l.getValid_com()==0)
				result.add(l);
		}*/
		
		session.close();
		return results;
	}
	
	public Commande getComNonValiderClient(Long idcli){

	    Session session = sessionFactory.openSession();
	    
	    List<Commande> results = session.createQuery("from Commande where valid_com = :validFlag and client.id_cli = :idc", Commande.class)
	            .setParameter("validFlag", 0)
	            .setParameter("idc", idcli)
	            .getResultList(); 
	    
	    session.close();
	    
	    if (!results.isEmpty()) {
	        return results.get(0);
	    } else {
	        return null;
	    }
	}
	public List<Commande> getComLivreur(Long idliv){

	    Session session = sessionFactory.openSession();
	    
	    List<Commande> results = session.createQuery("from Commande where valid_com = :validFlag and livreur.id_liv = :idc order by date_com asc", Commande.class)
	            .setParameter("validFlag", 1)
	            .setParameter("idc", idliv)
	            .getResultList(); 
	    
	    session.close();
	    
	    if (!results.isEmpty()) {

	        return results;
	    } else {

	        return null;
	    }
	}

	public List<Commande> getAllComByDate(){
		Session session=sessionFactory.openSession();
		List<Commande> results = session.createQuery("from Commande order by date_com asc", Commande.class)
			    .getResultList();
		/*for (Commande l : results) {
			if(l.getValid_com()==0)
				result.add(l);
		}*/
		
		session.close();
		return results;
	}
	public List<Commande> getAllComRetard(int retardd){
		//List<Commande> result = null;
		Session session=sessionFactory.openSession();
		List<Commande> results = session.createQuery("from Commande where retard = :r", Commande.class)
			    .setParameter("r", retardd)
			    .getResultList();
		/*for (Commande l : results) {
			if(l.getValid_com()==0)
				result.add(l);
		}*/
		
		session.close();
		return results;
	}
	public boolean updateCommandeForClient(long idCommande, long idClient) {
		Session session = null;
		Transaction tx = null;
		boolean success = false;
		try {
			session = sessionFactory.openSession();
			tx = session.beginTransaction();

			int rowCount = session
					.createQuery(
							"UPDATE Commande SET valid_com = :newValidFlag WHERE client.id_cli = :idClient and id_com =:idCommande")
					.setParameter("newValidFlag", 1)
					.setParameter("idClient", idClient)
					.setParameter("idCommande", idCommande)
					.executeUpdate();

			System.out.println(" commande mises à jour : " + rowCount);

			tx.commit();
			success = true;
		} catch (RuntimeException e) {
			if (tx != null) {
				tx.rollback();
			}
			throw e;
		} finally {
			if (session != null) {
				session.close();
			}
		}
		return success;
	}

}
