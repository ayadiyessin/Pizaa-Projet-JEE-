package DAO;


import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import modele.Livreur;

public class LivreurDAO {
	private SessionFactory sessionFactory;

	public LivreurDAO() {
		sessionFactory = util.HibernateUtil.getSessionFactory();
	}

	public boolean create(Livreur l) {
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		boolean success = false;
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
		return success;
	}

	public Livreur findById(long id) {
		Session session = sessionFactory.openSession();
		Livreur l = session.get(Livreur.class, id);
		session.close();
		return l;
	}
	
	public boolean updateEtatdispo(Long id,int etat) {
		Session session = sessionFactory.openSession();
		Livreur l = session.get(Livreur.class, id);
		boolean success = false;
		if (l != null) {
			l.setEtatdispo(etat);
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
	
	
	public boolean update(Long id, String nom, String prenom, String psw, String image, int numtel, int etat) {
		Session session = sessionFactory.openSession();
		Livreur l = session.get(Livreur.class, id);
		boolean success = false;
		if (l != null) {
			l.setNom(nom);
			l.setPrenom(prenom);
			l.setPassword(psw);
			l.setImage(image);
			l.setNumtel(numtel);
			l.setEtatdispo(etat);
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
		Livreur l = session.get(Livreur.class, id);
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
	
	public List<Livreur> findAll(){
		Session session=sessionFactory.openSession();
		List<Livreur> results = session.createQuery("from Livreur",Livreur.class).getResultList();
		session.close();
		return results;
	}
	
	 public List<Livreur> getAllEtatdispo() {
	        	Session session=sessionFactory.openSession();
	            List<Livreur> results = session.createQuery("from Livreur where etatdispo = :etatdispo", Livreur.class).setParameter("etatdispo", 0).getResultList();
	            session.close();
	    		return results;
	    }
	/*** yessin*/
	public Livreur findByLogin(String login) {
	    Session session = sessionFactory.openSession();
	    Livreur livreur = null;
	    try {
	        String hql = "FROM Livreur L WHERE L.login = :login";
	        Query<Livreur> query = session.createQuery(hql, Livreur.class);
	        query.setParameter("login", login);
	        livreur = query.uniqueResult();
	    } finally {
	        session.close();
	    }
	    return livreur;
	}
}
