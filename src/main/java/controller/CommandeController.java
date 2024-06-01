package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import modele.Livreur;

import java.io.IOException;

import DAO.CommandeDAO;
import DAO.LivreurDAO;

/**
 * Servlet implementation class CommandeController
 */
public class CommandeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CommandeDAO cdao ;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommandeController() {
        super();
        this.cdao = new CommandeDAO();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String message="";
		if(request.getParameter("id")!=null) {
		message="suppression impossible";
		long id=Long.parseLong(request.getParameter("id"));
		if(cdao.updateEtatCom(id,"en cours"))
			message="suppression produit avec succes";
		response.sendRedirect("/Projet_JSP/chefcuisiner/accueilChef.jsp");  
		}
		else if(request.getParameter("idliv")!=null) {
			message="suppression impossible";
			long id=Long.parseLong(request.getParameter("idliv"));
			if(cdao.updateEtatCom(id,"en cours de livraison"))
				message="suppression produit avec succes";
			response.sendRedirect("/Projet_JSP/livreur/accueilLivreur.jsp");  
			}
		else if(request.getParameter("idlivf")!=null) {
			message="suppression impossible";
			long id=Long.parseLong(request.getParameter("idlivf"));
			if(cdao.updateEtatCom(id,"commande livrée"))
				message="suppression produit avec succes";
			response.sendRedirect("/Projet_JSP/livreur/accueilLivreur.jsp");  
			}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		if(request.getParameter("Finaliser")!=null) {
			long commIdStr =Long.parseLong( request.getParameter("idcom"));
	        long livreurIdStr = Long.parseLong( request.getParameter("livreurId"));
	        LivreurDAO liv = new LivreurDAO();
			Livreur Livcom = liv.findById(livreurIdStr);
	        
	        if(cdao.updateLivreur(commIdStr,Livcom)) {
				cdao.updateEtatCom(commIdStr,"prête");
			}
	        response.sendRedirect("/Projet_JSP/chefcuisiner/accueilChef.jsp"); 
			
		}
	}

}
