package child.note.model;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;

public class noteDAOImple implements noteDAO {
 
	private SqlSessionTemplate sqlMap;
	
	public noteDAOImple(SqlSessionTemplate sqlMap){
		super();
		this.sqlMap = sqlMap;
	}
	//목록보기
	public List<noteDTO> noteList(int cp, int ls) {
		
		int startNum=(cp-1)*ls+1;
		int endNum=cp*ls;
		
		Map<String, Integer> map =new HashMap<String, Integer>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		
		List<noteDTO> list = sqlMap.selectList("note_list",map);
		
		return list;
	}
	//본문 불러오기
	public noteDTO noteContent(int idx) {
		
		noteDTO dto =sqlMap.selectOne("note_content", idx);
		
		return dto;
		
		
	}
	//글쓰기
	
	public int noteWrite(noteDTO dto) {
		if(dto.getNote_writer().equals("")||dto.getNote_writer()==null||dto.getNote_writer().equals("로그인해주세요")){
			return 0;
		}
		if(dto.getNote_content().equals("")||dto.getNote_content()==null||dto.getNote_content().equals("글이 없습니다.")){
			return 0;
		}
		
		int count=sqlMap.insert("note_write",dto);
		return count;
	}
	//수정 불러오기
	public noteDTO noteUpdateForm(int idx) {
		noteDTO dto =sqlMap.selectOne("note_updateForm", idx);
		return dto;
	}
	
	
	//수정하기
	public int noteUpdate(noteDTO dto) {
		int result = sqlMap.update("note_update", dto);
		return result;
	}
	
	//삭제하기
	public int noteDel(int idx) {
		int result =sqlMap.delete("note_del", idx);
		return result;
	}
	
	//총게시물 수
	public int getTotalCnt() {
		
		int count = sqlMap.selectOne("totalcnt");		
		return count == 0 ? 1 : count;
		
	}

	
	//검색하기
	public List<noteDTO> noteSearch(int cp, int ls,String keyword) {
		
		int startNum=(cp-1)*ls+1;
		int endNum=cp*ls;
		
		Map<String, Object> map =new HashMap<String, Object>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		map.put("keyword", keyword);

		
		List<noteDTO> list = sqlMap.selectList("noteSearch",map);
		
		return list;
	}
	/**검색 게시물 수*/
	public int getFindTotal(String keyword) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		
		
		int count = sqlMap.selectOne("findTotal", map);	
		
		return count == 0 ? 1 : count;

	}	
	
	//날짜 검색
	public List<noteDTO> notedateSearch(int cp, int ls,String calendarstart, String calenderend) {
		int startNum=(cp-1)*ls+1;
		int endNum=cp*ls;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		map.put("calenderstart", calendarstart);
		map.put("calenderend", calenderend);
		
		List<noteDTO>list=sqlMap.selectList("note_dateSerach",map);
		
		return list;
	}
	//날짜검색 게시물수
	public int getdateToal(String calendarstart, String calenderend) {
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("calenderstart", calendarstart);
		map.put("calenderend", calenderend);
		
		int count=sqlMap.selectOne("dateTotal",map);
		return count==0?1:count;
	}
	
}
