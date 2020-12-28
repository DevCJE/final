package child.member.model;

import java.sql.Date;

public class memberDTO {
	
	private int idx;
	private String id;
	private String pwd;
	private String name;
	private String namechild;
	private String groupchild;
	private String tel;
	private String email;
	private String addr;
	private Date joindate;
	private int auth;
	private String state;
	
	public memberDTO() {
		super();
	}

	public memberDTO(int idx, String id, String pwd, String name, String namechild, String groupchild, String tel,
			String email, String addr, Date joindate, int auth, String state) {
		super();
		this.idx = idx;
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.namechild = namechild;
		this.groupchild = groupchild;
		this.tel = tel;
		this.email = email;
		this.addr = addr;
		this.joindate = joindate;
		this.auth = auth;
		this.state = state;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNamechild() {
		return namechild;
	}

	public void setNamechild(String namechild) {
		this.namechild = namechild;
	}

	public String getGroupchild() {
		return groupchild;
	}

	public void setGroupchild(String groupchild) {
		this.groupchild = groupchild;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public Date getJoindate() {
		return joindate;
	}

	public void setJoindate(Date joindate) {
		this.joindate = joindate;
	}

	public int getAuth() {
		return auth;
	}

	public void setAuth(int auth) {
		this.auth = auth;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

}
