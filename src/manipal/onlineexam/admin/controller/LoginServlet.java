package manipal.onlineexam.admin.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import manipal.onlineexam.admin.dao.UserModel;

/**
 * Servlet implementation class LoginServlet
 */

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 
		
		/*RequestDispatcher dispatcher=request.getRequestDispatcher("view/admin/QPack.jsp");
		dispatcher.forward(request, response);*/
		String userName="",pass="";
		
		userName=request.getParameter("userName");
		pass=request.getParameter("password");
		
		UserModel userModel=new UserModel();
		if(userModel.checkUser(userName, pass))
		{
			/*RequestDispatcher dispatcher=request.getRequestDispatcher("view/admin/QPack.jsp");
			dispatcher.forward(request, response);*/
			
			
			
			response.sendRedirect("view/admin/QPack.jsp");
		}
		else
		{
			response.sendRedirect("view/admin/Login.jsp");
		}
		
		
		
		
		
	}

}
