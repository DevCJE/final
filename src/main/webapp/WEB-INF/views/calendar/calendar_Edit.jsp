<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="assets/css/animate.css">
    <link rel="stylesheet" href="assets/css/font-awesome.min.css">
    <link rel="stylesheet" href="assets/css/slick.css">
    <link rel="stylesheet" href="assets/js/rs-plugin/css/settings.css">
    <link rel="stylesheet" href="assets/css/styles.css">
    <link rel="stylesheet" href="assets/css/main.css">


    <script type="text/javascript" src="assets/js/modernizr.custom.32033.js"></script>
    <script src="assets/js/jquery-1.11.1.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/slick.min.js"></script>
    <script src="assets/js/placeholdem.min.js"></script>
    <script src="assets/js/rs-plugin/js/jquery.themepunch.plugins.min.js"></script>
    <script src="assets/js/rs-plugin/js/jquery.themepunch.revolution.min.js"></script>
    <script src="assets/js/waypoints.min.js"></script>
    <script src="assets/js/scripts.js"></script>
    
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">  
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
  var num="";
</script>
</head>
<body>
<form name="calendar_Edit" action="calendar_Edit.do" method="post">
<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
          <div class="thumbnail">
              <div class="caption">
                <div class='col-lg-12 well well-add-card text-center'>
                    <h4><span class="glyphicon glyphicon-star"></span>
                    <input type="text" name="cal_subject" value="${dto.cal_subject }"></h4>
                </div>
                <div class='col-lg-12' style="padding-left:100px;">
                    <p>날짜선택<br> 
                    <input type="text" id="datepicker" name="cal_date" class="btn icon-btn btn-primary" value="${dto.cal_date }"></p>
                    <p>시간: <input type="text" name="cal_time" value="${dto.cal_time }"></p>
                    <p>상세내용:<br> <textarea rows="3" cols="30" name="cal_content">${dto.cal_content }</textarea></p>
                    <p><input type="hidden" name="cal_map" value="${dto.cal_map }"></p> 
                </div>
            </div>       
          </div>
        </div>
<p align="center"><button type="submit" class="btn btn-primary">수정하기</button>
<a href="calendar_View.do?idx=${dto.idx}" class="btn btn-primary">취소</a></p>
</form>
</body>
</html>