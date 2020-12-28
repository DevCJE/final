package child.controller;

import java.util.*;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.context.request.SessionScope;
import org.springframework.web.servlet.ModelAndView;

import child.member.model.memberDTO;
import child.roll.model.rollDAO;
import child.roll.model.rollDTO;

@Controller
public class RollbookController {

	@Autowired
	private rollDAO rdao;
	
	@RequestMapping("/rollList.do")
	public ModelAndView rollList(@RequestParam("roll_class") String roll_class,HttpSession session){
		
		 java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
		 String today = formatter.format(new java.util.Date()); 
		
		List<memberDTO> list= rdao.rollList(roll_class);
		ModelAndView mav=new ModelAndView();
		mav.addObject("list",list);
		mav.addObject("today",today);
		mav.setViewName("intranet/rollbook/child_rollList");
		return mav;
	}
	
	@RequestMapping("/aja.do")
	public ModelAndView ajax(
			@RequestParam("idx")String idx
			){
	
	ModelAndView mav = new ModelAndView();
		
		mav.addObject("elem", idx);
		
		
		mav.setViewName("intranet/rollbook/Json/rollbackJson");
		return mav;
	}
	
	@RequestMapping("/ajaa.do")
	public ModelAndView ajaxa(rollDTO dto ,
								@RequestParam("idx")String idx,
								@RequestParam("roll_info")String roll_info, @RequestParam(value="date" ,required=true)String date,
								@RequestParam(value="roll_class",required=true)String roll_class)	{
		
		//tln(roll_class);
		
	
			int result =rdao.rollUpdate(dto);
			int at = rdao.rollInfo(date, roll_class);
			int nat=rdao.rollInfo2(date, roll_class);
			int sick=rdao.rollInfo3(date, roll_class);
			int acc=rdao.rollInfo4(date, roll_class);
			int enter=rdao.rollInfo5(date, roll_class);
			int out=rdao.rollInfo6(date, roll_class);
			
			ModelAndView mav = new ModelAndView();
				
			ArrayList<String> arr = new ArrayList<String>();
			arr.add(idx);
			arr.add(roll_info);
			
		
			mav.addObject("arr", arr);
			
			mav.addObject("at", at);
			mav.addObject("nat",nat);
			mav.addObject("sick",sick);
			mav.addObject("acc",acc);
			mav.addObject("enter",enter);
			mav.addObject("out",out);
			mav.setViewName("intranet/rollbook/Json/rollbackJson2");
			
			return mav;
		}
	
	
	@RequestMapping(value="/rollSave.do", method=RequestMethod.POST)
	public ModelAndView rollSave(@RequestParam("member_idx")List<Integer>member_idx, @RequestParam("roll_name")List<String>roll_name, @RequestParam("roll_class")List<String>roll_class,@RequestParam("roll_info")List<Integer>roll_info){

		/*
		 * List<rollDTO> 로 받아올려고 햇으나 안됫기 때문에 각 패러미터를 List 배열을 통해서 받앗음
		 * 이를 dtos 라는 rolldto 로 컬렉션 되어있는 List에 for문을 돌려서
		 * 각 패러미터를 rolldto 한 객체에 set 을 한 뒤에 다시 dtos 에 넣는 방식을 통하여서
		 * List<rollDTO> 를 대체하였음.
		 */
		
		List<rollDTO> dtos = new ArrayList<rollDTO>();
		
		for (int i = 0; i < member_idx.size(); i++) {
			rollDTO dto = new rollDTO();
			
			dto.setMember_idx(member_idx.get(i));
			dto.setRoll_name(roll_name.get(i));
			dto.setRoll_class(roll_class.get(i));
			dto.setRoll_info(roll_info.get(i)); //지금 안받아짐 나중에 바꿀 것 //해결
			
			dtos.add(dto);
		}
		
		/*
		 * 해당 List를 rollsave 메소드로 보냈고 rollsave 메소드에서는 list의 크기만큼 for문을 수행하면서 insert 한다.
		 * 너는 저기 위에 보이는 저것만 값 받아올 수 있게 하면 됌
		 */
		
		int result =rdao.rollSave(dtos);
		String msg=result>0?"저장되었습니다.":"실패했습니다.";
		ModelAndView mav= new ModelAndView();
		mav.addObject("msg",msg);
		mav.addObject("url","rollSave.do");
		mav.setViewName("msg/msg");
		return mav;
	}
	@RequestMapping(value="/rollSave.do", method=RequestMethod.GET )
	public ModelAndView rollsaveList(HttpSession session){
		
		java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
		String today = formatter.format(new java.util.Date()); 
		
		List<rollDTO> list=rdao.rollSaveList();
		ModelAndView mav= new ModelAndView();
		 if(session.getAttribute("groupchild")!=null){
	         String groupchild=(String)session.getAttribute("groupchild");
	         String url="rollSerach.do?date="+today+"&roll_class="+groupchild;
	         mav.addObject("list",list);
	 		mav.addObject("date",today);
	 		mav.addObject("url",url);
	 		mav.setViewName("msg/msg4");
		 }else{
		String url="rollSerach.do?date="+today+"&roll_class=all";
		mav.addObject("list",list);
		mav.addObject("date",today);
		mav.addObject("url",url);
		mav.setViewName("msg/msg4");
		}
		return mav;
	}
	@RequestMapping("/rollSerach.do")
	public ModelAndView rollSerach(@RequestParam(value="date" ,required=true)String date,
			@RequestParam(value="roll_class",required=true)String roll_class,HttpSession session){
		
		
		
		//tln(roll_class);
		java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
		String today = formatter.format(new java.util.Date()); 
		
		List<rollDTO> list=rdao.rollDateSer(date, roll_class);
		
		session.setAttribute("date", date);
		session.setAttribute("roll_class", roll_class);
		
		HashMap<String, Object> map= new HashMap<String, Object>();
		map.put("date", date);
		map.put("roll_class", roll_class.toLowerCase());
		
		int totalpeople=list.size();
		
		int count=rdao.rollInfo(date, roll_class);
		int count2=rdao.rollInfo2(date, roll_class);
		int count3=rdao.rollInfo3(date, roll_class);
		int count4=rdao.rollInfo4(date, roll_class);
		int count5=rdao.rollInfo5(date, roll_class);
		int count6=rdao.rollInfo6(date, roll_class);
		
		ModelAndView mav=new ModelAndView();

		mav.addObject("list",list);
		mav.addObject("today",today);
		mav.addObject("totalpeople",totalpeople);
		mav.addObject("count",count);
		mav.addObject("count2",count2);
		mav.addObject("count3",count3);
		mav.addObject("count4",count4);
		mav.addObject("count5",count5);
		mav.addObject("count6",count6);
		
		mav.addObject("CL",roll_class);
		
		
		mav.setViewName("intranet/rollbook/child_rollSer");
		return mav;
		
	}
	@RequestMapping("/infoSerach.do")
	public ModelAndView infoSer(@RequestParam(value="date" ,required=true)String date,
			@RequestParam(value="roll_class",required=true)String roll_class, @RequestParam(value="roll_info",required=true) int roll_info,
			HttpSession session
			){
		
		
		
		java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
		String today = formatter.format(new java.util.Date());
		
		List<rollDTO> list=rdao.infoSer(date, roll_class, roll_info);
		
		session.setAttribute("date", date);
		session.setAttribute("roll_class", roll_class);
		
		
		HashMap<String, Object> map= new HashMap<String, Object>();
		map.put("date", date);
		map.put("roll_class", roll_class.toLowerCase());
		map.put("roll_info", roll_info);
		
		int totalpeople=list.size();
		
		int count=rdao.rollInfo(date, roll_class);
		int count2=rdao.rollInfo2(date, roll_class);
		int count3=rdao.rollInfo3(date, roll_class);
		int count4=rdao.rollInfo4(date, roll_class);
		int count5=rdao.rollInfo5(date, roll_class);
		int count6=rdao.rollInfo6(date, roll_class);
		
		ModelAndView mav=new ModelAndView();

		mav.addObject("list",list);
		mav.addObject("today",today);
		mav.addObject("totalpeople",totalpeople);
		mav.addObject("count",count);
		mav.addObject("count2",count2);
		mav.addObject("count3",count3);
		mav.addObject("count4",count4);
		mav.addObject("count5",count5);
		mav.addObject("count6",count6);
		
		mav.setViewName("intranet/rollbook/child_infoSer");
		return mav;
		
		
	}
	
	
}
