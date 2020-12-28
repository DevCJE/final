package child.consent.model;

import java.sql.Date;

public class ConsentReplyDTO {
	
	private int idx;
	private int come_home_idx;
	private String content;
	private Date replydate;
	
	public ConsentReplyDTO() {
		super();
	}
	
	public ConsentReplyDTO(int idx, int come_home_idx, String content, Date replydate) {
		super();
		this.idx = idx;
		this.come_home_idx = come_home_idx;
		this.content = content;
		this.replydate = replydate;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public int getCome_home_idx() {
		return come_home_idx;
	}

	public void setCome_home_idx(int come_home_idx) {
		this.come_home_idx = come_home_idx;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getReplydate() {
		return replydate;
	}

	public void setReplydate(Date replydate) {
		this.replydate = replydate;
	}

}
