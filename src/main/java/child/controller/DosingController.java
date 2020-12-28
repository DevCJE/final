package child.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import child.consent.model.ConsentDTO;
import child.dosing.model.EncodeDTO;
import child.dosing.model.dosingDAO;
import child.dosing.model.dosingDAOImple;
import child.dosing.model.dosingDTO;
import child.member.model.memberDTO;

@Controller
public class DosingController {
	int result=0;
	String s = "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";
	@Autowired
	private dosingDAO dosingDao;


	public DosingController() {

	}
	
	@RequestMapping("/dosing.do")
	public ModelAndView dosing(@RequestParam(value="cp", defaultValue="1")int cp, HttpSession session
			){
		ModelAndView mav = new ModelAndView();
		String id = (String)session.getAttribute("id");
		
		List<dosingDTO> list = dosingDao.dosing_getAllChildId(id);
		
		int pagenum = list.size()/6;
		
		int page_DDULGUOGI = list.size()%6;
		
		//("pagenum: "+pagenum);
		
		ArrayList<dosingDTO> list_Real= new ArrayList<dosingDTO>();
		
	
		if(page_DDULGUOGI>0){
			
			pagenum = pagenum+1;	
		}

		for(int i=(cp-1)*6;i<(cp-1)*6+6;i++){
			try {
				list_Real.add(list.get(i));	
			} catch (Exception e) {
				
			}
			
			
		}
		mav.addObject("list",list_Real);
		mav.addObject("page",pagenum);
		mav.addObject("cp", cp);
	
		mav.setViewName("dosing/dosing");
		
		return mav;
	}
	int state;
	
	@RequestMapping("dosingAdminDateSearch.do")
	public ModelAndView consentAdminDateSearch(@RequestParam(value="cp", defaultValue="1")int cp, HttpSession session, @RequestParam("calenderstart")String calendarstart, @RequestParam("calenderend")String calendarend){
		
		ModelAndView mav = new ModelAndView();
		
		String name = "none";
		
		//(calendarstart+"/"+calendarend);
		
		List<dosingDTO> list = dosingDao.dosingDateSearch(calendarstart,calendarend,name);
		
		int pagenum = list.size()/6;
		
		int page_DDULGUOGI = list.size()%6;
		
		//("pagenum: "+pagenum);
		
		ArrayList<dosingDTO> list_Real= new ArrayList<dosingDTO>();
		
	
		if(page_DDULGUOGI>0){
			
			pagenum = pagenum+1;	
		}

		for(int i=(cp-1)*6;i<(cp-1)*6+6;i++){
			try {
				list_Real.add(list.get(i));	
			} catch (Exception e) {
				
			}
			
			
		}
		mav.addObject("lists",list_Real);
		mav.addObject("page",pagenum);
		mav.addObject("cp", cp);
	
		mav.setViewName("dosing/dosing_admin");
		
		return mav;
		
	}
	
	
	@RequestMapping("dosingDateSearch.do")
	public ModelAndView consentDateSearch(@RequestParam(value="cp", defaultValue="1")int cp, HttpSession session, @RequestParam("calenderstart")String calendarstart, @RequestParam("calenderend")String calendarend){
		
		ModelAndView mav = new ModelAndView();
		
		String name = (String) session.getAttribute("id");
		
		//(calendarstart+"/"+calendarend);
		
		List<dosingDTO> list = dosingDao.dosingDateSearch(calendarstart,calendarend,name);
		
		
		int pagenum = list.size()/6;
		
		int page_DDULGUOGI = list.size()%6;
		
		//("pagenum: "+pagenum);
		
		ArrayList<dosingDTO> list_Real= new ArrayList<dosingDTO>();
		
	
		if(page_DDULGUOGI>0){
			
			pagenum = pagenum+1;	
		}

		for(int i=(cp-1)*6;i<(cp-1)*6+6;i++){
			try {
				list_Real.add(list.get(i));	
			} catch (Exception e) {
				
			}
			
			
		}
		mav.addObject("list",list_Real);
		mav.addObject("page",pagenum);
		mav.addObject("cp", cp);
	
		mav.setViewName("dosing/dosing");
		
		return mav;
		
	}
	
	
	
	
	@RequestMapping("dosingAdminNameSearch.do")
	public ModelAndView dosingAdminNameSearch(@RequestParam(value="cp", defaultValue="1")int cp, 
			@RequestParam("search")String name,
			@RequestParam("searchgroup")String group,
			HttpSession session){
		ModelAndView mav = new ModelAndView();
		
		//(name);
		//(group);
		
		List<dosingDTO> list = null;
		if(group.equals("client")){
		list = dosingDao.dosingAdminNameSearch2(name);
		//(list);
		}
		if(group.equals("namechild")){
		list = dosingDao.dosingAdminNameSearch(name);
		//(list);
		}
		
		int pagenum = list.size()/6;
		
		int page_DDULGUOGI = list.size()%6;
		
		//("pagenum: "+pagenum);
		
		ArrayList<dosingDTO> list_Real= new ArrayList<dosingDTO>();
		
	
		if(page_DDULGUOGI>0){
			
			pagenum = pagenum+1;	
		}

		for(int i=(cp-1)*6;i<(cp-1)*6+6;i++){
			try {
				list_Real.add(list.get(i));	
			} catch (Exception e) {
				
			}
			
			
		}
		mav.addObject("lists",list_Real);
		mav.addObject("page",pagenum);
		mav.addObject("cp", cp);
		
		
		
		
	
		mav.setViewName("dosing/dosing_admin");
		
		return mav;
		
	}
	
	
	
	
	
