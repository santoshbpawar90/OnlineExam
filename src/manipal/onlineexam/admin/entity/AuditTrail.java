package manipal.onlineexam.admin.entity;

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
	int audiId;
	String event;
	String qIdCentral;
	String qIdClient;
	
	@ManyToOne
	@JoinColumn(name="stud_FK")
	StudentLogin login;

	public int getAudiId() {
		return audiId;
	}

	public void setAudiId(int audiId) {
		this.audiId = audiId;
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
