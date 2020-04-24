package noti.data;

import java.sql.Timestamp;

public class NotiDto {
	private int notiNum;
	private String notiType;
	private String notiCont;
	private String userId;
	private String notiTitle;
	private Timestamp notiDate;
	private String notiPwd;
	private int notiCnt;
	private Timestamp notiTime;
	
	
	public int getNotiNum() {
		return notiNum;
	}
	public void setNotiNum(int notiNum) {
		this.notiNum = notiNum;
	}
	public String getNotiType() {
		return notiType;
	}
	public void setNotiType(String notiType) {
		this.notiType = notiType;
	}
	public String getNotiCont() {
		return notiCont;
	}
	public void setNotiCont(String notiCont) {
		this.notiCont = notiCont;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getNotiTitle() {
		return notiTitle;
	}
	public void setNotiTitle(String notiTitle) {
		this.notiTitle = notiTitle;
	}
	public Timestamp getNotiDate() {
		return notiDate;
	}
	public void setNotiDate(Timestamp notiDate) {
		this.notiDate = notiDate;
	}
	public String getNotiPwd() {
		return notiPwd;
	}
	public void setNotiPwd(String notiPwd) {
		this.notiPwd = notiPwd;
	}
	public int getNotiCnt() {
		return notiCnt;
	}
	public void setNotiCnt(int notiCnt) {
		this.notiCnt = notiCnt;
	}
	public Timestamp getNotiTime() {
		return notiTime;
	}
	public void setNotiTime(Timestamp notiTime) {
		this.notiTime = notiTime;
	}

	
	
}
