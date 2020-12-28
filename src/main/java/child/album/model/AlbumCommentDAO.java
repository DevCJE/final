package child.album.model;

import java.util.List;

public interface AlbumCommentDAO {
	
	public List<AlbumCommentDTO> AlbumCmtList(int idx);
	public int AlbumCmtWrite(AlbumCommentDTO acmtdto, AlbumDTO dto);
	public int AlbumCmtDel(int idx);
	

}
