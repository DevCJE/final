<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>귀가 동의서</title>
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
    <div class="container" id="tourpackages-carousel">
      <div class="row">
        <div class="col-lg-12">
        <form name = "dateSearch"  id = "dateSearch" action = "consentDateSearch.do">
        	<h1>귀가 동의서
        		<c:if test="${empty param.calenderstart}">
        		<input type="text" id="datepickerstart" name="calenderstart" class="btn icon-btn btn-primary pull-center " value="처음 날짜">
        		<input type="text" id="datepickerend" name="calenderend" class="btn icon-btn btn-primary pull-center " value="마지막 날짜">
        		</c:if>
        		<c:if test="${!empty param.calenderstart}">
        		<input type="text" id="datepickerstart" name="calenderstart" class="btn icon-btn btn-primary pull-center " value="${param.calenderstart }">
        		<input type="text" id="datepickerend" name="calenderend" class="btn icon-btn btn-primary pull-center " value="${param.calenderend }">
        		</c:if>
        		<input type="submit" class="btn icon-btn btn-primary" value="날짜 검색하기">
        		<a class="btn icon-btn btn-primary pull-right" href="consentWrite.do"><span class="glyphicon btn-glyphicon glyphicon-plus img-circle"></span> 귀가동의서 작성하기 </a>
        	</h1>
        </form>
        <br/><br/>
        </div>
        <c:if test="${empty lists}">
        	<h4 class = "text-center">귀가 동의서 신청 내역이 없습니다.</h4>
        </c:if>
        <c:forEach var="list" items="${lists}">
        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
          <div class="thumbnail">
              <div class="caption">
                <div class='col-lg-12'>
                    <span class="glyphicon glyphicon-envelope"></span>
                </div>
                <div class='col-lg-12 well well-add-card'>
                    <h4>보호자 : ${list.name}</h4>
                </div>
                <div class='col-lg-12'>
                    <p>귀가방법 : ${list.type}</p>
                    <p>귀가시간 : ${list.time}</p>
                    <p>신청일자 : ${list.writedate} </p> 
                </div>
                <button type="button" class="btn btn-primary btn-xs btn-update btn-add-card" onclick="location.href='consentContent.do?idx=${list.idx}'">상세보기</button>
                <c:if test="${list.confirm == 'no'}">
                <button type="button" class="btn btn-danger pull-right" disabled="disabled">승인 대기중</button>
                </c:if>
                <c:if test="${list.confirm == 'yes'}">
                <button type="button" class="btn btn-success pull-right">승인 완료</button>
                </c:if>
            </div>       
          </div>
        </div>   
        </c:forEach>
	          <div class = "col-xs-12 text-center" id = "paging">
	          	${page}
	          </div>	          
      </div><!-- End row -->
    </div><!-- End container -->
    <br>
    <%@include file="/WEB-INF/views/footer.jsp" %>
    
</body>
</html>