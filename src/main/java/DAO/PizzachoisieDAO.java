package DAO;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import modele.IngredPizza;
import modele.Ingredient;
import modele.Pizza;
import modele.Pizzachoisie;
import modele.Taillepizza;

public class PizzachoisieDAO {
private SessionFactory sessionFactory;
	
	public PizzachoisieDAO() {
		sessionFactory = util.HibernateUtil.getSessionFactory();
	}
	
	public List<Pizzachoisie> getAll(){
		Session session=sessionFactory.openSession();
		List<Pizzachoisie> results = session.createQuery("from Pizza choisie",Pizzachoisie.class).getResultList();
		session.close();
		return results;
	}
	
	public Pizzachoisie create(Pizzachoisie pc) {
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		//Long id = null;
		//boolean success = false;
		try {
			tx = session.beginTransaction();
			session.persist(pc);
			//id = pc.getId_pizzachois();
			tx.commit();
			//success = true;
		} catch (Exception e) {
			if (tx != null)
				tx.rollback();
			throw e;
		} finally {
			session.close();
		}
		return pc;
	}
	
	public Pizzachoisie findById(long id) {
		Session session = sessionFactory.openSession();
		Pizzachoisie pc = session.get(Pizzachoisie.class, id);
		session.close();
		return pc;
	}
	
	public boolean update(Long id,int val) {
		Session session = sessionFactory.openSession();
		Pizzachoisie pc = session.get(Pizzachoisie.class, id);
		boolean success = false;
		if (pc != null) {
			pc.setValid(val);

			Transaction tx = null;
			try {
				tx = session.beginTransaction();
				session.persist(pc);
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
		Pizzachoisie pc = session.get(Pizzachoisie.class, id);
		boolean success = false;
		if (pc != null) {
			Transaction tx = null;
			try {
				tx = session.beginTransaction();
				session.remove(pc);
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
	
	public double prixPizz(long id) {
		Session session = sessionFactory.openSession();
		Pizzachoisie pc = session.get(Pizzachoisie.class, id);
		Pizza p = session.get(Pizza.class, pc.getIdpiz_pizzachois());
		Taillepizza tp = session.get(Taillepizza.class, pc.getIdtail_pizzachois());
		Ingredient ing;
		double prixTot=0;
		for(IngredPizza ingp:pc.getIngredpizzas())
		{
			ing = session.get(Ingredient.class, ingp.getIding_ingredpiz());
			prixTot+=ing.getPrix();
		}
		prixTot=prixTot+tp.getPrix()+p.getPrix();
		session.close();

		return prixTot;
	}
}
