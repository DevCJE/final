<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
    
<script src="assets/js/jquery-1.11.1.min.js"></script>
<script src="assets/js/jquery-ui-1.11.4.custom.min.js"></script>
<script src="assets/js/sidebar.js"></script>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">  
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://cdn.socket.io/socket.io-1.3.7.js"></script>

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
	<aside class="sidebar">
		<div class="sidebar-content">
			<div class="sidebar-field">
			<form name="doc_docWrite" action="doc_docWrite2.do">
				<input type="hidden" name="document" value="${fileID }"> 
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
					<input type="text" name="sign1" size="30">
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
</body>
</html>