package review.data;

import java.sql.Timestamp;

public class RevwDto {
	private int revwNum;
	private String revwCont;
	private String userId;
	private String revwTitle;
	private Timestamp revwDate;
	private String revwType;
	private int revwStar;
	private Timestamp revwTime;
	private int revwCnt;
	public int getRevwNum() {
		return revwNum;
	}
	public void setRevwNum(int revwNum) {
		this.revwNum = revwNum;
	}
	public String getRevwCont() {
		return revwCont;
	}
	public void setRevwCont(String revwCont) {
		this.revwCont = revwCont;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getRevwTitle() {
		return revwTitle;
	}
	public void setRevwTitle(String revwTitle) {
		this.revwTitle = revwTitle;
	}
	public Timestamp getRevwDate() {
		return revwDate;
	}
	public void setRevwDate(Timestamp revwDate) {
		this.revwDate = revwDate;
	}
	public String getRevwType() {
		return revwType;
	}
	public void setRevwType(String revwType) {
		this.revwType = revwType;
	}
	public int getRevwStar() {
		return revwStar;
	}
	public void setRevwStar(int revwStar) {
		this.revwStar = revwStar;
	}
	public Timestamp getRevwTime() {
		return revwTime;
	}
	public void setRevwTime(Timestamp revwTime) {
		this.revwTime = revwTime;
	}
	public int getRevwCnt() {
		return revwCnt;
	}
	public void setRevwCnt(int revwCnt) {
		this.revwCnt = revwCnt;
	}
	
	
}
