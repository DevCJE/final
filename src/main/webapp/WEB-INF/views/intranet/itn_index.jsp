<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

  <head>
    <meta charset="utf-8">
<title>Insert title here</title>

<!-- js placed at the end of the document so the pages load faster -->
<script src="assets/js/jquery.js"></script>
<script src="assets/js/jquery-1.8.3.min.js"></script>
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="assets/js/bootstrap.min.js"></script>
<script class="include" type="text/javascript"
   src="assets/js/jquery.dcjqaccordion.2.7.js"></script>
<script src="assets/js/jquery.scrollTo.min.js"></script>
<script src="assets/js/jquery.nicescroll.js" type="text/javascript"></script>
<script src="assets/js/jquery.sparkline.js"></script>


<!--common script for all pages-->

<script type="text/javascript" src="assets/js/jquery.gritter.js"></script>
<script type="text/javascript" src="assets/js/gritter-conf.js"></script>
<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!--external css-->
<link rel="stylesheet" type="text/css"
   href="assets/js/css/gritter/css/jquery.gritter.css">
<link rel="stylesheet" type="text/css"
   href="assets/js/css/lineicons/style.css">

<!-- Custom styles for this template -->
<link href="assets/js/css/style.css" rel="stylesheet">
<link href="assets/js/css/style-responsive.css" rel="stylesheet">
<script src="assets/js/chart-master/Chart.js"></script>
<script src="assets/js/common-scripts.js"></script>

<style>
.top-menu ul li {
   margin-top: 15px;
}
</style>
</head>

