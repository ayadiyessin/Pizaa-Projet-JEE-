package DAO;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import modele.Client;
import modele.Livreur;
import modele.Pizza;

public class PizzaDAO {
	private SessionFactory sessionFactory;
	private Session session;
	public PizzaDAO()
	{
		sessionFactory = util.HibernateUtil.getSessionFactory();
		session= sessionFactory.openSession();
	}
	public void create(Pizza p)
	{
		Transaction tx=null;
		
		try {
		tx = session.beginTransaction();
		session.persist(p);
		tx.commit();
		}
		catch (Exception e) { if (tx!=null) tx.rollback(); throw e; }
	}
	
	public List<Pizza> getAll(){
		Session session=sessionFactory.openSession();
		List<Pizza> results = session.createQuery("from Pizza",Pizza.class).getResultList();
		session.close();
		return results;
	}
	
	public Pizza findById(long id) {
		Session session = sessionFactory.openSession();
		Pizza p = session.get(Pizza.class, id);
		session.close();
		return p;
	}
}
