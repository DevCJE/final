package child.page;

public class PageModule {
	
	public static String makePage(String pagename, int totalCnt, int listSize, int pageSize, int cp) {
		int totalpage=(totalCnt/listSize)+1;
		if(totalCnt % listSize==0)totalpage--;
		int userGroup=cp/pageSize;
		if(cp % pageSize==0)userGroup--;
		StringBuffer sb = new StringBuffer();
		sb.append("<ul class='pagination'>");
		
		if(userGroup!=0){		
			
			sb.append("<li><a href='");
			sb.append(pagename);
			sb.append("?cp=");
			int temp = (userGroup-1)*pageSize+pageSize;
			sb.append(temp);
			sb.append("'>이전</a></li>");
			
		
		}
			
		for(int i=(userGroup*pageSize+1);i<=(userGroup*pageSize+pageSize);i++){
			
			if(i==cp){
				sb.append("<li class='active'>&nbsp;&nbsp;<a href='");
				sb.append(pagename);
				sb.append("?cp=");
				sb.append(i);
				sb.append("'>");
				sb.append(i);
				sb.append("</a>&nbsp;&nbsp;</li>");
				
			} else {
			
			sb.append("<li>&nbsp;&nbsp;<a href='");
			sb.append(pagename);
			sb.append("?cp=");
			sb.append(i);
			sb.append("'>");
			sb.append(i);
			sb.append("</a>&nbsp;&nbsp;</li>");
			
			}
				
			if(i==totalpage) break;			
		}
	

		if(userGroup!=(totalpage/pageSize-(totalpage%pageSize==0?1:0))){
			
			sb.append("<li><a href='");
			sb.append(pagename);
			sb.append("?cp=");
			int temp = (userGroup+1)*pageSize+1;
			sb.append(temp);
			sb.append("'>다음</a></li></ul>");


			}
		return sb.toString();
	}
	
	public static String makePage(String pagename, int totalCnt, int listSize, int pageSize, int cp, String calenderstart, String calenderend) {
		int totalpage=(totalCnt/listSize)+1;
		if(totalCnt % listSize==0)totalpage--;
		int userGroup=cp/pageSize;
		if(cp % pageSize==0)userGroup--;
		StringBuffer sb = new StringBuffer();
		
		sb.append("<ul class='pagination'>");
		
		if(userGroup!=0){		
			
			sb.append("<li><a href='");
			sb.append(pagename);
			sb.append("?cp=");
			int temp = (userGroup-1)*pageSize+pageSize;
			sb.append(temp);
			sb.append("&calenderstart="+calenderstart);
			sb.append("&calenderend="+calenderend);
			sb.append("'>이전</a></li>");
			
		
		}
			
		for(int i=(userGroup*pageSize+1);i<=(userGroup*pageSize+pageSize);i++){
			
			if(i==cp){
				sb.append("<li class='active'>&nbsp;&nbsp;<a href='");
				sb.append(pagename);
				sb.append("?cp=");
				sb.append(i);
				sb.append("&calenderstart="+calenderstart);
				sb.append("&calenderend="+calenderend);
				sb.append("'>");
				sb.append(i);
				sb.append("</a>&nbsp;&nbsp;</li>");
			} else {
			
			sb.append("<li>&nbsp;&nbsp;<a href='");
			sb.append(pagename);
			sb.append("?cp=");
			sb.append(i);
			sb.append("&calenderstart="+calenderstart);
			sb.append("&calenderend="+calenderend);
			sb.append("'>");
			sb.append(i);
			sb.append("</a>&nbsp;&nbsp;</li>");
			
			}
				
			if(i==totalpage) break;			
		}
	

		if(userGroup!=(totalpage/pageSize-(totalpage%pageSize==0?1:0))){
			
			sb.append("<li><a href='");
			sb.append(pagename);
			sb.append("?cp=");
			int temp = (userGroup+1)*pageSize+1;
			sb.append(temp);
			sb.append("&calenderstart="+calenderstart);
			sb.append("&calenderend="+calenderend);
			sb.append("'>다음</a></li></ul>");


			}
		return sb.toString();
	}
	
