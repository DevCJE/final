<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link href="assets/stylesheets/application-a07755f5.css" rel="stylesheet" type="text/css"/>
    <link href="assets/images/favicon.ico" rel="icon" type="image/ico" />
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
    
  <body class='main page'>
    <!-- Navbar -->
    <div class='navbar navbar-default' id='navbar'>
    <c:url var="itnIndexUrl" value="itn_index.do">
        	<c:param name="count">${sessionScope.count}</c:param>
        	<c:param name="send_name">${sessionScope.name}</c:param>
    </c:url>
      <a class='navbar-brand' href='${itnIndexUrl}'>
        <i class='icon-beer'></i>
       	Intranet
      </a>
      <ul class='nav navbar-nav pull-right'>
        <li>
        <c:url var="itnMsgUrl" value="itn_msg_List.do">
        	<c:param name="count">${sessionScope.count}</c:param>
        	<c:param name="send_name">${sessionScope.name}</c:param>
        </c:url>
          <a href="${itnMsgUrl}">
            <i class='icon-envelope'></i>
            	메세지
            <span class='badge'>${count}</span>
          </a>
        </li>
        <li class='dropdown'>
          <a class='dropdown-toggle' data-toggle='dropdown' href='#'>
            <i class='icon-user'></i>
            <strong>${sessionScope.id}</strong>
            <img class="img-rounded" src="http://placehold.it/20x20/ccc/777" />
            <b class='caret'></b>
          </a>
          <ul class='dropdown-menu'>
            <li>
              <a href="index.do">돌아가기</a>
            </li>
            <li class='divider'></li>
            <li>
              <a href="/">Sign out</a>
            </li>
          </ul>
        </li>
      </ul>
    </div>
</body>
</html>