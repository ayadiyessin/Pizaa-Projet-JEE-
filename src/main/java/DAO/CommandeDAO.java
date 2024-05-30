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
		//session= sessionFactory.openSession();
	}
	public Commande create(Commande l) {
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		//boolean success = false;
		try {
			tx = session.beginTransaction();
			session.persist(l);
			tx.commit();
			//success = true;
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
		List<Commande> results = session.createQuery("from Commande where valid_com = :validFlag", Commande.class)
			    .setParameter("validFlag", 1)
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
	            .getResultList(); // Utilise getResultList() au lieu de getSingleResult()
	    
	    session.close();
	    
	    if (!results.isEmpty()) {
	        // S'il y a des résultats, retournez le premier élément de la liste
	        return results.get(0);
	    } else {
	        // S'il n'y a pas de résultats, retournez null ou gérez le cas en conséquence dans votre application
	        return null;
	    }
	}

	public List<Commande> getAllComByDate(){
		//List<Commande> result = null;
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

}
