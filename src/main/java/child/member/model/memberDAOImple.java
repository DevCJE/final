package child.member.model;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;

public class memberDAOImple implements memberDAO {
	
	private SqlSessionTemplate sqlMap;
	
	public memberDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	public int memberJoin(memberDTO dto) {
		int count = sqlMap.insert("memberJoin", dto);
		return count;
	}

	public memberDTO memberLogin(memberDTO dto) {
		memberDTO mdto = sqlMap.selectOne("memberLogin", dto);
		return mdto;
	}

	public String memberFindId(memberDTO dto) {
		String result = sqlMap.selectOne("memberFindId", dto);
		return result;
	}

	public memberDTO memberFindPwd(memberDTO dto) {
		memberDTO result = sqlMap.selectOne("memberFindPwd", dto);
		return result;
	}

	public memberDTO memberLoad(String id) {
		memberDTO mdto = sqlMap.selectOne("memberLoad", id);
		return mdto;
	}

	public String memberCheckPwd(HashMap<String, String> pwd) {
		String result = sqlMap.selectOne("memberPwdCheck", pwd);
		return result;
	}

	public int memberUpdatePwd(HashMap<String, String> pwd) {
		int result = sqlMap.update("memberUpdatePwd", pwd);
		return result;
	}

	public int memberUpdate(memberDTO dto) {
		int result = sqlMap.update("memberUpdate", dto);
		return result;
	}

	public int memberOut(memberDTO dto) {
		int result = sqlMap.update("memberOut", dto);
		return result;
	}

	public HashMap<String, String> memberCheck(String id) {
		String result = sqlMap.selectOne("memberCheck", id);
		
		HashMap<String, String> jsonResult = new HashMap<String, String>();
		
		if(result != null){
			jsonResult.put("result", "true");
		} else {
			jsonResult.put("result", "false");
		}
		
		return jsonResult;
	}

	public int memberResetPwd(memberDTO dto) {
		int result = sqlMap.update("memberResetPwd", dto);
		return result;
	}
	
	public memberDTO itnLockLogin(memberDTO dto) {
		memberDTO mdto=sqlMap.selectOne("itnLockLogin", dto);
		return mdto;
	}
	
	
}
