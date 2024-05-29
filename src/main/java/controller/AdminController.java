package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import modele.Admin;
import modele.Livreur;

import java.io.IOException;
import java.net.URLEncoder;

import DAO.AdminDAO;

/**
 * Servlet implementation class AdminController
 */
public class AdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AdminDAO addao;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminController() {
        super();
        // TODO Auto-generated constructor stub
        this.addao=new AdminDAO();
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
	            Admin u = addao.findByLogin1(email);

	            // Vérifier les informations de connexion
	            if (u != null && u.getLogin().equals(email) && u.getPassword().equals(password)) {
	                HttpSession session = request.getSession();
	                session.setAttribute("Livreur", u);
	                response.sendRedirect("/Projet_JSP/index.jsp");
	            }else {
	            	String message = "Erreur d'authentification";
	            	String redirectURL = request.getContextPath() + "/admin/authentificationAdmin.jsp?email=" + email + "&password=" + password + "&message=" + URLEncoder.encode(message, "UTF-8");
	            	response.sendRedirect(redirectURL);	            	
	            }

	        
	    }
	}

}
