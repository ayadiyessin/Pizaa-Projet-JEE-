package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import modele.Pizza;

import java.io.IOException;
import java.util.List;

import DAO.PizzaDAO;

/**
 * Servlet implementation class PizzaController
 */
public class PizzaController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private PizzaDAO pdao;
	public PizzaController() {
		super();
		pdao=new PizzaDAO();
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
		List<Pizza> results = pdao.getAll();
		request.setAttribute("listPizza",results);
		request.setAttribute("message",message);
		RequestDispatcher rd=getServletContext().getRequestDispatcher("/pizza/ListPizza.jsp");
		rd.forward(request, response); 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
