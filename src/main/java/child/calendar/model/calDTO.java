package child.calendar.model;

import java.sql.Date;

public class calDTO {
	private int idx;
	private String cal_subject;
	private String cal_date;
	private String cal_time;
	private String cal_content;
	private String cal_map;
	
	public calDTO() {
		super();
	}

	public calDTO(int idx, String cal_subject, String cal_date, String cal_time, String cal_content, String cal_map) {
		super();
		this.idx = idx;
		this.cal_subject = cal_subject;
		this.cal_date = cal_date;
		this.cal_time= cal_time;
		this.cal_content = cal_content;
		this.cal_map = cal_map;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getCal_subject() {
		return cal_subject;
	}

	public void setCal_subject(String cal_subject) {
		this.cal_subject = cal_subject;
	}

	public String getCal_date() {
		return cal_date;
	}

	public void setCal_date(String cal_date) {
		this.cal_date = cal_date;
	}

	public String getCal_time() {
		return cal_time;
	}

	public void setCal_time(String cal_time) {
		this.cal_time = cal_time;
	}

	public String getCal_content() {
		return cal_content;
	}

	public void setCal_content(String cal_content) {
		this.cal_content = cal_content;
	}

	public String getCal_map() {
		return cal_map;
	}

	public void setCal_map(String cal_map) {
		this.cal_map = cal_map;
	}
	
}