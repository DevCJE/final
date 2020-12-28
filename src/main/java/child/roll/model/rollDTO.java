package child.roll.model;

public class rollDTO {

	private int idx;
	private int member_idx;
	private String roll_name;
	private String roll_date;
	private int roll_info;
	private String roll_class;
	public rollDTO() {
		super();
	}
	public rollDTO(int idx, int member_idx, String roll_name, String roll_date, int roll_info, String roll_class) {
		super();
		this.idx = idx;
		this.member_idx = member_idx;
		this.roll_name = roll_name;
		this.roll_date = roll_date;
		this.roll_info = roll_info;
		this.roll_class = roll_class;
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
	public String getRoll_name() {
		return roll_name;
	}
	public void setRoll_name(String roll_name) {
		this.roll_name = roll_name;
	}
	public String getRoll_date() {
		return roll_date;
	}
	public void setRoll_date(String roll_date) {
		this.roll_date = roll_date;
	}
	public int getRoll_info() {
		return roll_info;
	}
	public void setRoll_info(int roll_info) {
		this.roll_info = roll_info;
	}
	public String getRoll_class() {
		return roll_class;
	}
	public void setRoll_class(String roll_class) {
		this.roll_class = roll_class;
	}
	
	
	
	
}
