package child.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import child.album.model.*;


@Controller
public class AlbumController {
	
	@Autowired
	private AlbumDAO albumDao;
	@Autowired
	private AlbumCommentDAO albumCommentDao;
	@Autowired
	private HttpSession session;
	
	private String subresult;
		
	//단일파일업로드
	@RequestMapping("/photoUpload.do")
	public String photoUpload(HttpServletRequest request, PhotoVo vo){
		 System.out.println("photoUpload");
	    String callback = vo.getCallback();
	    String callback_func = vo.getCallback_func();
	    String file_result = "";
	    try {
	        if(vo.getFiledata() != null && vo.getFiledata().getOriginalFilename() != null && !vo.getFiledata().getOriginalFilename().equals("")){
	            //파일이 존재하면
	            String original_name = vo.getFiledata().getOriginalFilename();
	            String ext = original_name.substring(original_name.lastIndexOf(".")+1);
	            //파일 기본경로
	            String defaultPath = request.getSession().getServletContext().getRealPath("/");
	            //파일 기본경로 _ 상세경로
	            int defaultPathsub = defaultPath.length();
	            String path = defaultPath + "resource" + File.separator + "photo_upload" + File.separator;              
	            File file = new File(path);
	            System.out.println("path:"+path);
	            //디렉토리 존재하지 않을경우 디렉토리 생성
	            if(!file.exists()) {
	                file.mkdirs();
	            }
	            //서버에 업로드 할 파일명(한글문제로 인해 원본파일은 올리지 않는것이 좋음)
	            String realname = UUID.randomUUID().toString() + "." + ext;
	        ///////////////// 서버에 파일쓰기 ///////////////// 
	            vo.getFiledata().transferTo(new File(path+realname));
	            file_result += "&bNewLine=true&sFileName="+original_name+"&sFileURL=resource/photo_upload/"+realname;
	        } else {
	            file_result += "&errstr=error";
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return "redirect:" + callback + "?callback_func="+callback_func+file_result;
	}
	
	//다중파일업로드
	@RequestMapping("/multiplePhotoUpload.do")
	public void multiplePhotoUpload(HttpServletRequest request, HttpServletResponse response){
	    try {
	         //파일정보
	         String sFileInfo = "";
	         //파일명을 받는다 - 일반 원본파일명
	         String filename = request.getHeader("file-name");
	         //파일 확장자
	         String filename_ext = filename.substring(filename.lastIndexOf(".")+1);
	         //확장자를소문자로 변경
	         filename_ext = filename_ext.toLowerCase();
	         //파일 기본경로
	         String dftFilePath = request.getSession().getServletContext().getRealPath("/");
	         int defaultPathsub = dftFilePath.length();
	         //파일 기본경로 _ 상세경로
	         String filePath = dftFilePath + "resource" + File.separator + "photo_upload" + File.separator;
	         
	         File file = new File(filePath);
	         if(!file.exists()) {
	            file.mkdirs();
	         }
	         
	         String realFileNm = "";
	         SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
	         String today= formatter.format(new java.util.Date());
	         realFileNm = today+UUID.randomUUID().toString() + filename.substring(filename.lastIndexOf("."));
	         String rlFileNm = filePath + realFileNm;
	         ///////////////// 서버에 파일쓰기 ///////////////// 
	         InputStream is = request.getInputStream();
	         OutputStream os=new FileOutputStream(rlFileNm);
	         int numRead;
	         byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
	         while((numRead = is.read(b,0,b.length)) != -1){
	            os.write(b,0,numRead);
	         }
	         if(is != null) {
	            is.close();
	         }
	         os.flush();
	         os.close();
	         
	         
	         ///////////////// imgur에 파일 올리기 /////////////////
	         
	         File imagefile = new File(filePath+realFileNm);
	         
	         imagefile = new File(imagefile.getAbsolutePath());
	         
	         String result = child.imgur.ImgurImageUpload.imgurUpload(imagefile);
	         
	         int startImg = result.indexOf("id");
	         int endImg = result.indexOf("title");
	         
	         subresult = result.substring(startImg+5, endImg-3);
	         
	         subresult = "http://i.imgur.com/"+subresult+".png";
	         
	         System.out.println(subresult);
	         
	         ///////////////// 서버에 파일쓰기 /////////////////
	         // 정보 출력
	         sFileInfo += "&bNewLine=true";
	         // img 태그의 title 속성을 원본파일명으로 적용시켜주기 위함
	         sFileInfo += "&sFileName="+ filename;;
	         sFileInfo += "&sFileURL="+subresult;
	         PrintWriter print = response.getWriter();
	         print.print(sFileInfo);
	         print.flush();
	         print.close();
	         
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}
	
	
	@RequestMapping("/albumList.do")
	public ModelAndView albumList(@RequestParam(value = "cp", defaultValue = "1") int cp){
		
		if(session.getAttribute("id")==null){
			
			ModelAndView mav= new ModelAndView();
			String msg="로그인 후 이용해주세요.";
			mav.addObject("msg",msg);
			mav.addObject("url","index.do");
			
			mav.setViewName("msg/msg");
			return mav;
			
		}else{
		
		int totalCnt = albumDao.getTotalCnt();
		int listSize = 6;
		int pageSize = 6;
		String pageStr = child.page.PageModule.makePage("albumList.do", totalCnt, listSize, pageSize, cp);
				
		List<AlbumDTO> list = albumDao.AlbumList(cp, listSize);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("pagStr", pageStr);
		mav.setViewName("album/albumList");
		
		return mav;
		}
	}
	
	@RequestMapping(value = "/albumWrite.do", method = RequestMethod.GET)
	public String albumWriteForm(){
		
		return "album/albumWrite";
	}
	
	@RequestMapping(value = "/albumWrite.do", method = RequestMethod.POST)
	public ModelAndView albumWrite(AlbumDTO adto){
		
		if(subresult !=null){
			adto.setAlbum_photo(subresult);
		} else {
			adto.setAlbum_photo("no image");
		}
		
		
		int result = albumDao.AlbumWrite(adto);
		String msg = result>0?" 앨범작성 완료!" : "앨범작성 실패!";
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("url", "albumList.do");
		mav.setViewName("msg/msg");
		
		return mav;	
	}

	@RequestMapping("/albumContent.do")
	public ModelAndView albumContent(@RequestParam(value = "idx", defaultValue ="0")  int idx){
		
		AlbumDTO dto = albumDao.AlbumContent(idx);
		List<AlbumDTO> content_List = albumDao.AlbumContentList(idx);
		List<AlbumDTO> contentList = new ArrayList<AlbumDTO>();
		int temp[] = new int[3];
		for(int i=0; i<3; i++){
			temp[i] = (int)(Math.random()*content_List.size());
		}
		for(int i=0; i<3; i++){
			for(int j=0; j<i; j++){
				if(temp[i] == temp[j] && i!=j){
					temp[j] = (int)(Math.random()*3);
					i=0;//i=-1;
					break;
				}
			}
		}
		for(int i=0; i<3; i++){
			AlbumDTO adto = content_List.get(temp[i]);
			contentList.add(adto);
		}
		
		
		List<AlbumCommentDTO> albumCmt = albumCommentDao.AlbumCmtList(idx);
		
		ModelAndView mav = new ModelAndView();
		
		if(dto == null){			
			mav.addObject("msg", "앨범이 삭제 되었거나  잘못된 접근입니다.");
			mav.addObject("url", "albumList.do");
			mav.setViewName("msg/msg");
			
		
		} else {		
			mav.addObject("dto", dto);
			mav.addObject("albumCmt", albumCmt);
			mav.addObject("contentList", contentList);
			mav.setViewName("album/albumContent");
		}
		
		return mav;
	}
	
	@RequestMapping("/albumDel.do")
	public ModelAndView albumDel(@RequestParam(value = "idx", defaultValue ="0") int idx){
		
		int result = albumDao.AlbumDel(idx);
		String msg = result>0?" 앨범삭제!" : "다시 삭제 해주세요!";
				
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("url", "albumList.do");
		mav.setViewName("msg/msg");
		
		return mav;
	
	}
	
	@RequestMapping("/albumCmtWrite.do")
	public ModelAndView albumCmtWrite(AlbumCommentDTO acmtdto,AlbumDTO dto){
		
	      int result=albumCommentDao.AlbumCmtWrite(acmtdto, dto);
	      
	      String msg=result>0?"댓글작성성공!":"댓글달기실패!";
	      
	      ModelAndView mav = new ModelAndView();
	      mav.addObject("msg",msg);
	      mav.addObject("url","albumContent.do?idx="+acmtdto.getAlbum_idx()+"&album_idx="+dto.getIdx());
	      mav.setViewName("msg/msg");
	      
	      return mav;      
	}
	
	@RequestMapping("/albumCmtDel.do")
	public ModelAndView albumCmtDel(@RequestParam(value = "idx", defaultValue ="0") int idx,
									@RequestParam("album_idx") int album_idx){
		
	      int result=albumCommentDao.AlbumCmtDel(idx);	      
	      String msg=result>0?"댓글삭제성공!":"댓글삭제실패!";
	      
	      ModelAndView mav = new ModelAndView();
	      mav.addObject("msg",msg);
	      mav.addObject("url","albumContent.do?idx="+album_idx);
	      mav.setViewName("msg/msg");
	
	      return mav;
	}
		
	@RequestMapping("/albumUpdateForm.do")
	public ModelAndView albumUpdateForm(@RequestParam("idx") int idx){
		
		AlbumDTO adto = albumDao.AlbumUpdate(idx);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("dto", adto);
		mav.setViewName("album/albumUpdateForm");
		
		return mav;
	}
	
	@RequestMapping("/albumUpdate.do")
	public ModelAndView albumUpdate(AlbumDTO adto){
		
		int result = albumDao.AlbumUpdateOk(adto);
		String msg = result > 0? "앨범수정성공!" : "앨점수정 실패!";
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("url", "albumList.do");
		mav.addObject("msg", msg);
		mav.setViewName("msg/msg");
		
		return mav;	
	}
	
	@RequestMapping("/albumFind.do")
	public ModelAndView alubmFind(@RequestParam(value = "cp", defaultValue = "1")int cp, 
									 @RequestParam("keyword")String keyword, 
									 @RequestParam("selectBox")String selectBox){
		
		int findTotalCnt = albumDao.getFindTotalCnt(keyword, selectBox);
		int listSize = 4;
		int pageSize = 5;
		String pageFindStr = child.page.PageModule.albummakeSearchPage("albumFind.do", findTotalCnt, listSize, pageSize, cp, keyword, selectBox);
		List<AlbumDTO> albumFind = albumDao.AlbumFind(cp, listSize, keyword, selectBox);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("albumFind", albumFind);
		mav.addObject("pageFindStr",pageFindStr);
		mav.setViewName("album/albumFind");
		
		return mav;
	}
	
	@RequestMapping("/albumCalender.do")
	public ModelAndView alubmCalender(@RequestParam(value = "cp", defaultValue = "1")int cp, 
								      @RequestParam("calenderstart") String calenderstart, 
								      @RequestParam("calenderend")String calenderend ){
		
		int calenderTotalCnt = albumDao.AlbumCalenderTotalCnt(calenderstart, calenderend);
		int listSize = 6;
		int pageSize = 5;
		
		String pageCalenderStr = child.page.PageModule.makePage("albumCalender.do", calenderTotalCnt, listSize, pageSize, cp, calenderstart, calenderend);
		List<AlbumDTO> albumcalender = albumDao.AlbumCalender(cp, listSize, calenderstart, calenderend);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("albumcalender", albumcalender);
		mav.addObject("pageCalenderStr",pageCalenderStr);
		mav.setViewName("album/albumCalender");
		
		return mav;
	}	
}
