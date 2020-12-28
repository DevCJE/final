package child.controller;

import java.awt.List;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.nio.file.attribute.AclEntry.Builder;
import java.util.ArrayList;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.text.Document;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.xml.sax.SAXException;

import child.dosing.model.dosingDAO;
import child.dosing.model.dosingDTO;
import child.member.model.memberDAO;
import child.member.model.memberDTO;
import child.security.httpToxmlTojson;



@Controller
public class SecureController {
	
	@Autowired
	private HttpSession session;
	

	@Autowired
	private memberDAO mdao;
	
	@Autowired
	private dosingDAO dosingDao;

	
	@RequestMapping("/secure.do")
	public ModelAndView secure(){
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("secure/secure");
		
		return mav;
	}
	@RequestMapping("/cctv.do")
	public ModelAndView cctv(@RequestParam(value="cl", required=false)String cl,
			@RequestParam(value="add",required=false, defaultValue="no")String add,
			@RequestParam(value="region",required=false)String region,
			@RequestParam(value="del",required=false, defaultValue="no")String del){
		//("뭐냐"+del+region);
		
		if(add.equals("yes")){
			int count = dosingDao.cctvAddRegion(region);
			
		}
		
		if(del.equals("yes")){
			//("del 로 갑시다.");
			int count = dosingDao.cctvDelRegion(region);
		}
		
		ArrayList<String> list = dosingDao.cctvGetRegionInfo();
		
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("elem", list.size());
		mav.addObject("array", list);
		
		
		mav.setViewName("secure/cctv");
		
		return mav;
	}

	@RequestMapping("/cctv_main.do")
	public ModelAndView cctv_main(
			@RequestParam(value="region",required=false)String region,
			@RequestParam(value="out",required=false, defaultValue="0")String out,
			HttpSession session
			){	
		
		ModelAndView mav = new ModelAndView();
		String id=null;
		String name=null;
		if(out.equals("1")){
		session.invalidate();
		}
		else{
		 id = (String)session.getAttribute("id");
		 name = (String)session.getAttribute("name");
		 mav.addObject("sname",name);
			mav.addObject("sid",id);
		
		}
		
		
		mav.addObject("region",region);
		
		
		mav.setViewName("secure/cctv_main");
		
		return mav;
	}
	
	@RequestMapping(value="/cctv_member_login.do", method=RequestMethod.POST)
	public ModelAndView memberLogin(memberDTO dto,@RequestParam(value="region",required=false)String region, @RequestParam(value="idcheck", required = false)String idcheck, HttpServletResponse response){
		
		dto.setPwd(child.security.Sha256.encrypt(dto.getPwd()));
		
		memberDTO result = mdao.memberLogin(dto);
		String msg = null;
		
		if(result == null || result.getState().equals("off")){
			msg =  "등록된 아이디나 비밀번호가 맞지 않습니다.";
		} else {
			msg = result.getName()+"님 환영합니다!";
			if(idcheck != null && idcheck.equals("on")){
				Cookie cookies = new Cookie("id", dto.getId());
				cookies.setMaxAge(60*60*2);
				response.addCookie(cookies);
			}
			
			
			
			session.setAttribute("name", result.getName());
			session.setAttribute("id", result.getId());
			session.setAttribute("auth", result.getAuth());
			session.setAttribute("idx", result.getIdx());
		}
		ModelAndView mav = new ModelAndView();

		String id = (String)session.getAttribute("id");
		String name = (String)session.getAttribute("name");
		mav.addObject("sname",name);
		mav.addObject("sid",id);
		
		
		

		mav.addObject("sname",name);
		mav.addObject("sid",id);
		mav.addObject("region",region);
		mav.addObject("msg", msg);
		
		mav.setViewName("secure/cctv_main");
		
		return mav;
	}
	
	
	@RequestMapping("/facility.do")
	public ModelAndView facility(){
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("secure/facility");
		
		return mav;
	}

	@RequestMapping("/ajax_map.do")
	public ModelAndView ajax_map(@RequestParam("idx")String idx){
		//("idx: "+idx);
		
		String str="";
		
		if(idx.equals("1")){
		
			str="경찰서";
			
			
		}
		if(idx.equals("2")){
			str="소방서";
			
			
		}
		if(idx.equals("3")){
			str="아동복지센터";
			
			
		}
		if(idx.equals("4")){
			str="주변유치원";
			
			
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("secure/mapinfo");
		
		
		
		
		return mav;
	}
	

		@RequestMapping("/ajax_search.do")
	public ModelAndView ajax_search(@RequestParam("search")String search){
		//("search: "+search);
		
		httpToxmlTojson hxj = new httpToxmlTojson();
		
		//("hxj result: "+hxj.getXmlData(search) );
		
		String search_all = hxj.getXmlData(search);
		ModelAndView mav = new ModelAndView();
		mav.addObject("search", search_all);
		mav.setViewName("secure/mapinfo");
		
		
		
		
		return mav;
	}

}
