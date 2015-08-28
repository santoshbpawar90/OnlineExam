package manipal.onlineexam.student.entity;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import manipal.onlineexam.admin.entity.Ans;
import manipal.onlineexam.admin.entity.TimeInterval;
import manipal.onlineexam.admin.entity.Trail;

@Entity
public class StudentLogin {

	@Id
	@GeneratedValue
	int id;
	String studId;
	String userName;
	String pass;
	String studName;	
	String college;
	Date loginTime;
	Date logoutTime;
	String loginStatus;
	String photoPath;
	String resPath;
	String ipAdd;
	String macAdd;
	String divMain;
	String divMenu;
	
	@ManyToOne
	@JoinColumn(name="qPack_FK")
	QPack pack;
	
	@OneToMany(targetEntity=TimeInterval.class,mappedBy="login",fetch=FetchType.LAZY,cascade=CascadeType.ALL)
	List<TimeInterval> intervals;
	
	
	@OneToMany(targetEntity=Trail.class,mappedBy="studentLogin",fetch=FetchType.LAZY,cascade=CascadeType.ALL)
	List<Trail> trails;
	

	@OneToMany(targetEntity=Ans.class,mappedBy="studentLog",fetch=FetchType.LAZY,cascade=CascadeType.ALL)
	List<Ans> ans;

	
	public List<Ans> getAns() {
		return ans;
	}
	public void setAns(List<Ans> ans) {
		this.ans = ans;
	}
	public List<Trail> getTrails() {
		return trails;
	}
	public void setTrails(List<Trail> trails) {
		this.trails = trails;
	}
	public String getDivMain() {
		return divMain;
	}
	public void setDivMain(String divMain) {
		this.divMain = divMain;
	}
	public String getDivMenu() {
		return divMenu;
	}
	public void setDivMenu(String divMenu) {
		this.divMenu = divMenu;
	}
	
	public List<TimeInterval> getIntervals() {
		return intervals;
	}
	public void setIntervals(List<TimeInterval> intervals) {
		this.intervals = intervals;
	}
	public String getMacAdd() {
		return macAdd;
	}
	public void setMacAdd(String macAdd) {
		this.macAdd = macAdd;
	}
	public String getIpAdd() {
		return ipAdd;
	}
	public void setIpAdd(String ipAdd) {
		this.ipAdd = ipAdd;
	}
	public String getResPath() {
		return resPath;
	}
	public void setResPath(String resPath) {
		this.resPath = resPath;
	}
	public String getPhotoPath() {
		return photoPath;
	}
	public void setPhotoPath(String photoPath) {
		this.photoPath = photoPath;
	}
	public QPack getPack() {
		return pack;
	}
	public void setPack(QPack pack) {
		this.pack = pack;
	}
	public String getStudId() {
		return studId;
	}
	public void setStudId(String studId) {
		this.studId = studId;
	}
	public String getStudName() {
		return studName;
	}
	public void setStudName(String studName) {
		this.studName = studName;
	}
	public String getLoginStatus() {
		return loginStatus;
	}
	public void setLoginStatus(String loginStatus) {
		this.loginStatus = loginStatus;
	}
	public String getCollege() {
		return college;
	}
	public void setCollege(String college) {
		this.college = college;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	
	
	public Date getLoginTime() {
		return loginTime;
	}
	public void setLoginTime(Date loginTime) {
		this.loginTime = loginTime;
	}
	public Date getLogoutTime() {
		return logoutTime;
	}
	public void setLogoutTime(Date logoutTime) {
		this.logoutTime = logoutTime;
	}
	
	
	
	
	
}
