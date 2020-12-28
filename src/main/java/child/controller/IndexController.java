package child.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ibm.icu.text.DecimalFormat;

import child.document.model.docDAO;
import child.document.model.docDTO;
import child.itnmsg.model.*;
import child.member.admin.model.AdminDAO;
import child.member.model.memberDTO;
import child.roll.model.rollDAO;

@Controller
public class IndexController {

   @Autowired
   private itnMsgDAO imDao;
   
   //태현-start
   @Autowired
   public AdminDAO adminDao;
   //태현-end
   
   @Autowired
   private rollDAO rdao;
   @Autowired
   private HttpSession session;
   
   //나라 dao
   @Autowired
   private docDAO docDao;

   
   @RequestMapping("/index.do")
   public ModelAndView index(){
      ModelAndView mav = new ModelAndView();
      mav.setViewName("index");
      
      return mav;
   }
   
   @RequestMapping(value="/itn_index.do")
   public ModelAndView itn_index(@RequestParam("send_name")String send_name,         
                          @RequestParam(value = "cp", defaultValue = "1") int cp
                          ,HttpSession session){

   int count=imDao.itnMsgViews(send_name);
   
   session.setAttribute("msgcount", count);
         
     /**출석부*/
      
      int attPer=rdao.attPer();
      int attenden=rdao.attenden();
      int absent=rdao.absent();
      int guitar=rdao.guitar();
      
      int WeattPer=rdao.WeattPer();
      int Weattenden=rdao.Weattenden();
      int Weabsent=rdao.Weabsent();
      int Weguitar=rdao.Weguitar();
      
      int MoattPer=rdao.MoattPer();
      int Moattenden=rdao.Moattenden();
      int Moabsent=rdao.Moabsent();
      int Moguitar=rdao.Moguitar();
      
      int BoattPer=rdao.BoattPer();
      int Boattenden=rdao.Boattenden();
      int Boabsent=rdao.Boabsent();
      int Boguitar=rdao.Boguitar();
      
      /**출석부*/
         
   //태현-start
   int totalCnt = adminDao.chNogetTotal();
   int listSize = 5;
   int pageSize = 5;
   String pageStr = child.page.PageModule.makePage("itn_index.do", totalCnt, listSize, pageSize, cp);
   List<memberDTO> list = adminDao.chNo_adminForm(cp, listSize);
   ModelAndView mav=new ModelAndView();      
   mav.addObject("list",list);
   mav.addObject("pagStr", pageStr);
   //태현-end
   
    /**출석부*/
      if(attPer!=0){
         double atten=((double)attenden / (double)attPer)*100;
         double abs=((double)absent/(double)attPer)*100;
         double gui=((double)guitar/(double)attPer)*100;
         mav.addObject("atten",atten);
         mav.addObject("abs",abs);
         mav.addObject("gui",gui);
         mav.addObject("attPer",attPer);
         }
      
      if(WeattPer!=0){
      double Weatten=((double)Weattenden / (double)WeattPer)*100;
      double Weabs=((double)Weabsent/(double)WeattPer)*100;
      double Wegui=((double)Weguitar/(double)WeattPer)*100;
      
      mav.addObject("Weatten",Weatten);
      mav.addObject("Weabs",Weabs);
      mav.addObject("Wegui",Wegui);
      mav.addObject("WeattPer",WeattPer);
     
      }
      
      if(MoattPer!=0){
      double Moatten=((double)Moattenden / (double)MoattPer)*100;
      double Moabs=((double)Moabsent/(double)MoattPer)*100;
      double Mogui=((double)Moguitar/(double)MoattPer)*100;
      
      mav.addObject("Moatten",Moatten);
      mav.addObject("Moabs",Moabs);
      mav.addObject("Mogui",Mogui);
      mav.addObject("MoattPer",MoattPer);
      }
      
      if(session.getAttribute("groupchild")!=null){
         String groupchild=(String)session.getAttribute("groupchild");
         
         int MyattPer=rdao.MyattPer(groupchild);
         int Myattenden=rdao.Myattenden(groupchild);
         int Myabsent=rdao.Myabsent(groupchild);
         int Myguitar=rdao.Myguitar(groupchild);

      
      if(MyattPer!=0){
         double Myatten=((double)Myattenden/(double)MyattPer)*100;
         double Myabs=((double)Myabsent/(double)MyattPer)*100;
         double Mygui=((double)Myguitar/(double)MyattPer)*100;
         mav.addObject("Myatten",Myatten);
         mav.addObject("Myabs",Myabs);
         mav.addObject("Mygui",Mygui);
         mav.addObject("MyattPer",MyattPer);
      }
      }else if(session.getAttribute("groupchild")==null){
         double Boatten=((double)Boattenden / (double)BoattPer)*100;
         double Boabs=((double)Boabsent/(double)BoattPer)*100;
         double Bogui=((double)Boguitar/(double)BoattPer)*100;
         mav.addObject("Boatten",Boatten);
         mav.addObject("Boabs",Boabs);
         mav.addObject("Bogui",Bogui);
         mav.addObject("BoattPer",BoattPer);
       
      }
      
      /**출석부*/
               
   
   ///////////////////////////////////////////////////나라 소스 시작
   List<docDTO> list2 = docDao.listCall(send_name);
   
   mav.addObject("doclist",list2);
   ////////////////////나라 끝
               
   mav.addObject("count", count);
   mav.setViewName("intranet/itn_index");
   
   return mav;
   
   }
   
   @RequestMapping(value="/itn_lockscreen.do")
   public String itn_lockscreen(){
      return "intranet/itn_lockscreen";
   }
}