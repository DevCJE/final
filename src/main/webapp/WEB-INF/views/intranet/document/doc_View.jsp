<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- js placed at the end of the document so the pages load faster -->
<script src="assets/js/jquery.js"></script>
<script src="assets/js/jquery-1.8.3.min.js"></script>
<link rel="stylesheet" type="text/css" href="assets/css/bootstrap.css">
<script src="assets/js/bootstrap.min.js"></script>
<script class="include" type="text/javascript"
   src="assets/js/jquery.dcjqaccordion.2.7.js"></script>
<script src="assets/js/jquery.scrollTo.min.js"></script>
<script src="assets/js/jquery.nicescroll.js" type="text/javascript"></script>
<script src="assets/js/jquery.sparkline.js"></script>
<script src="https://cdn.socket.io/socket.io-1.3.7.js"></script>

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
	<br><br>
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
<div class="row">
<div class="col-xs-6 col-xs-offset-2" >
	<iframe src="${url}" width="850" height="900"></iframe>
</div>

<div class="col-xs-8 col-xs-offset-5">
<form name="signname" action="updateSign.do" id="doc_form">
<input type="hidden" name="idx" value="${idx }">
<input type="hidden" name="name2" value="${name }">

<div class="row" style="margin-right: 50px;">

<div class="col-sm-3">
<fieldset>
	<legend>보고자 사인</legend>
		<div id="signature_report" style="border: 1px solid black; width: 200px;height: 100px;">	
		</div>
</fieldset>
</div>
<div class="col-sm-1"></div>

<div class="col-sm-3">
<fieldset>
	<legend>결재자 사인</legend>
		<canvas id="signature" width="200" height="100" style="border: 1px solid black;">	
		</canvas>
</fieldset>
<input type="hidden" id="idx" name="sign2" value="${idx}">
<input type="hidden" id="long_idx" name="" value="${sign1}">
<input type="submit" value="결재확인">
<c:url var="donot" value="donotUpdate.do?">
	<c:param name="idx" value="${idx }"/>
	<c:param name="name2" value="${name }"/>
</c:url>
<a href="${donot }"><input type="button" value="결재반려">
</a>
</div>
</div>


</form>
</div>
</div>
</section>
</section>
</section>


<script type="text/javascript">

var idx = document.getElementById('idx').value;
var long_idx = document.getElementById('long_idx').value;

$('#doc_form').submit(function(){

	// canvas 그림 불러와라.
	var canvas = document.getElementById("signature");
	var img    = canvas.toDataURL("image/png");
	base64str = img.replace('data:image/png;base64,', '');
	
	//ert(img);

	ajax_sending_encodedimg(img,idx);

	//window.alert("1. 서명저장완료.");
	
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
		
		var url = "document_signature.do?t="+t+"&idx="+idx+"&state=view";
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


var ajax_state=0;
ajax_requesting_encoding = function(i){
	
	ajax_state=5;
	
	createXMLHttpRequest();
	var url = "dosing_GETsignature.do?idx="+i+"&state=doc";
	xmlHttp.onreadystatechange = loader;
	xmlHttp.open("GET", url, true);
	xmlHttp.send(null);	
	
	
}



window.onload = ajax_requesting_encoding(long_idx);



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
		
		if( data.drawing && clients[data.id]){
				
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
				'x': e.pageX-1086,
				'y': e.pageY-1042,
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