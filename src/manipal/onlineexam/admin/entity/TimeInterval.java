package manipal.onlineexam.admin.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import manipal.onlineexam.student.entity.StudentLogin;


@Entity
public class TimeInterval {

	@Id
	@GeneratedValue
	int id;
	Date date;
	String activeStatus;
	
	@ManyToOne
	@JoinColumn(name="login_FK")
	StudentLogin login;
	
	
	
	public StudentLogin getLogin() {
		return login;
	}
	public void setLogin(StudentLogin login) {
		this.login = login;
	}
	public String getActiveStatus() {
		return activeStatus;
	}
	public void setActiveStatus(String activeStatus) {
		this.activeStatus = activeStatus;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	
	
	
}
