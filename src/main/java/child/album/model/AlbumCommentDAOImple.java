package child.album.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class AlbumCommentDAOImple implements AlbumCommentDAO {
	
	public AlbumCommentDAOImple() {
		super();
	}
	
	private SqlSessionTemplate sqlMap;

	public AlbumCommentDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	} 
	
	/**댓글 리스트*/
	public List<AlbumCommentDTO> AlbumCmtList(int idx) {
		
		List<AlbumCommentDTO> albumCmt = sqlMap.selectList("albumCmtList", idx);

		return albumCmt;
	}
	
	/**댓글달기*/
	public int AlbumCmtWrite(AlbumCommentDTO acmtdto, AlbumDTO adto) {
		
		if(acmtdto.getAlbum_comment_content().equals("")||acmtdto.getAlbum_comment_content()==null||acmtdto.getAlbum_comment_content().equals("제목을 입력하세요...")){
			return 0;
		}
		if(acmtdto.getAlbum_comment_writer().equals("")||acmtdto.getAlbum_comment_writer()==null||acmtdto.getAlbum_comment_writer().equals("내용을 입력하세요...")){
			return 0;
		}
		
		int count = sqlMap.insert("albumCmtWrite", acmtdto);
		
		return count;
	}
	
	public int AlbumCmtDel(int idx) {
	
		int count = sqlMap.delete("albumCmtDel", idx);	
		
		return count;
	}
}
