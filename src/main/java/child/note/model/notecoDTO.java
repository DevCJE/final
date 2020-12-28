package child.note.model;

import java.sql.Date;

public class notecoDTO {
	private int idx;
	private int note_idx;
	private String note_comment_writer;
	private String note_comment_content;
	private Date note_comment_date;
	public notecoDTO() {
		super();
	}
	public notecoDTO(int idx, int note_idx, String note_comment_writer, String note_comment_content,
			Date note_comment_date) {
		super();
		this.idx = idx;
		this.note_idx = note_idx;
		this.note_comment_writer = note_comment_writer;
		this.note_comment_content = note_comment_content;
		this.note_comment_date = note_comment_date;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getNote_idx() {
		return note_idx;
	}
	public void setNote_idx(int note_idx) {
		this.note_idx = note_idx;
	}
	public String getNote_comment_writer() {
		return note_comment_writer;
	}
	public void setNote_comment_writer(String note_comment_writer) {
		this.note_comment_writer = note_comment_writer;
	}
	public String getNote_comment_content() {
		return note_comment_content;
	}
	public void setNote_comment_content(String note_comment_content) {
		this.note_comment_content = note_comment_content;
	}
	public Date getNote_comment_date() {
		return note_comment_date;
	}
	public void setNote_comment_date(Date note_comment_date) {
		this.note_comment_date = note_comment_date;
	}
	
	
	
}
