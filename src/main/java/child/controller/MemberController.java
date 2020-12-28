package child.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import child.member.model.memberDAO;
import child.member.model.memberDTO;
import child.security.Sha256;
import email.Email;
import email.EmailSender;

@Controller
public class MemberController {
	
	@Autowired
	private memberDAO mdao;
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private EmailSender emailSender;
	
	@Autowired
	private Email email;
	
	@RequestMapping(value="/member_join.do", method=RequestMethod.GET)
	public String memberJoin(){
	 		return "member/member_join";
	 }
	
	@RequestMapping(value="/member_join.do", method=RequestMethod.POST)
	public ModelAndView memberJoinOk(memberDTO dto){
		
		dto.setPwd(child.security.Sha256.encrypt(dto.getPwd()));
		
		if(dto.getNamechild() == null||dto.getNamechild().equals("")||dto.getNamechild().indexOf(" ") >= 0) {
			dto.setAuth(2);   System.out.println("()↑↔↓()"); 
		} else {
			dto.setAuth(1);
		}
		
		int result = mdao.memberJoin(dto);
		
		String msg = result > 0 ? "회원이 되신걸 환영합니다!" : "회원 가입에 실패하였습니다!";
		String url = result > 0 ? "index.do" : "member_join.do?join=false";
			
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("msg", msg);
		mav.addObject("url", url);
		mav.setViewName("msg/msg");
		
		return mav;
	}
	
	@RequestMapping(value="/member_login.do", method=RequestMethod.POST)
	public ModelAndView memberLogin(memberDTO dto, @RequestParam(value="idcheck", required = false)String idcheck, HttpServletResponse response){
		
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
			session.setAttribute("groupchild", result.getGroupchild());
		}
		
		String url = "index.do";
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("msg", msg);
		mav.addObject("url", url);
		mav.setViewName("msg/msg");
		
