package manipal.onlineexam.student.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import manipal.onlineexam.student.dao.StudentLoginDao;
import manipal.onlineexam.student.entity.StudentLogin;

import org.w3c.dom.Attr;
import org.w3c.dom.Document;
import org.w3c.dom.Element;

/**
 * Servlet implementation class StudentSubmitServlet
 */

public class StudentSubmitServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudentSubmitServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doPost(request, response);
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		RequestDispatcher requestDispatcher=null;
		
		try {
			
			
			
		
			//<-----------------------------student info start---------------------------------->			
		
		String studId=request.getParameter("studId");
		System.out.println("Student Id--"+studId);
		String examId=request.getParameter("examId");
		System.out.println("Exam Id--"+examId);
		String paperId=request.getParameter("paperId");
		System.out.println("Paper Id--"+paperId);
		String subId=request.getParameter("subId");
		System.out.println("Subject Id--"+subId);
		String username=request.getParameter("username");
		System.out.println("Username--"+username);
		
		
		int uId=0;
		
		if(request.getParameter("uId")!=null)
		{
			uId=Integer.parseInt(request.getParameter("uId"));
		}
			
		StudentLoginDao loginDao=new StudentLoginDao();
		StudentLogin login=loginDao.getStudentLoginById(uId);
		
		
		
//----------------------------------xml writing start----------------------------->
		
		DocumentBuilderFactory docFactory = DocumentBuilderFactory.newInstance();
		DocumentBuilder docBuilder = docFactory.newDocumentBuilder();
 //-------\
// 		   \
		   // root elements
		Document doc = docBuilder.newDocument();
		Element rootElement = doc.createElement("studentresult");
		doc.appendChild(rootElement);
		 //-------\
		//		   \ 
		// student elements
		Element student = doc.createElement("student");
		rootElement.appendChild(student);
 
		// set attribute to student element
		Attr attr = doc.createAttribute("id");
		attr.setValue(studId);                  //student id   <------
		student.setAttributeNode(attr);
 
		// shorten way
		// student.setAttribute("id", "1");
		
		 //-------\
		//		   \
		
		// examid elements
		Element examid = doc.createElement("examid");
		examid.appendChild(doc.createTextNode(examId));
		student.appendChild(examid);
 
		// paperid elements
		Element paperid = doc.createElement("paperid");
		paperid.appendChild(doc.createTextNode(paperId));
		student.appendChild(paperid);
 
		// subjectid elements
		Element subjectid = doc.createElement("subjectid");
		subjectid.appendChild(doc.createTextNode(subId));
		student.appendChild(subjectid);
 
		// futureuses elements
		Element futureuse = doc.createElement("futureuse");
		futureuse.appendChild(doc.createTextNode("future use")); //future use
		student.appendChild(futureuse);
		
		Element questionAnswers = doc.createElement("questionAnswers");
		student.appendChild(questionAnswers);
		
	//<-----------------------------student info end---------------------------------->	
	
		//<-----------------------------question answer start---------------------------------->		
		
		String finalanwser=request.getParameter("finalanwser");
		System.out.println(finalanwser);
		
		
		

		
		
		ArrayList<String> questionArray=new ArrayList<String>();
		ArrayList<String> answerArray=new ArrayList<String>();
		
		
		
		
		String[] splits=finalanwser.split(",");
		if(splits!=null)
		for(int i=2;i<splits.length;i++)
		{
			//Element questionid=doc.createElement("question"); 
			
			
			if(i%2==0)
			{
				System.out.println("ques="+splits[i]);
				questionArray.add(splits[i]);
				
				//Attr attr1 = doc.createAttribute("id"); //  printing question id -- <question --id="1"-->  </question>
				//attr1.setValue(splits[i]);
				//questionid.setAttributeNode(attr1);
				
			}
			else
			{
				System.out.println("Ans="+splits[i]);
				answerArray.add(splits[i]);
				
				//questionid.appendChild(doc.createTextNode(splits[i]));  // printing answer --<question id="1"> --answer-- </question>
				//questionAnswer.appendChild(questionid);
				
			}
		}

		
		System.out.println("question array-"+questionArray);
		System.out.println("answer array-"+answerArray);
		
		for(int x=0;x<questionArray.size();x++){
			Element	questionAnswer=doc.createElement("questionAnswer");	
			
			questionAnswers.appendChild(questionAnswer);
			
			
			
			String question=questionArray.get(x);
        
        	Element questionId=doc.createElement("questionId");
			questionId.appendChild(doc.createTextNode(""+question+""));
			questionAnswer.appendChild(questionId);
	
         
			
			String answer=answerArray.get(x);
			Element anwser=doc.createElement("anwser");
			anwser.appendChild(doc.createTextNode(""+answer+""));
			questionAnswer.appendChild(anwser);
			
		
		}	
		
		try {
			
		
		// write the content into xml file
				TransformerFactory transformerFactory = TransformerFactory.newInstance();
				Transformer transformer = transformerFactory.newTransformer();
				DOMSource source = new DOMSource(doc);
				String resPath="f:/Result"+uId+".xml";
				StreamResult result = new StreamResult(new File(resPath));
		 
				// Output to console for testing
				// StreamResult result = new StreamResult(System.out);
		 
				transformer.transform(source, result);
		 
				System.out.println("File saved!");
				
				if(login!=null)
				{
					login.setLogoutTime(new Date());
					login.setLoginStatus("2");
					if(new File(resPath).exists())
					{
						login.setResPath(resPath);
					}
					else
					{
						login.setResPath("");
					}
					
					
					loginDao.updateStudentLogin(login);
				}
		
		} catch (Exception e) {
			// TODO: handle exception
			
			e.printStackTrace();
		}
				
		//----------------------------------xml writing end----------------------------->
		
		//<-----------------------------question answer end---------------------------------->
				
			//	request.setAttribute("usern", username);
				
				/*requestDispatcher=request.getRequestDispatcher("view/student/LogoutStudent.jsp");
				
				requestDispatcher.forward(request, response);
				*/
				
				response.sendRedirect("view/student/LogoutStudent.jsp?usern="+username);
		
		} catch (Exception e) {
			// TODO: handle exception
			
			e.printStackTrace();
		}
		
			
			} 
		
		
	}

	


