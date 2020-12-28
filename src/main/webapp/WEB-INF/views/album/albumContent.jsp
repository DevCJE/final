<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@include file="/WEB-INF/views/header.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	.album_content{
		margin-left: 50px;
	}
	div#cond img{
		width: 75%;
		height: 400px;
		margin-left: 50px;
	}
	.album-header{
		padding-top: 40px;		
	}
	.featured-article{
		margin-left: 50px;
	}
	.content_title{
		width: 800px;
		height: 50px;
		margin-left: 170px;
		text-align: left;			
	}
	.content_header{
		margin-top: 50px;
	}
	#cmt_list{
		margin-right: 100px;
	}
	.content_title{
		font-size: 25px;
		padding-bottom: 50px;
	}
	.content_list{
		padding-top: 130px;
		margin-right: 150px;
	}
	.content_img{
		width: 50%;
		height: 15%;
	}
	.lits_title{
		font-size: 10px;
		padding-top: 4px;
		margin: 15px;
		margin-left: 80px;
		height: 32px;
		width: 190px;
	}	
</style>
<meta charset="UTF-8">
<title>앨범 본문보기</title>
</head>
<body>
<section>
	<article>
		   <c:set var="adto" value="${dto}"/>
		<div class="album_content text-center">
		    <c:url var="albumUpdateUri" value="albumUpdateForm.do">
		          <c:param name="idx">${adto.idx}</c:param>
		    </c:url>
		    <div class="row">
		    <!-- 본문보기 -->
		      <div class="col-xs-8">
		         <div class="content_header">
		             <div class="content_title well" style="font-size:20">
		             	&nbsp;${adto.idx}.&nbsp;${adto.album_subject}
		             </div>
	             		<div class="text-right">
	               			<small>작성날짜:${adto.album_date} <br> View: ${adto.album_viewer}</small>
	               		</div>
		              	 <input type="hidden" value="${adto.idx}" name="idx">                         	
		            <div class="block-title">
		               <div id="cond" class="album_content">
		                  <small id="ccon">${adto.album_content}</small>
		               </div>
		            </div>
		         </div>
		         <br/>	<br/>	       	         
		      <!-- 댓글 리스트 -->
		      <div class="cmt_list">   
		      <c:forEach var="albumCmt" items="${albumCmt}">		                    
		        <div class= "col-xs-12 br">
			        <span class="glyphicon glyphicon-envelope"></span>&nbsp;${albumCmt.album_comment_writer} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;작성날짜: ${albumCmt.album_comment_date}
	        		<c:url var="albumCmtDelUirl" value="albumCmtDel.do">
			            <c:param name="album_idx">${albumCmt.album_idx}</c:param>
			            <c:param name="idx">${albumCmt.idx}</c:param>   
			         </c:url>
			         <c:choose>
			         <c:when test="${sessionScope.auth == 4 || sessionScope.auth == 5 }">
			         	<a href="${albumCmtDelUirl}"><img src="/finalproject/note_file/note_img/delete.gif" align="right"></a>
			         </c:when>
			         <c:when test="${sessionScope.name == albumCmt.album_comment_writer}">
			         	<a href="${albumCmtDelUirl}"><img src="/finalproject/note_file/note_img/delete.gif" align="right"></a>
			         </c:when>
			         </c:choose>
			        <br><p>${albumCmt.album_comment_content}</p>	<br/><br/>	
		        </div>		        
		      </c:forEach>
	      	  <c:if test="${sessionScope.auth == 4 || sessionScope.auth == 5}">
			    	<a href="${albumUpdateUri}"><button class="btn btn-primary pull-right">수정</button></a>
			    	<a href="albumDel.do?idx=${adto.idx}"><button class="btn btn-primary pull-right">삭제</button></a>
			  </c:if>
			  		<a href="albumList.do"><button class="text- btn btn-primary pull-right">목록</button></a>
			  		<button type="button" class="btn btn-primary pull-right" data-target="#layerpop" data-toggle="modal">댓글</button>
			  </div>	   	     	
		      <!-- 댓글달기 -->
		       <c:if test="${sessionScope.auth == 3 || sessionScope.auth == 4 || sessionScope.auth == 5}">
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
					      <form name = "contentReply" action = "albumCmtWrite.do" method="post">
					      <div class="modal-body">
					      		댓글내용
					            <input class = "form-control" type = "text" name = "album_comment_content">            
					            <input type="hidden" name="idx" value="${adto.idx}">
		                        <input type="hidden" class="form-control" id="album_writer" name="album_comment_writer" value="${sessionScope.name}" required>
		                        <input type="hidden" name="album_idx" value="${adto.idx}">  
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
		          </c:if>          
		       	</div>
		       	<!-- 본문 리스트 보기 -->     
		        <div class="content_list">
		         <ul class="media-list main-list">
		         <c:forEach var="contentList" items="${contentList}">
		         <c:url var="albumContentUri" value="albumContent.do">
		       		<c:param name="idx">${contentList.idx}</c:param>
		       	 </c:url>
		           <li class="media">           
		               <a href="${albumContentUri}"><img class="content_img" src="${contentList.album_photo}"></a>		               
           		       <div class="lits_title well">
		               		${contentList.idx}. ${contentList.album_subject}
		               </div>
		           </li>
		          </c:forEach>
		         </ul> 
		      </div>
		   </div>
	   </div>	   
   </article>
</section> 
</body>
<%@include file="/WEB-INF/views/footer.jsp" %>
</html>