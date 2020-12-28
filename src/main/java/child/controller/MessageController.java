package child.controller;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import child.itnmsg.model.*;
import child.member.model.*;

@Controller
public class MessageController {

	@Autowired
	private itnMsgDAO imDao;
	
	@RequestMapping("/itn_msg_List.do")
	public ModelAndView itnMsgList(@RequestParam(value="cp",defaultValue="1")int cp,@RequestParam(value="send_name")String send_name){
		
		int totalCnt = imDao.itnGetTotalCnt(send_name);
		int listSize = 10;
		int pageSize = 5;
		
		String pageStr = child.page.PageModule.makeSendNamePage("itn_msg_List.do", totalCnt, listSize, pageSize, cp, send_name);
		List<itnMsgDTO> list=imDao.itnMsgList(cp, listSize);
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("pageStr", pageStr);
		mav.setViewName("intranet/message/itn_msg_List");
		
		return mav;
	}
	
	@RequestMapping(value="/itn_msg_Write.do", method=RequestMethod.GET)
	public ModelAndView itnMsgWriteForm(){
		
		List<memberDTO> list=imDao.itnSelectList();
		ModelAndView mav=new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("intranet/message/itn_msg_Write");
		
		return mav;
	}
	
	@RequestMapping(value="/itn_msg_Write.do", method = RequestMethod.POST)
	public ModelAndView itnMsgWrite(itnMsgDTO dto){
		
		int result = imDao.itnMsgWrite(dto);
		String msg = result>0?"작성완료":"작성실패";
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("url", "itn_msg_List.do?send_name="+dto.getRecv_name());
		mav.setViewName("intranet/itnmsg/itnmsg");
		
		return mav;	
	}
	
	@RequestMapping("/itn_msg_Content.do")
	public ModelAndView itnMsgContent(@RequestParam(value="idx",defaultValue ="0")int idx,@RequestParam("send_name")String send_name){
		imDao.itnMsgView(idx,send_name);
		
		itnMsgDTO dto=imDao.itnContent(idx);
		ModelAndView mav = new ModelAndView();
		
		if(dto == null){			
			mav.addObject("msg", "잘못된 접근입니다.");
			mav.setViewName("intranet/itnmsg/itnmsg");
		
		} else {		
			dto.getContent().replaceAll("/n", "<br>");
			mav.addObject("dto", dto);
			mav.setViewName("intranet/message/itn_msg_Content");
		}
		return mav;
	}
	
	@RequestMapping("/itn_msg_RecvList.do")
	public ModelAndView itnMsgRecvList(@RequestParam(value="cp",defaultValue="1")int cp,@RequestParam(value="recv_name")String recv_name){
		int totalCnt = imDao.itnGetTotalRecvCnt(recv_name);
		int listSize = 10;
		int pageSize = 5;
		String pageStr = child.page.PageModule.makeRecvNamePage("itn_msg_RecvList.do", totalCnt, listSize, pageSize, cp, recv_name);
		List<itnMsgDTO> list=imDao.itnMsgRecvList(cp, listSize);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("pageStr", pageStr);
		mav.setViewName("intranet/message/itn_msg_RecvList");
		
		return mav;
	}
	
	@RequestMapping("/itn_msg_RecvContent.do")
	public ModelAndView itnMsgRecvContent(@RequestParam(value="idx",defaultValue ="0")int idx){
		
		itnMsgDTO dto=imDao.itnRecvContent(idx);
		ModelAndView mav = new ModelAndView();
		
		if(dto == null){			
			mav.addObject("msg", "잘못된 접근입니다.");
			mav.setViewName("intranet/itnmsg/itnmsg");
		
		} else {		
			dto.getContent().replaceAll("/n", "<br>");
			mav.addObject("dto", dto);
			mav.setViewName("intranet/message/itn_msg_RecvContent");
		}
		return mav;
	}
	
	@RequestMapping("/itn_msg_SendDel.do")
	public ModelAndView itnMsgSendDel(@RequestParam("send_name")String send_name,@RequestParam("chk")List<Integer> sendDelList){
		
		String msg = null;
		
		for(int i = 0 ; i < sendDelList.size() ; i++){
			
			int count = imDao.itnMsgSendDel(send_name, sendDelList.get(i));
			msg = count > 0 ? "삭제 성공" : "삭제 도중 오류가 발생하였습니다.";
			
		}
		
		String url = "itn_msg_List.do?send_name="+send_name;
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("url", url);
		mav.setViewName("msg/msg");
		
		return mav;
		
	}
	
	@RequestMapping("/itn_msg_RecvDel.do")
	public ModelAndView itnMsgRecvDel(@RequestParam("recv_name")String recv_name,@RequestParam("chk")List<Integer> recvDelList){
		
		String msg=null;
		for(int i=0;i<recvDelList.size();i++){
			int count=imDao.itnMsgRecvDel(recv_name, recvDelList.get(i));
			msg=count>0?"삭제 성공":"삭제 도중 오류가 발생했습니다.";
			
		}
		String url="itn_msg_RecvList.do?recv_name="+recv_name;
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("url", url);
		mav.setViewName("msg/msg");
		
		return mav;
	}
	
	@RequestMapping("/itn_msg_Cancel.do")
	public ModelAndView itnMsgCancel(@RequestParam("idx")int idx,@RequestParam("recv_name")String recv_name){
		int result=imDao.itnMsgCancel(idx);
		String msg=result>0?"발송 취소 성공":"발송 취소 실패";
		String url="itn_msg_RecvList.do?recv_name="+recv_name;
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("url", url);
		mav.setViewName("msg/msg");
		
		return mav;
		
	}
}
