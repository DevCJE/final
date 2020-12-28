package child.itnmsg.model;

import java.sql.*;

public class itnMsgDTO {

	private int idx;
	private String subject;
	private String content;
	private String recv_name;
	private String send_name;
	private String recv_del;
	private String send_del;
	private Date message_date;
	private int message_view;
	
	public itnMsgDTO() {
		super();
	}

	public itnMsgDTO(int idx, String subject, String content, String recv_name, String send_name, String recv_del,
			String send_del, Date message_date, int message_view) {
		super();
		this.idx = idx;
		this.subject = subject;
		this.content = content;
		this.recv_name = recv_name;
		this.send_name = send_name;
		this.recv_del = recv_del;
		this.send_del = send_del;
		this.message_date = message_date;
		this.message_view = message_view;
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

	public String getRecv_name() {
		return recv_name;
	}

	public void setRecv_name(String recv_name) {
		this.recv_name = recv_name;
	}

	public String getSend_name() {
		return send_name;
	}

	public void setSend_name(String send_name) {
		this.send_name = send_name;
	}

	public String getRecv_del() {
		return recv_del;
	}

	public void setRecv_del(String recv_del) {
		this.recv_del = recv_del;
	}

	public String getSend_del() {
		return send_del;
	}

	public void setSend_del(String send_del) {
		this.send_del = send_del;
	}

	public Date getMessage_date() {
		return message_date;
	}

	public void setMessage_date(Date message_date) {
		this.message_date = message_date;
	}

	public int getMessage_view() {
		return message_view;
	}

	public void setMessage_view(int message_view) {
		this.message_view = message_view;
	}
	
}
