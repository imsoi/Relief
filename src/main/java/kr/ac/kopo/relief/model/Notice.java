package kr.ac.kopo.relief.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Notice {
	private int ncode;
	private String title;
	private String contents;
	@DateTimeFormat(pattern = "YYYY년 MM월 dd일")
	private Date regDate;
	private Date editDate;
	private String id;

	public int getNcode() {
		return ncode;
	}

	public void setNcode(int ncode) {
		this.ncode = ncode;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}


	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public Date getEditDate() {
		return editDate;
	}

	public void setEditDate(Date editDate) {
		this.editDate = editDate;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
}
