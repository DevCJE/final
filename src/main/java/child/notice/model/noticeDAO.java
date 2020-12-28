package child.notice.model;

import java.util.*;

public interface noticeDAO {

	public int noticeWrite(noticeDTO dto);
	public List<noticeDTO> noticeList(int cp,int ls);
	public int getTotalCnt();
	public noticeDTO noticeContent(int idx);
	public int noticeDelete(int idx);
	public void plusReadNum(int idx);
	public int noticeUpdate(noticeDTO dto);
	public List<noticeDTO> noticeSearch(int cp,int ls,String select,String keyword);
	public int noticeGetTotalCnt(String select,String keyword);
	
}
