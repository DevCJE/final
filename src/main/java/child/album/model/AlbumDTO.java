package child.album.model;

import java.sql.Date;

public class AlbumDTO {
	
	private int idx;
	private int member_idx;
	private String album_subject;
	private String album_content;
	private String album_photo;
	private int album_viewer;
	private Date album_date;
	private int album_child_class;
	private int album_child_name;
	
	public AlbumDTO() {
		super();
	}

	public AlbumDTO(int idx, int member_idx, String album_subject, String album_content, String album_photo,
			int album_viewer, Date album_date, int album_child_class, int album_child_name) {
		super();
		this.idx = idx;
		this.member_idx = member_idx;
		this.album_subject = album_subject;
		this.album_content = album_content;
		this.album_photo = album_photo;
		this.album_viewer = album_viewer;
		this.album_date = album_date;
		this.album_child_class = album_child_class;
		this.album_child_name = album_child_name;
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

	public String getAlbum_subject() {
		return album_subject;
	}

	public void setAlbum_subject(String album_subject) {
		this.album_subject = album_subject;
	}

	public String getAlbum_content() {
		return album_content;
	}

	public void setAlbum_content(String album_content) {
		this.album_content = album_content;
	}

	public String getAlbum_photo() {
		return album_photo;
	}

	public void setAlbum_photo(String album_photo) {
		this.album_photo = album_photo;
	}

	public int getAlbum_viewer() {
		return album_viewer;
	}

	public void setAlbum_viewer(int album_viewer) {
		this.album_viewer = album_viewer;
	}

	public Date getAlbum_date() {
		return album_date;
	}

	public void setAlbum_date(Date album_date) {
		this.album_date = album_date;
	}

	public int getAlbum_child_class() {
		return album_child_class;
	}

	public void setAlbum_child_class(int album_child_class) {
		this.album_child_class = album_child_class;
	}

	public int getAlbum_child_name() {
		return album_child_name;
	}

	public void setAlbum_child_name(int album_child_name) {
		this.album_child_name = album_child_name;
	}
}
	