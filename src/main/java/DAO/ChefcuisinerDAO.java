package DAO;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import modele.Chefcuisiner;
import modele.Client;

public class ChefcuisinerDAO {
	private SessionFactory sessionFactory;

	public ChefcuisinerDAO() {
		sessionFactory = util.HibernateUtil.getSessionFactory();
	}

	public boolean create(Chefcuisiner ch) {
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		boolean success = false;
		try {
			tx = session.beginTransaction();
			session.persist(ch);
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

	public Chefcuisiner findById(long id) {
		Session session = sessionFactory.openSession();
		Chefcuisiner ch = session.get(Chefcuisiner.class, id);
		session.close();
		return ch;
	}
	
	
	
	public boolean update(Long id,String psw) {
		Session session = sessionFactory.openSession();
		Chefcuisiner ch = session.get(Chefcuisiner.class, id);
		boolean success = false;
		if (ch != null) {
			ch.setPassword(psw);
			Transaction tx = null;
			try {
				tx = session.beginTransaction();
				session.persist(ch);
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
		Chefcuisiner ch = session.get(Chefcuisiner.class, id);
		boolean success = false;
		if (ch != null) {
			Transaction tx = null;
			try {
				tx = session.beginTransaction();
				session.remove(ch);
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
	
	public List<Chefcuisiner> findAll(){
		Session session=sessionFactory.openSession();
		List<Chefcuisiner> results = session.createQuery("from Chefcuisiner",Chefcuisiner.class).getResultList();
		session.close();
		return results;
	}
}
