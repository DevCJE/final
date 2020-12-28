package child.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import child.member.admin.model.AdminDAO;
import child.member.model.memberDTO;

@Controller
public class MemberAdminController {
	@Autowired
	public AdminDAO adminDao;
	
    @RequestMapping("/te_adminForm.do")
	public ModelAndView te_adminform(@RequestParam(value = "cp", defaultValue = "1") int cp,HttpSession session){
    	session.setAttribute("cp", cp);
    	int totalCnt = adminDao.tegetTotal();
		int listSize = 5;
		int pageSize = 5;
		String pageStr = child.page.PageModule.makePage("te_adminForm.do", totalCnt, listSize, pageSize, cp);
    	
    	List<memberDTO> list=adminDao.te_adminForm(cp, listSize);
    	
    	ModelAndView mav= new ModelAndView();
    	mav.addObject("list",list);
    	mav.addObject("pagStr", pageStr);
    	mav.setViewName("intranet/member_admin/te_adminForm");
    	return mav;
    		
	}
    @RequestMapping("/teNo_adminForm.do")
   	public ModelAndView teNo_adminform(@RequestParam(value = "cp", defaultValue = "1") int cp,HttpSession session){
    	session.setAttribute("cp", cp);
    	int totalCnt = adminDao.teNogetTotal();
   		int listSize = 5;
   		int pageSize = 5;
   		String pageStr = child.page.PageModule.makePage("teNo_adminForm.do", totalCnt, listSize, pageSize, cp);
       	
       	List<memberDTO> list=adminDao.teNo_adminForm(cp, listSize);
       	
       	ModelAndView mav= new ModelAndView();
       	mav.addObject("list",list);
       	mav.addObject("pagStr", pageStr);
       	mav.setViewName("intranet/member_admin/teNo_adminForm");
       	return mav;
       		
   	}
    @RequestMapping("/ch_adminForm.do")
    public ModelAndView ch_adminForm(@RequestParam(value = "cp", defaultValue = "1") int cp,HttpSession session){
    	
    	session.setAttribute("cp", cp);
    	int totalCnt = adminDao.chgetTotal();
		int listSize = 5;
		int pageSize = 5;
		String pageStr = child.page.PageModule.makePage("ch_adminForm.do", totalCnt, listSize, pageSize, cp);
    	
		List<memberDTO> list = adminDao.ch_adminForm(cp, listSize);
    	
		ModelAndView mav=new ModelAndView();
    	
		mav.addObject("list",list);
		mav.addObject("pagStr", pageStr);
    	mav.setViewName("intranet/member_admin/ch_adminForm");
    	return mav;
    }
    @RequestMapping("/chNo_adminForm.do")
    public ModelAndView chNo_adminForm(@RequestParam(value = "cp", defaultValue = "1") int cp,HttpSession session){
    	session.setAttribute("cp", cp);
    	int totalCnt = adminDao.chNogetTotal();
		int listSize = 5;
		int pageSize = 5;
		String pageStr = child.page.PageModule.makePage("chNo_adminForm.do", totalCnt, listSize, pageSize, cp);
    	
		List<memberDTO> list = adminDao.chNo_adminForm(cp, listSize);
    	
		ModelAndView mav=new ModelAndView();
    	
		mav.addObject("list",list);
		mav.addObject("pagStr", pageStr);
    	mav.setViewName("intranet/member_admin/chNo_adminForm");
    	return mav;
    }
    @RequestMapping("/banChange.do")
    public ModelAndView banChange(String groupchild, String id,HttpSession session,int cp){
    	if(groupchild.equals("undefined")){
    		cp=(Integer)session.getAttribute("cp");
    		String msg="반을 선택해 주세요";        	
        	String url="te_adminForm.do?cp="+cp;
        	ModelAndView mav=new ModelAndView();
        	mav.addObject("msg",msg);
        	mav.addObject("url",url);
        	mav.setViewName("msg/msg");
        	return mav;
    	}
    	
    	cp=(Integer)session.getAttribute("cp");
    	int count=adminDao.banChange(groupchild, id);
    	String msg=count>0?"입력성공":"입력실패";
    	String url="te_adminForm.do?cp="+cp;
    	ModelAndView mav=new ModelAndView();
    	mav.addObject("msg",msg);
    	mav.addObject("url",url);
    	mav.setViewName("msg/msg");
    	return mav;
    }    
    @RequestMapping("/teDelete.do")
    public ModelAndView teDelete(int idx,HttpSession session,int cp){
    	cp=(Integer)session.getAttribute("cp");
    	int count=adminDao.teDelete(idx);
    	String msg=count>0?"퇴사완료":"퇴사실패";
    	String url="te_adminForm.do?cp="+cp;
    	ModelAndView mav=new ModelAndView();
    	mav.addObject("msg",msg);
    	mav.addObject("url",url);
    	mav.setViewName("msg/msg");
    	return mav;
    }
    @RequestMapping("/teacherOk.do")
    public ModelAndView teacherOk(int idx,HttpSession session,int cp){
    	cp=(Integer)session.getAttribute("cp");
    	int count=adminDao.teacherOk(idx);
    	String msg=count>0?"승인완료":"승인실패";
    	String url="teNo_adminForm.do?cp="+cp;
    	ModelAndView mav=new ModelAndView();
    	mav.addObject("msg",msg);
    	mav.addObject("url",url);
    	mav.setViewName("msg/msg");
    	return mav;
    }
    @RequestMapping("/teacherNo.do")
    public ModelAndView teacherNo(int idx,HttpSession session,int cp){
    	cp=(Integer)session.getAttribute("cp");
    	int count=adminDao.teDelete(idx);
    	String msg=count>0?"취소완료":"취소실패";
    	String url="teNo_adminForm.do?cp="+cp;
    	ModelAndView mav=new ModelAndView();
    	mav.addObject("msg",msg);
    	mav.addObject("url",url);
    	mav.setViewName("msg/msg");
    	return mav;
    }
    @RequestMapping("/chDelete.do")
    public ModelAndView chDelete(int idx,HttpSession session,int cp){
    	cp=(Integer)session.getAttribute("cp");
    	int count=adminDao.chDelete(idx);
    	String msg=count>0?"퇴소완료":"퇴소실패";
    	String url="ch_adminForm.do?cp="+cp;
    	ModelAndView mav=new ModelAndView();
    	mav.addObject("msg",msg);
    	mav.addObject("url",url);
    	mav.setViewName("msg/msg");
    	return mav;
    }
    @RequestMapping("/childOk.do")
    public ModelAndView childOk(int idx,HttpSession session,int cp){
    	cp=(Integer)session.getAttribute("cp");
    	int count=adminDao.childOk(idx);
    	String msg=count>0?"승인완료":"승인실패";
    	String url="chNo_adminForm.do?cp="+cp;
    	ModelAndView mav=new ModelAndView();
    	mav.addObject("msg",msg);
    	mav.addObject("url",url);
    	mav.setViewName("msg/msg");
    	return mav;
    }
    @RequestMapping("/childNo.do")
    public ModelAndView childNo(int idx,HttpSession session,int cp){
    	cp=(Integer)session.getAttribute("cp");
    	int count=adminDao.chDelete(idx);
    	String msg=count>0?"취소완료":"취소실패";
    	String url="chNo_adminForm.do?cp="+cp;
    	ModelAndView mav=new ModelAndView();
    	mav.addObject("msg",msg);
    	mav.addObject("url",url);
    	mav.setViewName("msg/msg");
    	return mav;
    }
    @RequestMapping("/chBanChange.do")
    public ModelAndView chBanChange(String groupchild, String id , HttpSession session,int cp){   	
    	if(groupchild.equals("undefined")){
    		cp=(Integer)session.getAttribute("cp");       	
        	String msg="반을 선택해 주세요";
        	String url="ch_adminForm.do?cp="+cp;
        	ModelAndView mav=new ModelAndView();
        	mav.addObject("msg",msg);
        	mav.addObject("url",url);
        	mav.setViewName("msg/msg");
        	return mav;
    	}
    	cp=(Integer)session.getAttribute("cp");
    	int count=adminDao.chBanChange(groupchild, id);
    	String msg=count>0?"입력성공":"입력실패";
    	String url="ch_adminForm.do?cp="+cp;
    	ModelAndView mav=new ModelAndView();
    	mav.addObject("msg",msg);
    	mav.addObject("url",url);
    	mav.setViewName("msg/msg");
    	return mav;
    }
    @RequestMapping("/chSearch.do")
    public ModelAndView chSerch(String serchgroup, String chsearch){
    	List<memberDTO> list=adminDao.chSearch(serchgroup, chsearch);
    	ModelAndView mav=new ModelAndView();
    	mav.addObject("list2",list);
    	mav.setViewName("intranet/member_admin/ch_adminForm");
    	return mav;
    }
    @RequestMapping("/chNoSearch.do")
    public ModelAndView chNoSerch(String serchgroup, String chsearch){
    	List<memberDTO> list=adminDao.chNoSearch(serchgroup, chsearch);
    	ModelAndView mav=new ModelAndView();
    	mav.addObject("list2",list);
    	mav.setViewName("intranet/member_admin/chNo_adminForm");
    	return mav;
    }
    @RequestMapping("/teSearch.do")
    public ModelAndView teSearch(String tesearch){
        List<memberDTO> list=adminDao.teSearch(tesearch);
        ModelAndView mav=new ModelAndView();
        mav.addObject("list2",list);
        mav.setViewName("intranet/member_admin/te_adminForm");
        return mav;
    }
    @RequestMapping("/teNoSearch.do")
    public ModelAndView teNoSearch(String tesearch){
        List<memberDTO> list=adminDao.teNoSearch(tesearch);
        ModelAndView mav=new ModelAndView();
        mav.addObject("list2",list);
        mav.setViewName("intranet/member_admin/teNo_adminForm");
        return mav;
    }
}
