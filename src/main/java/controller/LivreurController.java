package controller;

import java.io.IOException;
import java.net.URLEncoder;

import DAO.LivreurDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import modele.Livreur;

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
	        
	            Livreur u = livdao.findByLogin(email);

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
		
		if(request.getParameter("insertlivreur")!=null) {
		    String nom = request.getParameter("nom");
		    String prenom = request.getParameter("prenom");
		    String login = request.getParameter("login");
		    String password = request.getParameter("password");
		    String numtelStr = request.getParameter("numtel");
		    String image = request.getParameter("image");

		    if(nom.isEmpty() || prenom.isEmpty() || login.isEmpty() || password.isEmpty() || numtelStr.isEmpty() || image.isEmpty()) {
		       
		        response.sendRedirect("/Projet_JSP/admin/AjoutLivreur.jsp"); 
		    } else {
		        int numtel = Integer.parseInt(numtelStr);
		        Livreur l=new Livreur(login, password, nom, prenom, image, numtel, 0);
		        
		        livdao.create(l);
		        response.sendRedirect("/Projet_JSP/admin/ListeLivreur.jsp"); 
		    }
		}
			
		}
	}

