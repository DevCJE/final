package child.controller;

import java.util.Calendar;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.google.api.client.extensions.java6.auth.oauth2.VerificationCodeReceiver;

import child.calendar.model.calDAO;
import child.calendar.model.calDTO;

@Controller
public class CalendarController {
	
	@Autowired
	   private calDAO calDao;
	
	@RequestMapping("/calendar_List.do")
	public ModelAndView cal_List(@RequestParam(value="id")String id,@RequestParam(value="year", required=false)String year,
			@RequestParam(value="month", required=false)String month){
		ModelAndView mav = new ModelAndView();
		
		if(id==null || id.equals("")){
			mav.addObject("msg", "로그인 후 이용해주세요.");
			mav.addObject("url", "index.do");
			
			mav.setViewName("msg/msg");
		}
		
		else{
		
		Calendar c = Calendar.getInstance();
		Calendar today = Calendar.getInstance();
		
		int thisyear = 0;
		if(year==null || year==""){
			thisyear=c.get(Calendar.YEAR);
		}
		else {
			int numYear = Integer.parseInt(year);
			thisyear=numYear;
			c.set(Calendar.YEAR, thisyear);
		}
		
		int thismonth=0;
		
		if(month==null || month==""){
			thismonth = c.get(Calendar.MONTH)+1;
		}
		else{
			int numMonth = Integer.parseInt(month);
			if(numMonth>=1 && numMonth<=12){
				thismonth = Integer.parseInt(month);
				c.set(Calendar.MONTH, thismonth-1);
			}
			else if(numMonth==0){
				thismonth = 12;
				c.set(Calendar.MONTH, thismonth-1);
			}
			else if(numMonth==13){
				thismonth=1;
				c.set(Calendar.MONTH, thismonth-1);
			}
		}
		
		c.set(Calendar.DATE, 1);

		int startday = c.get(Calendar.DAY_OF_WEEK);
		int enddate = c.getActualMaximum(Calendar.DATE);
		
		String stoday = ""+today.get(Calendar.YEAR)+(today.get(Calendar.MONTH)+1)+today.get(Calendar.DATE);
		int itoday = Integer.parseInt(stoday);
		
		Map<String,Object> map =  new HashedMap();
		map.put("year", thisyear);
		map.put("month", thismonth);
		map.put("startday", startday);
		map.put("enddate", enddate);
		map.put("today", itoday);
		
		List<calDTO> list = calDao.cal_List(thisyear, thismonth);
		
		mav.addObject("list", list);
		mav.addObject("cal", map);
		mav.setViewName("calendar/calendar_List");
		}
		
		return mav;
	}
	
	@RequestMapping(value="/calendar_Write.do", method=RequestMethod.GET)
	public ModelAndView cal_WriteForm(@RequestParam(value="id")String id){
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("id", id);
		mav.setViewName("/calendar/calendar_WriteForm");
		
		return mav;
	}
	
	@RequestMapping(value="/calendar_Write.do", method=RequestMethod.POST)
	public ModelAndView cal_Write(@ModelAttribute("dto")calDTO command, @RequestParam(value="id")String id){
		ModelAndView mav = new ModelAndView();
		int result = calDao.cal_Write(command);
		
		String msg = result > 0? "작성 성공!" : "작성 실패";
		mav.addObject("msg", msg);
		mav.addObject("url", "calendar_List.do?id="+id);
		mav.setViewName("msg/msg");
		
		return mav;
	}
	
	@RequestMapping("/calendar_View.do")
	public ModelAndView cal_View(@RequestParam(value="idx")String idx){
		ModelAndView mav = new ModelAndView();
		int idx_n = Integer.parseInt(idx);
		calDTO dto = calDao.cal_View(idx_n);
		
		mav.addObject("dto", dto);
		mav.setViewName("calendar/calendar_View");
		
		return mav;
	}
	
	@RequestMapping(value="/calendar_Edit.do", method=RequestMethod.GET)
	public ModelAndView cal_Edit(@RequestParam(value="idx")String idx){
		ModelAndView mav = new ModelAndView();
		int idx_n = Integer.parseInt(idx);
		
		calDTO dto = calDao.cal_Edit(idx_n);
		mav.addObject("dto", dto);
		mav.setViewName("calendar/calendar_Edit");
		
		return mav;
	}
	
	@RequestMapping(value="/calendar_Edit.do", method=RequestMethod.POST)
	public ModelAndView cal_Update(@ModelAttribute("dto")calDTO command){
		ModelAndView mav = new ModelAndView();
		
		int result = calDao.cal_Update(command);
		String msg = result > 0 ? "수정 완료":"수정 실패";
		
		mav.addObject("msg", msg);
		mav.addObject("url", "calendar_View.do?idx="+command.getIdx());
		
		mav.setViewName("msg/msg");
		
		return mav;
	}
	
	@RequestMapping("/calendar_Delete.do")
	public ModelAndView cal_Delete(@RequestParam(value="idx")String idx){
		ModelAndView mav = new ModelAndView();
		int idx_n = Integer.parseInt(idx);
		
		int result = calDao.cal_Delete(idx_n);
		String msg = result > 0 ? "삭제 완료": "삭제 실패";
		
		mav.addObject("msg", msg);
		mav.addObject("url", "calendar_List.do");
		mav.setViewName("msg/msg2");
		
		return mav;
	}
}
