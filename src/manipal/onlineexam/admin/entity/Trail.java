package manipal.onlineexam.admin.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import manipal.onlineexam.student.entity.StudentLogin;

@Entity
public class Trail {

	@Id
	@GeneratedValue
	int id;
	String myEvent;
	String qIdCentral;
	String qIdClient;
	String optionNo;
	Date myDate;
	
	@ManyToOne
	@JoinColumn(name="stud_FK")
	StudentLogin studentLogin;
	
	
	
	public StudentLogin getStudentLogin() {
		return studentLogin;
	}
	public void setStudentLogin(StudentLogin studentLogin) {
		this.studentLogin = studentLogin;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getMyEvent() {
		return myEvent;
	}
	public void setMyEvent(String myEvent) {
		this.myEvent = myEvent;
	}
	public String getqIdCentral() {
		return qIdCentral;
	}
	public void setqIdCentral(String qIdCentral) {
		this.qIdCentral = qIdCentral;
	}
	public String getqIdClient() {
		return qIdClient;
	}
	public void setqIdClient(String qIdClient) {
		this.qIdClient = qIdClient;
	}
	public String getOptionNo() {
		return optionNo;
	}
	public void setOptionNo(String optionNo) {
		this.optionNo = optionNo;
	}
	public Date getMyDate() {
		return myDate;
	}
	public void setMyDate(Date myDate) {
		this.myDate = myDate;
	}
	
	
	
}
