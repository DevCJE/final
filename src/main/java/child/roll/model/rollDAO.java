package child.roll.model;

import java.util.HashMap;
import java.util.List;

import child.member.model.memberDTO;

public interface rollDAO {

   
   public List<memberDTO> rollList(String roll_class);
   
   public int rollSave(List<rollDTO> dto);
   
   public List<rollDTO> rollSaveList();
   
   public List<rollDTO> rollDateSer(String date, String roll_class);
   
   public int rollUpdate(rollDTO dto);
   
   public int rollInfo(String date, String roll_class);
   public int rollInfo2(String date, String roll_class);
   public int rollInfo3(String date, String roll_class);
   public int rollInfo4(String date, String roll_class);
   public int rollInfo5(String date, String roll_class);
   public int rollInfo6(String date, String roll_class);
   public List<rollDTO> infoSer(String date, String roll_class, int roll_info);
   public int attPer();
   public int attenden();
   public int absent();
   public int guitar();
   public int WeattPer();
   public int Weattenden();
   public int Weabsent();
   public int Weguitar();
   public int MoattPer();
   public int Moattenden();
   public int Moabsent();
   public int Moguitar();
   public int MyattPer(String groupchild);
   public int Myattenden(String groupchild);
   public int Myabsent(String groupchild);
   public int Myguitar(String groupchild);
   public int BoattPer();
   public int Boattenden();
   public int Boabsent();
   public int Boguitar();

}