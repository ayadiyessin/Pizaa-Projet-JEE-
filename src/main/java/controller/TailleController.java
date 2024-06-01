package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import modele.Ingredient;
import modele.Taillepizza;

import java.io.IOException;

import DAO.IngredientDAO;
import DAO.TaillepizzaDAO;

/**
 * Servlet implementation class TailleController
 */
public class TailleController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	private TaillepizzaDAO tdao;
    public TailleController() {
        super();
        tdao=new TaillepizzaDAO();
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
		if(request.getParameter("inserttaille")!=null) {
		    String taille = request.getParameter("taille");
		    String prixStr = request.getParameter("prix");

		    // Vérification des champs vides
		    if(taille.isEmpty() || prixStr.isEmpty()) {
		        // Redirection vers une page d'erreur ou un message d'erreur
		        response.sendRedirect("/Projet_JSP/admin/AjoutTaille.jsp"); 
		    } else {
		        float prix = Float.parseFloat(prixStr);
		        Taillepizza t = new Taillepizza(taille, prix, 0);
		        tdao.create(t);
		        response.sendRedirect("/Projet_JSP/admin/listTaille.jsp"); 
		    }
		}

	}

}