	@RequestMapping("/dosing_admin.do")
	public ModelAndView dosing_admin(@RequestParam(value="cp", defaultValue="1")int cp, HttpSession session){
		ModelAndView mav = new ModelAndView();
		
		List<dosingDTO> list = dosingDao.dosing_getAllChild();
		
		int pagenum = list.size()/6;
		
		int page_DDULGUOGI = list.size()%6;
		
		//("pagenum: "+pagenum);
		
		ArrayList<dosingDTO> list_Real= new ArrayList<dosingDTO>();
		
	
		if(page_DDULGUOGI>0){
			
			pagenum = pagenum+1;	
		}

		for(int i=(cp-1)*6;i<(cp-1)*6+6;i++){
			try {
				list_Real.add(list.get(i));	
			} catch (Exception e) {
				
			}
			
		}
		mav.addObject("lists",list_Real);
		mav.addObject("page",pagenum);
		mav.addObject("cp", cp);
		
		mav.setViewName("dosing/dosing_admin");
		
		return mav;
	}
	
	@RequestMapping("/dosing_signature.do")
	public ModelAndView dosing_sig(@RequestParam(value="t",required=false)String t,
			@RequestParam(value="ch")String child_name,
			@RequestParam(value="cl")String client,
		@RequestParam(value="hour")String hour,
			@RequestParam(value="minute")String minute,
				@RequestParam(value="second")String second){
		
		
		
		//("t: "+t);
		
		
		
		String time = hour+minute+second;
		
		//(hour+"시"+minute+"분"+second+"초");
		int result = dosingDao.dosing_signature(t,client,child_name,time);
		
		
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("dosing/json/dosing_sig");
		
		return mav;
	}
	
		
		@RequestMapping("/dosing_GETsignature.do")
		public ModelAndView dosing_sigg(@RequestParam(value="t",required=false)String t,
				@RequestParam(value="client",required=false)String client,
				@RequestParam(value="child_name",required=false)String child_name,
				@RequestParam(value="hour",required=false)String h,
				@RequestParam(value="minute",required=false)String m,
				@RequestParam(value="second",required=false)String s,
				@RequestParam(value="time",required=false)String time,
				@RequestParam(value="state",required=false,defaultValue="none")String state,
				@RequestParam(value="idx",required=false,defaultValue="none")String idx
				
				
				){
			//ln(idx);
			
			if(idx.length()>4){
			idx = idx.substring(1,idx.length()-1);
			//ln(idx);
			}
		//("---time---: "+h+""+m+""+s);
			List<EncodeDTO> list=null;
		
		//("sfsd");
		
		if(state.equals("doc")){
			list = dosingDao.dosing_GETsignatureDoc(idx);
			String s2="";
			String s1 = list.get(0).getEnc1();
			
			try{
				if(list.get(0).getEnc2().length()>0){
					s2 = list.get(0).getEnc2();
					//ln(s2);
					}}
			catch(Exception e){
			System.out.println("===============NULL POINTER EXCEPTION ================");	
				e.printStackTrace();
				System.out.println("======================================================");	
			
			}
			
			
			//ln(s1.length()+s2.length());
			
		}else{
		
		list = dosingDao.dosing_GETsignature(client,child_name,time);
		
		String s1 = list.get(0).getEnc1();
		String s2 = list.get(0).getEnc2();

		}
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("result", list);
		
		mav.setViewName("dosing/json/dosing_sig");
		
		return mav;
	}	
		
	
	@RequestMapping("/dosing_main.do")
	public ModelAndView dosing_main(@RequestParam(value="idx")String idx){
		
		List<dosingDTO> result = dosingDao.dosing_getSpecificChildInfo(idx);
		
		//(result.get(0).getSymtom());
	
		ModelAndView mav = new ModelAndView();
		mav.addObject("result",result);
		mav.setViewName("dosing/dosing_main");
		
		return mav;
	}	
	
