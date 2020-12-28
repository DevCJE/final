package child.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import child.consent.model.ConsentDAO;
import child.consent.model.ConsentDTO;
import child.consent.model.ConsentReplyDTO;

@Controller
public class ConsentController {
	
	@Autowired
	private ConsentDAO dao;
	
	@Autowired
	private HttpSession session;
	
	public int checkAuth(){
		
		int checkAuth = 0;
		
		if((Integer) session.getAttribute("auth")!=null){
			checkAuth = (Integer) session.getAttribute("auth");
		}
		
		return checkAuth;

	}
	
	@RequestMapping("consentList.do")
	public ModelAndView consentList(@RequestParam(value="cp", defaultValue="1")int cp){
		
		int checkAuth = checkAuth();
		
		if(checkAuth != 3){
			String msg = "잘못된 접근입니다.";
			String url = "index.do";
			
			ModelAndView mav = new ModelAndView();
			
			mav.addObject("msg", msg);
			mav.addObject("url", url);
			mav.setViewName("msg/msg");
			
			return mav;
		}
		
		int member_idx = 0;
		
		if(session.getAttribute("idx") != null){
			member_idx = (Integer) session.getAttribute("idx");
		} 
		
		int totalCnt = dao.consentCnt(member_idx);
		int listSize = 6;
		int pageSize = 5;
		String page = null;
		
		if(totalCnt > 0){
			page = child.page.PageModule.makePage("consentList.do", totalCnt, listSize, pageSize, cp);
		} 
		
		List<ConsentDTO> dto = dao.consentList(cp, listSize,  member_idx);
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("lists", dto);
		mav.addObject("page", page);
		mav.setViewName("consent/consentList");
		
		return mav;
	}
	
	@RequestMapping("consentAdminList.do")
	public ModelAndView consentAdminList(@RequestParam(value="cp", defaultValue="1")int cp){
		
		int checkAuth = checkAuth();
		
		if(checkAuth != 4 && checkAuth != 5){
			String msg = "잘못된 접근입니다.";
			String url = "index.do";
			
			ModelAndView mav = new ModelAndView();
			
			mav.addObject("msg", msg);
			mav.addObject("url", url);
			mav.setViewName("msg/msg");
			
			return mav;
		}
		
		int totalCnt = dao.consentCntTotal();
		int listSize = 6;
		int pageSize = 5;
		String page = null;
		
		if(totalCnt > 0){
			page = child.page.PageModule.makePage("consentAdminList.do", totalCnt, listSize, pageSize, cp);
		} 
		
		List<ConsentDTO> dto = dao.consentAdminList(cp, listSize);
		
		List<String> mdto = new ArrayList<String>();
		
		for (int i = 0; i < dto.size(); i++) {
			mdto.add(i, dao.consentGetNameChild(dto.get(i).getMember_idx()));
		}
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("namechilds", mdto);
		mav.addObject("lists", dto);
		mav.addObject("page", page);
		mav.setViewName("consent/consentAdminList");
		
		return mav;
		
	
	}
	
	@RequestMapping(value="consentWrite.do", method=RequestMethod.GET)
	public ModelAndView consentWriteForm(){
		
		Date date = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("date", dateFormat.format(date));
		mav.setViewName("consent/consentWrite");
		
		return mav;
	}
	
	@RequestMapping(value="consentWrite.do", method=RequestMethod.POST)
	public ModelAndView consentWrite(ConsentDTO dto){
		
		int result = dao.consentWrite(dto);
		String msg = result > 0 ? "작성 완료하였습니다." : "작성 실패!";
		String url = result > 0 ? "consentList.do" : "consentWrite.do?write=false";
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("url", url);
		mav.setViewName("msg/msg");
		
		return mav;
		
	}
	
	@RequestMapping("consentContent.do")
	public ModelAndView consentContent(@RequestParam("idx")int idx){
		
		int checkAuth = checkAuth();
		
		if(checkAuth < 3){
			String msg = "잘못된 접근입니다.";
			String url = "index.do";
			
			ModelAndView mav = new ModelAndView();
			
			mav.addObject("msg", msg);
			mav.addObject("url", url);
			mav.setViewName("msg/msg");
			
			return mav;
		}
		
		ConsentDTO dto = dao.consentContent(idx);
		List<ConsentReplyDTO> rdto = dao.consentReplyContent(idx);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", dto);
		mav.addObject("reply", rdto);
		mav.setViewName("consent/consentContent");
		
		return mav;
		
	}
	
