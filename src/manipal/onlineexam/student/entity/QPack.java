package manipal.onlineexam.student.entity;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class QPack {

	@Id
	@GeneratedValue
	int id;
	String qPackName;
	Date date;
	String path; 
	String duration;
	String activationStatus;
	String examId;
	String subId;
	String subName;
	String paperId;
	Date firstTestStartedTime;
	Date endTime;
	String intervalStatus;
	
	@OneToMany(targetEntity=StudentLogin.class,mappedBy="pack",cascade=CascadeType.ALL,fetch=FetchType.LAZY)
	List<StudentLogin> studentLogins;
	
	
	
	
	public String getIntervalStatus() {
		return intervalStatus;
	}
	public void setIntervalStatus(String intervalStatus) {
		this.intervalStatus = intervalStatus;
	}
	public Date getFirstTestStartedTime() {
		return firstTestStartedTime;
	}
	public void setFirstTestStartedTime(Date firstTestStartedTime) {
		this.firstTestStartedTime = firstTestStartedTime;
	}
	public Date getEndTime() {
		return endTime;
	}
	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
	public List<StudentLogin> getStudentLogins() {
		return studentLogins;
	}
	public void setStudentLogins(List<StudentLogin> studentLogins) {
		this.studentLogins = studentLogins;
	}
	public String getSubName() {
		return subName;
	}
	public void setSubName(String subName) {
		this.subName = subName;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getqPackName() {
		return qPackName;
	}
	public void setqPackName(String qPackName) {
		this.qPackName = qPackName;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public String getDuration() {
		return duration;
	}
	public void setDuration(String duration) {
		this.duration = duration;
	}
	public String getActivationStatus() {
		return activationStatus;
	}
	public void setActivationStatus(String activationStatus) {
		this.activationStatus = activationStatus;
	}
	public String getExamId() {
		return examId;
	}
	public void setExamId(String examId) {
		this.examId = examId;
	}
	public String getSubId() {
		return subId;
	}
	public void setSubId(String subId) {
		this.subId = subId;
	}
	public String getPaperId() {
		return paperId;
	}
	public void setPaperId(String paperId) {
		this.paperId = paperId;
	}
	
	
	
	
	
}
