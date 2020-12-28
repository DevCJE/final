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
			<h4 class="panel-title">비밀번호 찾기 결과</h4>
		</div><br/><br/><br/>
		 <div class="row">
		  <div class="text-center" style="height: 200px;" >
			    <div class = "col-xs-12">
			    	<p><b>${param.name}</b> 회원님이 초기에 설정하신</p>
			    	<p><b>이메일(${result})</b>을 통해</p> 
			    	<p>초기화된 비밀번호를 보내드렸어요</p>	<br/><br/>
			    </div>
			    <div class = "col-xs-12">
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