package child.album.model;

import java.sql.Date;

public class AlbumCommentDTO {
	
	private int idx;
	private int album_idx;
	private String album_comment_writer;
	private String album_comment_content;
	private Date album_comment_date;
	
	public AlbumCommentDTO() {
		super();
	}

	public AlbumCommentDTO(int idx, int album_idx, String album_comment_writer,
			String album_comment_content, Date album_comment_date) {
		super();
		this.idx = idx;
		this.album_idx = album_idx;
		this.album_comment_writer = album_comment_writer;
		this.album_comment_content = album_comment_content;
		this.album_comment_date = album_comment_date;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public int getAlbum_idx() {
		return album_idx;
	}

	public void setAlbum_idx(int album_idx) {
		this.album_idx = album_idx;
	}

	public String getAlbum_comment_writer() {
		return album_comment_writer;
	}

	public void setAlbum_comment_writer(String album_comment_writer) {
		this.album_comment_writer = album_comment_writer;
	}

	public String getAlbum_comment_content() {
		return album_comment_content;
	}

	public void setAlbum_comment_content(String album_comment_content) {
		this.album_comment_content = album_comment_content;
	}

	public Date getAlbum_comment_date() {
		return album_comment_date;
	}

	public void setAlbum_comment_date(Date album_comment_date) {
		this.album_comment_date = album_comment_date;
	}
}
