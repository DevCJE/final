<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="assets/css/animate.css">
    <link rel="stylesheet" href="assets/css/font-awesome.min.css">
    <link rel="stylesheet" href="assets/css/slick.css">
    <link rel="stylesheet" href="assets/js/rs-plugin/css/settings.css">
    <link rel="stylesheet" href="assets/css/styles.css">
    <link rel="stylesheet" href="assets/css/main.css">
    <style>
        @font-face {
    font-family: 'Sumusaleuibom';
    src: url(assets/fonts/Sumusaleuibom.ttf) format('truetype');
	}
	body{
    	font-family : "Sumusaleuibom"
    }
    </style>
</head>
<body>
	<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
          <div class="thumbnail">
              <div class="caption">
                <div class='col-lg-12 well well-add-card text-center'>
                    <h4><span class="glyphicon glyphicon-star"></span>&nbsp;${dto.cal_subject }</h4>
                </div>
                <div class='col-lg-12' style="padding-left:100px;">
                    <p>날짜: ${dto.cal_date }</p>
                    <p>시간: ${dto.cal_time }</p>
                    <p>상세내용: ${dto.cal_content }</p> 
                </div>
            </div>       
          </div>
        </div>
<p align="center"><a href="#" class="btn btn-primary" onclick="window.self.close()">닫기</a>
<c:if test="${sessionScope.auth>=4 }">
	<a href="calendar_Edit.do?idx=${dto.idx}" class="btn btn-primary">수정하기</a>
	<a href="calendar_Delete.do?idx=${dto.idx }" class="btn btn-primary">삭제하기</a></p>
</c:if>
</p>
</body>
</html>