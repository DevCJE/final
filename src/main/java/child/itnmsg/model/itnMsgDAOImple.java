package child.itnmsg.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import child.member.model.memberDTO;

public class itnMsgDAOImple implements itnMsgDAO {
	
	private SqlSessionTemplate sqlMap;

	public itnMsgDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	public List<itnMsgDTO> itnMsgList(int cp,int ls) {
		int startnum=(cp-1)*ls+1;
		int endnum=cp*ls;
		
		System.out.println("startnum:" + startnum);
		System.out.println("endnum:" + endnum);
		
		Map<String, Integer> map=new HashMap<String, Integer>();
		map.put("startNum", startnum);
		map.put("endNum", endnum);
		
		List<itnMsgDTO> list=sqlMap.selectList("itnMsgList", map);
		
		return list;
	}

	public int itnMsgWrite(itnMsgDTO dto) {
		if(dto.getSend_name().equals("")||dto.getSend_name()==null||dto.getSend_name().equals("받는사람을 입력하세요...")){
			
		}
		if(dto.getSubject().equals("")||dto.getSubject()==null||dto.getSubject().equals("제목을 입력하세요...")){
			return 0;
		}
		if(dto.getContent().equals("")||dto.getContent()==null||dto.getContent().equals("내용을 입력하세요...")){
			return 0;
		}
		int count=sqlMap.insert("itnMsgWrite", dto);
		return count;
	}
	public itnMsgDTO itnContent(int idx) {
		itnMsgDTO dto=sqlMap.selectOne("itnMsgContent", idx);
		return dto;
	}
	public int itnMsgDelete(int idx) {
		int result=sqlMap.delete("itnMsgDelete", idx);
		return result;
	}
	public int itnGetTotalCnt(String send_name) {
		int count=sqlMap.selectOne("itnGetTotalCnt", send_name);
		return count==0?1:count;
	}
	public void itnMsgView(int idx,String send_name) {
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("idx", idx);
		map.put("sendname", send_name);
		sqlMap.update("itnMsgView", map);
	}
	public int itnMsgViews(String send_name) {
		int count=sqlMap.selectOne("itnMsgViews", send_name);
		return count;
	}
	public List<itnMsgDTO> itnMsgRecvList(int cp, int ls) {
		int startnum=(cp-1)*ls+1;
		int endnum=cp*ls;
		
		Map<String, Integer> map=new HashMap<String, Integer>();
		map.put("startNum", startnum);
		map.put("endNum", endnum);
		
		List<itnMsgDTO> list=sqlMap.selectList("itnMsgRecvList", map);
		return list;
	}
	public int itnGetTotalRecvCnt(String recv_name) {
		int count=sqlMap.selectOne("itnGetTotalRecvCnt", recv_name);
		return count==0?1:count;
	}
	public itnMsgDTO itnRecvContent(int idx) {
		itnMsgDTO dto=sqlMap.selectOne("itnMsgRecvContent", idx);
		return dto;
	}
	public int itnMsgSendDel(String send_name, int sendDelList) {

	    Map<String, Object> map=new HashMap<String, Object>();
	    map.put("sendname", send_name);
	    map.put("idx", sendDelList);
	    
	    int count=sqlMap.update("itnSendDel", map);
	   
		return count;
	}
	public int itnMsgRecvDel(String recv_name, int recvDelList) {
		
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("recvname", recv_name);
		map.put("idx", recvDelList);
		
		int count=sqlMap.update("itnRecvDel", map);
		
		return count;
	}
	public int itnMsgCancel(int idx) {
		int count=sqlMap.update("itnMsgCancel", idx);
		return count;
	}
	public List<memberDTO> itnSelectList() {
		List<memberDTO> list=sqlMap.selectList("itnSelectList");
		return list;
	}
}
