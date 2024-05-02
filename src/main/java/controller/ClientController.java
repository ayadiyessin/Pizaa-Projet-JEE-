package controller;

import java.io.IOException;

import DAO.ClientDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
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
			String l=request.getParameter("login");
			String p=request.getParameter("password");
			String n=request.getParameter("nom");
			String pr=request.getParameter("prenom");
			String ad=request.getParameter("adresse");
			int numt=Integer.parseInt(request.getParameter("numtel"));
			Client c=new Client(l,p,n,pr,ad,numt);	
			cdao.create(c);
			//response.sendRedirect("/FirstJSP/Authentification.jsp");
		}
	}

}
