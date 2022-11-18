package com.springlec.base.model;

import java.sql.Timestamp;

public class BDto {

	int bId;
	String bName;
	String bTitle;
	Timestamp insertdate;
	
	public BDto() {
		// TODO Auto-generated constructor stub
	}

	public BDto(int bId, String bName, String bTitle, Timestamp insertdate) {
		super();
		this.bId = bId;
		this.bName = bName;
		this.bTitle = bTitle;
		this.insertdate = insertdate;
	}

	public int getbId() {
		return bId;
	}

	public void setbId(int bId) {
		this.bId = bId;
	}

	public String getbName() {
		return bName;
	}

	public void setbName(String bName) {
		this.bName = bName;
	}

	public String getbTitle() {
		return bTitle;
	}

	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}

	public Timestamp getInsertdate() {
		return insertdate;
	}

	public void setInsertdate(Timestamp insertdate) {
		this.insertdate = insertdate;
	}

	
}
