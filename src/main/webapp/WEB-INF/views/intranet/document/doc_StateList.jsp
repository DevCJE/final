<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE>
<html>
<head>


<script>
	$(function() {
		$('#table').searchable({
			striped : true,
			searchType : 'fuzzy'
		});

		$('#searchable-container').searchable({
			searchField : '#container-search',
			selector : '.row',
			childSelector : '.col-xs-4',
			show : function(elem) {
				elem.slideDown(100);
			},
			hide : function(elem) {
				elem.slideUp(100);
			}
		})
	});
	var ele;
	var name;
	function select(i) {
		var num;
		var el = document.getElementById("sel1_" + i + "").value;
		ele = el;
	}
	function myFunction(id) {
		location.href = 'chBanChange.do?groupchild=' + ele + '&id=' + id
				+ '&cp=' + $
		{
			cp
		}
		+'';
	}
	function myFunction2(idx) {
		location.href = 'chDelete.do?idx=' + idx + '&cp=' + $
		{
			cp
		}
		+'';
	}

	var x_counter;
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

		<!-- 모달 CSS -->
		<link rel="stylesheet" type="text/css" href="assets/css/component.css" />
		<script src="assets/js/modernizr.custom.js"></script>
		<!-- 모달 CSS -->
<style>
.top-menu ul li{
	margin-top:15px;
}

</style>
</head>
<body>


<!-- 모달 영역, 감춰진 부분. -->
		<div class="md-modal md-effect-16" id="modal-16">
			<div class="md-content">
				<h3>결제 완료 확인(관리자 서명)</h3>
				<div id="signature_report">

					
					<button class="md-close">Close me!</button>
				</div>
			</div>
		</div>
		
			<button class="md-trigger" data-modal="modal-16" id="button_ok" style="display: none;">Newspaper</button>

		<div class="md-overlay"></div><!-- the overlay element -->

		<!-- classie.js by @desandro: https://github.com/desandro/classie -->
		<script src="assets/js/classie.js"></script>
		<script src="assets/js/modalEffects.js"></script>

		<script>

			var polyfilter_scriptpath = '/js/';
		</script>
		<script src="assets/js/cssParser.js"></script>
		<script src="assets/js/css-filters-polyfill.js"></script>
<!-- 모달 영역, 감춰진 부분. -->		
	
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
	<!--main content start--> 




	<section id="main-content">
<section class="wrapper">
	<div id="content">
		<div name="title" align="left">
			<h1>결재 상태 목록</h1>
		</div>

		<div name="statelist" align="center">
			<table class="table" width="800" border="0">
				<tr align="center">
				<thead align="center">
					<td><b>서류 제목</b></td>
					<td><b>결재 기한</b></td>
					<td><b>결재자</b></td>
					<td><b>결재 상태</b></td>
				</thead>
				</tr>
				<c:if test="${empty stateList }">
					<tr align="center">
						<td colspan="4">결재 보낸 서류가 없습니다</td>
					</tr>
				</c:if>
				<c:forEach var="state" items="${stateList }" varStatus="status">
					<tr align="center">
						<td><a href="#"
							onclick="window.open('${state.document }','statedoc','width=860,height=980')">${state.subject }</a></td>
						<td>${state.confirm_date }</td>
						<td>${state.name2 }</td>
						<td><c:if test="${state.state ==3 }">
				반려됨 | 
				<c:url var="fileURL" value="docEdit.do?">
									<c:param name="idx" value="${state.idx }" />
									
								</c:url>
								<a href="${fileURL }">수정하기</a>
							</c:if> <c:if test="${state.state ==1 }">
				<span style="color:red;" onmouseover="myFunction(${state.idx})">결재완료</span>
			</c:if> <c:if test="${state.state ==0 }">
				결재대기 중
			</c:if> <c:if test="${state.state ==4 }">
				재결재 대기 중
			</c:if></td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div align="center">${page }</div>
	</div>
</section>
</section>
</section>

</body>

<script>

myFunction = function(idy){
	
	
	ajax_requesting_encoding(idy);
	
	
	
	
	  $( "#button_ok" ).click();
	
	
}


function createXMLHttpRequest() {
	if(window.ActiveXObject) { 
		xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");		
	} else if(window.XMLHttpRequest) { 
	xmlHttp = new XMLHttpRequest();
	}
}



ajax_requesting_encoding = function(i){
	
	ajax_state=5;
	
	createXMLHttpRequest();
	var url = "dosing_GETsignature.do?idx="+i+"&state=doc";
	xmlHttp.onreadystatechange = loader;
	xmlHttp.open("GET", url, true);
	xmlHttp.send(null);	
	
	
}

function loader() {
	if(xmlHttp.readyState == 4) {
		if(xmlHttp.status == 200) {
			temp = xmlHttp.responseText;
			var DATA = temp;
			DATA = eval('('+DATA+')');
			console.log("pass");
			if(ajax_state === 5){
				
				var s1 = DATA.data[0].s1;
				//ert(s1.length);
				var s2 = DATA.data[0].s2;
				//ert(s2.length);
				var imgdata = s1+s2;
				//ert(imgdata.length);
						
				var abc = ' ';
			
				function replaceAll(imgdata, abc, replace) {
					  return str.replace(new RegExp(abc, def), replace);
					}

				
				var str = imgdata.split(" ").join("+");
				//ert(str);
				
				var elem = document.getElementById('signature_report');
				elem.innerHTML="<img src="+str+" style='width:200px; height:100px;'>";
		}
			
		}}}


</script>




</html>