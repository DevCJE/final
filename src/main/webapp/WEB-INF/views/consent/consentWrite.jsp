<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>귀가동의서 작성하기</title>
<style>
.row{
	margin-top: 20px;
	margin-bottom: 20px;
}
</style>
</head>
<body>
<%@include file="/WEB-INF/views/header.jsp" %>
<script>
$(document).ready(function(){ 
	$('#consentForm').submit(function(){ 
		var time = $('#ampm').val() + $('#hour').val() + $('#min').val();
		$('#time').val(time);
	});
});
</script>
    <section>
    	<article>
    		<div class = "container well well-add-card" style="height: 500px; margin-top : 50px;" >
    			<form class= "form-horizontal" id = "consentForm" name="consentForm" action="consentWrite.do" method="post">
	    			<div class = "row">
	    				<div class = "col-xs-12 text-center">
	    					<h3>귀가 동의서 작성하기</h3>
	    				</div>
	    			</div>
	    			<div class = "row">
	    				<div class = "col-xs-2 col-xs-offset-3">
	    					<p>신청일자</p>
	    				</div>
	    				<div class = "col-xs-6">
	    					<p>${date}</p>
	    				</div>
	    			</div>
	    			<div class = "row">
	    				<div class = "col-xs-2 col-xs-offset-3">
	    					<p>귀가 요청 시간</p>
	    				</div>
	    				<div class = "col-xs-6">
	    					<select class="input-sm col-xs-2" id="ampm">
	    						<option value="오전">오전</option>
	    						<option value="오후">오후</option>
	    					</select>
	    					<select class="input-sm col-xs-2" id ="hour">
	    						<option value="1시">1시</option>
	    						<option value="2시">2시</option>
	    						<option value="3시">3시</option>
	    						<option value="4시">4시</option>
	    						<option value="5시">5시</option>
	    						<option value="6시">6시</option>
	    						<option value="7시">7시</option>
	    						<option value="8시">8시</option>
	    						<option value="9시">9시</option>
	    						<option value="10시">10시</option>
	    						<option value="11시">11시</option>
	    						<option value="12시">12시</option>
	    					</select>
	    					<select class="input-sm col-xs-2" id ="min">
	    						<option value="00분">00분</option>
	    						<option value="30분">30분</option>
	    					</select>
	    				</div>
	    			</div>
	    			<div class = "row">
	    				<div class = "col-xs-2 col-xs-offset-3">
	    					<p>귀가방법</p>
	    				</div>
	    				<div class = "col-xs-6">
		    					<input type="radio" class=" input-xs" name="type" value="자가용">&nbsp;자가용&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		    					<input type="radio" class=" input-xs" name="type" value="버스">&nbsp;버스&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		    					<input type="radio" class=" input-xs" name="type" value="도보">&nbsp;도보&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		    					<input type="radio" class=" input-xs" name="type" value="기타">&nbsp;기타
	    				</div>
	    			</div>
	    			<div class = "row">
	    				<div class = "col-xs-2 col-xs-offset-3">
	    					<p>보호자</p>
	    				</div>	    				
	    				<div class = "col-xs-4">
		    				<input class="form-control" type = "text" name="name" placeholder="원아와의 관계">
	    				</div>
	    			</div>
	    			<div class = "row">
	    				<div class = "col-xs-2 col-xs-offset-3">
	    					<p>비상연락처</p>
	    				</div>
	    				<div class = "col-xs-4">
		    				<input class="form-control" type = "text" name="tel" placeholder="바로 연락 가능한 번호">
	    				</div>
	    			</div><br/><br/>
	    			<div class = "row">
	    				<div class = "col-xs-12 text-center">
	    					<input type = "hidden" name = "time" id ="time">
	    					<input type = "hidden" name = "member_idx" value = "${sessionScope.idx}">
		    				<button class="btn btn-primary" type="submit">작성하기</button>
		    				<button class="btn btn-primary" type="reset">다시 작성</button>
	    				</div>	    				
	    			</div>
    			</form>
    		</div>
    	</article>    
    </section>    
<%@include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>