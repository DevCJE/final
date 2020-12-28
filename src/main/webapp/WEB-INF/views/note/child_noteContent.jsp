<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>알림장 본문</title>

<!-- 탭 스타일 -->
<style>
	
			.status-upload form textarea {
		background: none repeat scroll 0 0 #fff;
		border: medium none;
		-webkit-border-radius: 4px 4px 0 0;
		-moz-border-radius: 4px 4px 0 0;
		-ms-border-radius: 4px 4px 0 0;
		-o-border-radius: 4px 4px 0 0;
		border-radius: 4px 4px 0 0;
		color: #777777;
		float: left;
		font-family: Lato;
		font-size: 14px;
		height: 142px;
		letter-spacing: 0.3px;
		padding: 20px;
		width: 100%;
		resize:vertical;
		outline:none;
		border: 1px solid #F2F2F2;
		}
div#cond img{
width: 50%;
height: 50%;
}

#hhrr{

background: #000000;
height: 1px;
width: 10%;
}
	</style>
</head>
<body>


<section class="well">
	<article>
		<!--
		 -->
		<div class="content">
		<div class="container" id="tourpackages-carousel">
      <div class="row">
        <div class="col-lg-12">
        </div>
        <div class="col-xs-12">
          <div class="thumbnail">
              <div class="caption">
                <div class='col-xs-12'>
                    <h3 class="text-center list-group-item note-title well" style="font-weight: bold;"> ${dto.note_select} 알림장 </h3>
                       
                      <h4 class="text-right"><fmt:formatDate value="${dto.note_writedate}" pattern="yyyy년 MM월 dd일"/></h4> 
                   	 <hr>
							</div>
						

						<div class="Ncontent">
							<div id="cond" class="NcontentSub">
									<h3 style="text-align: center;" >${dto.note_select}의 알림 사항입니다.</h3>
									
									<hr id="hhrr">
									<p class="ccon text-center" id="conte">${dto.note_content}</p>
								</div>
								<div class="item">
								 <hr>
									<h3 style="text-align: center;" >오늘의 준비물입니다!</h3>
									<hr id="hhrr">
									<p><ul><li>${dto.note_need}</ul></p>
									</div>
							</div>
							
							</div>
							<hr>
							<c:if test="${empty colist}">
				
				</c:if>
				<c:if test="${!empty colist}">
				 <h3 class="list-group-item note-title well" >답변</h3>
				 </c:if>
                    <c:forEach var="comt" items="${colist}">
                   
                    	<h5 style="padding-left: 10px">
                    	<span class="glyphicon glyphicon-envelope"></span>&nbsp;${comt.note_comment_writer}
                    	<span style="float: right;">${comt.note_comment_date}
                    	<c:url var="deleteUrl" value="notecoDel.do">
									<c:param name="idx_comt">${comt.idx}</c:param>
									<c:param name="idx">${dto.idx}</c:param>							
						</c:url>
						<c:choose>
						<c:when test="${sessionScope.auth == 4 || sessionScope.auth == 5 }">
							<a href="${deleteUrl}"><img src="/finalproject/note_file/note_img/delete.gif"></a>
						</c:when>
						<c:when test="${sessionScope.name == comt.note_comment_writer}">
							<a href="${deleteUrl}"><img src="/finalproject/note_file/note_img/delete.gif"></a>
						</c:when>
						</c:choose>
						</span></h5>                   	
                    	<p> &nbsp;&nbsp; ${comt.note_comment_content} </p>
                    </c:forEach>
							
							
						

							
						</div>
					</div>
					<!-- END Portlet PORTLET-->
				</div>
			
		<div class="row">
		  <div class="col-md-12">
	 		
              </div>
              </div>
              <br>
		
		<hr>
	<!-- 댓글 -->
	
	    <div class="container" style="background-color: white;">
			<div class="row">
			  <div class="col-md-6">
				
				
				<!--  -->
                 
                </div>
          
					</div>
			</div>
			</div>
    <hr>
    	
   		<!-- 댓글 작성 -->
    		<div>
    		 <c:if test="${sessionScope.auth == 3 || sessionScope.auth == 4 || sessionScope.auth == 5}">
			   
					<!-- 모달 댓글  -->
					
							<div class="modal fade" id="layerpop" >
							  <div class="modal-dialog">
							    <div class="modal-content">
							      <!-- header -->
							      <div class="modal-header">
							        <!-- 닫기(x) 버튼 -->
							        <button type="button" class="close" data-dismiss="modal">×</button>
							        <!-- header title -->
							        <h4 class="modal-title">댓글달기</h4>
							      </div>
							      <!-- body -->
							      <form name = "contentReply" action = "notecoWrite.do" method="post">
							      <div class="modal-body">
							      		답장 내용
							           <input class = "form-control" type = "text" name = "note_comment_content">            
							            <input type="hidden" name="idx" value="${dto.idx}">
										<input type="hidden" class="form-control" id="note_writer" name="note_comment_writer"  value="${sessionScope.name}" required>
										<input type="hidden" name="note_idx" value="${dto.idx}">
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
					
					<!--  -->
	              </c:if>
		   		 </div>
	   		<div class="container" >
		      <div class="row">
		        <div class="col-lg-12">
 				<span style='float:right'>
						  <button type="button" id="re" class="btn btn-primary" data-target="#layerpop" data-toggle="modal">댓글 작성</button>
			               <button type="button" id="list" class="btn btn-primary" onclick="location.href='noteList.do'">목록</button>
			              <c:if test="${sessionScope.auth == 4 || sessionScope.auth == 5}">
			               <button type="button" id="modify" class="btn btn-primary" onclick="location.href='noteUpdate.do?idx=${dto.idx}'">수정</button>
			              <button type="button" id="delete" class="btn btn-primary" onclick="location.href='noteDel.do?idx=${dto.idx}'">삭제</button>  
			              </c:if>
			                           
	           </span>
			</div>
			</div>
			</div>
            <hr/>
            </div>
	</article>
</section>

<%@include file="../footer.jsp" %>
</body>
</html>