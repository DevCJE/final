package child.note.model;

import java.util.*;

public interface noteDAO {
	
	public List<noteDTO> noteList(int cp, int ls);
	
	public noteDTO noteContent(int idx);
	
	public int noteWrite(noteDTO dto);
	
	public int noteUpdate(noteDTO dto);
	
	public noteDTO noteUpdateForm(int idx);
	
	public int noteDel(int idx);
	
	public int getTotalCnt();
	
	public List<noteDTO> noteSearch(int cp, int ls,String keyword);

	public int getFindTotal(String keyword);
	
	public List<noteDTO> notedateSearch(int cp, int ls,String calenderstart,String calenderend);
	
	public int getdateToal(String calendarstart,String calenderend);
}
