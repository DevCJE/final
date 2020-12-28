package child.member.admin.model;

import java.util.List;

import child.album.model.AlbumDTO;
import child.member.model.memberDTO;

public interface AdminDAO {

	public List<memberDTO> te_adminForm(int cp, int ls);
	
	public List<memberDTO> teNo_adminForm(int cp, int ls);
	
	public int banChange(String groupchild, String id);
	
	public int teDelete(int idx);
	
	public int teacherOk(int idx);
	
	public int teacherNo(int idx);
	
	public int chDelete(int idx);
	
	public int childOk(int idx);
	
	public int childNo(int idx);
	
	public List<memberDTO> ch_adminForm(int cp, int ls);
	
	public List<memberDTO> chNo_adminForm(int cp, int ls);
	
	public int chBanChange(String groupchild, String id);
	
	public List<memberDTO> chSearch(String serchgroup, String chsearch);
	
	public List<memberDTO> chNoSearch(String serchgroup, String chsearch);
	
	public List<memberDTO> teSearch(String tesearch);
	
	public List<memberDTO> teNoSearch(String tesearch);
	
	public int chgetTotal();
	
	public int chNogetTotal();
	
	public int tegetTotal();
	
	public int teNogetTotal();
	
	
}
