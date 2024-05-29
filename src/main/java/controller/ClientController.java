package controller;

import java.io.IOException;
import java.net.URLEncoder;

import DAO.ClientDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import modele.Chefcuisiner;
import modele.Client;

/**
 * Servlet implementation class ClientController
 */
public class ClientController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ClientDAO cdao;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClientController() {
        super();
        cdao = new ClientDAO();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(request.getParameter("inscription")!=null)
		{
			String email = request.getParameter("email");
            String password = request.getParameter("password");
            String nom = request.getParameter("nom");
            String prenom = request.getParameter("prenom");
            String adresse = request.getParameter("adresse");
            int tell = Integer.parseInt(request.getParameter("tell"));
            //String message = request.getParameter("message");
            
            Client u = cdao.findByLogin(email);

            if (u != null && u.getLogin().equals(email) ) {
            	String message = "Il y a un compte avec cette adresse email.";
            		String redirectURL = request.getContextPath() + "/client/inscriClient.jsp" +
            	        "?email=" + URLEncoder.encode(email, "UTF-8") +
            	        "&password=" + URLEncoder.encode(password, "UTF-8") +
            	        "&nom=" + URLEncoder.encode(nom, "UTF-8") +
            	        "&prenom=" + URLEncoder.encode(prenom, "UTF-8") +
            	        "&adresse=" + URLEncoder.encode(adresse, "UTF-8") +
            	        "&tell=" + tell +  
            	        "&message=" + URLEncoder.encode(message, "UTF-8");
            	response.sendRedirect(redirectURL);
            	
            	
            }else {
            	Client c=new Client(email,password,nom,prenom,adresse,tell);	
    			cdao.create(c);
            	response.sendRedirect("/Projet_JSP/client/authentificationClinet.jsp");           	
            }

		}
		else if(request.getParameter("authentification")!=null)
		{
			String email = request.getParameter("email");
	        String password = request.getParameter("password");
	        
	        Client u = cdao.findByLogin(email);

	            if (u != null && u.getLogin().equals(email) && u.getPassword().equals(password)) {
	                HttpSession session = request.getSession();
	                session.setAttribute("client", u);
	                response.sendRedirect("/Projet_JSP/client/accueilClient.jsp");
	            }else {
	            	String message = "Erreur d'authentification";
	            	String redirectURL = request.getContextPath() + "/client/authentificationClinet.jsp?email=" + email + "&password=" + password + "&message=" + URLEncoder.encode(message, "UTF-8");
	            	response.sendRedirect(redirectURL);	            	
	            }

	        
	    }
	}

}
