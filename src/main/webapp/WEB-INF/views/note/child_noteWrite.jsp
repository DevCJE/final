<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="child.controller.AlbumController" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../header.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작성</title>
<style type="text/css">

.red{
    color:red;
    }
.form-area
{
    background-color: #FAFAFA;
   padding: 10px 40px 60px;
   margin: 10px 0px 60px;
   border: 1px solid GREY;
   }
</style>

</head>
<script type="text/javascript" src="resource/editor/js/SE2BasicCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="resource/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="resource/editor/js/smarteditor2.js" charset="utf-8"></script>
<script type="text/javascript" src="resource/editor/js/SE2M_Configuration.js" charset="utf-8"></script>
<script>
$(function(){
    //전역변수
    var obj = [];               
    //스마트에디터 프레임생성
    nhn.husky.EZCreator.createInIFrame({
        oAppRef: obj,
        elPlaceHolder: "editor",
        sSkinURI: "/finalproject/resource/editor/SmartEditor2Skin.html", 
        htParams : {
            // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseToolbar : true,             
            // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseVerticalResizer : true,     
            // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
            bUseModeChanger : true, 
        }
    });
    //전송버튼
    $("#savebutton").click(function(){
        //id가 smarteditor인 textarea에 에디터에서 대입
        obj.getById["editor"].exec("UPDATE_CONTENTS_FIELD", []);
        //폼 submit
        $("#frm").submit();
    });
});
</script>
<body>
   <section>
      <article>      
         <div class="container">
            <div class="col-md-12">
                <div class="form-area">  
                    <form role="form" action="noteWrite.do" id="frm" >
                    <br style="clear:both">
                                <h3 style="margin-bottom: 25px; text-align: center;">알 림 장 작성</h3>
                           <div class = "form-group">
                                <select name="note_select">
                                   <option value = "전부">전체반</option>
                                   <option value = "A반">A반</option>
                                   <option value = "B반">B반</option>
                                   <option value = "C반">C반</option>
                                </select>
                           </div>
                           <div class="form-group">
                              <!--<input type="text" class="form-control" id="note_writer" name="note_writer" placeholder="작성자" required>-->
                               <label id="note_writer" name="note_writer" value="${sessionScope.name}">작성자 : ${sessionScope.name}</label> 
                               <input type="hidden" name="note_writer" value="${sessionScope.name}">
                           </div>
                                <div class="form-group">                                
                                   <textarea class="form-control" name="note_content" rows="5" id="editor" required="required"></textarea>
                                     <textarea class="form-control" name="note_need" placeholder="준비물" maxlength="140" rows="7" required="required"></textarea>                
                                </div>
                                       <div>
                                      
                                       <input type="hidden" name="note_img" >
                                       </div>         
                    <button type="submit" class="btn btn-primary pull-right" id="savebutton">작성</button>
                    </form>
                </div>
            </div>
         </div>
         
      </article>
   </section>
<%@include file="../footer.jsp" %>
</body>
</html>