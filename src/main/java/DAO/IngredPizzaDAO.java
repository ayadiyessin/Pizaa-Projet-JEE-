package DAO;

import java.util.Date;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import modele.Client;
import modele.Commande;
import modele.IngredPizza;
import modele.Ingredient;
import modele.Pizzachoisie;

import java.util.List;

public class IngredPizzaDAO {
	private SessionFactory sessionFactory;
	private Session session;
	public IngredPizzaDAO()
	{
		sessionFactory = util.HibernateUtil.getSessionFactory();
		//session= sessionFactory.openSession();
	}
	public boolean create(IngredPizza l) {
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
	public IngredPizza findById(long id) {
		Session session = sessionFactory.openSession();
		IngredPizza l = session.get(IngredPizza.class, id);
		session.close();
		return l;
	}
	
	public boolean delete(long id) {
		Session session = sessionFactory.openSession();
		IngredPizza l = session.get(IngredPizza.class, id);
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
	public List<IngredPizza> findAll(){
		Session session=sessionFactory.openSession();
		List<IngredPizza> results = session.createQuery("from IngredPizza",IngredPizza.class).getResultList();
		session.close();
		return results;
	}
	//yessin 
	public List<IngredPizza> getAllByPizza(Pizzachoisie p) {
	        List<IngredPizza> results = null;
	        try {
	        	Session session = sessionFactory.openSession();
	            results = session.createQuery("from IngredPizza where pizzachoisie.id_pizzachois = :r", IngredPizza.class)
	                             .setParameter("r", p.getId_pizzachois())
	                             .getResultList();
	        } catch (Exception e) {
	            e.printStackTrace(); // Ajoutez des logs ici pour mieux comprendre l'exception
	        } finally {
	            if (session != null) {
	                session.close();
	            }
	        }
	        return results;
	    }
	

	
	
}
