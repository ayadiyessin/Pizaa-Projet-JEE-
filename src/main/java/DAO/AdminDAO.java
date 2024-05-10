package DAO;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import modele.Admin;
import modele.Chefcuisiner;

public class AdminDAO {
	private SessionFactory sessionFactory;
	public AdminDAO() {
		sessionFactory = util.HibernateUtil.getSessionFactory();
	}
	
	public Admin findByLogin(String l) {
		Session session = sessionFactory.openSession();
		Admin a = session.get(Admin.class, l);
		session.close();
		return a;
	}
}
