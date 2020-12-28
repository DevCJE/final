package child.document.model;

import java.sql.Date;

public class docDTO {
	private int idx;
	private String subject;
	private String name1;
	private String name2;
	private int state;
	private Date confirm_date;
	private String sign1;
	private String sign2;
	private String document;
	
	public docDTO() {
		super();
	}

	public docDTO(int idx, String subject, String name1, String name2, int state, Date confirm_date, String sign1, String sign2,
			String document) {
		super();
		this.idx = idx;
		this.subject = subject;
		this.name1 = name1;
		this.name2 = name2;
		this.state = state;
		this.confirm_date = confirm_date;
		this.sign1 = sign1;
		this.sign2 = sign2;
		this.document = document;
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

	public String getName1() {
		return name1;
	}

	public void setName1(String name1) {
		this.name1 = name1;
	}

	public String getName2() {
		return name2;
	}

	public void setName2(String name2) {
		this.name2 = name2;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public Date getConfirm_date() {
		return confirm_date;
	}

	public void setConfirm_date(Date confirm_date) {
		this.confirm_date = confirm_date;
	}

	public String getSign1() {
		return sign1;
	}

	public void setSign1(String sign1) {
		this.sign1 = sign1;
	}
	
	public String getSign2() {
		return sign2;
	}
	
	public void setSign2(String sign2){
		this.sign2=sign2;
	}

	public String getDocument() {
		return document;
	}

	public void setDocument(String document) {
		this.document = document;
	}

}
