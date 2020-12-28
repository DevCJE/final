package child.menu.model;

import oracle.sql.DATE;

public class MenuDTO {

	private int idx;
	private String bob1_image;
	private String bob2_image;
	private String bob3_image;
	private String bob1_name;
	private String bob1_content;
	private String bob2_name;
	private String bob2_content;
	private String bob3_name;
	private String bob3_content;
	private String menu_date;
	public static final String path = "C:/Users/user2/git/finalproject/finalproject/src/main/webapp/bob_image";
	public MenuDTO() {
		super();
	}
	public MenuDTO(int idx, String bob1_image, String bob2_image, String bob3_image, String bob1_name,
			String bob1_content, String bob2_name, String bob2_content, String bob3_name, String bob3_content,
			String menu_date) {
		super();
		this.idx = idx;
		this.bob1_image = bob1_image;
		this.bob2_image = bob2_image;
		this.bob3_image = bob3_image;
		this.bob1_name = bob1_name;
		this.bob1_content = bob1_content;
		this.bob2_name = bob2_name;
		this.bob2_content = bob2_content;
		this.bob3_name = bob3_name;
		this.bob3_content = bob3_content;
		this.menu_date = menu_date;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getBob1_image() {
		return bob1_image;
	}
	public void setBob1_image(String bob1_image) {
		this.bob1_image = bob1_image;
	}
	public String getBob2_image() {
		return bob2_image;
	}
	public void setBob2_image(String bob2_image) {
		this.bob2_image = bob2_image;
	}
	public String getBob3_image() {
		return bob3_image;
	}
	public void setBob3_image(String bob3_image) {
		this.bob3_image = bob3_image;
	}
	public String getBob1_name() {
		return bob1_name;
	}
	public void setBob1_name(String bob1_name) {
		this.bob1_name = bob1_name;
	}
	public String getBob1_content() {
		return bob1_content;
	}
	public void setBob1_content(String bob1_content) {
		this.bob1_content = bob1_content;
	}
	public String getBob2_name() {
		return bob2_name;
	}
	public void setBob2_name(String bob2_name) {
		this.bob2_name = bob2_name;
	}
	public String getBob2_content() {
		return bob2_content;
	}
	public void setBob2_content(String bob2_content) {
		this.bob2_content = bob2_content;
	}
	public String getBob3_name() {
		return bob3_name;
	}
	public void setBob3_name(String bob3_name) {
		this.bob3_name = bob3_name;
	}
	public String getBob3_content() {
		return bob3_content;
	}
	public void setBob3_content(String bob3_content) {
		this.bob3_content = bob3_content;
	}
	public String getMenu_date() {
		return menu_date;
	}
	public void setMenu_date(String menu_date) {
		this.menu_date = menu_date;
	}
	public static String getPath() {
		return path;
	}
}