	@RequestMapping("/dosing_getChildName.do")
	public ModelAndView dosing_getChildName(@RequestParam(value="id")String name){
		
		memberDTO dtolist = dosingDao.dosingMember(name);
		//("이름 나오는지 확인. : "+list.get(0));
		
		String list = dtolist.getNamechild();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("result",list);
		mav.setViewName("dosing/Json/dosingJsonName");
		
		return mav;
	}	
	@RequestMapping("/dosing_main_update.do")
	public ModelAndView dosing_main_update(@RequestParam("idx")String idx,@RequestParam(value="cp",defaultValue="1")int cp,
			@RequestParam("state")int state){
		// ���� �������
		
		int result = dosingDao.dosing_confirm(idx);
		//("result: ? "+result);
		
		
		ModelAndView mav = new ModelAndView();
		
List<dosingDTO> list = dosingDao.dosing_getAllChild();
		
		int pagenum = list.size()/6;
		
		int page_DDULGUOGI = list.size()%5;
		
		//("pagenum: "+pagenum);
		
		ArrayList<dosingDTO> list_Real= new ArrayList<dosingDTO>();
		
	
		if(page_DDULGUOGI>0){
			
			pagenum = pagenum+1;	
		}

		for(int i=(cp-1)*6;i<(cp-1)*6+6;i++){
			try {
				list_Real.add(list.get(i));	
			} catch (Exception e) {
				
			}
			
		}
		mav.addObject("lists",list_Real);
		mav.addObject("page",pagenum);
		mav.addObject("cp", cp);
		mav.addObject("admin_result",result);
		mav.setViewName("dosing/dosing_admin");
		
		return mav;
	}
	
	
	
	@RequestMapping("/dosing_calendar.do")
	public ModelAndView dosing_calendar(){
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("dosing/dosing_calendar");
		
		return mav;
	}
	
	@RequestMapping("/dosing_write.do")
	public ModelAndView dosing_write(HttpSession session){
		String name = (String)session.getAttribute("id");
		
		//("name 나오냐? "+name);
		memberDTO list = dosingDao.dosingMember(name);
		
		//("이름 나오는지 확인. : "+list.get(0));
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("list",list);
		
		mav.setViewName("dosing/dosing_write");
		
		return mav;
	}

	@RequestMapping("dosing/dosing_list.do")
	public void dosing_list(){
	}
	
	@RequestMapping("dosing_delete.do")
	public String dosing_delete(@RequestParam("idx")int idx,HttpSession session){
		result=dosingDao.dosing_delete(idx);
		return "redirect://dosing_request.do?result="+result+"";
		
	}
	
