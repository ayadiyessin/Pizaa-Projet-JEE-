package DAO;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import modele.Admin;
import modele.Chefcuisiner;
import modele.Livreur;

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
	/*** yessin*/
	public Admin findByLogin1(String login) {
	    Session session = sessionFactory.openSession();
	    Admin admin = null;
	    try {
	        String hql = "FROM Admin A WHERE A.login = :login"; // Correction de la syntaxe HQL
	        Query<Admin> query = session.createQuery(hql, Admin.class);
	        query.setParameter("login", login);
	        admin = query.uniqueResult();
	    } finally {
	        session.close();
	    }
	    return admin;
	}
}
