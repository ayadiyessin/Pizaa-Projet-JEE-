package controller;

import java.io.IOException;

import DAO.LignecommandeDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class PanierController
 */
public class PanierController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private LignecommandeDAO lcdao;

	public PanierController() {
		super();
		lcdao = new LignecommandeDAO();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Long id = Long.parseLong(request.getParameter("idlc"));
		if (request.getParameter("del") != null) {
			//Long lcmId = Long.parseLong(request.getParameter("lcmId"));
			if(lcdao.deleteAll(id))
				response.sendRedirect("/Projet_JSP/index.jsp");
			
			//response.sendRedirect("/Projet_JSP/client/panier.jsp");
			
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	}

}
