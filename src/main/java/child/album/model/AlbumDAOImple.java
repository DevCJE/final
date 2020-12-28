package child.album.model;

import java.util.*;
import org.mybatis.spring.SqlSessionTemplate;

public class AlbumDAOImple implements AlbumDAO {
	
	private SqlSessionTemplate sqlMap;
	
	public AlbumDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	public AlbumDAOImple() {
		super();
	}
	
	/**총게시물 수*/
	public int getTotalCnt() {
		
		int count = sqlMap.selectOne("totalCnt");		
		return count == 0 ? 1 : count;
		
	}
		
	/**앨범 리스트*/
	public List<AlbumDTO> AlbumList(int cp, int ls) {
		
		int StartNum = (cp-1)*ls+1;
		int endNum = cp*ls;
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startNum", StartNum);
		map.put("endNum", endNum);
						
		List<AlbumDTO> list = sqlMap.selectList("albumList", map);
		
		return list;
	}
	
	/**앨범 글쓰기*/
	public int AlbumWrite(AlbumDTO adto) {
		
		int count = sqlMap.insert("albumWriter", adto);
		
		return count;
	}
	
	/**조회수*/
	public void AlbumViewer(int idx) {
		
		sqlMap.update("albumViewer", idx);
		
	}
	
	/**앨범 본문보기*/
	public AlbumDTO AlbumContent(int idx) {
		
		AlbumViewer(idx);
				
		AlbumDTO dto = sqlMap.selectOne("albumContent", idx);
			
		return dto;
		
	}
	
	/**앨범 삭제하기*/
	public int AlbumDel(int idx) {
		
		int count = sqlMap.delete("albumDel",idx);
		
		return count;
	}
	
	/**앨범 본문보기 리스트*/
	public List<AlbumDTO> AlbumContentList(int idx) {
		
		List<AlbumDTO> contentList = sqlMap.selectList("albumContentList", idx);
		return contentList;
	}
	
	
	/**앨범 수정하기*/
	public AlbumDTO AlbumUpdate(int idx) {
			
		AlbumDTO dto = sqlMap.selectOne("albumUpdate", idx);
				
		return dto;

	}
	
	/**앨범 수정 확인*/
	public int AlbumUpdateOk(AlbumDTO adto) {
		
		int count = sqlMap.update("albumUpdateOk", adto);
		
		return count;
	}
	
	/**검색 게시물 수*/
	public int getFindTotalCnt(String keyword, String selectBox) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		map.put("selectBox", selectBox);
		
		int count = sqlMap.selectOne("findTotalCnt", map);	
		
		return count == 0 ? 1 : count;
	}
	
	/**검색하기*/
	public List<AlbumDTO> AlbumFind(int cp, int ls, String keyword, String selectBox) {
		
		int StartNum = (cp-1)*ls+1;
		int endNum = cp*ls;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startNum", StartNum);
		map.put("endNum", endNum);
		map.put("keyword", keyword);
		map.put("selectBox", selectBox);
		
		List<AlbumDTO> AlbumFind = sqlMap.selectList("alumFind", map);
		
		return AlbumFind;
	}
	
	/**날짜 검색 총 게시시물*/
	public int AlbumCalenderTotalCnt(String calenderstart, String calenderend) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("calenderstart", calenderstart);
		map.put("calenderend", calenderend);
		
		int count = sqlMap.selectOne("albumCalenderTotalCnt", map);	
		
		return count == 0 ? 1 : count;
	}
	
	/**날짜 검색하기*/
	public List<AlbumDTO> AlbumCalender(int cp, int ls, String calenderstart, String calenderend) {
		
		int startNum = (cp-1)*ls+1;
		int endNum = cp*ls;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("calenderstart", calenderstart);
		map.put("calenderend", calenderend);
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		
		List<AlbumDTO> albumcalender = sqlMap.selectList("albumcalender", map);
		
		return albumcalender;
	}
}


