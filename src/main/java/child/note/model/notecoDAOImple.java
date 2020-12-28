package child.note.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class notecoDAOImple implements notecoDAO {
	
	private SqlSessionTemplate sqlMap;
	
	
	public notecoDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap=sqlMap;
	}

	//댓글 불러오기
	public List<notecoDTO> notecoList(int note_idx) {
		List<notecoDTO> colist=sqlMap.selectList("noteco_list",note_idx);
		return colist;
	}
	
	public int notecoWrite(notecoDTO cdto) {
		int count = sqlMap.insert("noteco_write",cdto);
		return count;
	}
	public int notecoDel(int idx) {
		int result =sqlMap.delete("noteco_del", idx);
		return result;
	}
}
