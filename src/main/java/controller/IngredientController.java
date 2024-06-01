package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import modele.Ingredient;
import modele.Pizza;

import java.io.IOException;
import java.util.List;

import DAO.IngredientDAO;
import DAO.PizzaDAO;

/**
 * Servlet implementation class IngredientController
 */
public class IngredientController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private IngredientDAO idao;
    public IngredientController() {
        super();
        idao=new IngredientDAO();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String message="";
		if(request.getParameter("id")!=null) {
			message="suppression impossible";
			long id=Long.parseLong(request.getParameter("id"));
			//if(pdao.delete(id))
			//message="suppression de la personne "+id+" avec succes";
		}
		List<Ingredient> results = idao.findAll();
		request.setAttribute("listing",results);
		request.setAttribute("message",message);
		RequestDispatcher rd=getServletContext().getRequestDispatcher("/choisirPizza.jsp");
		rd.forward(request, response); 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if (request.getParameter("insertingredient") != null) {
		    String nom = request.getParameter("nom");
		    String prixStr = request.getParameter("prix");

		    // Vérifiez si les champs ne sont pas vides
		    if (nom != null && !nom.trim().isEmpty() && prixStr != null && !prixStr.trim().isEmpty()) {
		        try {
		            float prix = Float.parseFloat(prixStr);

		            Ingredient i = new Ingredient(nom, prix, 0);
		            idao.create(i);
		            response.sendRedirect("/Projet_JSP/admin/listIngredient.jsp");
		        } catch (NumberFormatException e) {
		            // Redirection ou message d'erreur si le prix n'est pas un nombre valide
		            response.sendRedirect("/Projet_JSP/admin/AjoutIngredients.jsp?error=invalidPrice");
		        }
		    } else {
		        // Redirection ou message d'erreur si un champ est vide
		        response.sendRedirect("/Projet_JSP/admin/AjoutIngredients.jsp?error=emptyFields");
		    }
		}

	
	}

}
