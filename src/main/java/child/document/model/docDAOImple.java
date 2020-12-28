package child.document.model;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.google.api.services.drive.model.File;

public class docDAOImple<Quickstrat2> implements docDAO {

	private SqlSessionTemplate sqlMap;
	
	
	public docDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	public ArrayList<String> doc_ListByIdx(String idx){

		List<String> list_L = sqlMap.selectList("doc_ListByIdx",idx);
		ArrayList<String> list = new ArrayList<String>();

		for(int i=0;i<list_L.size();i++){
			list.add(list_L.get(i));
		}
		
		return list;
		
	}
	
	public Map<String,Object> doc_docList() {
		
		try {
			Quickstart2 quick = new Quickstart2();
			Map<String,Object> list = quick.getList();

			//System.out.println(list.size());
			
			return list;
			
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public Map<String,Object> doc_docForm(String fileid, String subject) {
		// TODO Auto-generated method stub
		Quickstart2 quick = new Quickstart2();
		try {
			Map<String,Object> map = quick.printFile(fileid,subject);
			
			return map;

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	
	public String doc_searchMem(String name1) {
		String names = sqlMap.selectOne("searchMem", name1);
		return names;
	}
	
	public String updateFile(String subject, String url) {
		// TODO Auto-generated method stub
		Quickstart2 quick = new Quickstart2();
		try {
			String newFileSubject = quick.updateFile(url, subject);
			
			return newFileSubject;
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	public int doc_Write(docDTO dto) {
		// TODO Auto-generated method stub
		int result = sqlMap.insert("doc_write", dto);
		
		return result;
	}
	
	public List<docDTO> doc_StateList(String name, int cp, int listsize) {
		// TODO Auto-generated method stub
		Map<String,Object> map = new HashMap<String, Object>();
		
		int start = (cp-1)*listsize+1;
		int end = cp*listsize;
		
		map.put("name", name);
		map.put("start", start);
		map.put("end", end);
		
		List<docDTO> list = sqlMap.selectList("doc_state", map);
		return list;
	}
	
	public List<docDTO> doc_SignList(String name, int cp, int listsize) {
		// TODO Auto-generated method stub
		Map<String,Object> map = new HashMap<String, Object>();
		
		int startnum = (cp-1)*listsize+1;
		int endnum = cp*listsize;
		
		map.put("name", name);
		map.put("startnum", startnum);
		map.put("endnum", endnum);
		
		List<docDTO> list = sqlMap.selectList("doc_sign", map);
		return list;
	}
	
	public int donotUpdate(int idx) {
		// TODO Auto-generated method stub
		int result = sqlMap.update("not_update", idx);
		return result;
	}
	
	public int update(int idx, String sign2) {
		// TODO Auto-generated method stub
		docDTO dto = new docDTO();
		dto.setIdx(idx);
		dto.setSign2(sign2);
		int result = sqlMap.update("update", dto);
		return result;
	}
	
	public docDTO docEdit(int idx) {
		// TODO Auto-generated method stub
		docDTO dto = sqlMap.selectOne("edit", idx);
		String url="";
		Quickstart2 quick = new Quickstart2();
		try {
			url = quick.editFile(dto.getSubject());
			dto.setDocument(url);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return dto;
	}
	
	public String getUrl(String subject) {
		// TODO Auto-generated method stub
		Quickstart2 quick = new Quickstart2();
		String url="";
		
		try {
			url=quick.getUrl(subject);
			return url;
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	
	public int editUp(docDTO dto) {
		// TODO Auto-generated method stub
		int result = sqlMap.update("editup", dto);
		
		return result;
	}
	
	public int insertDoc(wdocDTO dto) {
		// TODO Auto-generated method stub
		int result = sqlMap.insert("insertdoc",dto);
		return 0;
	}
	
	public int signTotal(String name2) {
		// TODO Auto-generated method stub
		int result = sqlMap.selectOne("signTotal",name2);
		
		return result>0?result:1;
	}
	
	public int stateTotal(String name1) {
		// TODO Auto-generated method stub
		int result = sqlMap.selectOne("stateTotal",name1);
		
		return result>0?result:1;
	}
	
	public int deleteData() {
		// TODO Auto-generated method stub
		int result = sqlMap.delete("deleteAll");
		
		return result;
	}
	
	public List<wdocDTO> getDocList(int cp, int listsize) {
		// TODO Auto-generated method stub
		int start = (cp-1)*listsize+1;
		int end = cp*listsize;
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		
		List<wdocDTO> dto = sqlMap.selectList("getList", map);
		
		return dto;
	}
	
	public List<docDTO> listCall(String name) {
		// TODO Auto-generated method stub
		List<docDTO> list = sqlMap.selectList("listCall", name);
		
		return list;
	}

}
