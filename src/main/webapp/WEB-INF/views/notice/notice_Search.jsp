<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#notice_table tbody .tr-visible {
	display: table-row;
}
tbody tr td .def{
	text-decoration:none;
	color:black
}
#notice_table{
	width:800px;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/header.jsp"%>
<section class="well">
	<script>
		$(function() {
			$(".def").click(
					function(e) {

						$(this).closest(".tr_visible").next().contents()
								.slideToggle('fast');

					});
		});
	</script>
	<div class="container" style="background-color:white;">
		<div class="col-xs-8 col-xs-offset-2">
			<form name="searchForm" action="notice_Search.do">
				<br><br>
				<h2>공지사항</h2>
				<br> <br>
				<table border="0" cellspacing="0" class="table table-hover"
					id="notice_table">
					<thead>
						<tr align="center">
							<td><strong>번호</strong></td>
							<td><strong>제목</strong></td>
							<td><strong>작성자</strong></td>
							<td><strong>작성날짜</strong></td>
						</tr>
					</thead>
					<tbody>
						<c:if test="${empty list}">
							<tr align="center">
								<td colspan="4" align="center">등록된 게시글이 없습니다.</td>
							</tr>
						</c:if>

						<c:forEach var="dto" items="${list}">
							<tr class="tr_visible" align="center">
								<td>${dto.idx}</td>
								<td><a class="def">${dto.subject}</a></td>
								<td>관리자</td>
								<td>${dto.notice_date}</td>
							</tr>
							<tr class="tr_visible">
								<td colspan="4" style="display:none;">
									<div>${dto.content}</div> 
									<c:choose>
										<c:when test="${sessionScope.auth==4 || sessionScope.auth==5}">
											<c:url var="updateUrl" value="notice_Update.do">
												<c:param name="idx">${dto.idx}</c:param>
												<c:param name="subject">${dto.subject}</c:param>
												<c:param name="content">${dto.content}</c:param>
											</c:url>
											<button type="button" class="btn btn-primary btn-block"
												onclick="location.href='${updateUrl}'">수정하기</button>

											<c:url var="deleteUrl" value="notice_Delete.do">
												<c:param name="idx">${dto.idx}</c:param>
											</c:url>
											<button type="button" class="btn btn-primary btn-block"
												onclick="location.href='${deleteUrl}'">삭제하기</button>
										</c:when>
										<c:otherwise>
										</c:otherwise>
									</c:choose>
								</td>
							</tr>
						</c:forEach>
						<tr>
							<td><select name="select" class = "form-control">
									<option value="subject">제목</option>
									<option value="content">내용</option>
							</select></td>
							<td><input type="text" name="keyword" size="35" class = "form-control"
								placeholder="검색어를 입력하세요..."></td>
							<td>
								<button type="submit" class="btn btn-primary">검색</button>
							</td>
							<c:choose>
								<c:when test="${sessionScope.auth==4 || sessionScope.auth==5}">
									<td>
										<button type="button" class="btn btn-primary"
											onclick="location.href='notice_Write.do'">글쓰기</button>
									</td>
								</c:when>
								<c:otherwise>
									<td></td>
								</c:otherwise>
							</c:choose>
						</tr>
					</tbody>
					<tfoot>
						<tr align="center">
							<td colspan="4">${pageStr}</td>

						</tr>
					</tfoot>
				</table>
			</form>
		</div>
	</div>
	</section>
	<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>