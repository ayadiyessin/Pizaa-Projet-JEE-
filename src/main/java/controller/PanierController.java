package controller;

import java.io.IOException;

import DAO.CommandeDAO;
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
	private CommandeDAO cmdao;

	public PanierController() {
		super();
		lcdao = new LignecommandeDAO();
		cmdao = new CommandeDAO();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String idlcParam = request.getParameter("idlc");
		String suppParam = request.getParameter("supp");
		String dataId = request.getParameter("dataId");
        String value = request.getParameter("value");
		System.out.println("Parsed id: " + idlcParam);
        System.out.println("supp parameter: " + suppParam);

		
		if (idlcParam != null && suppParam != null) {
		        Long id = Long.parseLong(idlcParam);
		        
		        System.out.println("Parsed id: " + id);
		        System.out.println("supp parameter: " + suppParam);

		        if (lcdao.updateLigneValid(id)) {
		            System.out.println("Update successful. Redirecting to index.jsp");
		            response.sendRedirect("/Projet_JSP/client/panier.jsp");
		        } else {
		            System.out.println("Update failed. Redirecting to panier.jsp");
		            response.sendRedirect("/Projet_JSP/client/panier.jsp");
		        }
		    
		} else if(value != null && dataId != null) {
			Long idlig = Long.parseLong(dataId);
			int val = Integer.parseInt(value);
			System.out.println(idlig +" "+ val );
			if(lcdao.updateQT(idlig, val)) {
				System.out.println("aa");
				response.sendRedirect("/Projet_JSP/client/panier.jsp");
			}
			
			
		}
		
		else {
		    System.out.println("Required parameters are missing. Redirecting to error.jsp");
		    response.sendRedirect("/Projet_JSP/error.jsp");
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String message="";
		if(request.getParameter("acheter")!=null) {
			Long idcom=Long.parseLong(request.getParameter("idcomach"));
			Long idcli=Long.parseLong(request.getParameter("idcliach"));
			if(cmdao.updateCommandeForClient(idcom, idcli)) {
				message="produit  "+idcom+" mis a jour avec succes";
			}
		}
		response.sendRedirect("/Projet_JSP/index.jsp");
		
		
	}

}
