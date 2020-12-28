<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(function() {

		$("#checkAll").click(function() {
			if ($("#checkAll").prop("checked")) {
				$("input[name=chk]").prop("checked", true);
			} else {
				$("input[name=chk]").prop("checked", false);
			}
		})

		$("#remove").click(function() {
			var chk = $("input[name=chk]").is(":checked");
			if (!chk) {
				alert("선택된 메세지가 없습니다.");
			} else {
				$('input[name=chk]:checked').each(function() {
					$(this).parents('tr').remove();
				});
				alert("메세지 삭제가 완료되었습니다.");
			}
		})
	})
</script>
<!-- js placed at the end of the document so the pages load faster -->
<script src="assets/js/jquery.js"></script>
<script src="assets/js/jquery-1.8.3.min.js"></script>
<link rel="stylesheet" type="text/css" href="assets/css/bootstrap.css">
<script src="assets/js/bootstrap.min.js"></script>
<script class="include" type="text/javascript" src="assets/js/jquery.dcjqaccordion.2.7.js"></script>
<script src="assets/js/jquery.scrollTo.min.js"></script>
<script src="assets/js/jquery.nicescroll.js" type="text/javascript"></script>
<script src="assets/js/jquery.sparkline.js"></script>


<!--common script for all pages-->

<script type="text/javascript" src="assets/js/jquery.gritter.js"></script>
<script type="text/javascript" src="assets/js/gritter-conf.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!--external css-->
<link rel="stylesheet" type="text/css" href="assets/js/css/gritter/css/jquery.gritter.css">
<link rel="stylesheet" type="text/css" href="assets/js/css/lineicons/style.css">

<!-- Custom styles for this template -->
<link href="assets/js/css/style.css" rel="stylesheet">
<link href="assets/js/css/style-responsive.css" rel="stylesheet">
<script src="assets/js/chart-master/Chart.js"></script>
<script src="assets/js/common-scripts.js"></script>

<style>
.top-menu ul li{
	margin-top:15px;
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
		<div class="fa fa-bars tooltips" data-placement="right" data-original-title="Toggle Navigation"></div> 
	</div>
	<!--logo start--> 
		<c:url var="itnIndexUrl" value="itn_index.do">
			<c:param name="send_name">${sessionScope.name}</c:param>
		</c:url>
		
		<a href="${itnIndexUrl}" class="logo"><b>INTRANET</b></a> <!--logo end-->
		
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

			<li class="sub-menu">
				<a href="javascript:;">
					<span>서류관리</span>
				</a>
				<ul class="sub">
					<li><a href="doc_docList.do">서류 목록</a></li>
					<li><a href="doc_SignList.do?name=${sessionScope.name}">결재 서류 목록</a></li>
					<li><a href="doc_StateList.do?name=${sessionScope.name}">결재 상태 보기</a></li>
				</ul>
			</li>
			
			<li class="sub-menu">
				
				<span>
					<a href="rollSave.do">출석부</a>
				</span>
				
			</li>
			<c:if test="${sessionScope.auth == 5}"> 
			<li class="sub-menu">
				<a href="javascript:;"> 
					<span>멤버관리</span>
				</a>
					<ul class="sub">
						<li><a href="teNo_adminForm.do">미승인교사관리</a></li>
						<li><a href="te_adminForm.do">승인교사관리</a></li>
						<li><a href="chNo_adminForm.do">미승인원생관리</a></li>
						<li><a href="ch_adminForm.do">승인원생관리</a></li>
					</ul>
			</li>
			</c:if>
			<c:if test="${sessionScope.auth == 4}"> 
			<li class="sub-menu">
				<a href="javascript:;">
					<span>원생관리</span>
				</a>
					<ul class="sub">
						<li><a href="chNo_adminForm.do">미승인원생관리</a></li>
						<li><a href="ch_adminForm.do">승인원생관리</a></li>
					</ul>
			</li>
			</c:if>
			
			<li class="sub-menu">
				
				<c:url var="itnMsgUrl" value="itn_msg_List.do">
					<c:param name="count">${sessionScope.count}</c:param>
					<c:param name="send_name">${sessionScope.name}</c:param>
				</c:url>
				
				<span>
					<a href="${itnMsgUrl}">쪽지함</a>
				</span>
				
			</li>
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
      </section>
	<!--main content start--> 
	<section id="main-content">
		<section class="wrapper">
<br><br><br><br><br>
<div class="content">
		<ul class="nav nav-tabs">
			<c:url var="itnMsgUrl" value="itn_msg_List.do">
				<c:param name="send_name">${sessionScope.name}</c:param>
			</c:url>
			<li class="active"><a href="${itnMsgUrl}">받은쪽지함</a></li>
			<c:url var="itnMsgRecvUrl" value="itn_msg_RecvList.do">
				<c:param name="recv_name">${sessionScope.name}</c:param>
			</c:url>
			<li><a href="${itnMsgRecvUrl}">보낸쪽지함</a></li>
		</ul>
		<form name="delForm" action="itn_msg_SendDel.do">
			<table border="0" cellspacing="0" class="table table-hover">
				<thead>
					<tr align="center">
						<td width="30px"><input type="checkbox" id="checkAll"></td>
						<td width="50px">번호</td>
						<td width="100px">보낸사람</td>
						<td width="500px">제목</td>
						<td width="50px">날짜</td>
						<td width="100">수신여부</td>
					</tr>
				</thead>
				<tbody>
					<c:if test="${empty list}">
						<tr>
							<td colspan="6" align="center">받은 쪽지가 없습니다.</td>
						</tr>
					</c:if>
					<c:forEach var="dto" items="${list}"> 
						<c:if test="${dto.send_name == sessionScope.name && dto.send_del != 'Y'}">
								<tr align="center">
									<td><input type="checkbox" name="chk" value="${dto.idx}"></td>
									<td>${dto.idx}</td>
									<td>${dto.recv_name}</td>
									<c:url var="msgContentUrl" value="itn_msg_Content.do">
										<c:param name="idx">${dto.idx}</c:param>
										<c:param name="send_name">${dto.send_name}</c:param>
									</c:url>
									<td><a href="${msgContentUrl}">${dto.subject}</a></td>
									<td>${dto.message_date}</td>
									<c:if test="${dto.message_view==0}">
										<td>미확인</td>
									</c:if>
									<c:if test="${dto.message_view>0}">
										<td>${dto.message_date}</td>
									</c:if>
								</tr>
							</c:if>
					</c:forEach>
					<tr align="right">
						<td colspan="6">
						<input type="hidden" name="send_name" value="${sessionScope.name}"> 
						<input type="submit" value="삭제하기" class="btn btn-warning"> 
						<c:url var="recvUrl" value="itn_msg_Write.do">
							<c:param name="idx">${dto.idx}</c:param>
							<c:param name="recv_name">${sessionScope.name}</c:param>
						</c:url>
						<button type="button" class="btn btn-warning" onclick="location.href='${recvUrl}'">쪽지보내기</button>
					</tr>
				</tbody>

				<tfoot>
					<tr align="center">
						<td colspan="6">${pageStr}</td>
					</tr>
				</tfoot>
			</table>
		</form>
	</div>
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