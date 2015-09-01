package manipal.onlineexam.student.controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import manipal.onlineexam.admin.dao.TrailDao;
import manipal.onlineexam.admin.entity.Trail;
import manipal.onlineexam.student.dao.QPackDao;
import manipal.onlineexam.student.dao.StudentLoginDao;
import manipal.onlineexam.student.entity.QPack;
import manipal.onlineexam.student.entity.StudentLogin;

/**
 * Servlet implementation class StudentLoginServlet
 */

public class StudentLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudentLoginServlet() {
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
		
		
		
		
		
		
		
		String userName="";
		String pass="";
		int id=0;
		HttpSession session=request.getSession();
		
		userName=request.getParameter("userName");
		pass=request.getParameter("password");
		
		StudentLoginDao loginDao=new StudentLoginDao();
		
		List<StudentLogin> studentLogins=loginDao.getAllStudentLogins();
		boolean flag=false;
		if(studentLogins!=null )
		for(StudentLogin login:studentLogins)
		{
			if(userName.equals(login.getUserName().trim()) && pass.equals(login.getPass().trim()) && login.getPack()!=null && login.getPack().getActivationStatus().equals("1") && login.getLoginStatus()!=null && login.getLoginStatus().trim().equalsIgnoreCase("0"))
			{
				flag=true;
				id=login.getId();
				session.setAttribute("User", userName);
				System.out.println("Session Created....");				
				
				//=========================
				
				StudentLoginDao studentLoginDao=new StudentLoginDao();
				
				login.setLoginTime(new Date());
				login.setLoginStatus("1");
				
				studentLoginDao.updateStudentLogin(login);
				//================================
				
				QPackDao qPackDao=new QPackDao();
				QPack qPack= login.getPack();
			
				
				
				
			
				
				//====================================
				
				Trail trail=new Trail();
				trail.setMyEvent("Logged In");
				trail.setMyDate(new Date());
				trail.setStudentLogin(login);
				
				TrailDao dao=new TrailDao();
				dao.addTrail(trail);
				
				
			}
		}
		
		
		if(flag)
		{
			response.sendRedirect("view/student/instruction.jsp?user="+id);
		}
		else
		{
			response.sendRedirect("view/student/LoginStudent.jsp");
		}
		
		
		
		
		
		
		
	}
	
	

}
