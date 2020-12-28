<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="/WEB-INF/views/header.jsp" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>앨범리스트</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">  
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script> 
$(function() {
    $( "#datepickerstart, #datepickerend" ).datepicker({
         showButtonPanel: true,       
         closeText: '닫기', 
         dateFormat: "yy-mm-dd",
         changeMonth: true, 
         dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
         dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
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
<Style>
 .main_title{
 	font-size: 40px;
 	margin-left: 25px;
 }
 #ablum_btn{
 	margin-left: 120px;
 }
 #albumimg{
 	width: 200px;
 	height : 250px;
 }
 .thumbnail {
 	margin: 10px;
 }
 #contert_header{	
 	margin-left: 200px;
}
 .page{
 	text-align: center;
 }

</Style>
</head>
<body>
<section>	
	<article>
		<div class="row">
		    <div id="contert_header" class="col-xs-9">
        <form name = "dateSearch"  id = "dateSearch" action = "albumCalender.do">
        	<div class="main_title">   	
       		 	ALBUM   	
        		<c:if test="${empty param.calenderstart}">
        		<input type="text" id="datepickerstart" name="calenderstart" class="btn icon-btn btn-primary pull-center " value="처음 날짜">
        		<input type="text" id="datepickerend" name="calenderend" class="btn icon-btn btn-primary pull-center " value="마지막 날짜">
        		</c:if>
        		<c:if test="${!empty param.calenderstart}">
        		<input type="text" id="datepickerstart" name="calenderstart" class="btn icon-btn btn-primary pull-center " value="${param.calenderstart }">
        		<input type="text" id="datepickerend" name="calenderend" class="btn icon-btn btn-primary pull-center " value="${param.calenderend }">	
        		</c:if>
        		<input type="submit" class="btn icon-btn btn-primary pull-center" value="날짜 검색하기">
        		<c:if test="${sessionScope.auth == 4 || sessionScope.auth == 5}"> 
 		        <a id="ablum_btn" class="btn icon-btn btn-primary pull-conter" href="albumWrite.do">
        			<span class="glyphicon btn-glyphicon glyphicon-plus img-circle"></span>
        			앨범 작성하기
        		</a>
        		</c:if>
			</div>      	
        </form>
		</div>
			</div>
				<div class="container">
					<div class="row ">
					<c:if test="${empty albumFind}">
						<div class="text-center">
							검색된 사진이 없습니다.
						</div>
					</c:if>
		  		  	<c:forEach var="afind" items="${albumFind}">
					<c:url var="albumUri" value="albumContent.do">
	          			<c:param name="idx">${afind.idx}</c:param>
	          		</c:url>
						<div class="album col-xs-4 text-center">
						<div class="thumbnail" >
							<h4>${afind.idx}.&nbsp;&nbsp;${afind.album_subject}</h4>
							<div>
	               				<img src="${afind.album_photo}" id = "albumimg" alt="ALT NAME">
	               			</div>
	               			<div class="caption text-right">
	                 			<small>View: ${afind.album_viewer}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                 			[${afind.album_date}]</small>               			
	                			<p align="center"><a href="${albumUri}" class="btn btn-primary btn-block">open</a></p>
	           				</div>           
	             		 </div>
	             		 
	             		</div> 
	       			 </c:forEach>
	       			 </div>
					 <div class="page">		
						${pageFindStr}						
					 </div>
				</div>		     		  
		 	 <div class="ser" align="center">
				<form name="albumFind" method="post" action="albumFind.do">
				<div>					
				<select name="selectBox">
					<option value="album_subject">제목</option>
					<option value="album_content">내용</option>
				</select>				
			    	<input type="text" name="keyword" placeholder="검색어 입력">
			  		<button type="submit" class="btn icon-btn btn-primary">검색</button>
			  	</div>	
				</form>
			</div>
	</article>	
</section>	
<%@include file="/WEB-INF/views/footer.jsp" %>         
</body>
</html>