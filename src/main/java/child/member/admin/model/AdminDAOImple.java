package child.member.admin.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import child.member.model.memberDTO;

public class AdminDAOImple implements AdminDAO {

	private SqlSessionTemplate sqlMap;

	public AdminDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	public List<memberDTO> te_adminForm(int cp, int ls) {
		int StartNum = (cp-1)*ls+1;
		int endNum = cp*ls;
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startNum", StartNum);
		map.put("endNum", endNum);
		List<memberDTO> list=sqlMap.selectList("te_adminForm",map);
		return list;
	}
	public List<memberDTO> teNo_adminForm(int cp, int ls) {
		int StartNum = (cp-1)*ls+1;
		int endNum = cp*ls;
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startNum", StartNum);
		map.put("endNum", endNum);
		List<memberDTO> list=sqlMap.selectList("teNo_adminForm",map);
		return list;
	}	
	public int banChange(String groupchild, String id){
		
		HashMap<String, String> map = new HashMap<String,String>();
		
		map.put("groupchild", groupchild);
		map.put("id", id);
		
		int count = sqlMap.update("banChange",map);
		return count;
	}

	public int teDelete(int idx) {
		int count=sqlMap.update("teDelete",idx);
		return count;
	}

	public int teacherOk(int idx) {
				
		int count=sqlMap.update("teacherOk",idx);
		return count;
	}

	public int teacherNo(int idx) {
		int count=sqlMap.update("teacherNo",idx);
		return count;
	}	
	public int chDelete(int idx){
		int count=sqlMap.update("chDelete",idx);
		return count;
	}
	public int childOk(int idx) {
		
		int count=sqlMap.update("childOk",idx);
		return count;
	}
	public int childNo(int idx) {
		int count=sqlMap.update("childNo",idx);
		return count;
	}	
	public List<memberDTO> ch_adminForm(int cp, int ls) {
		
		int StartNum = (cp-1)*ls+1;
		int endNum = cp*ls;
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startNum", StartNum);
		map.put("endNum", endNum);
		
		List<memberDTO> list=sqlMap.selectList("ch_adminForm",map);
		return list;
	}
     public List<memberDTO> chNo_adminForm(int cp, int ls) {
		
		int StartNum = (cp-1)*ls+1;
		int endNum = cp*ls;
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startNum", StartNum);
		map.put("endNum", endNum);
		
		List<memberDTO> list=sqlMap.selectList("chNo_adminForm",map);
		return list;
	}	
	
public int chBanChange(String groupchild, String id){
		
		HashMap<String, String> map = new HashMap<String,String>();
		
		map.put("groupchild", groupchild);
		map.put("id", id);
		
		int count = sqlMap.update("chBanChange",map);
		return count;
	}

public List<memberDTO> chSearch(String serchgroup, String chsearch) {
    HashMap<String, Object> map = new HashMap<String, Object>();
    map.put("serchgroup", serchgroup);
	map.put("chsearch", chsearch);
	List<memberDTO> result=sqlMap.selectList("chSearch",map);
return result;
}
public List<memberDTO> chNoSearch(String serchgroup, String chsearch) {
    HashMap<String, Object> map = new HashMap<String, Object>();
    map.put("serchgroup", serchgroup);
	map.put("chsearch", chsearch);
	List<memberDTO> result=sqlMap.selectList("chNoSearch",map);
return result;
}

public List<memberDTO> teSearch(String tesearch) {
	List<memberDTO> result=sqlMap.selectList("teSearch",tesearch);
	return result;
}
public List<memberDTO> teNoSearch(String tesearch) {
	List<memberDTO> result=sqlMap.selectList("teNoSearch",tesearch);
	return result;
}

public int chgetTotal() {	
	int count = sqlMap.selectOne("chgetTotal");	
	return count == 0 ? 1 : count;
}
public int chNogetTotal() {	
	int count = sqlMap.selectOne("chNogetTotal");	
	return count == 0 ? 1 : count;
}
public int tegetTotal() {	
	int count = sqlMap.selectOne("tegetTotal");	
	return count == 0 ? 1 : count;
}
public int teNogetTotal() {	
	int count = sqlMap.selectOne("teNogetTotal");	
	return count == 0 ? 1 : count;
}


}

