package child.notice.model;

import java.util.*;
import org.mybatis.spring.SqlSessionTemplate;
import child.notice.model.*;

public class noticeDAOImple implements noticeDAO {

	private SqlSessionTemplate sqlMap;
	
	public noticeDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	public int noticeWrite(noticeDTO dto) {
		if(dto.getSubject().equals("")||dto.getSubject()==null||dto.getSubject().equals("제목을 입력하세요...")){
			return 0;
		}
		if(dto.getContent().equals("")||dto.getContent()==null||dto.getContent().equals("내용을 입력하세요...")){
			return 0;
		}
		int count=sqlMap.insert("noticeWrite", dto);
		return count;
	}
	
	public List<noticeDTO> noticeList(int cp, int ls) {
		int startnum=(cp-1)*ls+1;
		int endnum=cp*ls;
		
		Map<String, Integer> map=new HashMap<String, Integer>();
		map.put("startNum", startnum);
		map.put("endNum", endnum);
		
		List<noticeDTO> list=sqlMap.selectList("noticeList",map);
		return list;
	}
	
	public int getTotalCnt() {
		int count=sqlMap.selectOne("getTotalCnt");
		return count==0?1:count;
	}
	
	public noticeDTO noticeContent(int idx) {
		noticeDTO dto=sqlMap.selectOne("noticeContent", idx);
		return dto;
	}
	
	public int noticeDelete(int idx) {
		int result=sqlMap.delete("noticeDelete", idx);
		return result;
	}
	
	public void plusReadNum(int idx) {
		sqlMap.update("plusReadNum", idx);
	}
	
	public int noticeUpdate(noticeDTO dto) {
		if(dto.getSubject().equals("")||dto.getSubject()==null||dto.getSubject().equals("제목을 입력하세요...")){
			return 0;
		}
		if(dto.getContent().equals("")||dto.getContent()==null||dto.getContent().equals("내용을 입력하세요...")){
			return 0;
		}
		
		int list=sqlMap.update("noticeUpdate", dto);
		return list;
	}
	public List<noticeDTO> noticeSearch(int cp,int ls,String select, String keyword) {
		int startNum=(cp-1)*ls+1;
		int endNum=cp*ls;
		
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		map.put("select", select);
		map.put("keyword", keyword);
		
		List<noticeDTO> list=sqlMap.selectList("nSearchList", map);
		
		
		return list;
	}
	
	public int noticeGetTotalCnt(String select,String keyword) {
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("select", select);
		map.put("keyword", keyword);
		int count=sqlMap.selectOne("nSearchGetTotalCnt", map);
		return count==0?1:count;
	}
}
