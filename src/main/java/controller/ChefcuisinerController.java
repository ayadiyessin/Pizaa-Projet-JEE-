package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import modele.Chefcuisiner;
import modele.Livreur;

import java.io.IOException;
import java.net.URLEncoder;

import DAO.ChefcuisinerDAO;

/**
 * Servlet implementation class ChefcuisinerController
 */
public class ChefcuisinerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ChefcuisinerDAO chefdao;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChefcuisinerController() {
        super();
        // TODO Auto-generated constructor stub
        this.chefdao=new ChefcuisinerDAO();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getParameter("action");
        if ("deconnexion".equals(action)) {
            HttpSession session = request.getSession(false); 
            if (session != null) {
                session.invalidate(); 
            }
            response.sendRedirect("index.jsp"); 
        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		if(request.getParameter("authentification")!=null)
		{
			String email = request.getParameter("email");
	        String password = request.getParameter("password");
	        
	        Chefcuisiner u = chefdao.findByLogin(email);

	            if (u != null && u.getLogin().equals(email) && u.getPassword().equals(password)) {
	                HttpSession session = request.getSession();
	                session.setAttribute("chef", u);
	                response.sendRedirect("/Projet_JSP/chefcuisiner/accueilChef.jsp");
	            }else {
	            	String message = "Erreur d'authentification";
	            	String redirectURL = request.getContextPath() + "/chefcuisiner/authentificationChef.jsp?email=" + email + "&password=" + password + "&message=" + URLEncoder.encode(message, "UTF-8");
	            	response.sendRedirect(redirectURL);	            	
	            }

	        
	    }
		if (request.getParameter("insertChef") != null) {
		    String login = request.getParameter("login");
		    String password = request.getParameter("password");

		   
		    if (login != null && !login.trim().isEmpty() && password != null && !password.trim().isEmpty()) {
		        Chefcuisiner c = new Chefcuisiner(login, password);

		        chefdao.create(c);
		        response.sendRedirect("/Projet_JSP/admin/chefProfile.jsp");
		    } else {
		        
		        response.sendRedirect("/Projet_JSP/admin/AjoutChef.jsp?error=emptyFields");
		    }
		}

	}

}