	@RequestMapping("dosing_request.do")
	public ModelAndView dosing_Request(){
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("result",result);
		mav.setViewName("dosing/dosing_request");
		return mav;
	}
	String time_Real;
	@RequestMapping("dosing_write_ok.do")
	public String dosing_write_ok(@RequestParam("dosing_date_String")String dosing_date_String,
HttpSession session,
			
			@RequestParam("time")String time,
			@RequestParam("hour")String h,
			@RequestParam("minute")String m,
			@RequestParam("second")String s,
			
			dosingDTO dto){
		Date Date = null ;
		//("time check: "+h+""+m+""+s);
		time_Real = h+""+m+""+s;
		
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		
		try {
			Date = df.parse(dosing_date_String);
			//(Date);
			
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		dto.setDosing_date(Date);
		dto.setSig_time(h+""+m+""+s);
		dto.setConfirm("no");
		String id = (String)session.getAttribute("id");
		dto.setId(id);
				
		result=dosingDao.dosing_write(dto);
		return "redirect://dosing_request.do?result="+result+"";
	}
	@RequestMapping("/dosing_write_cancel.do")
	public String dosing_write_cancel(){	
		
		return "redirect://dosing_request.do?result=1";
	}	
	
	@RequestMapping("/ajaxTest.do")
	public ModelAndView ajaxTest(){
		ModelAndView mav = new ModelAndView();
		
		// �������������
		List<dosingDTO> result = dosingDao.dosing_getAllChild();
		
		//(result.get(0).getSymtom());
		
		mav.addObject("dosing_getAllChildlist",result);
		mav.setViewName("dosing/json/dosingJson");
		
		return mav;
	}	
	
	@RequestMapping("/ajax_show_childinfo.do")
	public ModelAndView ajax_show_childinfo(@RequestParam(value="idx", defaultValue="9999")String child_idx,
			@RequestParam(value="state",defaultValue="0")int state){
		ModelAndView mav = new ModelAndView();
		//(state);
		
		List<dosingDTO> result=null;
		
		// ���� �������
		if(state==0){
		result = dosingDao.dosing_getChildInfo(child_idx);
		}
		if(state==1){
		result = dosingDao.dosing_getAllChild();
		}
		mav.addObject("dosing_getChildInfo",result);
		mav.setViewName("dosing/json/dosingJson_childInfo");
		
		return mav;		
	}
	
	@RequestMapping("/ajaxMonth.do")
	public ModelAndView ajaxMonth(){
		ModelAndView mav = new ModelAndView();
		
		List<String> result = dosingDao.dosing_getAllMonthAvailable();
		
		mav.addObject("dosing_getAllMonthAvailable",result);
		mav.setViewName("dosing/json/dosingJsonMonth");
		
		return mav;
	}
	@RequestMapping("/ajax_calen.do")
	public ModelAndView ajax_calen(){
		ModelAndView mav = new ModelAndView();
		
		List<String> result = dosingDao.dosing_getAllMonthAvailable();
		
		mav.addObject("dosing_getAllMonthAvailable",result);
		mav.setViewName("dosing/json/dosingJsonMonth");
		
		return mav;
	}
	
	@RequestMapping("/ajaxReport.do")
	public ModelAndView ajaxReport(@RequestParam("content")String content,
			@RequestParam(value="idx",defaultValue="19")String idx,
			HttpSession session){	
		ModelAndView mav = new ModelAndView();
		 
		ArrayList<String> update_list = new ArrayList<String>();
		
		update_list.add(idx);
		update_list.add(content);
		
		String result = dosingDao.dosingUpdateReport(update_list);
		
		
		mav.addObject("result",result);
		mav.setViewName("dosing/json/dosingJsonReport");
		
		return mav;
	}	

	@RequestMapping("dosing_byMonth.do")
	public ModelAndView dosing_byMonth(@RequestParam(value="month",defaultValue="01")String month,
			@RequestParam(value="ajax",defaultValue="0")String ajax){
		List<dosingDTO> result = dosingDao.dosing_getAllChildByMonth(month);
		ModelAndView mav = new ModelAndView();	
		mav.addObject("result",result);

		if(ajax.equals("0")){
		mav.setViewName("dosing/dosing_byMonth");
		}
		if(ajax.equals("1")){
			
		mav.setViewName("dosing/json/dosingJson_byMonth");
		}
		return mav;
	}
	@RequestMapping("dosing_byMonth2.do")
	public ModelAndView dosing_byMonth2(@RequestParam(value="month",defaultValue="01")String month,
			@RequestParam(value="ajax",defaultValue="0")String ajax){
		List<dosingDTO> result = dosingDao.dosing_getAllChildByMonth(month);
		ModelAndView mav = new ModelAndView();	

		mav.addObject("result",result);

		if(ajax.equals("0")){
		mav.setViewName("dosing/dosing_byMonth");
		}
		if(ajax.equals("1")){
			
		mav.setViewName("dosing/json/dosingJson_byMonth");
		}
		return mav;
	}
}
