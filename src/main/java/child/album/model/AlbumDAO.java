package child.album.model;

import java.util.List;

public interface AlbumDAO {
	
	public List<AlbumDTO> AlbumList(int cp, int ls);
	
	public int getTotalCnt();
	
	public int AlbumWrite(AlbumDTO adto);
	
	public AlbumDTO AlbumContent(int idx);
	
	public List<AlbumDTO> AlbumContentList(int idx);
	
	public AlbumDTO AlbumUpdate(int idx);
	
	public int AlbumUpdateOk(AlbumDTO adto);
	
	public int AlbumDel(int idx);
	
	public void AlbumViewer(int idx);
	
	public int getFindTotalCnt(String keyword, String selectBox);
	
	public List<AlbumDTO> AlbumFind(int cp, int ls, String keyword, String selectBox);

	public int AlbumCalenderTotalCnt(String calenderstart, String calenderend);
	
	public List<AlbumDTO> AlbumCalender(int cp, int ls, String calenderstart, String calenderend);

}
