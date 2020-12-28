package child.menu.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.core.NestedExceptionUtils;

public class MenuDAOImple implements MenuDAO {

private SqlSessionTemplate sqlMap;

	public MenuDAOImple(SqlSessionTemplate sqlMap) {
	super();
	this.sqlMap = sqlMap;
}

	public int menuWriteOk(MenuDTO dto) {
	
		int count=sqlMap.insert("menuWriteOk",dto);
		return count;
	}

	public MenuDTO menuChart(String calender) {
		
		
		MenuDTO menu=sqlMap.selectOne("menuChart",calender);
		return menu;
	}

	public List<MenuDTO> menuUpdateForm(String menu_date) {
		List<MenuDTO> list=sqlMap.selectList("menuUpdateForm",menu_date);
		return list;
	}
	public int menuUpdateOk(MenuDTO dto){
		int count=sqlMap.update("menuUpdateOk",dto);
		return count;
	}
    public int menuDeleteOk(String menu_date){   	
    	int count=sqlMap.delete("menuDeleteOk",menu_date);
    	return count;
    }
    public MenuDTO infoImage(int idx){
    	MenuDTO menu=sqlMap.selectOne("infoImage",idx);
    	return menu;
    }
    public List<MenuDTO> monthCalender(){
    	List<MenuDTO> list=sqlMap.selectList("monthCalender");
    	return list;
    }
    
}
