package kr.ac.kopo.relief.model;

import kr.ac.kopo.relief.util.UploadFile;

public class NoticeImage implements UploadFile {
	private int icode;
	private String filename;
	private String uuid;
	private int noticeNcode;
	public int getIcode() {
		return icode;
	}
	public void setIcode(int icode) {
		this.icode = icode;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getUuid() {
		return uuid;
	}
	public void setUuid(String uuid) {
		this.uuid = uuid;
	}
	public int getNoticeNcode() {
		return noticeNcode;
	}
	public void setNoticeNcode(int noticeNcode) {
		this.noticeNcode = noticeNcode;
	}
	
	
}