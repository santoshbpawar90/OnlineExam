package manipal.onlineexam.admin.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import manipal.onlineexam.student.entity.StudentLogin;


@Entity
public class AuditTrail {

	@Id
	@GeneratedValue
	int auditId;
	String event;
	String qIdCentral;
	String qIdClient;
	String option;
	Date time;
	 
	@ManyToOne
	@JoinColumn(name="stud_FK")
	StudentLogin login;

	

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public String getOption() {
		return option;
	}

	public void setOption(String option) {
		this.option = option;
	}

	public int getAuditId() {
		return auditId;
	}

	public void setAuditId(int auditId) {
		this.auditId = auditId;
	}

	public String getEvent() {
		return event;
	}

	public void setEvent(String event) {
		this.event = event;
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

	public StudentLogin getLogin() {
		return login;
	}

	public void setLogin(StudentLogin login) {
		this.login = login;
	}
	
	
	
	
}
