package child.dosing.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import child.member.model.memberDTO;


public class dosingDAOImple implements dosingDAO {
	private SqlSessionTemplate sqlMap;
	
	public dosingDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	public int dosing_write(dosingDTO dto) {
		int count = sqlMap.insert("dosingWrite",dto);
		
		return count;
	}
	public List<dosingDTO> dosing_getAllChild(){
		List<dosingDTO> list = sqlMap.selectList("dosing_getAllChild");
		return list;
	}

	public List<dosingDTO> dosing_getAllChildId(String id){
		List<dosingDTO> list = sqlMap.selectList("dosing_getAllChildId", id);
		return list;
	}

	public List<dosingDTO> dosing_getChildInfo(String child_idx) {
		List<dosingDTO> list = sqlMap.selectList("dosing_getChildInfo", child_idx);
		return list;
	}
	public List<dosingDTO> dosing_getSpecificChildInfo(String idx) {
		List<dosingDTO> list = sqlMap.selectList("dosing_getSpecificChildInfo", idx);
		return list;
	}
	public List<dosingDTO> dosing_getAllChildByMonth(String month) {
		
		String MONTH = "1988-"+month+"-01";
		String YEARANDMONTH = "1988/"+month+"";
		String dum = month;
		List<dosingDTO> list = sqlMap.selectList("dosing_getAllChildByMonth",dum);
		////.println("list from imple: "+list);
		return list;
		
	}
	public List<String> dosing_getAllMonthAvailable() {
		List<String> list = sqlMap.selectList("dosing_getAllMonthAvailable");
		
		////.println("get All Month Avail : "+list);
		return list;
		
	}
	
	
	public int dosing_delete(int idx){
		int count = sqlMap.delete("dosing_delete",idx);
		
		return count;
	}
	public String dosingUpdateReport(ArrayList<String> update_list){
		////.println("test from dosingUpdateReport !!!");
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("idx", update_list.get(0));
		map.put("content", update_list.get(1));
		
		int count = sqlMap.update("dosingUpdateReport", map);
		
		return map.get("content");
	}
	
	public int dosing_confirm(String idx){
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("idx", idx);
		map.put("confirm", "yes");
		
		int count = sqlMap.update("dosing_confirm",map);
		
		return count;
	}
	
	public List<dosingDTO> dosingDateSearch(String calendarstart,String calendarend, String name){
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", calendarstart);
		map.put("end", calendarend);
		map.put("id", name);
		
		List<dosingDTO> list = sqlMap.selectList("dosingDateSearch",map);
		return list;
		
	}
	
	public List<dosingDTO> dosingAdminNameSearch(String name){
		List<dosingDTO> list = sqlMap.selectList("dosingAdminNameSearch",name);
		return list;
	}
	
	public List<dosingDTO >dosingAdminNameSearch2(String name){
		////.println(name);
		List<dosingDTO> list = sqlMap.selectList("dosingAdminNameSearch2",name);
		return list;
	}
	
	public int dosing_signature(String s, String cl, String ch, String time){
		
		////.println("s: from imple: "+s);
		HashMap<String, String> str = new HashMap<String, String>();
		////.println(s.length());
		
		//s.replace("+", "*");
		
		
		String s1 = null;
		String s2 = null;
		
		
		if(s.length()<2500){
			s1 = s;
			s2 = "";
			str.put("code1", s1);
			str.put("code2", s2);
			
			
			
		}
		if(s.length()>2500){
			s1 = s.substring(0,2500);
			s2 = s.substring(2500);
			str.put("code1", s1);
			str.put("code2", s2);
			
			//.println(s1);
			//.println(s2);
			//.println(idx);
			
			
		}
		
		
		
		
		
		
		////.println(s1.length()+"/"+s2.length()+"/"+(s1+s2).length()+"/ "+s.length());

		str.put("code1", s1);
		str.put("code2", s2);
		str.put("client",cl);
		str.put("child_name",ch);
		str.put("time", time);
		str.put("idx", "idx");
		
		int count = sqlMap.insert("dosing_signature",str);
		return count;
		
	}
	
	public List<EncodeDTO> dosing_GETsignature(String client, String name,String time){
		////.println("test!!!!");
		
		HashMap<String, String> str_in = new HashMap<String, String>();
		
		str_in.put("client", client);
		str_in.put("child_name", name);
		str_in.put("sig_time", time);
		
		////.println(client+time);
		
		List<EncodeDTO> list = sqlMap.selectList("dosing_GETsignature",str_in);
		
		return list;
	}
	public List<EncodeDTO> dosing_GETsignatureDoc(String idx){
	////.println("test!!!!");
		
		//ln("test!!!!");
			HashMap<String, String> str_in = new HashMap<String, String>();
			
			str_in.put("idx", idx);
			
			////.println(client+time);
			
			List<EncodeDTO> list = sqlMap.selectList("dosing_GETsignatureDoc",str_in);
			
			//ln(list);
			
			return list;
		
	}
	
	public memberDTO dosingMember(String name){
		memberDTO list = sqlMap.selectOne("dosingMember",name);
		return list;
	}
	
	public ArrayList<String> cctvGetRegionInfo(){
		List<String> list_L = sqlMap.selectList("cctvGetRegionInfo");
		ArrayList<String> list = new ArrayList<String>();

		for(int i=0;i<list_L.size();i++){
			list.add(list_L.get(i));
		}
		
		return list;
	}
	
	public int cctvAddRegion(String region){
		int count = sqlMap.insert("cctvAddRegion", region);
		
		
		return count;
	}
	public int cctvDelRegion(String region){
		int count = sqlMap.delete("cctvDelRegion", region);
		return count;
	}
	
	public int document_signature(String s,String idx){
		HashMap<String, String> str = new HashMap<String, String>();
		
//.println(s.length());
		String s1=null;
		String s2=null;
		
		
		if(s.length()<2500){
			s1 = s;
			s2 = "";
			str.put("code1", s1);
			str.put("code2", s2);
			
			
			
		}
		if(s.length()>2500){
			s1 = s.substring(0,2500);
			s2 = s.substring(2500);
			str.put("code1", s1);
			str.put("code2", s2);
			
			//.println(s1);
			//.println(s2);
			//.println(idx);
			
			
		}
		
		
		//.println("idx: "+idx);
		////.println(s1.length()+"/"+s2.length()+"/"+(s1+s2).length()+"/ "+s.length());

		str.put("client","none");
		str.put("child_name","none");
		str.put("time", "none");
		str.put("idx", idx);
		
		//.println("imple!");
		
		int count = sqlMap.insert("dosing_signature",str);
		//.println("sqlMap finished");
		return count;
		

	}
	
	public int document_signature_2(String s,String idx){
		HashMap<String, String> str = new HashMap<String, String>();
		
		//.println(s.length());
				String s1=null;
				String s2=null;
				
				if(s.length()<2500){
					s1 = s;
					s2 = "";
					str.put("code1", s1);
					str.put("code2", s2);
					
				}
				if(s.length()>2500){
					s1 = s.substring(0,2500);
					s2 = s.substring(2500);
					str.put("code1", s1);
					str.put("code2", s2);
					
					//.println(s1);
					//.println(s2);
					//.println(idx);
					
					
				}
				
				
				//.println("idx: "+idx);
				////.println(s1.length()+"/"+s2.length()+"/"+(s1+s2).length()+"/ "+s.length());

				str.put("client","none");
				str.put("child_name","none");
				str.put("time", "none");
				str.put("idx", idx);
				
				//.println("imple!");
				
				int count = sqlMap.insert("dosing_signature",str);
				//.println("sqlMap finished");
				return count;
		
	}
	
}
