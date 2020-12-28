package child.note.model;

import java.sql.Date;

public class noteDTO {

	private int idx;
	private String note_select;
	private Date note_writedate;
	private String note_content;
	private String note_img;
	private String note_video;
	private String note_need;
	private String note_writer;
	
	public static final String imgpath = "C:/Users/jdh33_2/git/finalproject/finalproject/src/main/webapp/note_file/note_img";
	
	public noteDTO() {
		super();
	}
	public noteDTO(int idx, String note_select, Date note_writedate, String note_content, String note_img,
			String note_video, String note_need, String note_writer) {
		super();
		this.idx = idx;
		this.note_select = note_select;
		this.note_writedate = note_writedate;
		this.note_content = note_content;
		this.note_img = note_img;
		this.note_video = note_video;
		this.note_need = note_need;
		this.note_writer = note_writer;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getNote_select() {
		return note_select;
	}
	public void setNote_select(String note_select) {
		this.note_select = note_select;
	}
	public Date getNote_writedate() {
		return note_writedate;
	}
	public void setNote_writedate(Date note_writedate) {
		this.note_writedate = note_writedate;
	}
	public String getNote_content() {
		return note_content;
	}
	public void setNote_content(String note_content) {
		this.note_content = note_content;
	}
	public String getNote_img() {
		return note_img;
	}
	public void setNote_img(String note_img) {
		this.note_img = note_img;
	}
	public String getNote_video() {
		return note_video;
	}
	public void setNote_video(String note_video) {
		this.note_video = note_video;
	}
	public String getNote_need() {
		return note_need;
	}
	public void setNote_need(String note_need) {
		this.note_need = note_need;
	}
	public String getNote_writer() {
		return note_writer;
	}
	public void setNote_writer(String note_writer) {
		this.note_writer = note_writer;
	}
	
	public static String getImgpath() {
		return imgpath;
	}
	
}
