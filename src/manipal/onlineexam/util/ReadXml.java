package manipal.onlineexam.util;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import manipal.onlineexam.student.dao.StudentLoginDao;
import manipal.onlineexam.student.entity.StudentLogin;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

/**
 * Servlet implementation class ReadXml
 */
@WebServlet("/ReadXml")
public class ReadXml extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReadXml() {
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
		
		System.out.println("geting paper");
		ArrayList<QuestionClass> listquestion = new ArrayList<QuestionClass>();

		try {

			int uId=0;
			
			if(request.getParameter("id")!=null)
			{
				uId=Integer.parseInt(request.getParameter("id"));
			}
					
					
			
			StudentLoginDao loginDao=new StudentLoginDao();			
			StudentLogin studentLogin= loginDao.getStudentLoginById(uId);
			request.setAttribute("username",studentLogin.getUserName());
			request.setAttribute("time", studentLogin.getPack().getDuration());
			request.setAttribute("subject", studentLogin.getPack().getqPackName());
			request.setAttribute("college", studentLogin.getCollege());
			request.setAttribute("examId", studentLogin.getPack().getExamId());
			request.setAttribute("paperId", studentLogin.getPack().getPaperId());
			request.setAttribute("subId", studentLogin.getPack().getSubId());
			request.setAttribute("studId", studentLogin.getStudId());
			request.setAttribute("photoPath", studentLogin.getPhotoPath());
			request.setAttribute("Name", studentLogin.getStudName());
			request.setAttribute("uId", uId);
			
			
			File fXmlFile = new File(studentLogin.getPack().getPath());
			DocumentBuilderFactory dbFactory = DocumentBuilderFactory
					.newInstance();
			DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
			Document doc = dBuilder.parse(fXmlFile);

			// optional, but recommended
			// read this -
			// http://stackoverflow.com/questions/13786607/normalization-in-dom-parsing-with-java-how-does-it-work
			doc.getDocumentElement().normalize();

			System.out.println("Root element :"
					+ doc.getDocumentElement().getNodeName());

			NodeList nList = doc.getElementsByTagName("Question");

			if(nList!=null)
			for (int temp = 0; temp < nList.getLength(); temp++) {

				Node nNode = nList.item(temp);

				System.out.println("\nCurrent Element :" + nNode.getNodeName());

				if (nNode.getNodeType() == Node.ELEMENT_NODE) {

					Element eElement = (Element) nNode;

					System.out.println("question id : "
							+ eElement.getAttribute("QuestionsId"));
					System.out.println("question : "
							+ eElement.getElementsByTagName("QuestionName")
									.item(0).getTextContent());
					System.out.println("option 1 : "
							+ eElement.getElementsByTagName("Option1").item(0)
									.getTextContent());
					System.out.println("option 2 : "
							+ eElement.getElementsByTagName("Option2").item(0)
									.getTextContent());
					System.out.println("option 3 : "
							+ eElement.getElementsByTagName("Option3").item(0)
									.getTextContent());
					System.out.println("option 4 : "
							+ eElement.getElementsByTagName("Option4").item(0)
									.getTextContent());
					
					QuestionClass q = new QuestionClass();

					Integer id = Integer.parseInt(eElement.getAttribute("QuestionsId")); // id form  XML is in string thats why parseInt
					q.setQuestionId(id);
					String question = eElement
							.getElementsByTagName("QuestionName").item(0)
							.getTextContent();
					q.setQuestion(question);
					String option1 = eElement.getElementsByTagName("Option1").item(0).getTextContent();
					q.setOption1(option1);
					String option2 = eElement.getElementsByTagName("Option2").item(0).getTextContent();
					q.setOption2(option2);
					String option3 = eElement.getElementsByTagName("Option3").item(0).getTextContent();
					q.setOption3(option3);
					String option4 = eElement.getElementsByTagName("Option4").item(0).getTextContent();
					q.setOption4(option4);

					listquestion.add(q);

				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		System.out.println("---------------------------");

		System.out.println("----ARRAYLIST----");
		System.out.println("---------------------------");
		
		for (QuestionClass questionClass : listquestion) {

			System.out.println(questionClass.getQuestionId());
			System.out.println(questionClass.getQuestion());
			System.out.println(questionClass.getOption1());
			System.out.println(questionClass.getOption2());
			System.out.println(questionClass.getOption3());
			System.out.println(questionClass.getOption4());

		}
		try {
			
			request.setAttribute("qlist", listquestion);
			RequestDispatcher rd=request.getRequestDispatcher("view/student/exam.jsp");
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		}

}
