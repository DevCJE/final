<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="/WEB-INF/views/header.jsp" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>알 림 장</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">  
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style>
 .main_title{
 	font-size: 40px;
 	margin-left: 25px;
 }
 #note_btn{
 	margin-top: 13px;
 	margin-right: 18px;
 }
 
 #noteimg{
 	width: 200px;
 	height : 200px;
 }
 
     #custom-search-form {
        margin:0;
        margin-top: 5px;
        padding: 0;
    }
 
    #custom-search-form .search-query {
        padding-right: 3px;
        padding-right: 4px \9;
        padding-left: 3px;
        padding-left: 4px \9;
        /* IE7-8 doesn't have border-radius, so don't indent the padding */
 
        margin-bottom: 0;
        -webkit-border-radius: 3px;
        -moz-border-radius: 3px;
        border-radius: 3px;
        -webkit-transition: width  0.2s ease-in-out;
    -moz-transition:width  0.2s ease-in-out;
    -o-transition: width  0.2s ease-in-out;
    transition: width  0.2s ease-in-out;
    }
 
    #custom-search-form button {
        border: 0;
        background: none;
        /** belows styles are working good */
        padding: 2px 5px;
        margin-top: 2px;
        position: relative;
        left: -28px;
        /* iE7-8 doesn't have border-radius, so don't indent the padding */
        margin-bottom: 0;
        -webkit-border-radius: 3px;
        -moz-border-radius: 3px;
        border-radius: 3px;
    }
 
    .search-query:focus + button {
        z-index: 3;   
    }   
    .search-query:focus{
        width: 260px;
    }   

</style>

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
		
		if(datepickerstart == "처음날짜" || datepickerend == "마지막날짜"){
			window.alert('날짜를 모두 선택하시고 검색해주세요!')
			return false;
		}
	
	});		
	
});
 
</script>


</head>
<body>



<section>
	<article>
		<div class="container">
			<div class="row">
			<div class="col-mg-12">
			<div class="header" style="margin-top: 20px;" >
				<form name = "dateSearch" id="dateSearch" action = "noteDateSearch.do">        
	        	<div class="main_title">
	        	NOTE	        
	        	<c:if test="${empty param.calenderstart}">
        		<input type="text" id="datepickerstart" name="calenderstart" class="btn icon-btn btn-primary pull-center " value="처음날짜">
        		<input type="text" id="datepickerend" name="calenderend" class="btn icon-btn btn-primary pull-center " value="마지막날짜">
        		</c:if>
        		<c:if test="${!empty param.calenderstart}">
        		<input type="text" id="datepickerstart" name="calenderstart" class="btn icon-btn btn-primary pull-center " value="${param.calenderstart }">
        		<input type="text" id="datepickerend" name="calenderend" class="btn icon-btn btn-primary pull-center " value="${param.calenderend }">	
        		</c:if>	        		
	        		<input type="submit" class="btn icon-btn btn-primary" value="날짜 검색하기">
	        	 <c:if test="${sessionScope.auth == 4 || sessionScope.auth == 5}">
	        	 <a id="note_btn" class="btn icon-btn btn-primary pull-right" onclick="location.href='noteWriteForm.do'">
        			<span class="glyphicon btn-glyphicon glyphicon-plus img-circle"></span> 알림장 작성하기
        		</a>
	        		</c:if>
	        		 
	        		</div>
	        		</form>
					</div>		
					
	        	<div>
	        <%--    --%>
				
		           <c:if test="${empty list}">
		           <h2>게시글이 없습니다.</h2>
		           </c:if>
		          <div class="row">
		           <c:forEach var="dto" items="${list}">
					
		            <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
		               
		                <!-- <img src="/finalproject/note_file/note_img/${dto.note_img}" alt="ALT NAME" width="175" height="250"> -->
		               <div class='col-lg-12'>
		               <a href="noteContent.do?idx=${dto.idx}&note_idx=${dto.idx}" style="text-decoration:none;">
		               <div class="thumbnail" >
		                
		                <fmt:setLocale value="ko" scope="session"/>
		                  <h3 style="text-decoration:none"><fmt:formatDate value="${dto.note_writedate}" pattern="yyyy년 MM월 dd일"/> 알림장</h3>
		                  <div class = "col-xs-offset-2">
		                  <img src="${dto.note_img}" id = "noteimg" alt="note_file/note_img/altkinder.png">
		                  </div>
		                  <br>
		                  <p align="center"><a href="noteContent.do?idx=${dto.idx}&note_idx=${dto.idx}" class="btn btn-primary btn-block">세부내용 확인</a></p>
		                
		                </div>
		                </a>
		              </div>
		          	 </div>
		              </c:forEach>
		            </div>
		        
		        <div align="center">${pageStr}</div>
			</div>
			</div>
		</div>

		<!--
		
		 
		 -->
		
	<div class="row">
        <div class="span12">
            <form id="custom-search-form" class="form-search form-horizontal pull-right" name="search" action="noteSearch.do">
                <div class="input-append span12">
                    <input type="text" name="keyword" class="search-query mac-style" placeholder="검색어 입력">
                    <button class="btn icon-btn btn-primary" type="submit"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></button>
                </div>
            </form>
        </div>
	</div>


		
	<!-- 	<div class="row" align="center">
			<form name="search" action="noteSearch.do">
		    	<input type="text" name="keyword" placeholder="검색어 입력">
		  		<button class="btn icon-btn btn-primary" type="submit">검색</button>
			</form>
		</div>	 -->	
		</div>
	</article>
</section>



<%@include file="../footer.jsp" %>
</body>
</html>