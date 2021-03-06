<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>귀가 동의서 관리</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">	
</head>
<body>
	<%@include file="/WEB-INF/views/header.jsp" %>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script> 
	$(function() {
	    $( "#datepickerstart, #datepickerend" ).datepicker({
	         showButtonPanel: true,       
	         closeText: '닫기', 
	         dateFormat: "yy-mm-dd",
	         changeMonth: true, 
	         dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
	         dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
	         monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
	         monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
	
	  });
	    
		$('#dateSearch').submit(function(){
			
			var datepickerstart = $('#datepickerstart').val();
			var datepickerend = $('#datepickerend').val();
			
			if(datepickerstart == "처음 날짜" || datepickerend == "마지막 날짜"){
				window.alert('날짜를 모두 선택하시고 검색해주세요!')
				return false;
			}
		
		});		
		
	});
	 
	</script>
	<section>
		<article>
			<div class = "container">
				<div class = "header">
					<form name = "dateSearch" id = "dateSearch" action = "consentAdminDateSearch.do">
					<h1>귀가 동의서					
		        		<input type="submit" class="btn icon-btn btn-primary pull-right" value="날짜 검색하기">  
		        		<c:if test="${empty param.calenderstart}">		        		
		        		<input type="text" id="datepickerend" name="calenderend" class="btn icon-btn btn-primary pull-right " value="마지막 날짜">
		        		<input type="text" id="datepickerstart" name="calenderstart" class="btn icon-btn btn-primary pull-right " value="처음 날짜">
		        		</c:if>
		        		<c:if test="${!empty param.calenderstart}">		        		
		        		<input type="text" id="datepickerend" name="calenderend" class="btn icon-btn btn-primary pull-right " value="${param.calenderend }">
		        		<input type="text" id="datepickerstart" name="calenderstart" class="btn icon-btn btn-primary pull-right " value="${param.calenderstart }">
		        		</c:if>      		
	        		</h1>
	        		</form>
        		</div>
        		<br/><br/>
        		<div class = "body text-center">
        			<table class = "table table-striped">
        				<thead>
        					<tr>
        						<td><b>원아이름</b></td>        						
        						<td><b>신청날짜</b></td>        						
        						<td><b>보호자이름</b></td>        						
        						<td><b>귀가요청시간</b></td>        						
        						<td><b>동의 여부</b></td>        						
        						<td><b>세부내용확인</b></td>        						
        					</tr>
       					</thead>
       					<tbody>
       						<c:forEach var="list" items="${lists}" varStatus="status">
	       						<tr>
	       							<td>${namechilds[status.index]}</td>
	       							<td>${list.writedate}</td>
	       							<td>${list.name}</td>
	       							<td>${list.time}</td>
	       							<c:if test="${list.confirm == 'no' }">
	       							<td><button type = "button" class = "btn btn-danger" disabled>동의 대기</button></td>
	       							</c:if>
	       							<c:if test="${list.confirm == 'yes' }">
	       							<td><button type = "button" class = "btn btn-success" disabled>동의 완료</button></td>
	       							</c:if>	       							
	       							<td><button type = "button" class = "btn btn-primary" onclick="location.href='consentContent.do?idx=${list.idx}'">세부내용 확인</button></td>
	       						</tr>
       						</c:forEach>
       					</tbody>       					
       					<tfoot>
       						<tr>
       							<td colspan = "6">
       								<div class = "row col-xs-12">
       									${page}
       								</div>
       							</td>       							
       						</tr>
       						<tr>
       							<td colspan = "6">
       							<div class = "row col-xs-12">
	       							<form class = "form-inline" action = "consentAdminNameSearch.do">
		       							<select class = "form-control" name="searchgroup">
		       								<option value = "namechild">원아 이름</option>
		       								<option value = "name">보호자이름</option>
		       							</select>
	       								<input size="40" class = "form-control" type ="text" name ="search" placeholder="검색하실 이름을 입력하세요"> 
	       								<button type = "submit" class ="btn btn-primary">검색하기</button>
	       							</form>
       							</div>
       							</td>       							
       						</tr>
       					</tfoot>
        			</table>
        		</div>        		
			</div>
		</article>
	</section>	
	<%@include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>