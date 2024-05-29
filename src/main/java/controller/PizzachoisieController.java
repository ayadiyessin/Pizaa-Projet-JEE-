package controller;

import java.io.IOException;
import java.util.Date;

import DAO.ClientDAO;
import DAO.CommandeDAO;
import DAO.IngredPizzaDAO;
import DAO.IngredientDAO;
import DAO.LignecommandeDAO;
import DAO.PizzaDAO;
import DAO.PizzachoisieDAO;
import DAO.TaillepizzaDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import modele.Client;
import modele.Commande;
import modele.IngredPizza;
import modele.Ingredient;
import modele.Lignecommande;
import modele.Pizza;
import modele.Pizzachoisie;
import modele.Taillepizza;

/**
 * Servlet implementation class PizzachoisieController
 */
public class PizzachoisieController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private PizzachoisieDAO pcdao;
	private PizzaDAO pdao;
	private TaillepizzaDAO tdao;
	private IngredientDAO igdao;
	private IngredPizzaDAO igpizdao;
	private CommandeDAO comdao;
	private ClientDAO cdao;
	private LignecommandeDAO lcdao;

	public PizzachoisieController() {
		super();
		pcdao = new PizzachoisieDAO();
		pdao = new PizzaDAO();
		tdao = new TaillepizzaDAO();
		igdao = new IngredientDAO();
		igpizdao = new IngredPizzaDAO();
		comdao = new CommandeDAO();
		cdao = new ClientDAO();
		lcdao = new LignecommandeDAO();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getParameter("validpizza") != null) {
			Long idp = Long.parseLong(request.getParameter("pizzaId"));
			Long idtail = Long.parseLong(request.getParameter("taille"));
			Pizza pz = pdao.findById(idp);
			Taillepizza tp = tdao.findById(idtail);
			Pizzachoisie pc = new Pizzachoisie(0, tp, pz);
			Pizzachoisie newpc = pcdao.create(pc);

			String[] selectedIngredients = request.getParameterValues("selectedIngredients");

			// Ajout des ingrédients à la pizza créée
			for (String selectedIngredientId : selectedIngredients) {
				Long ingredientId = Long.parseLong(selectedIngredientId);
				Ingredient ing = igdao.findById(ingredientId);

				IngredPizza ingpiz = new IngredPizza(ing, newpc);
				igpizdao.create(ingpiz);

			}

			Long idCli = (long) 1;
			Client c = cdao.findById(idCli);
			Date d = new Date();
			Commande cmanc = comdao.getComNonValiderClient(idCli);
			Lignecommande lcm;
			if(cmanc ==null)
			{
				Commande cm = new Commande(d, 0, "en attente", 0, c);
				Commande newcm = comdao.create(cm);
				lcm = new Lignecommande(1, 0, newpc, newcm);
			}
			else
				lcm = new Lignecommande(1, 0, newpc, cmanc);
			

			
			lcdao.create(lcm);

			response.sendRedirect("/Projet_JSP/client/panier.jsp");
		}
	}

}
