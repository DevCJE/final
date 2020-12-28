package child.dosing.model;

import java.util.Date;

public class dosingDTO {
	
	private int idx;
	private int child_idx;
	private String child_name;
	private String client;
	private String symtom;
	private String dosing_class;
	private String medicine;
	private String dosing_capacity;
	private int dosing_number;
	private Date dosing_date;
	private String dosing_time;
	private String dosing_keep;
	private String report_writer_name;
	private String etc;
	private String confirm;
	private String sig_time;
	private String id;
	
	
	

	
	

	public dosingDTO() {
		super();
	}
	public dosingDTO(int idx, int child_idx, String child_name, String client, String symtom, String dosing_class,
			String medicine, String dosing_capacity, int dosing_number, Date dosing_date, String dosing_time,
			String dosing_keep, String report_writer_name, String etc, String confirm, String sig_time, String id) {
		super();
		this.idx = idx;
		this.child_idx = child_idx;
		this.child_name = child_name;
		this.client = client;
		this.symtom = symtom;
		this.dosing_class = dosing_class;
		this.medicine = medicine;
		this.dosing_capacity = dosing_capacity;
		this.dosing_number = dosing_number;
		this.dosing_date = dosing_date;
		this.dosing_time = dosing_time;
		this.dosing_keep = dosing_keep;
		this.report_writer_name = report_writer_name;
		this.etc = etc;
		this.confirm = confirm;
		this.sig_time = sig_time;
		this.id = id;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getSig_time() {
		return sig_time;
	}
	public void setSig_time(String sig_time) {
		this.sig_time = sig_time;
	}
	public String getConfirm() {
		return confirm;
	}
	public void setConfirm(String confirm) {
		this.confirm = confirm;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getChild_idx() {
		return child_idx;
	}
	public void setChild_idx(int child_idx) {
		this.child_idx = child_idx;
	}
	public String getChild_name() {
		return child_name;
	}
	public void setChild_name(String child_name) {
		this.child_name = child_name;
	}
	public String getClient() {
		return client;
	}
	public void setClient(String client) {
		this.client = client;
	}
	public String getSymtom() {
		return symtom;
	}
	public void setSymtom(String symtom) {
		this.symtom = symtom;
	}
	public String getDosing_class() {
		return dosing_class;
	}
	public void setDosing_class(String dosing_class) {
		this.dosing_class = dosing_class;
	}
	public String getMedicine() {
		return medicine;
	}
	public void setMedicine(String medicine) {
		this.medicine = medicine;
	}
	public String getDosing_capacity() {
		return dosing_capacity;
	}
	public void setDosing_capacity(String dosing_capacity) {
		this.dosing_capacity = dosing_capacity;
	}
	public int getDosing_number() {
		return dosing_number;
	}
	public void setDosing_number(int dosing_number) {
		this.dosing_number = dosing_number;
	}
	public Date getDosing_date() {
		return dosing_date;
	}
	public void setDosing_date(Date dosing_date) {
		this.dosing_date = dosing_date;
	}
	public String getDosing_time() {
		return dosing_time;
	}
	public void setDosing_time(String dosing_time) {
		this.dosing_time = dosing_time;
	}
	public String getDosing_keep() {
		return dosing_keep;
	}
	public void setDosing_keep(String dosing_keep) {
		this.dosing_keep = dosing_keep;
	}
	public String getReport_writer_name() {
		return report_writer_name;
	}
	public void setReport_writer_name(String report_writer_name) {
		this.report_writer_name = report_writer_name;
	}
	public String getEtc() {
		return etc;
	}
	public void setEtc(String etc) {
		this.etc = etc;
	}

	
	
	

}
