package child.consent.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class ConsentDAOImple implements ConsentDAO {
	
	private SqlSessionTemplate sqlMap;

	public ConsentDAOImple() {
		super();
	}
	
	public ConsentDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	public int consentCntTotal() {
		int result = sqlMap.selectOne("consentCntTotal");
		return result;
	}

	public int consentCnt(int member_idx) {
		int result = sqlMap.selectOne("consentCnt", member_idx);
		return result;
	}

	public List<ConsentDTO> consentList(int cp, int ls, int member_idx) {
		
		int StartNum = (cp-1)*ls+1;
		int endNum = cp*ls;
		
		HashMap<String, Integer> cntSize = new HashMap<String, Integer>();
		cntSize.put("startNum", StartNum);
		cntSize.put("endNum", endNum);
		cntSize.put("member_idx", member_idx);
		
		List<ConsentDTO> result = sqlMap.selectList("consentList", cntSize);
		return result;
	}
	
	public int consentWrite(ConsentDTO dto) {
		int count = sqlMap.insert("consentWrite", dto);
		return count;
	}

	public ConsentDTO consentContent(int idx) {
		ConsentDTO dto = sqlMap.selectOne("consentContent", idx);
		return dto;
	}

	public List<ConsentReplyDTO> consentReplyContent(int idx) {
		List<ConsentReplyDTO> rdto = sqlMap.selectList("consentReplyContent", idx);
		return rdto;
	}

	public int consentReplyWrite(ConsentReplyDTO dto) {
		int count = sqlMap.insert("consentReplyWrite", dto);
		return count;
	}

	public List<ConsentDTO> consentDateSearch(int cp, int ls, int member_idx, String calenderstart, String calenderend) {
		
		int StartNum = (cp-1)*ls+1;
		int endNum = cp*ls;
		
		HashMap<String, Object> cntSize = new HashMap<String, Object>();
		
		cntSize.put("startNum", StartNum);
		cntSize.put("endNum", endNum);
		cntSize.put("member_idx", member_idx);
		cntSize.put("calenderstart", calenderstart);
		cntSize.put("calenderend", calenderend);
		
		List<ConsentDTO> dto = sqlMap.selectList("consentDateSearch", cntSize);
		
		return dto;
	}

	public List<ConsentDTO> consentAdminDateSearch(int cp, int ls, String calenderstart, String calenderend) {
		
		int StartNum = (cp-1)*ls+1;
		int endNum = cp*ls;
		
		HashMap<String, Object> cntSize = new HashMap<String, Object>();
		cntSize.put("startNum", StartNum);
		cntSize.put("endNum", endNum);
		cntSize.put("calenderstart", calenderstart);
		cntSize.put("calenderend", calenderend);
		
		List<ConsentDTO> result = sqlMap.selectList("consentAdminDateSearch", cntSize);		
		
		return result;
	}

	public List<ConsentDTO> consentAdminNameSearch(int cp, int ls, String searchgroup, String search) {
		
		int StartNum = (cp-1)*ls+1;
		int endNum = cp*ls;
		
		HashMap<String, Object> cntSize = new HashMap<String, Object>();
		cntSize.put("startNum", StartNum);
		cntSize.put("endNum", endNum);
		cntSize.put("searchgroup", searchgroup);
		cntSize.put("search", search);
		
		List<ConsentDTO> result = sqlMap.selectList("consentAdminNameSearch", cntSize);		
		
		return result;
	}

	public int consentAdminNameSearchCnt(String searchgroup, String search) {
		
		HashMap<String, Object> cntSize = new HashMap<String, Object>();
		
		cntSize.put("searchgroup", searchgroup);
		cntSize.put("search", search);
		
		int result = sqlMap.selectOne("consentAdminNameSearchCnt", cntSize);
		
		return result;
	}

	public int consentSearchCnt(int member_idx, String calenderstart, String calenderend) {

		HashMap<String, Object> cntSize = new HashMap<String, Object>();
		
		cntSize.put("member_idx", member_idx);
		cntSize.put("calenderstart", calenderstart);
		cntSize.put("calenderend", calenderend);
		
		int result = sqlMap.selectOne("consentSearchCnt", cntSize);
		
		return result;
	}

	public int consentAdminDateSearchCnt(String calenderstart, String calenderend) {
		
		HashMap<String, Object> cntSize = new HashMap<String, Object>();
		
		cntSize.put("calenderstart", calenderstart);
		cntSize.put("calenderend", calenderend);
		
		int result = sqlMap.selectOne("consentAdminDateSearchCnt", cntSize);
		
		return result;
	}

	public List<ConsentDTO> consentAdminList(int cp, int ls) {
		
		int StartNum = (cp-1)*ls+1;
		int endNum = cp*ls;
		
		HashMap<String, Integer> cntSize = new HashMap<String, Integer>();
		cntSize.put("startNum", StartNum);
		cntSize.put("endNum", endNum);
		
		List<ConsentDTO> result = sqlMap.selectList("consentAdminList", cntSize);		
		return result;
	}

	public String consentGetNameChild(int member_idx) {
		String result = sqlMap.selectOne("consentGetNameChild", member_idx);
		return result;
	}

	public int consentConfirm(ConsentDTO dto) {
		int count = sqlMap.update("consentConfirm", dto);
		return count;
	}

}
