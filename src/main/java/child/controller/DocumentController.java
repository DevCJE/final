package child.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.api.services.drive.model.File;
import com.google.api.client.extensions.java6.auth.oauth2.*;
import com.google.api.client.util.DateTime;

import child.document.model.docDAO;
import child.document.model.docDTO;
import child.document.model.wdocDTO;
import child.dosing.model.dosingDAO;

@Controller
public class DocumentController {
	
	@Autowired
	private docDAO docDao;
	
	@Autowired
	private dosingDAO dosingDao;

	
	@RequestMapping("/doc_StateList.do")
	public ModelAndView doc_List(@RequestParam(value="name")String name,
			@RequestParam(value="cp", defaultValue="1")int cp){
		ModelAndView mav = new ModelAndView();
		
		int totalList = docDao.stateTotal(name);
		int listsize = 10;
		int pagesize = 5;
		
		String pageStr = child.page.Paging.makePage("doc_StateList.do?name="+name, totalList, listsize, pagesize, cp);
		
		List<docDTO> list = docDao.doc_StateList(name,cp,listsize);
		
		mav.addObject("stateList", list);
		mav.addObject("page", pageStr);
		mav.setViewName("/intranet/document/doc_StateList");
		
		return mav;
	}

	@RequestMapping("/doc_docList.do")
	public ModelAndView doc_docList(@RequestParam(value="cp", defaultValue="1")int cp) throws IOException{
		
		ModelAndView mav = new ModelAndView();
		
		Map<String,Object> list = docDao.doc_docList();
		
		List<String> filename = (List<String>) list.get("filename");
		List<String> fileurl = (List<String>)list.get("fileurl");
		List<String> datetime = (List<String>) list.get("DateTime");
		
		int totalList = filename.size();
		int listsize = 10;
		int pagesize = 5;
		
		String pageStr = child.page.PageModule.makePage("doc_docList.do", totalList, listsize, pagesize, cp);
		
		docDao.deleteData();
		
		for(int i=0; i<filename.size(); i++){
			wdocDTO dto = new wdocDTO();
			dto.setSubject(filename.get(i));
			dto.setLast_date(datetime.get(i));
			dto.setDoc_addr(fileurl.get(i));
			
			 int result = docDao.insertDoc(dto);
		}
		
		List<wdocDTO> dtolist = docDao.getDocList(cp, listsize);
		
		for(int i=0; i<dtolist.size(); i++){
			wdocDTO dto = dtolist.get(i);
			String date = dto.getLast_date().substring(0, 10);
			dto.setLast_date(date);
			
			dtolist.set(i, dto);
		}
		
//		mav.addObject("list", filename);
//		mav.addObject("fileurl", fileurl);
//		mav.addObject("datetime", datetime);
		mav.addObject("dto", dtolist);
		mav.addObject("page", pageStr);
		
		mav.setViewName("/intranet/document/doc_docList");
		
		return mav;
	}
	
	@RequestMapping("/doc_SignList.do")
	public ModelAndView doc_SignList(@RequestParam(value="name")String name,
			@RequestParam(value="cp", defaultValue="1")int cp){
		ModelAndView mav = new ModelAndView();
		
		int totalsize = docDao.signTotal(name);
		int listsize = 10;
		int pagesize = 5;
		
		String pageStr = child.page.Paging.makePage("doc_SignList.do?name="+name, totalsize, listsize, pagesize, cp);

		List<docDTO> list = docDao.doc_SignList(name,cp,listsize);
		
		mav.addObject("signlist", list);
		mav.addObject("page", pageStr);
		mav.setViewName("/intranet/document/doc_SignList");
		
		return mav;
	}
	
	@RequestMapping(value="/doc_docWrite.do", method=RequestMethod.GET)
	public ModelAndView doc_docForm(@RequestParam(value="fileid")String fileid,
			@RequestParam(value="subject")String subject) {
		ModelAndView mav = new ModelAndView();
		
		Calendar c = Calendar.getInstance();
		int year = c.get(Calendar.YEAR);
		int month = c.get(Calendar.MONTH)+1;
		int date = c.get(Calendar.DATE);
		int hour = c.get(Calendar.HOUR);
		int minu = c.get(Calendar.MINUTE);
		int sec = c.get(Calendar.SECOND);
		
		String copiedsubject = subject+year+month+date+hour+minu+sec;
		
		Map<String,Object> copiedfile = docDao.doc_docForm(fileid,copiedsubject);
		
		mav.addObject("url", copiedfile.get("url"));
		mav.addObject("filename", copiedsubject);
		mav.addObject("fileID", copiedfile.get("id"));
		mav.setViewName("intranet/document/doc_docWrite");
		//copiedfile==null
		
		return mav;
	}
	
