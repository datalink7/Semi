package resv.data;

import java.sql.Timestamp;

public class MyResvDto {
	private String resvNum;
	private String resvType;
	private String boxCode;
	private String boxPwd;
	private String objType;
	private String objSize;
	private String objCnt;
	private String resvPrice;
	private Timestamp resvStDate;
	private Timestamp resvEdDate;
	private String userId;
	private String resvCancelYn;
	private String resvEndYn;
	private String resvOverPrice;
	private Timestamp resvDate;
	private String resvSendAddr;
	private String resvGetAddr;
	public String getResvNum() {
		return resvNum;
	}
	public void setResvNum(String resvNum) {
		this.resvNum = resvNum;
	}
	public String getResvType() {
		return resvType;
	}
	public void setResvType(String resvType) {
		this.resvType = resvType;
	}
	public String getBoxCode() {
		return boxCode;
	}
	public void setBoxCode(String boxCode) {
		this.boxCode = boxCode;
	}
	public String getBoxPwd() {
		return boxPwd;
	}
	public void setBoxPwd(String boxPwd) {
		this.boxPwd = boxPwd;
	}
	public String getObjType() {
		return objType;
	}
	public void setObjType(String objType) {
		this.objType = objType;
	}
	public String getObjSize() {
		return objSize;
	}
	public void setObjSize(String objSize) {
		this.objSize = objSize;
	}
	public String getObjCnt() {
		return objCnt;
	}
	public void setObjCnt(String objCnt) {
		this.objCnt = objCnt;
	}
	public String getResvPrice() {
		return resvPrice;
	}
	public void setResvPrice(String resvPrice) {
		this.resvPrice = resvPrice;
	}
	public Timestamp getResvStDate() {
		return resvStDate;
	}
	public void setResvStDate(Timestamp resvStDate) {
		this.resvStDate = resvStDate;
	}
	public Timestamp getResvEdDate() {
		return resvEdDate;
	}
	public void setResvEdDate(Timestamp resvEdDate) {
		this.resvEdDate = resvEdDate;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getResvCancelYn() {
		return resvCancelYn;
	}
	public void setResvCancelYn(String resvCancelYn) {
		this.resvCancelYn = resvCancelYn;
	}
	public String getResvEndYn() {
		return resvEndYn;
	}
	public void setResvEndYn(String resvEndYn) {
		this.resvEndYn = resvEndYn;
	}
	public String getResvOverPrice() {
		return resvOverPrice;
	}
	public void setResvOverPrice(String resvOverPrice) {
		this.resvOverPrice = resvOverPrice;
	}
	public Timestamp getResvDate() {
		return resvDate;
	}
	public void setResvDate(Timestamp resvDate) {
		this.resvDate = resvDate;
	}
	public String getResvSendAddr() {
		return resvSendAddr;
	}
	public void setResvSendAddr(String resvSendAddr) {
		this.resvSendAddr = resvSendAddr;
	}
	public String getResvGetAddr() {
		return resvGetAddr;
	}
	public void setResvGetAddr(String resvGetAddr) {
		this.resvGetAddr = resvGetAddr;
	}
}
