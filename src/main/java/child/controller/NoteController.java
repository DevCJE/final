package child.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;

import child.note.model.noteDAO;
import child.note.model.noteDTO;
import child.note.model.notecoDAO;
import child.note.model.notecoDTO;
import child.controller.AlbumController;

@Controller
public class NoteController {
	
	@Autowired
	private noteDAO ndao;
	@Autowired
	private notecoDAO ncdao;
	@Autowired
	private HttpSession session;


	@RequestMapping("/noteList.do")
	public ModelAndView noteList(@RequestParam(value="cp", defaultValue="1")int cp){
		if(session.getAttribute("id")==null){
			ModelAndView mav= new ModelAndView();
			String msg="로그인 후 이용해주세요.";
			mav.addObject("msg",msg);
			mav.addObject("url","index.do");
			
			mav.setViewName("msg/msg");
			return mav;
		}else{
		
		int totalcnt=ndao.getTotalCnt();
		int listSize=6;
		int pageSize=6;
		
		String pageStr=child.page.PageModule.makePage("noteList.do", totalcnt, listSize, pageSize, cp);
		
		
		List<noteDTO> list= ndao.noteList(cp, listSize);
		
		ModelAndView mav= new ModelAndView();
		
		mav.addObject("list",list);
		mav.addObject("pageStr",pageStr);
		
		mav.setViewName("note/child_noteList");
		
		return mav;}
	}
	
	@RequestMapping("/noteContent.do")
	public ModelAndView noteContent(@RequestParam(value="idx", defaultValue="0")int idx){
		noteDTO dto=ndao.noteContent(idx);
		

		List<notecoDTO> colist=ncdao.notecoList(dto.getIdx());
		
		dto.setNote_content(dto.getNote_content().replaceAll("\n", "<br>"));
		dto.setNote_need(dto.getNote_need().replaceAll("\n", "<li>"));
		ModelAndView mav= new ModelAndView();
		mav.addObject("dto",dto);
		
		mav.addObject("colist",colist);
		
		mav.setViewName("note/child_noteContent");
		return mav;
		
	}
	
	@RequestMapping("/noteWriteForm.do")
	public String noteWriteForm(){
		return "note/child_noteWrite";
	}
	
	
	
	
	
	
	@RequestMapping("/noteWrite.do")
	public ModelAndView noteWrite(noteDTO dto){
	
	
		String[]values = dto.getNote_content().split("\"");
		
		dto.setNote_img(values[1]);
		
		int result = ndao.noteWrite(dto);
		

		
		
		String msg=result > 0 ? "작성 되었습니다." : "실패했습니다.";
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg",msg);
		mav.addObject("url","noteList.do");
		mav.setViewName("msg/msg");
		return mav;
	}
	@RequestMapping("/noteUpdate.do")
	public ModelAndView noteUpdateForm(@RequestParam("idx") int idx){
		noteDTO dto=ndao.noteUpdateForm(idx);
		
		ModelAndView mav= new ModelAndView();
		mav.addObject("dto",dto);
		mav.setViewName("note/child_noteUpdate");
		return mav;
	}
	@RequestMapping("/noteUpdateOk.do")
	public ModelAndView noteUpdate(noteDTO dto){
		
		String[]values = dto.getNote_content().split("\"");
		
		dto.setNote_img(values[1]);
		
		int result =ndao.noteUpdate(dto);
		
		String msg=result >0? "수정되었습니다":"실패했습니다.";
		
		ModelAndView mav= new ModelAndView();
		mav.addObject("msg",msg);
		mav.addObject("url","noteContent.do?idx="+dto.getIdx()+"");
		mav.setViewName("msg/msg");
		return mav;
	}
	@RequestMapping("/noteDel.do")
	public ModelAndView noteDel(@RequestParam("idx") int idx){
		
		int result = ndao.noteDel(idx);
		
		String msg=result>0?"삭제되었습니다":"실패했습니다.";
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg",msg);
		mav.addObject("url","noteList.do");
		mav.setViewName("msg/msg");
		return mav;
	}
	@RequestMapping("/notecoWrite.do")
	public ModelAndView coWrite(notecoDTO cdto,noteDTO dto){
		int result=ncdao.notecoWrite(cdto);
		
		String msg=result>0?"작성되었습니다":"실패했습니다";
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg",msg);
		mav.addObject("url","noteContent.do?idx="+dto.getIdx()+"&note_idx="+dto.getIdx());
		mav.setViewName("msg/msg");
		return mav;
		
	}
	@RequestMapping("/notecoDel.do")
	public ModelAndView notecoDel(@RequestParam("idx")int note_idx ,@RequestParam("idx_comt") int idx){
		
		int result = ncdao.notecoDel(idx);
		
		String msg=result>0?"삭제되었습니다":"실패했습니다.";
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg",msg);
		mav.addObject("url","noteContent.do?idx="+note_idx+"&note_idx="+note_idx);
		mav.setViewName("msg/msg");
		return mav;
	}

	@RequestMapping(value="/noteSearch.do", method = RequestMethod.GET)
	public ModelAndView noteSearch( @RequestParam("keyword")String keyword, @RequestParam(value="cp", defaultValue="1")int cp){
		int Ftotalcnt=ndao.getFindTotal(keyword);
		int listSize=6;
		int pageSize=5;
				
		String pageFStr=child.page.PageModule.notemakeSearchPage("noteSearch.do", Ftotalcnt, listSize, pageSize, cp, keyword);

		List<noteDTO> list= ndao.noteSearch(cp, listSize, keyword);
		
		ModelAndView mav= new ModelAndView();
		
		mav.addObject("list",list);
		mav.addObject("pageFStr",pageFStr);
		
		mav.setViewName("note/child_noteSearch");
		
		return mav;
	}
	
	@RequestMapping("/noteDateSearch.do")
	public ModelAndView notedateSearch(@RequestParam(value="cp",defaultValue="1")int cp,
			HttpSession session, @RequestParam("calenderstart")String calenderstart, 
			@RequestParam("calenderend")String calenderend){
		
		int Dtotalcnt=ndao.getdateToal(calenderstart, calenderend);
		int listSize=6;
		int pageSize=6;

		String pageDStr=child.page.PageModule.makeSearchPage("noteDateSearch.do", Dtotalcnt, listSize, pageSize, cp, calenderstart, calenderend);

		List<noteDTO>list=ndao.notedateSearch(cp, listSize, calenderstart, calenderend);
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("list",list);
		mav.addObject("pageDStr",pageDStr);
		
		mav.setViewName("note/child_noteDateSearch");
		
		return mav;
		
	}
}
