package child.consent.model;

import java.util.List;

public interface ConsentDAO {
	
	public int consentCntTotal();
	
	public int consentCnt(int member_idx);
	
	public List<ConsentDTO> consentList(int cp, int ls, int member_idx);
	
	public int consentWrite(ConsentDTO dto);
	
	public ConsentDTO consentContent(int idx);
	
	public List<ConsentReplyDTO> consentReplyContent(int idx);
	
	public int consentReplyWrite(ConsentReplyDTO dto);
	
	public List<ConsentDTO> consentDateSearch(int cp, int ls, int member_idx, String calenderstart, String calenderend);
	
	public List<ConsentDTO> consentAdminDateSearch(int cp, int ls, String calenderstart, String calenderend);	

	public List<ConsentDTO>consentAdminNameSearch(int cp, int ls, String searchgroup, String search);
	
	public int consentSearchCnt(int member_idx, String calenderstart, String calenderend);
	
	public int consentAdminDateSearchCnt(String calenderstart, String calenderend);
	
	public int consentAdminNameSearchCnt(String searchgroup, String search);
	
	public List<ConsentDTO> consentAdminList(int cp, int ls);
	
	public String consentGetNameChild(int member_idx);	
	
	public int consentConfirm(ConsentDTO dto);
	

}
