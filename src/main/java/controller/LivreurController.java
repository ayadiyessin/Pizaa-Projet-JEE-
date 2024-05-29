package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import modele.Livreur;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import DAO.ClientDAO;
import DAO.LivreurDAO;

/**
 * Servlet implementation class LivreurController
 */
public class LivreurController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private LivreurDAO livdao ;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LivreurController() {
        super();
        livdao = new LivreurDAO();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
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
	        
	            // Rechercher l'utilisateur dans la base de données
	            Livreur u = livdao.findByLogin(email);

	            // Vérifier les informations de connexion
	            if (u != null && u.getLogin().equals(email) && u.getPassword().equals(password)) {
	                HttpSession session = request.getSession();
	                session.setAttribute("Livreur", u);
	                response.sendRedirect("/Projet_JSP/livreur/accueilLivreur.jsp");
	            }else {
	            	String message = "Erreur d'authentification";
	            	String redirectURL = request.getContextPath() + "/livreur/authentificationLivreur.jsp?email=" + email + "&password=" + password + "&message=" + URLEncoder.encode(message, "UTF-8");
	            	response.sendRedirect(redirectURL);	            	
	            }

	        
	    }
			
		}
	}

