package temp;

import java.io.File;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import org.w3c.dom.Attr;
import org.w3c.dom.Document;
import org.w3c.dom.Element;

public class WriteXMLFile {


	public static void main(String argv[]) {
 
	  try {
 
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
		attr.setValue("1");
		student.setAttributeNode(attr);
 
		// shorten way
		// student.setAttribute("id", "1");
		
		 //-------\
		//		   \
		
		// examid elements
		Element examid = doc.createElement("examid");
		examid.appendChild(doc.createTextNode("upsc"));
		student.appendChild(examid);
 
		// paperid elements
		Element paperid = doc.createElement("paperid");
		paperid.appendChild(doc.createTextNode("set3"));
		student.appendChild(paperid);
 
		// subjectid elements
		Element subjectid = doc.createElement("subjectid");
		subjectid.appendChild(doc.createTextNode("marathi"));
		student.appendChild(subjectid);
 
		// futureuses elements
		Element futureuse = doc.createElement("futureuse");
		futureuse.appendChild(doc.createTextNode("future use"));
		student.appendChild(futureuse);
		
		Element questionAnswer = doc.createElement("questionAnswer");
		student.appendChild(questionAnswer);
		
		
		 //-------\
		//		   \
		
			Element questionid=doc.createElement("question");
			questionid.appendChild(doc.createTextNode("answer"));
			questionAnswer.appendChild(questionid);

			Attr attr1 = doc.createAttribute("id");
			attr1.setValue("1");
			questionid.setAttributeNode(attr1);
			
			

			
		
 
		// write the content into xml file
		TransformerFactory transformerFactory = TransformerFactory.newInstance();
		Transformer transformer = transformerFactory.newTransformer();
		DOMSource source = new DOMSource(doc);
		StreamResult result = new StreamResult(new File("f:\\result.xml"));
 
		// Output to console for testing
		// StreamResult result = new StreamResult(System.out);
 
		transformer.transform(source, result);
 
		System.out.println("File saved!");
 
	  } catch (ParserConfigurationException pce) {
		pce.printStackTrace();
	  } catch (TransformerException tfe) {
		tfe.printStackTrace();
	  }
	}
}