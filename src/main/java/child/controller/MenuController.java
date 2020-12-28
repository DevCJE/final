
package child.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Map;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections.map.HashedMap;
import org.omg.CORBA.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.context.request.SessionScope;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import child.menu.model.MenuDAO;
import child.menu.model.MenuDTO;


@Controller
public class MenuController {
    @Autowired
	private MenuDAO menuDao;
	@Autowired
	HttpServletRequest request;
	
	@RequestMapping("/bobForm.do")
	public ModelAndView bobForm(HttpSession session){
		
		if(session.getAttribute("id")==null){
	         ModelAndView mav= new ModelAndView();
	         String msg="로그인 후 이용해주세요.";
	         mav.addObject("msg",msg);
	         mav.addObject("url","index.do");	         
	         mav.setViewName("msg/msg");
	         return mav;
	      }else{
		   java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
		   String today = formatter.format(new java.util.Date()); 
		
		   ModelAndView mav=new ModelAndView();		   		    
		   String url="menuChart.do?calender="+today;		   
		   mav.addObject("url",url);
		   mav.setViewName("msg/msg4");
           return mav;
	      }  
	}

	@RequestMapping("/menuWrite.do")
	public String menuWrite(){
		return "bob/menuWrite";
	}
	
	private String copyInto(MultipartFile bob_image){

		
		try {
			byte bytes[] = bob_image.getBytes();
			
			String dftFilePath = request.getSession().getServletContext().getRealPath("/");
			
			File newFile = new File(dftFilePath + bob_image.getOriginalFilename());
			
			FileOutputStream fos = new FileOutputStream(newFile);
			fos.write(bytes);
			fos.close();
	         
	         String result = child.imgur.ImgurImageUpload.imgurUpload(newFile);
	         
	         int startImg = result.indexOf("id");
	         int endImg = result.indexOf("title");
	         
	         String subresult = result.substring(startImg+5, endImg-3);
	         
	         subresult = "http://i.imgur.com/"+subresult+".png";
	         
	         return subresult;
			
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}
	}

	@RequestMapping("/menuWriteOk.do")
	public ModelAndView menuWriteOk(MenuDTO dto,@RequestParam("bob_image")List<MultipartFile> bob_image){
		ModelAndView mav=new ModelAndView();		
		String[] urlPath = new String[bob_image.size()];
		
		for(int i=0;i<bob_image.size();i++){
			urlPath[i] = copyInto(bob_image.get(i));
		}
		dto.setBob1_image(urlPath[0]);
		dto.setBob2_image(urlPath[1]);
		dto.setBob3_image(urlPath[2]);
		int result=menuDao.menuWriteOk(dto);
		dto.setBob1_content(dto.getBob1_content().replaceAll("\n", "<br>"));
		dto.setBob2_content(dto.getBob2_content().replaceAll("\n", "<br>"));
		dto.setBob3_content(dto.getBob3_content().replaceAll("\n", "<br>"));
		String calender=dto.getMenu_date();
		String msg=result>0?"작성성공":"작성실패";
		String url="menuChart.do";		
		mav.addObject("msg",msg);
		mav.addObject("url",url);
		mav.addObject("calender",calender);
		mav.setViewName("msg/msg3");
		
		
		
		return mav;
	}
	@RequestMapping("/menuChart.do")
	public ModelAndView menuChart(String calender,HttpSession session){
		
		ModelAndView mav=new ModelAndView();
		
		if(calender.equals("날짜 선택하기")){
			String msg="날짜를 입력해 주세요";
			String url="bobForm.do";
			mav.addObject("msg",msg);
			mav.addObject("url",url);
			mav.setViewName("msg/msg");
			return mav;
			}
				
		MenuDTO list=menuDao.menuChart(calender);
		if(list!=null){
		list.setBob1_content(list.getBob1_content().replaceAll("\n", "<br>"));
		list.setBob2_content(list.getBob2_content().replaceAll("\n", "<br>"));
		list.setBob3_content(list.getBob3_content().replaceAll("\n", "<br>"));
		}
		session.setAttribute("menu_date", calender);
		
		
		mav.addObject("dto",list);
		
		mav.setViewName("bob/bobForm");
		return mav;
	}
	@RequestMapping("/monthCalender.do")
	public ModelAndView monthCalender(@RequestParam(value="year", required=false)String year,
			@RequestParam(value="month", required=false)String month){	
		  
		    List<MenuDTO> list=menuDao.monthCalender();
		
		    ModelAndView mav=new ModelAndView();
          
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
			
			
			String date = ""+thisyear+thismonth+"01";		      
			int startday = c.get(Calendar.DAY_OF_WEEK);
			int enddate = c.getActualMaximum(Calendar.DATE);
			
			Map<String,Object> map =  new HashedMap();
			map.put("year", thisyear);
			map.put("month", thismonth);
			map.put("startday", startday);
			map.put("enddate", enddate);
			
			mav.addObject("cal", map);
			mav.addObject("list",list);
			mav.setViewName("bob/monthCalender");
			
			return mav;
		}
	
	@RequestMapping("/menuUpdateForm.do")
	public ModelAndView menuUpdateForm(String menu_date){
		List<MenuDTO> list=menuDao.menuUpdateForm(menu_date);
		ModelAndView mav=new ModelAndView();
		mav.addObject("list",list);
		mav.setViewName("bob/menuUpdateForm");
		return mav;
	}
	@RequestMapping("/menuUpdateOk.do")
	public ModelAndView menuUpdateOk(MenuDTO dto,@RequestParam("bob_image")List<MultipartFile> bob_image){
		ModelAndView mav=new ModelAndView();		
		String[] urlPath = new String[bob_image.size()];		
		for(int i=0;i<bob_image.size();i++){
			urlPath[i] = copyInto(bob_image.get(i));
		}
		dto.setBob1_image(urlPath[0]);
		dto.setBob2_image(urlPath[1]);
		dto.setBob3_image(urlPath[2]);				
		int result=menuDao.menuUpdateOk(dto);
		dto.setBob1_content(dto.getBob1_content().replaceAll("\n", "<br>"));
		dto.setBob2_content(dto.getBob2_content().replaceAll("\n", "<br>"));
		dto.setBob3_content(dto.getBob3_content().replaceAll("\n", "<br>"));		
		String msg=result>0?"수정성공":"수정실패";
		String url="menuChart.do";
		
		String calender=dto.getMenu_date();
		mav.addObject("calender",calender);
		mav.addObject("msg",msg);
		mav.addObject("url",url);
		mav.setViewName("msg/msg3");
		return mav;
	}
	@RequestMapping("/menuDeleteOk.do")
	public ModelAndView menuDeleteOk(String menu_date){
		int result=menuDao.menuDeleteOk(menu_date);
		String msg=result>0?"삭제성공":"삭제실패";
		String url="menuChart.do";
		ModelAndView mav=new ModelAndView();		
		String calender=menu_date;
		mav.addObject("calender",calender);
		mav.addObject("msg",msg);
		mav.addObject("url",url);
		mav.setViewName("msg/msg3");
		return mav;
	}
	@RequestMapping("/infoImage.do")
	public ModelAndView infoImage(int idx){
		MenuDTO menu=menuDao.infoImage(idx);
		menu.setBob1_content(menu.getBob1_content().replaceAll("\n", "<br>"));
		menu.setBob2_content(menu.getBob2_content().replaceAll("\n", "<br>"));
		menu.setBob3_content(menu.getBob3_content().replaceAll("\n", "<br>"));
		ModelAndView mav=new ModelAndView();
		mav.addObject("menu",menu);
		mav.setViewName("bob/infoImage");
		return mav;
	}
}