		return mav;
	}
	
	@RequestMapping("/member_logout.do")
	public ModelAndView memberLogout(){
		session.invalidate();
		
		String msg = "로그아웃 되었습니다.";
		String url = "index.do";
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("msg", msg);
		mav.addObject("url", url);
		mav.setViewName("msg/msg");
		
		return mav;
	}
	
	@RequestMapping("/member_find.do")
	public String memberFindForm(){
		return "member/member_find";
	}
	
	@RequestMapping("/member_find_id.do")
	public ModelAndView memberFindId(memberDTO dto){
		
		String result = mdao.memberFindId(dto);
		String msg = null;
		
		if(result == null){
			msg = "검색한 내용이 없습니다. 다시 확인해 주세요.";
			String url = "member_find.do";
			
			ModelAndView mav = new ModelAndView();
			mav.addObject("msg", msg);
			mav.addObject("url", url);
			mav.setViewName("msg/msg");
			
			return mav;
		} else {
			ModelAndView mav = new ModelAndView();
			mav.addObject("result", result);
			
			mav.setViewName("member/member_find_idresult");
			
			return mav;
		}
		
	}
	
	@RequestMapping("/member_find_pwd.do")
	public ModelAndView memberFindPwd(memberDTO dto) throws Exception{
		
		memberDTO result = mdao.memberFindPwd(dto);
		String msg = null;
		
		if(result == null){
			msg = "검색한 내용이 없습니다. 다시 확인해 주세요.";
			String url = "member_find.do";
			
			ModelAndView mav = new ModelAndView();
			mav.addObject("msg", msg);
			mav.addObject("url", url);
			mav.setViewName("msg/msg");
			
			return mav;
		} else {
			
			String resetPwdString = child.security.RandomString.random(15);
			
			result.setPwd(child.security.Sha256.encrypt(resetPwdString));
			
			mdao.memberResetPwd(result);
			
			int gol = result.getEmail().indexOf("@");
			
			String id = result.getEmail().substring(0, gol-4);
			id = id + "****";
			String emailurl = result.getEmail().substring(gol, result.getEmail().length());
			
			String emailresult = id + emailurl; // id의 맨 뒷글자 4자리를 지우고 * 로 치환한 형태.
			String pw= result.getPwd();
	        
	        if(pw!=null) {
	            email.setContent("새로운 비밀번호는 "+resetPwdString+" 입니다. 로그인 후 새로 설정해주세요!");
	            email.setReceiver(result.getEmail());
	            email.setSubject("[Kindergarten]" + result.getId()+"님 비밀번호 찾기 메일입니다.");
	            emailSender.SendEmail(email);
	        }
			
			ModelAndView mav = new ModelAndView();
			mav.addObject("result", emailresult);
			
			mav.setViewName("member/member_find_pwdresult");
			
			return mav;
		}
		
	}
	
	@RequestMapping(value="member_update.do", method=RequestMethod.GET)
	public ModelAndView memberUpdateForm(){
		
		String id = (String) session.getAttribute("id");
		
		memberDTO result = mdao.memberLoad(id);
		
		if(result == null ){
			
			String msg = "잘못된 접근입니다.";
			String url = "index.do";
			
			ModelAndView mav = new ModelAndView();
			
			mav.addObject("msg", msg);
			mav.addObject("url", url);
			mav.setViewName("msg/msg");
			
			return mav;
			
		} else {
			
			ModelAndView mav = new ModelAndView();
			
			String addr = result.getAddr();

			int addrBasic = addr.indexOf("-");
			
			if(addrBasic > 0){
				
				String addrDetail = addr.substring(addrBasic+2, addr.length());
				addr = addr.substring(0, addrBasic-1);
				
				result.setAddr(addr);
	
				mav.addObject("addrDetail", addrDetail);
				
			}
			
			mav.addObject("result", result);
			mav.setViewName("member/member_edit");
			
			return mav;
			
		}
	}
	
	@RequestMapping(value="member_update_pw.do", method=RequestMethod.POST)
	public ModelAndView memberPwUpdate(@RequestParam("prepwd")String prepwd, @RequestParam("pwd")String pwd, @RequestParam("id") String id){
		
		HashMap<String, String> pwdlist = new HashMap<String, String>();
		
		prepwd = child.security.Sha256.encrypt(prepwd);
		pwd = child.security.Sha256.encrypt(pwd);
		
		pwdlist.put("prepwd", prepwd);
		pwdlist.put("pwd", pwd);
		pwdlist.put("id", id);
		
		String pwdCheck = mdao.memberCheckPwd(pwdlist);
		
		if(pwdCheck == null){
			String msg = "기존 비밀번호가 맞지 않습니다.";
			String url = "member_update.do";
			ModelAndView mav = new ModelAndView();
			mav.addObject("msg", msg);
			mav.addObject("url", url);
			mav.setViewName("msg/msg");
			
			return mav;
		} else {
			
			mdao.memberUpdatePwd(pwdlist);
			
			String msg = "비밀번호를 변경을 완료했습니다.";
			String url = "member_update.do";
			ModelAndView mav = new ModelAndView();
			mav.addObject("msg", msg);
			mav.addObject("url", url);
			mav.setViewName("msg/msg");
			
			return mav;			
		}		
	}
	
	@RequestMapping(value="member_update.do", method=RequestMethod.POST)
	public ModelAndView memberUpdate(memberDTO dto){
		
		int result = mdao.memberUpdate(dto);
		
		String msg = result > 0 ? "수정을 완료하였습니다!" : "수정에 실패하였습니다!";
		String url = "member_update.do";
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("url", url);
		mav.setViewName("msg/msg");
		
		return mav;
	}
	
	@RequestMapping(value="member_out.do", method=RequestMethod.GET)
	public String memberOutForm(){
		return "member/member_out";
	}
	
	@RequestMapping(value="member_out.do", method=RequestMethod.POST)
	public ModelAndView memberOut(memberDTO dto){
		
		dto.setPwd(child.security.Sha256.encrypt(dto.getPwd()));
		
		int result = mdao.memberOut(dto);
		
		if(result > 0){
			session.invalidate();
		}
		
		String msg = result > 0 ? "회원 탈퇴가 완료 되었습니다." : "정보가 맞지 않습니다";
		String url =  result > 0 ? "index.do" : "member_out.do";
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("url", url);
		mav.setViewName("msg/msg");
		
		return mav;
	}
	
	@RequestMapping(value="member_check.do", method=RequestMethod.POST)
	public @ResponseBody HashMap<String, String> memberCheck(@RequestParam("id")String id){
		
		HashMap<String, String> result;
		
		for (int i = 0; i < id.length(); i++) {
			if( !(96 < id.charAt(i) && id.charAt(i) < 123) && !(47 < id.charAt(i) && id.charAt(i) < 58)){
				result = new HashMap<String, String>();
				result.put("result", "missing");
				return result;
			}
		}
		
		result = mdao.memberCheck(id);
		return result;		
	}
	
	@RequestMapping(value="itn_LockScreen.do",method=RequestMethod.GET)
	public String itn_LockScreenForm(){
		return "intranet/itn_lockscreen";
	}
	
	@RequestMapping(value="/itn_LockScreen.do",method=RequestMethod.POST)
	public ModelAndView itn_LockScreen(memberDTO dto,@RequestParam("send_name")String send_name){
		
		dto.setPwd(child.security.Sha256.encrypt(dto.getPwd()));
		
		memberDTO result = mdao.memberLogin(dto);
		String msg = null;
		String url = null;
		
		if(result == null || result.getState().equals("off") || result.getAuth() == 3 || result.getAuth() == 2 || result.getAuth() == 1){
			msg =  "등록된 아이디나 비밀번호가 맞지 않습니다.";
			url = "itn_LockScreen.do?send_name="+send_name;
		} else {
			msg = result.getName()+"님 인트라넷으로 접속합니다.";
			url = "itn_index.do?send_name="+send_name;
		}
		
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("msg", msg);
		mav.addObject("url", url);
		mav.setViewName("msg/msg");
		
		return mav;
	}
}
