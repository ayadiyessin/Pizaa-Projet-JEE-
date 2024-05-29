package DAO;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import modele.Client;
import modele.Livreur;


public class ClientDAO {
	private SessionFactory sessionFactory;

	public ClientDAO() {
		sessionFactory = util.HibernateUtil.getSessionFactory();
	}

	public boolean create(Client c) {
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		boolean success = false;
		try {
			tx = session.beginTransaction();
			session.persist(c);
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

	public Client findById(long id) {
		Session session = sessionFactory.openSession();
		Client c = session.get(Client.class, id);
		session.close();
		return c;
	}
	
	
	
	public boolean update(Long id, String nom, String prenom, String psw, String adresse, int numtel) {
		Session session = sessionFactory.openSession();
		Client c = session.get(Client.class, id);
		boolean success = false;
		if (c != null) {
			c.setNom(nom);
			c.setPrenom(prenom);
			c.setPassword(psw);
			c.setAdresse(adresse);
			c.setNumtel(numtel);
			Transaction tx = null;
			try {
				tx = session.beginTransaction();
				session.persist(c);
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
		Client c = session.get(Client.class, id);
		boolean success = false;
		if (c != null) {
			Transaction tx = null;
			try {
				tx = session.beginTransaction();
				session.remove(c);
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
	
	public List<Client> findAll(){
		Session session=sessionFactory.openSession();
		List<Client> results = session.createQuery("from Client",Client.class).getResultList();
		session.close();
		return results;
	}
	/*** yessin*/
	public Client findByLogin(String login) {
	    Session session = sessionFactory.openSession();
	    Client client = null;
	    try {
	        String hql = "FROM Client L WHERE L.login = :login";
	        Query<Client> query = session.createQuery(hql, Client.class);
	        query.setParameter("login", login);
	        client = query.uniqueResult();
	    } finally {
	        session.close();
	    }
	    return client;
	}
	
}
