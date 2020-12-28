package child.itnmsg.model;

import java.util.*;
import child.member.model.*;

public interface itnMsgDAO {
	
	public List<itnMsgDTO> itnMsgList(int cp,int ls);
	public int itnMsgWrite(itnMsgDTO dto);
	public itnMsgDTO itnContent(int idx);
	public int itnMsgDelete(int idx);
	public int itnGetTotalCnt(String send_name);
	public void itnMsgView(int idx,String send_name);
	public int itnMsgViews(String send_name);
	public List<itnMsgDTO> itnMsgRecvList(int cp,int ls);
	public int itnGetTotalRecvCnt(String recv_name);
	public itnMsgDTO itnRecvContent(int idx);
	public int itnMsgSendDel(String send_name,int sendDelList);
	public int itnMsgRecvDel(String recv_name,int recvDelList);
	public int itnMsgCancel(int idx);
	public List<memberDTO> itnSelectList();
}