	@RequestMapping(value="consentReply.do", method=RequestMethod.POST)
	public ModelAndView consentReplyWrite(ConsentReplyDTO dto){
		
		int result = dao.consentReplyWrite(dto);
		String msg = result > 0 ? "댓글 등록 하였습니다." : "댓글 등록 실패";
		String url = "consentContent.do?idx="+dto.getCome_home_idx();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("url", url);
		mav.setViewName("msg/msg");
		
		return mav;
		
	}
	
	@RequestMapping("consentDateSearch.do")
	public ModelAndView consentDateSearch(@RequestParam(value="cp", defaultValue="1")int cp, HttpSession session, @RequestParam("calenderstart")String calenderstart, @RequestParam("calenderend")String calenderend){
		
		int member_idx = (Integer) session.getAttribute("idx");
		int totalCnt = dao.consentSearchCnt(member_idx, calenderstart, calenderend);
		int listSize = 6;
		int pageSize = 5;
		String page = null;
		
		if(totalCnt > 0){
			page = child.page.PageModule.makePage("consentDateSearch.do", totalCnt, listSize, pageSize, cp, calenderstart, calenderend);
		} 
		
		List<ConsentDTO> dto = dao.consentDateSearch(cp, listSize, member_idx, calenderstart, calenderend);
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("lists", dto);
		mav.addObject("page", page);
		mav.setViewName("consent/consentList");
		
		return mav;
		
	}
	
	@RequestMapping("consentAdminDateSearch")
	public ModelAndView consentAdminDateSearch(@RequestParam(value="cp", defaultValue="1")int cp, @RequestParam("calenderstart")String calenderstart, @RequestParam("calenderend")String calenderend){
		
		int totalCnt = dao.consentAdminDateSearchCnt(calenderstart, calenderend);
		int listSize = 6;
		int pageSize = 5;
		String page = null;
		
		if(totalCnt > 0){
			page = child.page.PageModule.makePage("consentAdminDateSearch.do", totalCnt, listSize, pageSize, cp, calenderstart, calenderend);
		}
		
		List<ConsentDTO> dto = dao.consentAdminDateSearch(cp, listSize, calenderstart, calenderend);
		
		List<String> mdto = new ArrayList<String>();
		
		for (int i = 0; i < dto.size(); i++) {
			mdto.add(i, dao.consentGetNameChild(dto.get(i).getMember_idx()));
		}
		
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("namechilds", mdto);
		mav.addObject("lists", dto);
		mav.addObject("page", page);
		mav.setViewName("consent/consentAdminList");
		
		return mav;
		
	}
	
	@RequestMapping("consentAdminNameSearch")
	public ModelAndView consentAdminNameSearch(@RequestParam(value="cp", defaultValue="1")int cp, @RequestParam("searchgroup")String searchgroup, @RequestParam("search")String search){
		
		int totalCnt = dao.consentAdminNameSearchCnt(searchgroup, search);
		int listSize = 6;
		int pageSize = 5;
		String page = null;

		if(totalCnt > 0){
			page = child.page.PageModule.makeSearchPage("consentAdminNameSearch.do", totalCnt, listSize, pageSize, cp, searchgroup, search);
		}

		
		List<ConsentDTO> dto = dao.consentAdminNameSearch(cp, listSize, searchgroup, search);
		
		List<String> mdto = new ArrayList<String>();
		
		for (int i = 0; i < dto.size(); i++) {
			mdto.add(i, dao.consentGetNameChild(dto.get(i).getMember_idx()));
		}
		
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("namechilds", mdto);
		mav.addObject("lists", dto);
		mav.addObject("page", page);
		mav.setViewName("consent/consentAdminList");
		
		return mav;
		
	}
	
	@RequestMapping(value="consentConfirm.do", method=RequestMethod.POST)
	public ModelAndView consentConfirm(ConsentDTO dto){
		
		int result = dao.consentConfirm(dto);
		String msg = result > 0 ? "승인 완료 되었습니다." : "승인 완료 실패!";
		String url = "consentContent.do?idx="+dto.getIdx();
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("msg", msg);
		mav.addObject("url", url);
		mav.setViewName("msg/msg");
		
		return mav;
	}
	
	
}
