package child.consent.model;

import java.sql.Date;

public class ConsentDTO {
	
	private int idx;
	private int member_idx;
	private Date writedate;
	private String time;
	private String type;
	private String name;
	private String tel;
	private String confirm;
	private String reply;
	
	public ConsentDTO() {
		super();
	}

	public ConsentDTO(int idx, int member_idx, Date writedate, String time, String type, String name, String tel,
			String confirm, String reply) {
		super();
		this.idx = idx;
		this.member_idx = member_idx;
		this.writedate = writedate;
		this.time = time;
		this.type = type;
		this.name = name;
		this.tel = tel;
		this.confirm = confirm;
		this.reply = reply;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public int getMember_idx() {
		return member_idx;
	}

	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}

	public Date getWritedate() {
		return writedate;
	}

	public void setWritedate(Date writedate) {
		this.writedate = writedate;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getConfirm() {
		return confirm;
	}

	public void setConfirm(String confirm) {
		this.confirm = confirm;
	}

	public String getReply() {
		return reply;
	}

	public void setReply(String reply) {
		this.reply = reply;
	}
	
}
