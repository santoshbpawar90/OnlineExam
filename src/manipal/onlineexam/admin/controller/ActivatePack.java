package manipal.onlineexam.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import manipal.onlineexam.student.dao.QPackDao;
import manipal.onlineexam.student.entity.QPack;

/**
 * Servlet implementation class ActivatePack
 */
@WebServlet("/ActivatePack")
public class ActivatePack extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ActivatePack() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		int qPackId=0;
		
		
		if(request.getParameter("rdo")!=null)
		{
			qPackId=Integer.parseInt(request.getParameter("rdo"));
			
			QPackDao qPackDao=new QPackDao();
			
			QPack qPack=qPackDao.getQPackById(qPackId);
			
			if(qPack!=null){
				qPack.setActivationStatus("1");
				
				qPackDao.updateQPack(qPack);
			}
			
		}
		
		
		
		response.sendRedirect("view/admin/QPack.jsp");
	}

}