	public static String makeSearchPage(String pagename, int totalCnt, int listSize, int pageSize, int cp, String searchgroup, String search) {
		int totalpage=(totalCnt/listSize)+1;
		if(totalCnt % listSize==0)totalpage--;
		int userGroup=cp/pageSize;
		if(cp % pageSize==0)userGroup--;
		StringBuffer sb = new StringBuffer();
		sb.append("<ul class='pagination'>");
		
		if(userGroup!=0){		
			
			sb.append("<li><a href='");
			sb.append(pagename);
			sb.append("?cp=");
			int temp = (userGroup-1)*pageSize+pageSize;
			sb.append(temp);
			sb.append("&searchgroup="+searchgroup);
			sb.append("&search="+search);
			sb.append("'>이전</a></li>");
			
		
		}
			
		for(int i=(userGroup*pageSize+1);i<=(userGroup*pageSize+pageSize);i++){
			
			if(i==cp){
				sb.append("<li class='active'>&nbsp;&nbsp;<a href='");
				sb.append(pagename);
				sb.append("?cp=");
				sb.append(i);
				sb.append("&searchgroup="+searchgroup);
				sb.append("&search="+search);
				sb.append("'>");
				sb.append(i);
				sb.append("</a>&nbsp;&nbsp;</li>");
			} else {
			
			sb.append("<li>&nbsp;&nbsp;<a href='");
			sb.append(pagename);
			sb.append("?cp=");
			sb.append(i);
			sb.append("&searchgroup="+searchgroup);
			sb.append("&search="+search);
			sb.append("'>");
			sb.append(i);
			sb.append("</a>&nbsp;&nbsp;</li>");
			
			}
				
			if(i==totalpage) break;			
		}
	

		if(userGroup!=(totalpage/pageSize-(totalpage%pageSize==0?1:0))){
			
			sb.append("<li><a href='");
			sb.append(pagename);
			sb.append("?cp=");
			int temp = (userGroup+1)*pageSize+1;
			sb.append(temp);
			sb.append("&searchgroup="+searchgroup);
			sb.append("&search="+search);
			sb.append("'>다음</a></li></ul>");


			}
		return sb.toString();
	}
	public static String makeSendNamePage(String pagename, int totalCnt, int listSize, int pageSize, int cp, String send_name) {
		int totalpage=(totalCnt/listSize)+1;
		if(totalCnt % listSize==0)totalpage--;
		int userGroup=cp/pageSize;
		if(cp % pageSize==0)userGroup--;
		StringBuffer sb = new StringBuffer();
		sb.append("<ul class='pagination'>");
		
		if(userGroup!=0){		
			
			sb.append("<li><a href='");
			sb.append(pagename);
			sb.append("?cp=");
			int temp = (userGroup-1)*pageSize+pageSize;
			sb.append(temp);
			sb.append("&send_name="+send_name);
			sb.append("'>이전</a></li>");
			
		
		}
			
		for(int i=(userGroup*pageSize+1);i<=(userGroup*pageSize+pageSize);i++){
			
			if(i==cp){
				
				sb.append("<li class='active'>&nbsp;&nbsp;<a href='");
				sb.append(pagename);
				sb.append("?cp=");
				sb.append(i);
				sb.append("&send_name="+send_name);
				sb.append("'>");
				sb.append(i);
				sb.append("</a>&nbsp;&nbsp;</li>");
				//continue;
				
			} else {
				
			
			sb.append("<li>&nbsp;&nbsp;<a href='");
			sb.append(pagename);
			sb.append("?cp=");
			sb.append(i);
			sb.append("&send_name="+send_name);
			sb.append("'>");
			sb.append(i);
			sb.append("</a>&nbsp;&nbsp;</li>");
			
			}
				
			if(i==totalpage) break;			
		}
	

		if(userGroup!=(totalpage/pageSize-(totalpage%pageSize==0?1:0))){
			
			sb.append("<li><a href='");
			sb.append(pagename);
			sb.append("?cp=");
			int temp = (userGroup+1)*pageSize+1;
			sb.append(temp);
			sb.append("&send_name="+send_name);
			sb.append("'>다음</a></li></ul>");


			}
		return sb.toString();
	}
	public static String makeRecvNamePage(String pagename, int totalCnt, int listSize, int pageSize, int cp, String recv_name) {
		int totalpage=(totalCnt/listSize)+1;
		if(totalCnt % listSize==0)totalpage--;
		int userGroup=cp/pageSize;
		if(cp % pageSize==0)userGroup--;
		StringBuffer sb = new StringBuffer();
		sb.append("<ul class='pagination'>");
		
		if(userGroup!=0){		
			
			sb.append("<li><a href='");
			sb.append(pagename);
			sb.append("?cp=");
			int temp = (userGroup-1)*pageSize+pageSize;
			sb.append(temp);
			sb.append("&recv_name="+recv_name);
			sb.append("'>이전</a></li>");
			
		
		}
			
		for(int i=(userGroup*pageSize+1);i<=(userGroup*pageSize+pageSize);i++){
			
			if(i==cp){
				sb.append("<li class='active'>&nbsp;&nbsp;<a href='");
				sb.append(pagename);
				sb.append("?cp=");
				sb.append(i);
				sb.append("&recv_name="+recv_name);
				sb.append("'>");
				sb.append(i);
				sb.append("</a>&nbsp;&nbsp;</li>");
				//continue;
			} else {
			sb.append("<li>&nbsp;&nbsp;<a href='");
			sb.append(pagename);
			sb.append("?cp=");
			sb.append(i);
			sb.append("&recv_name="+recv_name);
			sb.append("'>");
			sb.append(i);
			sb.append("</a>&nbsp;&nbsp;</li>");
			}
				
			if(i==totalpage) break;			
		}
	

		if(userGroup!=(totalpage/pageSize-(totalpage%pageSize==0?1:0))){
			
			sb.append("<li><a href='");
			sb.append(pagename);
			sb.append("?cp=");
			int temp = (userGroup+1)*pageSize+1;
			sb.append(temp);
			sb.append("&recv_name="+recv_name);
			sb.append("'>다음</a></li></ul>");


			}
		return sb.toString();
	}
	public static String makeNoticePage(String pagename, int totalCnt, int listSize, int pageSize, int cp, String select, String keyword) {
		int totalpage=(totalCnt/listSize)+1;
		if(totalCnt % listSize==0)totalpage--;
		int userGroup=cp/pageSize;
		if(cp % pageSize==0)userGroup--;
		StringBuffer sb = new StringBuffer();
		sb.append("<ul class='pagination'>");
		
		if(userGroup!=0){		
			
			sb.append("<li><a href='");
			sb.append(pagename);
			sb.append("?cp=");
			int temp = (userGroup-1)*pageSize+pageSize;
			sb.append(temp);
			sb.append("&select="+select);
			sb.append("&keyword="+keyword);
			sb.append("'>이전</a></li>");
			
		
		}
			
		for(int i=(userGroup*pageSize+1);i<=(userGroup*pageSize+pageSize);i++){
			
			if(i==cp){
				sb.append("<li class='active'>&nbsp;&nbsp;<a href='");
				sb.append(pagename);
				sb.append("?cp=");
				sb.append(i);
				sb.append("&select="+select);
				sb.append("&keyword="+keyword);
				sb.append("'>");
				sb.append(i);
				sb.append("</a>&nbsp;&nbsp;</li>");
				//continue;
			} else {
			sb.append("<li>&nbsp;&nbsp;<a href='");
			sb.append(pagename);
			sb.append("?cp=");
			sb.append(i);
			sb.append("&select="+select);
			sb.append("&keyword="+keyword);
			sb.append("'>");
			sb.append(i);
			sb.append("</a>&nbsp;&nbsp;</li>");
			}
				
			if(i==totalpage) break;			
		}
	

		if(userGroup!=(totalpage/pageSize-(totalpage%pageSize==0?1:0))){
			
			sb.append("<li><a href='");
			sb.append(pagename);
			sb.append("?cp=");
			int temp = (userGroup+1)*pageSize+1;
			sb.append(temp);
			sb.append("&select="+select);
			sb.append("&keyword="+keyword);
			sb.append("'>다음</a></li></ul>");


			}
		return sb.toString();
	}
	
