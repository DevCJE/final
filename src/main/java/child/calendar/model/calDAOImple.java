package child.calendar.model;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class calDAOImple implements calDAO {

	private SqlSessionTemplate sqlMap;
	
	public calDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	/**일정 작성 메소드*/
	public int cal_Write(calDTO dto) {
		// TODO Auto-generated method stub
		int result = sqlMap.insert("cal_write", dto);
		
		return result;
	}
	
	/**일정 리스트 메소드*/
	public List<calDTO> cal_List(int year, int month) {
		// TODO Auto-generated method stub
		
		String month_s = "";
		if(month<10){
			month_s = "0"+month;
		}
		else {
			month_s = ""+month;
		}
		
		String date = ""+year+month_s+"01";
		List<calDTO> list = sqlMap.selectList("cal_list", date);
		return list;
	}
	
	/**일정 상세보기 메소드*/
	public calDTO cal_View(int idx) {
		// TODO Auto-generated method stub
		calDTO dto = sqlMap.selectOne("cal_view", idx);
		String date = dto.getCal_date().substring(0, 10);
		dto.setCal_date(date);
		
		return dto;
	}
	
	/**일정 수정 메소드*/
	public calDTO cal_Edit(int idx) {
		// TODO Auto-generated method stub
		calDTO dto = sqlMap.selectOne("cal_edit", idx);
		String date = dto.getCal_date().substring(0, 10);
		dto.setCal_date(date);
		
		return dto;
	}
	
	/**일정 수정 완료 메소드*/
	public int cal_Update(calDTO dto) {
		// TODO Auto-generated method stub
		int result = sqlMap.update("cal_update", dto);
		
		return result;
	}
	
	/**일정 삭제 메소드*/
	public int cal_Delete(int idx) {
		// TODO Auto-generated method stub
		int result = sqlMap.update("cal_delete", idx);
		
		return result;
	}

}
