<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/header.jsp" %>
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
    })
})
</script>
</head>
<body>

	<div class="container">
		<div class="col-xs-9 col-xs-offset-2">
			<br/><br/>공지사항 <br/><br/>
				<form name="updateForm" action="notice_Update.do" method="POST">
					<div class="form-group">
							<input type="hidden" name="idx" value="${param.idx}">
							<input type="text" class="form-control" name="subject" value="${param.subject}" placeholder="제목을 입력하세요...">
					</div>
					<div class="form-group">
						<textarea rows="20" cols="40" class="form-control" name="content" style="resize:none;" placeholder="내용을 입력하세요..." id="editor">${param.content}</textarea>
					</div>
					<div class="form-group">
					<button type="submit" class="btn btn-primary btn-block">수정하기</button>
					<button type="button" class="btn btn-primary btn-block" onclick="location.href='notice_List.do'">목록으로</button>
					</div>
 				</form>
		</div>
	</div>
<%@ include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>