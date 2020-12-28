<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
</head>
<body>
 <%@include file="/WEB-INF/views/header.jsp" %>
 <section>
 	<br/><br/>
 	<article>
 		<div class="container">
		<div class="panel panel-danger">
		<div class = "panel-heading">
			<h4 class="panel-title">아이디 찾기 결과</h4>
		</div><br/><br/><br/>
		 <div class="row">
		  <div class="text-center" >
			    <div class = "col-xs-12">
			    	<p>회원님의 아이디는 <b>${result}</b> 입니다.</p>
			    	<br/><br/><br/>
			    </div>
			    <div class = "col-xs-12" style="padding-bottom : 20px;">
			    <button type = "button" class="btn btn-primary" onclick="location.href='index.do'">홈으로</button>
			    <button type = "button" class="btn btn-primary" onclick="location.href='member_find.do'">돌아가기</button>
			    </div>
		   </div>
		  </div>
		 </div>
		 </div>
 	</article>
 </section>
  <%@include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>