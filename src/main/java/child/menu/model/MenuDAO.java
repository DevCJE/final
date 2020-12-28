package child.menu.model;

import java.util.List;

public interface MenuDAO {

	public int menuWriteOk(MenuDTO dto);
	
	public MenuDTO menuChart(String calender);
	
	public List<MenuDTO> menuUpdateForm(String menu_date);
	
	public int menuUpdateOk(MenuDTO dto);
	
	public int menuDeleteOk(String menu_date);
	
	public MenuDTO infoImage(int idx);
	
	public List<MenuDTO> monthCalender();
}
