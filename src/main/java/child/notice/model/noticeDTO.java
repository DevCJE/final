package child.notice.model;

import java.sql.*;

public class noticeDTO {
	
	private int idx;
	private String subject;
	private String content;
	private int readnum;
	private Date notice_date;
	
	public noticeDTO() {
		super();
	}

	public noticeDTO(int idx, String subject, String content, int readnum, Date notice_date) {
		super();
		this.idx = idx;
		this.subject = subject;
		this.content = content;
		this.readnum = readnum;
		this.notice_date = notice_date;
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getReadnum() {
		return readnum;
	}

	public void setReadnum(int readnum) {
		this.readnum = readnum;
	}

	public Date getNotice_date() {
		return notice_date;
	}

	public void setNotice_date(Date notice_date) {
		this.notice_date = notice_date;
	}
	
}
