package child.document.model;

import java.sql.*;

public class wdocDTO {
	private int idx;
	private String subject;
	private String last_date;
	private String doc_addr;
	
	public wdocDTO() {
		super();
	}

	public wdocDTO(int idx, String subject, String last_date, String doc_addr) {
		super();
		this.idx = idx;
		this.subject = subject;
		this.last_date = last_date;
		this.doc_addr = doc_addr;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getLast_date() {
		return last_date;
	}

	public void setLast_date(String string) {
		this.last_date = string;
	}

	public String getDoc_addr() {
		return doc_addr;
	}

	public void setDoc_addr(String doc_addr) {
		this.doc_addr = doc_addr;
	}

}
