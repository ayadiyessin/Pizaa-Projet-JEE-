package DAO;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import modele.Client;


public class ClientDAO {
	private SessionFactory sessionFactory;
	private Session session;
	public ClientDAO()
	{
		sessionFactory = util.HibernateUtil.getSessionFactory();
		session= sessionFactory.openSession();
	}
	public void create(Client c)
	{
		Transaction tx=null;
		
		try {
		tx = session.beginTransaction();
		session.persist(c);
		tx.commit();
		}
		catch (Exception e) { if (tx!=null) tx.rollback(); throw e; }
	}
	public Client findByLogin(String l)
	{
		Client c = session.get(Client.class, l);
		return c;
	}
}
