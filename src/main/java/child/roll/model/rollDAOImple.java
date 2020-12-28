package child.roll.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import org.mybatis.spring.SqlSessionTemplate;

import child.member.model.memberDTO;

public class rollDAOImple implements rollDAO {
   
   private SqlSessionTemplate sqlMap;

   public rollDAOImple(SqlSessionTemplate sqlMap){
      super();
      this.sqlMap = sqlMap;
   }
   
   //출석부 목록
   public List<memberDTO> rollList(String roll_class){
      Map<String, Object> map= new HashMap<String, Object>();
      map.put("roll_class", roll_class);
      List<memberDTO> list=sqlMap.selectList("roll_list",map);
      return list;
   }
   //출석부 저장
   public int rollSave(List<rollDTO> dto) {
      
      int count = 0;
      
      for(int i=0;i<dto.size();i++){
         
         count += sqlMap.insert("roll_save",dto.get(i));
         
      }
      
      return count;
   }
   
   //저장된 출석부 목록
   public List<rollDTO> rollSaveList() {
      List<rollDTO> list=sqlMap.selectList("roll_savelist");
      return list;
   }
   //저장페이지 날짜 검색
   public List<rollDTO> rollDateSer(String date,String roll_class) {
      Map<String, Object> map= new HashMap<String, Object>();
      map.put("date", date);
      map.put("roll_class", roll_class);
      
      List<rollDTO> list=sqlMap.selectList("roll_dateSer",map);
      
      return list;
   }
   //출석부 수정
   public int rollUpdate(rollDTO dto) {
      int result = sqlMap.update("roll_update", dto);
      return result;
   }
   //출석부 정보 숫자 1.출석 2. 결석 3. 병결4.사고5.입소6.퇴소
   public int rollInfo(String date, String roll_class) {
      Map<String, Object> map=new HashMap<String, Object>();
      map.put("date", date);
      map.put("roll_class", roll_class);
      
      int count = sqlMap.selectOne("roll_info1", map);
      
      return count;
   }
   
   public int rollInfo2(String date, String roll_class) {
      Map<String, Object> map=new HashMap<String, Object>();
      map.put("date", date);
      map.put("roll_class", roll_class);
      
      int count2 = sqlMap.selectOne("roll_info2", map);
      
      return count2;
   }
   public int rollInfo3(String date, String roll_class) {
      Map<String, Object> map=new HashMap<String, Object>();
      map.put("date", date);
      map.put("roll_class", roll_class);
      
      int count3 = sqlMap.selectOne("roll_info3", map);
      
      return count3;
   }
   public int rollInfo4(String date, String roll_class) {
      Map<String, Object> map=new HashMap<String, Object>();
      map.put("date", date);
      map.put("roll_class", roll_class);
      
      int count4 = sqlMap.selectOne("roll_info4", map);
      
      return count4;
   }
   public int rollInfo5(String date, String roll_class) {
      Map<String, Object> map=new HashMap<String, Object>();
      map.put("date", date);
      map.put("roll_class", roll_class);
      
      int count5 = sqlMap.selectOne("roll_info5", map);
      
      return count5;
   }
   public int rollInfo6(String date, String roll_class) {
      Map<String, Object> map=new HashMap<String, Object>();
      map.put("date", date);
      map.put("roll_class", roll_class);
      
      int count6 = sqlMap.selectOne("roll_info6", map);
      
      return count6;
   }
   //출석 상태에 따른 검색
   public List<rollDTO> infoSer(String date, String roll_class, int roll_info) {
      Map<String, Object> map= new HashMap<String, Object>();
      map.put("date", date);
      map.put("roll_class", roll_class);
      map.put("roll_info", roll_info);
      
      List<rollDTO> list=sqlMap.selectList("infoSer",map);
      
      return list;
   }
   //오늘 출석률 
   public int attPer() {
   int Allcount = sqlMap.selectOne("attPer");
   return Allcount;
   }
   public int attenden() {
   int atcount = sqlMap.selectOne("attenden");
   return atcount;
   }
   public int absent() {
      int abcount = sqlMap.selectOne("absent");
      return abcount;
   }
   public int guitar() {
      int guitar = sqlMap.selectOne("guitar");
      return guitar;
   }
   //주간 출석률
   public int WeattPer() {
   int AllWecount = sqlMap.selectOne("WeattPer");
   return AllWecount;
   }
   public int Weattenden() {
   int Weatcount = sqlMap.selectOne("Weattenden");
   return Weatcount;
   }
   public int Weabsent() {
      int Weabcount = sqlMap.selectOne("Weabsent");
      return Weabcount;
   }
   public int Weguitar() {
      int Weguitar = sqlMap.selectOne("Weguitar");
      return Weguitar;
   }
   //월간 출석률
   public int MoattPer() {
   int AllMocount = sqlMap.selectOne("MoattPer");
   return AllMocount;
   }
   public int Moattenden() {
   int Moatcount = sqlMap.selectOne("Moattenden");
   return Moatcount;
   }
   public int Moabsent() {
      int Moabcount = sqlMap.selectOne("Moabsent");
      return Moabcount;
   }
   public int Moguitar() {
      int Moguitar = sqlMap.selectOne("Moguitar");
      return Moguitar;
   }
   //우리반 출석률
   public int MyattPer(String groupchild) {
   int AllMycount = sqlMap.selectOne("MyattPer",groupchild);
   return AllMycount;
   }
   public int Myattenden(String groupchild) {
   int Myatcount = sqlMap.selectOne("Myattenden",groupchild);
   return Myatcount;
   }
   public int Myabsent(String groupchild) {
      int Myabcount = sqlMap.selectOne("Myabsent",groupchild);
      return Myabcount;
   }
   public int Myguitar(String groupchild) {
      int Myguitar = sqlMap.selectOne("Myguitar",groupchild);
      return Myguitar;
   }
   //원장님용 역대 출석률
   public int BoattPer() {
      int AllBocount = sqlMap.selectOne("BoattPer");
      return AllBocount;
      }
      public int Boattenden() {
      int Boatcount = sqlMap.selectOne("Boattenden");
      return Boatcount;
      }
      public int Boabsent() {
         int Boabcount = sqlMap.selectOne("Boabsent");
         return Boabcount;
      }
      public int Boguitar() {
         int Boguitar = sqlMap.selectOne("Boguitar");
         return Boguitar;
      }
   
}

