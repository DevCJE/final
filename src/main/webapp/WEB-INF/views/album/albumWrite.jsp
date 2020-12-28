<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>앨범 작성하기</title>
</head>
<%@include file="/WEB-INF/views/header.jsp" %>
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
			  <h2 align="center">앨범 작성하기</h2>
				<form class="albumWrite" action="albumWrite.do" method="post" id="frm">
				  <div class="form-group">
				    <label for="exampleInputEmail1">앨범 제목</label>
				    <input type="text" class="form-control" placeholder="title" name="album_subject">
				  </div>
				  <div class = "form-group">
				  	<input type="hidden" name="album_child_class" value="1">
				  	<input type="hidden" name="album_child_name" value="2">
				  	
				  	
				   </div>
				   <div class="form-group">
				    	<label>앨범 내용</label>
				    	<textarea class="form-control" rows="5" name="album_content" id="editor"></textarea>
				   </div>
				   <div>
						<input type="hidden" name="album_photo">
				   </div>
				   <div class="text-center">
				  		<button type="submit" class="btn icon-btn btn-primary" id="savebutton">Submit</button>
				  		<button type="reset" class="btn icon-btn btn-primary">cancel</button>
				  </div>
				</form>
			</div>
		</article>
	</section>
</body>
<%@include file="/WEB-INF/views/footer.jsp" %>
</html>