	@RequestMapping("/doc_searchMem.do")
	public ModelAndView doc_searchMem(@RequestParam(value="name2")String name1){
		ModelAndView mav = new ModelAndView();
		
		String names = docDao.doc_searchMem(name1);
		
		mav.addObject("names", names);
		mav.setViewName("intranet/document/nameList");
		
		return mav;
	}
	
	@RequestMapping("/doc_docWrite2.do")
	public ModelAndView doc_docWrite(@ModelAttribute("dto")docDTO command){
		ModelAndView mav = new ModelAndView();
		String fileUrl = docDao.updateFile(command.getSubject(), command.getDocument());
		command.setDocument(fileUrl);
		
		int result = docDao.doc_Write(command);
				
		String msg = result>0? "쓰기 성공":"쓰기 실패";
		
		mav.addObject("msg", msg);
		mav.addObject("url", "doc_docList.do");
		mav.setViewName("msg/msg");
		
		return mav;
	}
	
	@RequestMapping("/doc_docView.do")
	public ModelAndView doc_docView(@RequestParam(value="fileurl")String fileurl, @RequestParam(value="idx")String idx,
			@RequestParam(value="name2")String name2){
		ModelAndView mav = new ModelAndView();
		System.out.println("docView");
		
		ArrayList<String> sign1 = docDao.doc_ListByIdx(idx);
		
		
		mav.addObject("sign1", sign1.get(0));
		mav.addObject("url", fileurl);
		mav.addObject("idx", idx);
		mav.addObject("name", name2);
		mav.addObject("sign1", sign1);
		mav.setViewName("/intranet/document/doc_View");
		
		return mav;
	}
	
	@RequestMapping("/donotUpdate.do")
	public ModelAndView doc_notUpdate(@RequestParam(value="idx")String idx,@RequestParam(value="name2")String name2){
		ModelAndView mav = new ModelAndView();
		int idx_i = Integer.parseInt(idx);
		int result = docDao.donotUpdate(idx_i);
		
		String msg = result>0? "반려되었습니다":"반려 실패";
		
		mav.addObject("msg", msg);
		mav.addObject("url", "doc_SignList.do?name="+name2);
		mav.setViewName("msg/msg");
		
		return mav;
	}
	
	@RequestMapping("/updateSign.do")
	public ModelAndView doc_Update(@RequestParam(value="idx")String idx, @RequestParam(value="sign2")String sign2,
			@RequestParam(value="name2")String name2){
		ModelAndView mav = new ModelAndView();
		int idx_i = Integer.parseInt(idx);
		int result = docDao.update(idx_i, sign2);
		String msg = result > 0 ? "결재 완료":"결재 실패";
		
		mav.addObject("msg", msg);
		mav.addObject("url", "doc_SignList.do?name="+name2);
		mav.setViewName("msg/msg");
		
		return mav;
	}
	
	@RequestMapping("/docEdit.do")
	public ModelAndView doc_Edit(@RequestParam(value="idx")String idx){
		ModelAndView mav = new ModelAndView();
		
		int idx_i = Integer.parseInt(idx);
		docDTO dto = docDao.docEdit(idx_i);
		
		mav.addObject("dto", dto);
		mav.setViewName("/intranet/document/doc_Edit");
		
		return mav;
	}
	
	@RequestMapping("/docEdit2.do")
	public ModelAndView doc_EditWrite(@ModelAttribute("dto")docDTO command){
		ModelAndView mav = new ModelAndView();
		String url = docDao.getUrl(command.getSubject());
		command.setDocument(url);
		
		int update = docDao.editUp(command);
		
		String msg = update > 0 ? "수정 완료" : "수정 실패";
		
		mav.addObject("msg", msg);
		mav.addObject("url", "doc_StateList.do?name="+command.getName1());
		mav.setViewName("msg/msg");
		
		return mav;
	}
	
	@RequestMapping("/doc_sidebar.do")
	public String doc_sidebar(){
		return "intranet/document/doc_sidebar";
	}
	
	// *서명저장
	@RequestMapping("/document_signature.do")
	public ModelAndView dosing_sig(@RequestParam(value="t",required=false)String t,
			@RequestParam(value="state", required=false)String state,
			@RequestParam(value="idx")String idx){
		int result=-1;
		//.println("state: "+state);
		
		//.println("document !!");
		if(state.equals("write")){
			//.println("sig1 번째입니다.");
		result = dosingDao.document_signature(t,idx);
		}
		if(state.equals("view")){
			//System.out.println("sig2 번째입니다.");
		result = dosingDao.document_signature_2(t,idx);
		}
		
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("dosing/json/dosing_sig");
		
		return mav;
	}
}
