package child.document.model;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.google.api.client.extensions.java6.auth.oauth2.*;

import com.google.api.services.drive.model.File;

public interface docDAO {
	public Map<String,Object> doc_docList();
	public Map<String,Object> doc_docForm(String fileid, String subject);
	public String doc_searchMem(String name1);
	public String updateFile(String subject, String url);
	public int doc_Write(docDTO dto);
	public List<docDTO> doc_StateList(String name, int cp, int listsize);
	public List<docDTO> doc_SignList(String name, int cp, int listsize);
	public int donotUpdate(int idx);
	public int update(int idx, String sign2);
	public docDTO docEdit(int idx);
	public String getUrl(String subject);
	public int editUp(docDTO dto);
	public int insertDoc(wdocDTO dto);
	public int signTotal(String name2);
	public int stateTotal(String name1);
	public int deleteData();
	public List<wdocDTO> getDocList(int cp, int listsize);
	public List<docDTO> listCall(String name);
	public ArrayList<String> doc_ListByIdx(String idx);
	
}
