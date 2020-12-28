<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="/WEB-INF/views/header.jsp" %>
	<div class="container">
		<div class="col-md-6 col-md-offset-3">
			<br/><br/>공지사항 <br/><br/>
					<div class="form-group">
							<input type="text" class="form-control" name="subject" value="${dto.subject}" readonly>
					<span style="float:right;">작성일&nbsp;&nbsp; | &nbsp;&nbsp;${dto.notice_date}</span>
					</div>
					<div class="form-group">
						<textarea rows="20" cols="40" class="form-control" name="content" style="resize:none;" readonly>${dto.content}</textarea>
					</div>
					<div class="form-group">
					<button type="button" class="btn btn-primary btn-block" onclick="location.href='notice_List.do'">목록으로</button>
				
				
				<c:choose>
					<c:when test="${sessionScope.auth==4 || sessionScope.auth==5}">
						<c:url var="updateUrl" value="notice_Update.do">
							<c:param name="idx">${dto.idx}</c:param>
							<c:param name="subject">${dto.subject}</c:param>
							<c:param name="content">${dto.content}</c:param>
						</c:url>
					
					<c:url var="deleteUrl" value="notice_Delete.do">
							<c:param name="idx">${dto.idx}</c:param>
					</c:url>
					<button type="button" class="btn btn-primary btn-block" onclick="location.href='${updateUrl}'">수정하기</button>
					<button type="button" class="btn btn-primary btn-block" onclick="location.href='${deleteUrl}'">삭제하기</button>
					</c:when>
					<c:otherwise>
						<td>
						
						</td>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
<%@ include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>