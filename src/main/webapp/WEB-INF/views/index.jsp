<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>KinderGarten | 세상에서 제일 행복한 유치원</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
</head>
<body>
    <div class="pre-loader">
        <div class="load-con">
            <img src="assets/img/main/logo.png" class="animated fadeInDown" alt="">
            <div class="spinner">
              <div class="bounce1"></div>
              <div class="bounce2"></div>
              <div class="bounce3"></div>
            </div>
        </div>
    </div>
    <%@include file="header.jsp" %>
        <!--RevSlider-->
        <div class="tp-banner-container">
            <div class="tp-banner" >
                <ul>
                    <!-- SLIDE  -->
                    <li data-transition="fade" data-slotamount="7" data-masterspeed="1500" >
                        <!-- MAIN IMAGE -->
                        <img src="assets/img/main/transparent.png"  alt="slidebg1"  data-bgfit="cover" data-bgposition="left top" data-bgrepeat="no-repeat">
                        <!-- LAYERS -->
                        <!-- LAYER NR. 1 -->                        
                        <div class="tp-caption lfl fadeout hidden-xs"
                            data-x="left"
                            data-y="bottom"
                            data-hoffset="30"
                            data-voffset="0"
                            data-speed="500"
                            data-start="700"
                            data-easing="Power4.easeOut">
                            <img src="assets/img/main/test.png" alt="" height="580px;">
                        </div>
                        <div style="padding-left:30px;" class="tp-caption large_white_bold sft" data-x="550" data-y="center" data-hoffset="0" data-voffset="-80" data-speed="500" data-start="1200" data-easing="Power4.easeOut">
                            Kinder
                        </div>
                        <div style="padding-left:30px;" class="tp-caption large_white_bold sfr" data-x="770" data-y="center" data-hoffset="0" data-voffset="-80" data-speed="500" data-start="1400" data-easing="Power4.easeOut">
                            Garten
                        </div>
                        <div style="padding-left:30px;" class="tp-caption mediumlarge_light_white sfb" data-x="550" data-y="center" data-hoffset="0" data-voffset="0" data-speed="1000" data-start="1500" data-easing="Power4.easeOut">
                            오직 아이만을 생각하는 유치원
                        </div>
                        <div style="padding-left:50px;" class="tp-caption sfb hidden-xs" data-x="550" data-y="center" data-hoffset="0" data-voffset="85" data-speed="1000" data-start="1700" data-easing="Power4.easeOut">
                            <a href="#about" class="btn btn-primary inverse btn-lg">KinderGarten은 항상 아이만을 생각합니다!</a>
                        </div>
                        <div style="padding-left:50px;" class="tp-caption sfb hidden-xs" data-x="550" data-y="center" data-hoffset="0" data-voffset="250" data-speed="1000" data-start="1700" data-easing="Power4.easeOut">
                            <img src="assets/img/main/test2.png" alt="" width="400px" height="170px;">
                        </div>
                    </li>
                    <!-- SLIDE 3 -->
                    <li data-transition="zoomout" data-slotamount="7" data-masterspeed="1000" >
                        <!-- MAIN IMAGE -->
                        <img src="assets/img/main/transparent.png"  alt="slidebg1"  data-bgfit="cover" data-bgposition="left top" data-bgrepeat="no-repeat">                        
                      <div class="tp-caption customin customout hidden-xs"
                            data-x="right"
                            data-y="center"
                            data-hoffset="0"
                            data-customin="x:50;y:150;z:0;rotationX:0;rotationY:0;rotationZ:0;scaleX:0.5;scaleY:0.5;skewX:0;skewY:0;opacity:0;transformPerspective:0;transformOrigin:50% 50%;"
                        data-customout="x:0;y:0;z:0;rotationX:0;rotationY:0;rotationZ:0;scaleX:0.75;scaleY:0.75;skewX:0;skewY:0;opacity:0;transformPerspective:600;transformOrigin:50% 50%;"
                            data-voffset="50"
                            data-speed="1000"
                            data-start="700"
                            data-easing="Power4.easeOut">
                            <img src="assets/img/main/test5.png" alt="" width="640px" height="480px">
                        </div>                        
                        
                        <!-- LAYERS -->          
                      	<div style="padding-left:40px;" class="tp-caption lfl hidden-xs" data-x="left" data-y="top" data-hoffset="0" data-voffset="180" data-speed="1000" data-start="900" data-easing="Power4.easeOut">
                            <img src="assets/img/main/test4.png" alt="" width="300px" height="150px">
                        </div>   
                        <div class="tp-caption mediumlarge_light_white sfl hidden-xs" data-x="left" data-y="center" data-hoffset="0" data-voffset="0" data-speed="1000" data-start="1000" data-easing="Power4.easeOut">
                           더 좋은 세상을 꿈꿉니다
                        </div>
                        <div class="tp-caption mediumlarge_light_white sft hidden-xs" data-x="left" data-y="center" data-hoffset="0" data-voffset="50" data-speed="1000" data-start="1200" data-easing="Power4.easeOut">
                           아름답고 활기차고 슬기롭게
                        </div>
                        <div class="tp-caption small_light_white sfb hidden-xs" data-x="left" data-y="center" data-hoffset="0" data-voffset="130" data-speed="1000" data-start="1600" data-easing="Power4.easeOut">
                           <p>저희 KinderGarten은 항상 아이들을 생각합니다. <br> 아이들이 살기 좋은 세상을 위해 노력합니다. <br>세계 최고의 KinderGarten을 꿈꿉니다.</p>
                        </div>
                        <div class="tp-caption lfl hidden-xs" data-x="left" data-y="center" data-hoffset="0" data-voffset="210" data-speed="1000" data-start="1800" data-easing="Power4.easeOut">
                            <a href="#" class="btn btn-primary inverse btn-lg">입학 문의하기</a>
                        </div>
                    </li>              
                </ul>
            </div>
        </div>   
    <div class="wrapper">
        <section id="about">        
            <div class="container">
                <div class="section-heading scrollpoint sp-effect3">
                    <h1>Kinder Garten</h1>
                    <div class="divider"></div>
                    <p>KinderGarten의 다양한 활동을 확인해 보세요!</p>
                </div>
                <div class="row">
                    <div class="col-md-3 col-sm-3 col-xs-6">
          	            <c:url var="Callogin" value="calendar_List.do">
                            <c:param name="id" value="${sessionScope.id}"/>
                        </c:url>
                        <div class="about-item scrollpoint sp-effect2" onclick="location.href='${Callogin}'">
                            <i class="fa fa-calendar fa-2x"></i>
                            <h3>일정표</h3>                 
                            <p>매주, 매달, 매년 활발하게 있는 </p><p>KinderGarten 의 일정표를 확인</p>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-3 col-xs-6" >
                        <div class="about-item scrollpoint sp-effect5" onclick="location.href='albumList.do'">
                            <i class="fa fa-picture-o fa-2x"></i>
                            <h3>앨범</h3>
                            <p>자기 아이들의 활발한 활동을 담은 내역을 앨범을 통해 확인해 보세요.</p>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-3 col-xs-6" >
                        <div class="about-item scrollpoint sp-effect5" onclick="location.href='secure.do'">
                            <i class="fa fa-users fa-2x"></i>
                            <h3>지키미</h3>
                            <p>KinderGarten 근처에 있는 안전정보, 현재 유치원의 활동 상황을 CCTV를 통해 확인하세요.</p>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-3 col-xs-6" >
                    	<c:if test="${empty sessionScope.id}">
                      	<div class="about-item scrollpoint sp-effect1" onclick="location.href='consentAdminList.do'">                     
	                            <i class="fa fa-hospital-o fa-2x"></i>
	                            <h3>투약 및 귀가</h3>
                            <p>특별한 사정이 생겨 투약을 위뢰하거나 귀가를 신청하실경우 이곳을 통해 신청하세요.</p>
                        </div>
                        </c:if>
                    	<c:if test="${sessionScope.auto == 4 || sessionScope.auth == 5}">
                    	<div class="about-item scrollpoint sp-effect1" onclick="location.href='consentAdminList.do'">                     
	                            <i class="fa fa-hospital-o fa-2x"></i>
	                            <h3>투약 및 귀가</h3>
                            <p>특별한 사정이 생겨 투약을 위뢰하거나 귀가를 신청하실경우 이곳을 통해 신청하세요.</p>
                        </div>                    	
                    	</c:if>
                    	<c:if test="${sessionScope.auth == 3}" >
                        <div class="about-item scrollpoint sp-effect1" onclick="location.href='consentList.do'">                     
	                            <i class="fa fa-hospital-o fa-2x"></i>
	                            <h3>투약 및 귀가</h3>
                            <p>특별한 사정이 생겨 투약을 위뢰하거나 귀가를 신청하실경우 이곳을 통해 신청하세요.</p>
                        </div>
                        </c:if>
                    </div>
                </div>
            </div>
        </section>
    </div>    
        <%@include file="footer.jsp" %>        
    <script>
        $(document).ready(function() {
            appMaster.preLoader();        	
        });
    </script>
</body>
</html>
