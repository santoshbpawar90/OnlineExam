package manipal.onlineexam.admin.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import manipal.onlineexam.student.entity.StudentLogin;

@Entity
public class Ans {

	@Id
	@GeneratedValue
	int id;
	String qIdCentral;
	String ansId;
	
	@ManyToOne
	@JoinColumn(name="studId_Fk")
	StudentLogin studentLog;
	
	
	
	public StudentLogin getStudentLog() {
		return studentLog;
	}
	public void setStudentLog(StudentLogin studentLog) {
		this.studentLog = studentLog;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getqIdCentral() {
		return qIdCentral;
	}
	public void setqIdCentral(String qIdCentral) {
		this.qIdCentral = qIdCentral;
	}
	public String getAnsId() {
		return ansId;
	}
	public void setAnsId(String ansId) {
		this.ansId = ansId;
	}
	
	
	
	
}
