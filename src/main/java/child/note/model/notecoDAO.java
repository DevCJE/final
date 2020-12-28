package child.note.model;

import java.util.List;

public interface notecoDAO {

	public List<notecoDTO> notecoList(int note_idx);
	
	public int notecoWrite(notecoDTO cdto);
	
	public int notecoDel(int idx);
	
}
