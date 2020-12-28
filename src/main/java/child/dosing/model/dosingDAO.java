package child.dosing.model;

import java.util.ArrayList;

import java.util.List;

import child.member.model.memberDTO;

public interface dosingDAO {
	
	public int dosing_write(dosingDTO dto);
	public List<dosingDTO> dosing_getAllChild();
	public List<dosingDTO> dosing_getChildInfo(String child_idx);
	public int dosing_delete(int idx);
	public List<dosingDTO> dosing_getSpecificChildInfo(String idx);
	public List<dosingDTO> dosing_getAllChildByMonth(String month);
	public List<String> dosing_getAllMonthAvailable();
	public String dosingUpdateReport(ArrayList<String> update_list);
	public int dosing_signature(String im, String client, String name, String time);
	public List<EncodeDTO> dosing_GETsignature(String client, String name,String time);
	public int dosing_confirm(String idx);
	public List<dosingDTO> dosingDateSearch(String calendarstart,String calendarend, String name);
	public List<dosingDTO> dosingAdminNameSearch(String name);
	public List<dosingDTO >dosingAdminNameSearch2(String name);
	public memberDTO dosingMember(String name);
	public List<dosingDTO> dosing_getAllChildId(String id);
	public ArrayList<String> cctvGetRegionInfo();
	public int cctvAddRegion(String region);
	public int cctvDelRegion(String region);
	public int document_signature(String t,String idx);
	public int document_signature_2(String t,String idx);
	public List<EncodeDTO> dosing_GETsignatureDoc(String idx);
}
