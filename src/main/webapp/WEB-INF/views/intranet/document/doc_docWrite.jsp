<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- js placed at the end of the document so the pages load faster -->
<script src="assets/js/jquery-1.8.3.min.js"></script>
<link rel="stylesheet" type="text/css" href="assets/css/bootstrap.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> 
<script src="assets/js/bootstrap.min.js"></script>
<script class="include" type="text/javascript" src="assets/js/jquery.dcjqaccordion.2.7.js"></script>
<script src="assets/js/jquery.scrollTo.min.js"></script>
<script src="assets/js/jquery.nicescroll.js" type="text/javascript"></script>
<script src="assets/js/jquery.sparkline.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="assets/js/modernizr.custom.32033.js"></script>
    <script src="assets/js/slick.min.js"></script>
    <script src="assets/js/placeholdem.min.js"></script>
    <script src="assets/js/rs-plugin/js/jquery.themepunch.plugins.min.js"></script>
    <script src="assets/js/rs-plugin/js/jquery.themepunch.revolution.min.js"></script>
    <script src="assets/js/waypoints.min.js"></script>
    <script src="assets/js/scripts.js"></script>
    <script src="assets/js/jquery-ui-1.11.4.custom.min.js"></script>
	<script src="assets/js/sidebar.js"></script>
	<script src="https://cdn.socket.io/socket.io-1.3.7.js"></script>
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

<script>  
$(function() {
    $( "#datepicker" ).datepicker({
         showButtonPanel: true,       
         closeText: '닫기', 
         dateFormat: "yy-mm-dd",
         changeMonth: true, 
         dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
         dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
         monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
         monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']

  });
});
  var num="";
</script>
<script>
function memSearch(){
	var name = document.doc_docWrite.name2.value;
	window.open('doc_searchMem.do?name2='+name,'searchMember','width=300,height=150');
}
</script> 

<style>
.top-menu ul li{
	margin-top:15px;
}
button {
	outline: none;
}

button .sidebar-btn {
	color: black;
	font-weight: bold;
}

.sidebar {
	background-color: white;
	width: 458px;
	height: 100%;
	position: fixed;
	top: 0;
	right: -458px;
	z-index: 9999;
	margin-left: 0px;
	border-left: 1px solid black;
}

.sidebar>.sidebar-content {
	position: absolute;
	top: 20px;
	left: 90px;
	color: black;
}

