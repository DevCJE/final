package child.page;

public class Paging {
	
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
			sb.append("&cp=");
			int temp = (userGroup-1)*pageSize+pageSize;
			sb.append(temp);
			sb.append("'>이전</a></li>");
			
		
		}
			
		for(int i=(userGroup*pageSize+1);i<=(userGroup*pageSize+pageSize);i++){
			
			if(i==cp){
				sb.append("<li class='active'>&nbsp;&nbsp;<a href='");
				sb.append(pagename);
				sb.append("&cp=");
				sb.append(i);
				sb.append("'>");
				sb.append(i);
				sb.append("</a>&nbsp;&nbsp;</li>");
				
			} else {
			
			sb.append("<li>&nbsp;&nbsp;<a href='");
			sb.append(pagename);
			sb.append("&cp=");
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
			sb.append("&cp=");
			int temp = (userGroup+1)*pageSize+1;
			sb.append(temp);
			sb.append("'>다음</a></li></ul>");


			}
		return sb.toString();
	}
}
