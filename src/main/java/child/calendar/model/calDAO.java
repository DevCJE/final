package child.calendar.model;

import java.util.ArrayList;
import java.util.List;

public interface calDAO {
	public int cal_Write(calDTO dto); 
	public List<calDTO> cal_List(int year, int month); 
	public calDTO cal_View(int idx);
	public calDTO cal_Edit(int idx);
	public int cal_Update(calDTO dto);
	public int cal_Delete(int idx);
}
