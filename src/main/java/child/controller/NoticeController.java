package child.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import child.notice.model.*;


@Controller
public class NoticeController {

	@Autowired
	private noticeDAO ndao;
	
	@RequestMapping("/notice_List.do")
	public ModelAndView noticeList(@RequestParam(value="cp",defaultValue="1")int cp){
		int totalCnt = ndao.getTotalCnt();
		int listSize = 10;
		int pageSize = 5;
		String pageStr = child.page.PageModule.makePage("notice_List.do", totalCnt, listSize, pageSize, cp);
		
		List<noticeDTO> list=ndao.noticeList(cp, listSize);
		
		ModelAndView mav = new ModelAndView();
		
		if(list == null){			
			mav.addObject("msg", "잘못된 접근입니다.");
			mav.setViewName("msg/msg");
		
		} else {		
			for(int i=0;i<list.size();i++){
				list.get(i).setContent(list.get(i).getContent().replaceAll("/n", "<br>"));
			}
			mav.addObject("list", list);
			mav.addObject("pageStr", pageStr);
			mav.setViewName("notice/notice_List");
		}
		return mav;
	}
	
	@RequestMapping(value="/notice_Write.do", method = RequestMethod.GET)
	public String noticeWriteForm(){
		return "notice/notice_Write";
	}
	
	@RequestMapping(value="/notice_Write.do", method = RequestMethod.POST)
	public ModelAndView noticeWrite(noticeDTO dto){
		
		int result = ndao.noticeWrite(dto);
		String msg = result>0?"작성완료":"작성실패";
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("url", "notice_List.do");
		mav.setViewName("msg/msg");
		
		return mav;	
	}
	
	@RequestMapping("/notice_Delete.do")
	public ModelAndView noticeDelete(@RequestParam(value="idx")int idx){
		
		int result=ndao.noticeDelete(idx);
		String msg=result>0?"삭제성공":"삭제실패";
		String url="notice_List.do";
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg",msg);
		mav.addObject("url", url);
		mav.setViewName("msg/msg");
		
		return mav;
	}
	
	@RequestMapping(value="/notice_Update.do", method=RequestMethod.GET)
	public String noticeUpdateForm(){
		return "notice/notice_Update";
	}
	
	@RequestMapping(value="/notice_Update.do",method=RequestMethod.POST)
	public ModelAndView noticeUpdate(noticeDTO dto){
		int result=ndao.noticeUpdate(dto);
		dto.getContent().replaceAll("/n", "<br>");
		String msg=result>0?"수정성공":"수정실패";
		String url="notice_List.do";
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("url", url);
		mav.setViewName("msg/msg");
		
		return mav;
	}
	
	@RequestMapping("/notice_Search.do")
	public ModelAndView noticeSearch(@RequestParam(value="cp",defaultValue="1")int cp,@RequestParam(value="select")String select,@RequestParam(value="keyword")String keyword){
		
		int totalCnt = ndao.noticeGetTotalCnt(select,keyword);
		int listSize = 10;
		int pageSize = 5;
		
		String pageStr = child.page.PageModule.makeNoticePage("notice_Search.do", totalCnt, listSize, pageSize, cp, select, keyword);
		
		List<noticeDTO> list=ndao.noticeSearch(cp,listSize,select, keyword);
		ModelAndView mav=new ModelAndView();
		
		if(list == null){			
			mav.addObject("msg", "잘못된 접근입니다.");
			mav.setViewName("msg/msg");
		
		} else {		
			for(int i=0;i<list.size();i++){
				list.get(i).setContent(list.get(i).getContent().replaceAll("/n", "<br>"));
			}
			mav.addObject("list", list);
			mav.addObject("pageStr", pageStr);
			mav.setViewName("notice/notice_Search");
		}
		return mav;
	}
}