.sidebar button {
	background-color: white;
	display: block;
	position: absolute;
	top: 117px;
	right: 458px;
	width: 70px;
	height: 38px;
	line-height: 38px;
	text-align: center;
	margin: 0;
	padding: 0;
	border-left: 1px solid black;
	border-top: 1px solid black;
	border-bottom: 1px solid black;
}
.sidebar-field {
	margin-right: 100px;
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
	<!--main content start--> 
<section id="main-content">
<section class="wrapper">
<div id="content" align="center">
<aside class="sidebar">
		<div class="sidebar-content">
			<div class="sidebar-field">
			<form name="doc_docWrite" action="doc_docWrite2.do" id="doc_form">
				<input type="hidden" name="document" value="${fileID }" id="idx"> 
				<fieldset>
					<legend>문서 제목</legend>
					<input type="text" name="subject" value="${filename }" size="30">
				</fieldset>
				<br>
				<input type="hidden" name="name1" value="${sessionScope.name }">
				<br>
				<fieldset>
					<legend>결재자</legend>
					<input type="text" name="name2" size="30">
				</fieldset>
				<br>
				<br>
				<fieldset>
					<legend>결재시한</legend>
					<input
					type="text" id="datepicker" name="confirm_date"
					class="btn btn-default" value="날짜 선택" size="20">
				</fieldset>
				<br>
				<input type="hidden" name="state" value="0">
				<br>
				<fieldset>
					<legend>서명</legend>
					<input type="hidden" name="sign1" size="30" value="${fileID}">
				</fieldset>
				<br><br>
				<div id="cursors"></div>

				<canvas id="signature" width="200" height="100"
					style="border: 1px solid black;">
				</canvas>
				<br><br>
				<input type="submit" value="결재 보내기" class="btn btn-primary">
				<a href="doc_docList.do" class="btn btn-primary">취소</a>
			</form>
			</div>
		</div>
		<button>
			<span class="sidebar-btn">OPEN</span>
		</button>
	</aside>

		<div name="write" align="center">
			<iframe src="${url }" width="100%" height="800px"></iframe>
		</div>

</div>
</section>
</section>
</section>
</section>
</body>

<script type="text/javascript">

$('#doc_form').submit(function(){

	var canvas = document.getElementById("signature");
	var img    = canvas.toDataURL("image/png");
	base64str = img.replace('data:image/png;base64,', '');
	
	var idx = document.getElementById('idx').value;
	

	ajax_sending_encodedimg(img,idx);

	
	
});

function createXMLHttpRequest() {
	if(window.ActiveXObject) { 
		xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");		
	} else if(window.XMLHttpRequest) { 
	xmlHttp = new XMLHttpRequest();
	}
}

ajax_sending_encodedimg = function (t,idx){
	console.log("ajax3 !!!");
		ajax_state=4;
		createXMLHttpRequest();
		//window.alert("ajaz!");
		var url = "document_signature.do?t="+t+"&idx="+idx+"&state=write";
		xmlHttp.onreadystatechange = loader;
		xmlHttp.open("GET", url, true);
		xmlHttp.send(null);	
	
}

function loader() {
	if(xmlHttp.readyState == 4) {
		if(xmlHttp.status == 200) {
			//window.alert("ajax 도착!");
			
		}}}









function codeopen(){
	//("start !");
	//ert("crossbrowsing Test!!!");
	// HTML 5 지원여부 확인
	if(!('getContext' in document.createElement('canvas'))){
		//('지원불가 !');
		return false;
	}		
	// 노드 웹서버와 연겹.
	var url = 'https://192.168.20.33:8080';// 클라이언트용
	//var url = 'https://192.168.20.33:8080';// 서버용
	
	// getContext('2d') --> canvas 이미지를 실제Image 로 context 화 하는 작업. 
	var	context = $('#signature')[0].getContext('2d'),
	instructions = $('#instructions');
	
	var id = Math.round((new Date).getTime()*Math.random());// 접속유저 임의 번호 부여.
	var drawing = false;// drawing 기능 false 로 초기화

	var clients = {};
	var cursors = {};
	
	var socket = io.connect(url); // 파이프 노드 웹서버와 연결
	
	socket.on('moving', function (data) {			
		console.log("data: "+data);		
		
		if(! (data.id in clients)){
			cursors[data.id] = $('<div class="cursor">').appendTo('#cursors');
		}

		cursors[data.id].css({
			'left' : data.x,
			'top' : data.y
		});
		
		if(data.drawing && clients[data.id]){
				
			drawLine(clients[data.id].x, clients[data.id].y, data.x, data.y);
		
		}
		clients[data.id] = data;
		clients[data.id].updated = (new Date).getTime();
	});
	
	var prev = {};
	
	$('#signature').on('mousedown',function(e){	
		e.preventDefault();
		drawing = true;
		prev.x = e.pageX;
		prev.y = e.pageY;
		instructions.fadeOut();
	});
	
	$(document).bind('mouseup mouseleave',function(){
		drawing = false;
	});
	
	var lastEmit = (new Date).getTime();
	// (new Date).getTime() --> (new Date).getTime().
	
	$(document).on('mousemove',function(e){
		if((new Date).getTime() - lastEmit > 30){
			socket.emit('mousemove',{
				'x': e.pageX-1300,
				'y': e.pageY-430,
				'drawing': drawing,
				'id': id
			});
			lastEmit = (new Date).getTime();
		}
		
		if(drawing){
			console.log("---DRAWING---");
			drawLine(prev.x, prev.y, e.pageX, e.pageY);
			socket.on('sending',function(){
				
			});				
			
			prev.x = e.pageX;
			prev.y = e.pageY;
		}
	});
	
	setInterval(function(){			
		for(ident in clients){
			if((new Date).getTime() - clients[ident].updated > 20000){					
				cursors[ident].remove();
				delete clients[ident];
				delete cursors[ident];
			}
		}			
	},20000);// 20초뒤 삭제

	// 드로잉 메소드입니다.
	function drawLine(fromx, fromy, tox, toy){
		context.moveTo(fromx, fromy);
		context.lineTo(tox, toy);
		context.stroke();// 그린다.
	}
}

window.onload = codeopen;

</script>

</html>