package child.dosing.model;

public class EncodeDTO {
	
	private String enc1;
	private String enc2;
	public String getEnc1() {
		return enc1;
	}
	public void setEnc1(String enc1) {
		this.enc1 = enc1;
	}
	public String getEnc2() {
		return enc2;
	}
	public void setEnc2(String enc2) {
		this.enc2 = enc2;
	}
	public EncodeDTO(String enc1, String enc2) {
		super();
		this.enc1 = enc1;
		this.enc2 = enc2;
	}
	public EncodeDTO() {
		super();
	}
	
	

}
