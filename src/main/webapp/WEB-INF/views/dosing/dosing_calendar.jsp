<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/WEB-INF/views/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">  
<link rel="stylesheet" href="/resources/demos/style.css">  
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>  
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script>  
$(function() {
    $( "#datepicker" ).datepicker({
         showButtonPanel: true,       
         closeText: '닫기', 
         dateFormat: "yy-mm-dd",
         changeMonth: true, 
         dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
         dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
         monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
         monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']

  });
});

 
</script>

<body>
 
 <br><br><br><br><br><br><br><br><br>
<h2> dosing calendar !</h2>
<input type="text" id="datepicker" name="calender" class="btn btn-default" value="날짜선택하기">
</body>
</html>