<body>

   <section id="container">
      <!-- 
     **********************************************************************************************************************************************************
      TOP BAR CONTENT & NOTIFICATIONS
      *********************************************************************************************************************************************************** -->
      <!--header start-->

      <header class="header black-bg">
         <div class="sidebar-toggle-box">
            <div class="fa fa-bars tooltips" data-placement="right"
               data-original-title="Toggle Navigation"></div>
         </div>
         <!--logo start-->
         <c:url var="itnIndexUrl" value="itn_index.do">
            <c:param name="send_name">${sessionScope.name}</c:param>
         </c:url>

         <a href="${itnIndexUrl}" class="logo"><b>INTRANET</b></a>
         <!--logo end-->

         <div class="top-menu">
            <ul class="nav pull-right top-menu">
               <li><a href="index.do">돌아가기</a></li>
            </ul>
         </div>
      </header>
      <!--header end-->
      <!-- 
     **********************************************************************************************************************************************************
      MAIN SIDEBAR MENU
      *********************************************************************************************************************************************************** -->
      <!--sidebar start-->
      <aside>
         <div id="sidebar" class="nav-collapse">
            <!-- sidebar menu start-->
            <ul class="sidebar-menu" id="nav-accordion">
               <p class="centered">
                  <img src="assets/img/logo1.png" width="100">
               </p>
               <h5 class="centered">${sessionScope.name}&nbsp;<a href = "itn_msg_List.do?count=&send_name=${sessionScope.name}"><span class = "badge">${sessionScope.msgcount}</span></a></h5>
	
               <li class="sub-menu"><a href="javascript:;"> <span>서류관리</span>
               </a>
                  <ul class="sub">
                     <li><a href="doc_docList.do">서류 목록</a></li>
                     <li><a href="doc_SignList.do?name=${sessionScope.name}">결재
                           서류 목록</a></li>
                     <li><a href="doc_StateList.do?name=${sessionScope.name}">결재
                           상태 보기</a></li>
                  </ul></li>

               <li class="sub-menu"><span> <a href="rollSave.do">출석부</a>
               </span></li>
               <c:if test="${sessionScope.auth == 5}">
                  <li class="sub-menu"><a href="javascript:;"> <span>멤버관리</span>
                  </a>
                     <ul class="sub">
                        <li><a href="teNo_adminForm.do">미승인교사관리</a></li>
                        <li><a href="te_adminForm.do">승인교사관리</a></li>
                        <li><a href="chNo_adminForm.do">미승인원생관리</a></li>
                        <li><a href="ch_adminForm.do">승인원생관리</a></li>
                     </ul></li>
               </c:if>
               <c:if test="${sessionScope.auth == 4}">
                  <li class="sub-menu"><a href="javascript:;"> <span>원생관리</span>
                  </a>
                     <ul class="sub">
                        <li><a href="chNo_adminForm.do">미승인원생관리</a></li>
                        <li><a href="ch_adminForm.do">승인원생관리</a></li>
                     </ul></li>
               </c:if>

               <li class="sub-menu"><c:url var="itnMsgUrl"
                     value="itn_msg_List.do">
                     <c:param name="count">${sessionScope.count}</c:param>
                     <c:param name="send_name">${sessionScope.name}</c:param>
                  </c:url> <span> <a href="${itnMsgUrl}">쪽지함</a>
               </span></li>
            </ul>
            <!-- sidebar menu end-->
         </div>
      </aside>
      <!--sidebar end-->
      <!-- 
   **********************************************************************************************************************************************************
      MAIN CONTENT
    *********************************************************************************************************************************************************** 
      -->
   <!--main content start-->
   <section id="main-content">
      <section class="wrapper">
         <div class="row">
            <div class="col-xs-10 col-xs-offset-1 main-chart">
                      <div class="row mt well">
                      <!-- SERVER STATUS PANELS -->
                      <c:choose>
                      <c:when test="${empty attPer}">
                      <div class="col-xs-3">
                            <div class="white-panel pn donut-chart">
                               <div class="white-header">
                           
                             <h5 style="color:black">일간 출석률</h5>
                               </div>
                        <div class="row">
                           <div class="col-xs-12" style="margin-top:70px;">
                         	   <font color="black">출석부를 작성해주세요.</font>
                           </div>
                        </div>
                        <canvas id="serverstatus01" height="120" width="120"></canvas>
                       
                     </div>
                     <!--grey-panel -->
                  </div>
                      </c:when>
                      <c:otherwise>
                      <div class="col-xs-3">
                            <div class="white-panel pn donut-chart">
                               <div class="white-header">
                           
                             <h5 style="color:black">일간 출석률</h5>
                               </div>
                        <div class="row">
                        <canvas id="serverstatus01" height="120" width="120"></canvas>
                        <script>
                           var doughnutData = [
                                 {
                                    value: ${atten},
                                    color:"#68dff0"
                                 },
                                 {
                                    value : ${abs},
                                    color : "#ff0000"
                                 },
                                 {
                                    value : ${gui},
                                    color : "#f28e1d"
                                 }
                              ];
                              var myDoughnut = new Chart(document.getElementById("serverstatus01").getContext("2d")).Doughnut(doughnutData);
                        </script>
                           </div>
                           <div class="col-xs-12">
               		         <font color="#68dff0">출석:
               		         <fmt:formatNumber value="${atten}" pattern="0.0"/>%
         					</font>
               		         <br> 
               		         <font color="#ff0000">결석:
               		         <fmt:formatNumber value="${abs}" pattern="0.0"/>%
               		         </font> 
               		         <br>
               		         <font color="#f28e1d">기타:
               		         <fmt:formatNumber value="${gui}" pattern="0.0"/>%</font>
                           </div>
                     </div>
                     <!--grey-panel -->
                  </div>
                      
                      </c:otherwise>
                      </c:choose>
                         
                  <!-- /col-md-4-->
                  <c:choose>
                  <c:when test="${empty WeattPer}">
                  <div class="col-xs-3">
                            <div class="white-panel pn donut-chart">
                               <div class="white-header">
                             <h5 style="color:black">주간 출석률</h5>
                               </div>
                        <div class="row">
                           <div class="col-xs-12" style="margin-top:70px;">
                         	   <font color="black">출석부를 작성해주세요.</font>
                           </div>
                        </div>
                        <canvas id="serverstatus02" height="120" width="120"></canvas>
                       
                     </div>
                     <!--/grey-panel -->
                  </div>
                  </c:when>
                  <c:otherwise>
                  <div class="col-xs-3">
                            <div class="white-panel pn donut-chart">
                               <div class="white-header">
                             <h5 style="color:black">주간 출석률</h5>
                               </div>
                        <div class="row">
                        <canvas id="serverstatus02" height="120" width="120"></canvas>
                        <script>
                           var doughnutData = [
                                               {
                                                   value: ${Weatten},
                                                   color:"#68dff0"
                                                },
                                                {
                                                   value : ${Weabs},
                                                   color : "#ff0000"
                                                },
                                                {
                                                   value : ${Wegui},
                                                   color : "#f28e1d"
                                                }
                              ];
                              var myDoughnut = new Chart(document.getElementById("serverstatus02").getContext("2d")).Doughnut(doughnutData);
                        </script>
                           </div>
                           <div class="col-xs-12">
               		         <font color="#68dff0">출석:
               		         <fmt:formatNumber value="${Weatten}" pattern="0.0"/>%</font>
               		         <br> 
               		         <font color="#ff0000">결석:
               		         <fmt:formatNumber value="${Weabs}" pattern="0.0"/>%</font> 
               		         <br>
               		         <font color="#f28e1d">기타:
               		         <fmt:formatNumber value="${Wegui}" pattern="0.0"/>%</font>
                           </div>
                     </div>
                     <!--/grey-panel -->
                  </div>
                  </c:otherwise>
                  </c:choose>
                         
                  <!-- /col-md-4-->

                  <div class="col-xs-6">
                     <!-- WHITE PANEL - TOP USER -->
                     <div class="white-panel pn">
                        <div class="white-header">
                           <h5 style="color:black"><a href="chNo_adminForm.do">미승인 원생 게시판</a></h5>
                        </div>
                        
                        <div class="row">                          
                                <div class="col-xs-3" style="padding-top: 10px; color:black;">원생 이름</div>
                                <div class="col-xs-3" style="padding-top: 10px; color:black;">부모님 이름</div>
                                <div class="col-xs-6" style="padding-top: 10px; color:black;">부모님 전화번호</div>
                        </div>
                        <div class="row">       
                              <c:forEach var="dto" items="${list}">                          
                           <c:if test="${dto.auth==1}">                                                                                         
                                <div class="col-xs-3" style="padding-top: 10px; color:#5D5D5D;">${dto.namechild}</div>
                                <div class="col-xs-3" style="padding-top: 10px; color:#5D5D5D;">${dto.name}</div>
                                <div class="col-xs-6" style="padding-top: 10px; color:#5D5D5D;">${dto.tel}</div>                                                                                   
                            </c:if>                                                                                  
                         </c:forEach>                             
                           </div>
                          
                        </div>
                     </div>
                  </div><!-- /col-md-4 -->
                         
				<div class="row mt well">
                   <c:choose>
                   <c:when test="${empty MoattPer}">
                    <div class="col-xs-3">
                         <br>
                            <div class="white-panel pn donut-chart">
                               <div class="white-header">
                             <h5 style="color:black">월간 출석률</h5>
                               </div>
                        <div class="row">
                           <div class="col-xs-12" style="margin-top:70px;">
                         	   <font color="black">출석부를 작성해주세요.</font>
                           </div>
                        </div>
                        <canvas id="serverstatus03" height="120" width="120"></canvas>
                        
                     </div>
                     <!--/grey-panel -->
                  </div>
                   </c:when>
                   <c:otherwise>
                   <div class="col-xs-3">
                         <br>
                            <div class="white-panel pn donut-chart">
                               <div class="white-header">
                             <h5 style="color:black">월간 출석률</h5>
                               </div>
                        <div class="row">

                        <canvas id="serverstatus03" height="120" width="120"></canvas>
                        <script>
                           var doughnutData = [
                                  {
                                    value: ${Moatten},
                                    color:"#68dff0"                                    
                                 },
                                 {
                                    value : ${Moabs},
                                    color : "#ff0000"
                                 },
                                 {
                                    value : ${Mogui},
                                    color : "#f28e1d"
                                 }
                              ];
                              var myDoughnut = new Chart(document.getElementById("serverstatus03").getContext("2d")).Doughnut(doughnutData);
                        </script>
                         </div>
                           <div class="col-xs-12">
               		         <font color="#68dff0">출석:
               		         <fmt:formatNumber value="${Moatten}" pattern="0.0"/>%</font>
               		         <br> 
               		         <font color="#ff0000">결석:
               		         <fmt:formatNumber value="${Moabs}" pattern="0.0"/>%</font> 
               		         <br>
               		         <font color="#f28e1d">기타:
               		         <fmt:formatNumber value="${Mogui}" pattern="0.0"/>%</font>
                           </div>
                     </div>
                     <!--/grey-panel -->
                  </div>
                   </c:otherwise>
                   </c:choose>
                    
                  <!-- /col-md-4-->
                  <c:choose>
                  <c:when test="${empty sessionScope.groupchild}">
                  <c:if test="${BoattPer !=0}">
                  <div class="col-xs-3">

			              			      <br>
			                            <div class="white-panel pn donut-chart">
			                               <div class="white-header">
			                           
			                             <h5 style="color:black">역대 출석률</h5>
			                               </div>
			                        <div class="row">
			                        <canvas id="serverstatus05" height="120" width="120"></canvas>
			                        <script>
			                           var doughnutData = [
			                                 {
			                                    value: ${Boatten},
			                                    color:"#68dff0"
			                                 },
			                                 {
			                                    value : ${Boabs},
			                                    color : "#ff0000"
			                                 },
			                                 {
			                                    value : ${Bogui},
			                                    color : "#f28e1d"
			                                 }
			                              ];
			                              var myDoughnut = new Chart(document.getElementById("serverstatus05").getContext("2d")).Doughnut(doughnutData);
			                        </script>
                         </div>
                           <div class="col-xs-12">
               		         <font color="#68dff0">출석:
               		         <fmt:formatNumber value="${Boatten}" pattern="0.0"/>%</font>
               		         <br> 
               		         <font color="#ff0000">결석:
               		         <fmt:formatNumber value="${Boabs}" pattern="0.0"/>%</font> 
               		         <br>
               		         <font color="#f28e1d">기타:
               		         <fmt:formatNumber value="${Bogui}" pattern="0.0"/>%</font>
                           </div>
			                     </div>
			                     <!--grey-panel -->
			                  </div>
                  </c:if>
                  <c:if test="${BoattPer==0}">
                              	 <div class="col-xs-3">
			                    <br>
			                            <div class="white-panel pn donut-chart">
			                               <div class="white-header">
			                           
			                             <h5 style="color:black">역대 출석률</h5>
			                               </div>
			                        <div class="row">
			                           <div class="col-xs-12" style="margin-top:70px;">
			                         	   <font color="black">출석부를 작성해주세요.</font>
			                           </div>
			                        </div>
			                        <canvas id="serverstatus05" height="120" width="120"></canvas>
			                       
			                     </div>
			                     <!--grey-panel -->
			                  </div>
                  </c:if>
                
                  </c:when>
                  
                  <c:when test="${empty MyattPer}">
                  <div class="col-xs-3">
                         <br>
                            <div class="white-panel pn donut-chart">

                               <div class="white-header">

                             <h5 style="color:black">${sessionScope.groupchild } 출석률</h5>
                               </div>
                        <div class="row">
                           <div class="col-xs-12" style="margin-top:70px;">
                         	   <font color="black">출석부를 작성해주세요.</font>
                           </div>
                        </div>
                        <canvas id="serverstatus04" height="120" width="120"></canvas>
                        
               </div>
            </div>
                  </c:when>
                  <c:when test="${!empty MyattPer}">
                  <div class="col-xs-3">
                         <br>
                            <div class="white-panel pn donut-chart">
                               <div class="white-header">
                             <h5 style="color:black">${sessionScope.groupchild } 출석률</h5>
                               </div>
                        <div class="row">
                        <canvas id="serverstatus04" height="120" width="120"></canvas>
                        <script>
                           var doughnutData = [
                                 {
                                       value: ${Myatten},
                                        color:"#68dff0"                                    
                                     },
                                     {
                                        value : ${Myabs},
                                        color : "#ff0000"
                                     },
                                     {
                                        value : ${Mygui},
                                        color : "#f28e1d"
                                     }
                              ];
                              var myDoughnut = new Chart(document.getElementById("serverstatus04").getContext("2d")).Doughnut(doughnutData);
                        </script>
                         </div>
                           <div class="col-xs-12">
               		         <font color="#68dff0">출석:
               		         <fmt:formatNumber value="${Myatten}" pattern="0.0"/>%</font>
               		         <br> 
               		         <font color="#ff0000">결석:
               		         <fmt:formatNumber value="${Myabs}" pattern="0.0"/>%</font> 
               		         <br>
               		         <font color="#f28e1d">기타:
               		         <fmt:formatNumber value="${Mygui}" pattern="0.0"/>%</font>
                           </div>
               </div>
            </div>
                  </c:when>
                 
                  </c:choose>
            <div class="col-xs-6">
                     <br>
                     <!-- WHITE PANEL - TOP USER -->
                     <div class="white-panel pn">
                        <div class="white-header">
                        	<c:url var="state" value="doc_StateList.do?">
                        		<c:param name="name" value="${sessionScope.name }"/>
                        	</c:url>
                           <h5 style="color:black"><a href="${state }">결재 상태목록</a></h5>
                        </div>
                        <div class="row">                          
                                <div class="col-xs-4" style="color:black;">서류 제목</div>
                                <div class="col-xs-2" style="color:black;">결재자</div>
                                <div class="col-xs-3" style="color:black;">결재 기한</div>
                                <div class="col-xs-3" style="color:black;">결재 상태</div>
                        </div>
                        
                        <c:if test="${empty doclist }">
                        	<div class="row">
                        		<div class="col-xs-12" style="padding-top: 10px">
                        		결재 올린 서류가 없습니다.
                        		</div>
                        	</div>
                        </c:if>
                        <c:if test="${!empty doclist }">
                        <c:forEach var="doc" items="${doclist }">
                        <div class="row">
                           <div class="col-xs-4" style="padding-top: 10px; color:#5D5D5D;">${doc.subject}</div>
                           <div class="col-xs-2" style="padding-top: 10px; color:#5D5D5D;">${doc.name2 }</div>
                           <div class="col-xs-3" style="padding-top: 10px; color:#5D5D5D;">${doc.confirm_date }</div>
                           <div class="col-xs-3" style="padding-top: 10px; color:#5D5D5D;">
                                          <c:if test="${doc.state ==3 }">
                                       반려됨
                                    </c:if>
                                    <c:if test="${doc.state ==1 }">
                                       결재완료
                                    </c:if>
                                    <c:if test="${doc.state ==0 }">
                                       결재대기 중
                                    </c:if>
                                    <c:if test="${doc.state ==4 }">
                                       재결재 대기 중
                                    </c:if>
                           </div>
                        </div>
                        </c:forEach>
                        </c:if>
                     </div>
                  </div>
                 </div>
                </div>
      </section>
   </section>
</section>
   <script>
//  sidebar toggle

    $(function() {
        function responsiveView() {
            var wSize = $(window).width();
            if (wSize <= 768) {
                $('#container').addClass('sidebar-close');
                $('#sidebar > ul').hide();
            }

            if (wSize > 768) {
                $('#container').removeClass('sidebar-close');
                $('#sidebar > ul').show();
            }
        }
        $(window).on('load', responsiveView);
        $(window).on('resize', responsiveView);
    });

    $('.fa-bars').click(function () {
        if ($('#sidebar > ul').is(":visible") === true) {
            $('#main-content').css({
                'margin-left': '0px'
            });
            $('#sidebar').css({
                'margin-left': '-210px'
            });
            $('#sidebar > ul').hide();
            $("#container").addClass("sidebar-closed");
        } else {
            $('#main-content').css({
                'margin-left': '210px'
            });
            $('#sidebar > ul').show();
            $('#sidebar').css({
                'margin-left': '0'
            });
            $("#container").removeClass("sidebar-closed");
        }
    });
   </script>
</body>
</html>