	public static String albummakeSearchPage(String pagename, int totalCnt, int listSize, int pageSize, int cp, String keyword, String selectBox) {
		int totalpage=(totalCnt/listSize)+1;
		if(totalCnt % listSize==0)totalpage--;
		int userGroup=cp/pageSize;
		if(cp % pageSize==0)userGroup--;
		StringBuffer sb = new StringBuffer();
		sb.append("<ul class='pagination'>");
		
		if(userGroup!=0){		
			
			sb.append("<li><a href='");
			sb.append(pagename);
			sb.append("?cp=");
			int temp = (userGroup-1)*pageSize+pageSize;
			sb.append(temp);
			sb.append("&keyword="+keyword);
			sb.append("&selectBox="+selectBox);
			sb.append("'>이전</a></li>");
			
		
		}
			
		for(int i=(userGroup*pageSize+1);i<=(userGroup*pageSize+pageSize);i++){
			
			
			if(i==cp){
				sb.append("<li class='active'>&nbsp;&nbsp;<a href='");
				sb.append(pagename);
				sb.append("?cp=");
				sb.append(i);
				sb.append("&keyword="+keyword);
				sb.append("&selectBox="+selectBox);
				sb.append("'>");
				sb.append(i);
				sb.append("</a>&nbsp;&nbsp;</li>");
				//continue;
			} else {
			sb.append("<li>&nbsp;&nbsp;<a href='");
			sb.append(pagename);
			sb.append("?cp=");
			sb.append(i);
			sb.append("&keyword="+keyword);
			sb.append("&selectBox="+selectBox);
			sb.append("'>");
			sb.append(i);
			sb.append("</a>&nbsp;&nbsp;</li>");
			}
				
			if(i==totalpage) break;			
		}
	

		if(userGroup!=(totalpage/pageSize-(totalpage%pageSize==0?1:0))){
			
			sb.append("<li><a href='");
			sb.append(pagename);
			sb.append("?cp=");
			int temp = (userGroup+1)*pageSize+1;
			sb.append(temp);
			sb.append("&keyword="+keyword);
			sb.append("&selectBox="+selectBox);
			sb.append("'>다음</a></li></ul>");


			}
		return sb.toString();
	}
	public static String notemakeSearchPage(String pagename, int Ftotalcnt, int listSize, int pageSize, int cp, String keyword) {
		int totalpage=(Ftotalcnt/listSize)+1;
		if(Ftotalcnt % listSize==0)totalpage--;
		int userGroup=cp/pageSize;
		if(cp % pageSize==0)userGroup--;
		StringBuffer sb = new StringBuffer();
		sb.append("<ul class='pagination'>");
		
		if(userGroup!=0){		
			
			sb.append("<li><a href='");
			sb.append(pagename);
			sb.append("?cp=");
			int temp = (userGroup-1)*pageSize+pageSize;
			sb.append(temp);
			sb.append("&keyword="+keyword);
			sb.append("'>이전</a></li>");
			
		
		}
			
		for(int i=(userGroup*pageSize+1);i<=(userGroup*pageSize+pageSize);i++){
			
			if(i==cp){
				sb.append("<li class='active'>&nbsp;&nbsp;<a href='");
				sb.append(pagename);
				sb.append("?cp=");
				sb.append(i);
				sb.append("&keyword="+keyword);
				sb.append("'>");
				sb.append(i);
				sb.append("</a>&nbsp;&nbsp;</li>");
				//continue;
			} else {
			sb.append("<li>&nbsp;&nbsp;<a href='");
			sb.append(pagename);
			sb.append("?cp=");
			sb.append(i);
			sb.append("&keyword="+keyword);
			sb.append("'>");
			sb.append(i);
			sb.append("</a>&nbsp;&nbsp;</li>");
			}
				
			if(i==totalpage) break;			
		}
	

		if(userGroup!=(totalpage/pageSize-(totalpage%pageSize==0?1:0))){
			
			sb.append("<li><a href='");
			sb.append(pagename);
			sb.append("?cp=");
			int temp = (userGroup+1)*pageSize+1;
			sb.append(temp);
			sb.append("&keyword="+keyword);
			sb.append("'>다음</a></li></ul>");


			}
		return sb.toString();
	}public static String notemakeDateSearchPage(String pagename, int Dtotalcnt, int listSize, int pageSize, int cp, String calendarstart,String calenderend) {
		int totalpage=(Dtotalcnt/listSize)+1;
		if(Dtotalcnt % listSize==0)totalpage--;
		int userGroup=cp/pageSize;
		if(cp % pageSize==0)userGroup--;
		StringBuffer sb = new StringBuffer();
		sb.append("<ul class='pagination'>");
		
		if(userGroup!=0){		
			
			sb.append("<li><a href='");
			sb.append(pagename);
			sb.append("?cp=");
			int temp = (userGroup-1)*pageSize+pageSize;
			sb.append(temp);
			sb.append("&calenderstart="+calendarstart);
			sb.append("&calenderend="+calenderend);
			sb.append("'>이전</a></li>");
			
		
		}
			
		for(int i=(userGroup*pageSize+1);i<=(userGroup*pageSize+pageSize);i++){
			
			if(i==cp){
				sb.append("<li class='active'>&nbsp;&nbsp;<a href='");
				sb.append(pagename);
				sb.append("?cp=");
				sb.append(i);
				sb.append("&calenderstart="+calendarstart);
				sb.append("&calenderend="+calenderend);
				sb.append("'>");
				sb.append(i);
				sb.append("</a>&nbsp;&nbsp;</li>");
				//continue;
			} else {
			sb.append("<li>&nbsp;&nbsp;<a href='");
			sb.append(pagename);
			sb.append("?cp=");
			sb.append(i);
			sb.append("&calenderstart="+calendarstart);
			sb.append("&calenderend="+calenderend);
			sb.append("'>");
			sb.append(i);
			sb.append("</a>&nbsp;&nbsp;</li>");
			}
				
			if(i==totalpage) break;			
		}
	

		if(userGroup!=(totalpage/pageSize-(totalpage%pageSize==0?1:0))){
			
			sb.append("<li><a href='");
			sb.append(pagename);
			sb.append("?cp=");
			int temp = (userGroup+1)*pageSize+1;
			sb.append(temp);
			sb.append("&calenderstart="+calendarstart);
			sb.append("&calenderend="+calenderend);
			sb.append("'>다음</a></li></ul>");


			}
		return sb.toString();
	}
}
