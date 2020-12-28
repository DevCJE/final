package child.member.model;

import java.util.HashMap;

public interface memberDAO {
	
	public int memberJoin(memberDTO dto);
	
	public memberDTO memberLogin(memberDTO dto);
	
	public String memberFindId(memberDTO dto);
	
	public memberDTO memberFindPwd(memberDTO dto);
	
	public memberDTO memberLoad(String id);
	
	public String memberCheckPwd(HashMap<String, String> pwd);
	
	public int memberUpdatePwd(HashMap<String, String> pwd);
	
	public int memberUpdate(memberDTO dto);
	
	public int memberOut(memberDTO dto);
	
	public HashMap<String, String> memberCheck(String id);
	
	public int memberResetPwd(memberDTO dto);
	
	public memberDTO itnLockLogin(memberDTO dto);

}
