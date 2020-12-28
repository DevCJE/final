<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>귀가 동의서 상세내용</title>
<style>
.well > * {
	margin-top: 20px;
	margin-bottom: 20px;
	padding-left: 20px;
}
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/header.jsp" %>
	
    <div class="container" id="tourpackages-carousel" style="margin-top: 30px;">
      <div class="row">
        <div class="col-lg-12">
        </div>
        <div class="col-xs-8 col-xs-offset-2">
          <div class="thumbnail">
              <div class="caption">
                <div class='col-xs-12'>
                    <h3 class="text-center">귀가 동의서 상세내용</h3><h4 class="text-right">${list.writedate}</h4>
                </div><br/><br/>
                <div class='col-xs-12 well well-add-card' style="height: 350px;">
                    <p>귀가방법 : ${list.type}</p>
                    <p>귀가시간 : ${list.time}</p>
                    <p>보호자 : ${list.name}</p>
                    <p>연락처 : ${list.tel}</p>
                    <br/>
                    <c:if test="${list.confirm == 'no'}">
                    <p class="text-center">동의서 확인 후 승인 됩니다. 잠시만 기다려 주세요!</p>
                    </c:if>
                    <c:if test="${list.confirm == 'yes'}">
                    <p class="text-center">${list.reply}</p>
                    </c:if>
                </div>
                <div class='col-xs-12'>
                    <c:forEach var="replylist" items="${reply}">
                    	<span class="glyphicon glyphicon-envelope"></span>&nbsp;To.선생님&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;작성날짜:${replylist.replydate}
                    	<br/><br/>
                    	<p> &nbsp;&nbsp; ${replylist.content} </p>
                    	<hr/>
                    </c:forEach>
                </div>
                <div class = "footmenu text-center">
                <c:if test="${sessionScope.auth == 3}">
	                <c:if test="${list.confirm == 'no'}">
	                <button type="button" class="btn btn-danger" disabled="disabled">현재 확인 중입니다</button>
	                </c:if>
	                <c:if test="${list.confirm == 'yes'}">
	                <button type="button" class="btn btn-success" disabled>확인 완료 되었어요</button>
	                </c:if>
	                <button type="button" class="btn btn-primary" data-target="#layerpop" data-toggle="modal">답장하기</button>
					<button type="button" class="btn btn-primary" onclick = "location.href='consentList.do'">목록으로</button>
                </c:if>
                <c:if test="${sessionScope.auth == 4 || sessionScope.auth == 5 }">
                	<c:if test="${list.confirm == 'no'}">
	                <button type="button" class="btn btn-danger" disabled="disabled">동의 대기중</button>
	                <button type="button" class="btn btn-primary" data-target="#teacherreply" data-toggle="modal">동의 완료하기</button>
	                <button type="button" class="btn btn-primary" onclick = "location.href='consentAdminList.do'">목록으로</button>
	                </c:if>
	                <c:if test="${list.confirm == 'yes'}">
	                <button type="button" class="btn btn-success" disabled>동의 완료</button>
	                <button type="button" class="btn btn-primary" onclick = "location.href='consentAdminList.do'">목록으로</button>
	                </c:if>
                </c:if>
                </div>
            </div>       
          </div>
        </div>
      </div><!-- End row -->
    </div><!-- End container -->
    
    
<div class="modal fade" id="teacherreply" >
  <div class="modal-dialog">
    <div class="modal-content">
      <!-- header -->
      <div class="modal-header">
        <!-- 닫기(x) 버튼 -->
        <button type="button" class="close" data-dismiss="modal">×</button>
        <!-- header title -->
        <h4 class="modal-title">동의 완료 답장하기</h4>
      </div>
      <!-- body -->
      <form name = "contentReply" action = "consentConfirm.do" method="post">
      <div class="modal-body">
      		답장 내용
            <input class = "form-control" type = "text" name = "reply">            
            <input type = "hidden" name = "idx" value = "${list.idx}">
      </div>
      <!-- Footer -->
      <div class="modal-footer">
        <button type="submit" class="btn btn-primary">작성완료</button>
        <button type="button" class="btn btn-primary" data-dismiss="modal">닫기</button>
      </div>
      </form>
    </div>
  </div>
</div>
    
<div class="modal fade" id="layerpop" >
  <div class="modal-dialog">
    <div class="modal-content">
      <!-- header -->
      <div class="modal-header">
        <!-- 닫기(x) 버튼 -->
        <button type="button" class="close" data-dismiss="modal">×</button>
        <!-- header title -->
        <h4 class="modal-title">답장하기</h4>
      </div>
      <!-- body -->
      <form name = "contentReply" action = "consentReply.do" method="post">
      <div class="modal-body">
      		답장 내용
            <input class = "form-control" type = "text" name = "content">            
            <input type = "hidden" name = "come_home_idx" value = "${list.idx}">
      </div>
      <!-- Footer -->
      <div class="modal-footer">
        <button type="submit" class="btn btn-primary">작성완료</button>
        <button type="button" class="btn btn-primary" data-dismiss="modal">닫기</button>
      </div>
      </form>
    </div>
  </div>
</div>

    <%@include file="/WEB-INF/views/footer.jsp" %>
    
</body>
</html>