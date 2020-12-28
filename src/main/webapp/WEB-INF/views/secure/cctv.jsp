<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">

    #messages { list-style-type: none; margin: 0; padding: 0; }
    #messages li { padding: 5px 10px; }
    #messages li:nth-child(odd) { background: #eee; }

#BigDiv {
bottom: 100px;
width: 1000px;
height: 1300px;
border: 2px solid gray; display: inline-block;
}

#BigDiv > div {

display: inline;
margin: 150px auto;
padding: 50px; 

}


</style>

	<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.2.min.js"></script>
	<script src="https://cdn.socket.io/socket.io-1.3.7.js"></script>
	<script type="text/javascript" src="https://l2.io/ip.js?var=myip"></script>
	<script type="text/javascript" src="https://l2.io/ip.js?var=userip"></script>

</head>


<body>
 <%@include file="/WEB-INF/views/header.jsp" %>
 

<!-- page header -->
<div class="row" id="page header">
	<div class="col-xs-12 text-center">
		<h2>지킴이 서비스</h2>
	</div>
</div>


<br><br>


<!-- sub navigation, 한 row. -->
  <div class="row" id="sub_navigation">
    <div class="col-sm-2" style=":lavenderblush;"></div>
    
    <div class="col-xs-12 text-center" style=":lavender;">
    	<div class="row" style="text-align: center;">
		<h3>원내 CCTV 확인</h3>
		</div>
	</div>

  </div>


<!-- page content -->
<div class="row" id="page_content" >

 <div class="col-sm-2" style=":lavenderblush;"></div>
 
 
	<div class="col-sm-7" style=":lavender;">

    	<div class="row"style="margin-left: 230px;">
			<br><br>

	<c:set var="key" value="${array}"/>
	<c:forEach var="i" begin="1" end="${elem-1}" step="1" varStatus="status">
	
	<div class="col-sm-5" style="height: 300px; margin-bottom: 50px;">
<!-- 	<img id="play" style="width: 250px; height: 250px; padding: 20px; auto; cursor: pointer;" onclick="location.href='cctv_main.do'" > -->
	
	<div class="thumbnail" style="width: 240px;height: 300px;">
	<div>
	<img id="play_${i}" style="width: 100%; height: 230px;  cursor: pointer;" onclick="go_cctv_main('${key[i]}')" >
	</div>
	
	<div>
	<br>
	&nbsp;&nbsp;<b style="color: #5079db;"><<c:out value="${i}"/>> ${key[i]}</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src='https://s11.postimg.org/emx3l5ber/222.jpg'><b id="view_${i}"></b>명 시청중
	</div>
	</div>
	

	 
	
	
	
	</div>
		

	
	<c:if test="${i%2==0}">
	
	<br>
	

	
	
	</c:if>	
	
	</c:forEach>
		</div>
		
		<div class="row">
		<br><br><br><br><br><br><br><br>
		
		<div class="col-sm-2" style=":lavenderblush;"></div>
		<div class="col-sm-7">
		<button type="button" class="btn btn-primary pull-left" onclick="cctv_add()" style="width: 50%; z-index: 10;cursor: pointer; " data-toggle="modal" data-target="#myModal">CCTV 추가</button>
		<button type="button" class="btn btn-primary pull-right" style="width: 50%;" onclick="location.href='secure.do'">나가기</button>

		</div>
		
		</div>
		
	</div>
</div>



<!-- **************************************************************************************************** -->
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>


<%//부트스트랩 모달 영역 %>
<div class="container" style="">
  
  <!-- Trigger the modal with a button -->
  

  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title" id="h4-title"></h4>
        </div>
        <div class="modal-body">
          <p id="modal_content_ptag">
          Some text in the modal.
          </p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal" onclick="myFunction_click()">선택하기</button>
        </div>
      </div>
      
    </div>
  </div>
  
</div>

<%// 안보이는거 modal content 로 돌려준다. %>
<div style="border: 1px solid red; display: none;" id="di" >

지역선택 :<select id="secure_class">
 <option value="별님반">별님반</option>
 <option value="새싹반">새싹반</option>
 <option value="열매반">열매반</option>
 <option value="초록반">초록반</option>
</select>
</div>



<%@include file="/WEB-INF/views/footer.jsp" %>





<script type="text/javascript">
var r;
go_cctv_main = function(r){
	
	//window.alert(r);
	
	location.href="cctv_main.do?region="+r+"";
}

cctv_add = function(){
	var text = document.getElementById("di").innerHTML;
	document.getElementById('h4-title').innerHTML="CCTV 지역추가하기 !";
	document.getElementById('modal_content_ptag').innerHTML=text;
}


myFunction_click = function() {

	var el = document.getElementById('secure_class').value;
	location.href="cctv.do?add=yes&region="+el+"";
}

function codeopen(){

	var socket = io('https://192.168.20.33:8080');

	/**채팅**/

	$('form').submit(function(){
    socket.emit('chat_message', $('#m').val());
    $('#m').val('');
    return false;
 	});
	
  	socket.on('chat_message', function(msg){
  	window.alert(msg);
    $('#messages').append($('<li>').text(msg));
 	});
	
	/****/
	var ipaddr="null";
	var that = this;
	var ip =[];
	
	
	
	socket.on('streamip', function(ip){// socket.on stream 통해 (image)를... 안에는 내부변수라서 상관X 받겠다.
		that.ip = ip
		console.log("we finally arrive at socket.on in visualchat.html with ip: ");
		
		sessionStorage.setItem('key', that.ip[0]);
		
		});
	
	var data = sessionStorage.getItem('key');
	/*
	socket.on("streams", function(buf){
		  var uint8Arr = new Uint8Array(buf.buffer);
		  var str = String.fromCharCode.apply(null, uint8Arr);
		  var base64String = btoa(str);

		
		var e = 'data:image/jpg;base64,' + base64String;
		
		var img = document.getElementById("play");
		img.src = e;
	});		
	*/
	var confirm;
	
socket.on("streams_192.168.243.128", function(image2){
		
		var img = document.getElementById("play_2");
		img.src = image2;
	});	

	socket.on("streams_192.168.64.134", function(image2){
		
		var img = document.getElementById("play_1");
		img.width = 100;
		img.src = image2;
	});
	
	socket.on("streams_192.168.20.25", function(image3){
		
		var img = document.getElementById("play_3");
		img.width = 100;
		img.src = image3;
	});	
	
	socket.on("streams_192.168.20.15", function(image4){
		
		var img = document.getElementById("play_4");
		img.width = 100;
		img.src = image4;
	});	
		
	socket.on("streams_192.168.20.79", function(image4){
	//	console.log("219");
		var img = document.getElementById("play_5");
		img.width = 100;
		img.src = image4;
	});	
	/** 시청자수 ****/
	socket.on('YUL_count',function(viewer){
		
		console.log("YUL_count: "+viewer);
	//	window.alert("YUL_count: "+viewer);
		document.getElementById("view_1").innerHTML =viewer;
		
	});
	socket.on('CHO_count',function(viewer){
		
		console.log("CHO_count: "+viewer);
	//	window.alert("CHO_count: "+viewer);
		document.getElementById("view_2").innerHTML =viewer ;
		
	});
	socket.on('SAE_count',function(viewer){
		
		console.log("SAE_count: "+viewer);
	//	window.alert("SAE_count: "+viewer);
		document.getElementById("view_3").innerHTML =viewer ;
		
	});
	socket.on('BUL_count',function(viewer){
		
		console.log("BUL_count: "+viewer);
	//	window.alert("BUL_count: "+viewer);
		document.getElementById("view_4").innerHTML =viewer ;
		
	});
	
		$(document).ready(function(){
		socket.emit('view-request','go');
		//socket.emit('normal-quality-request','go');
		
		});
	
	
	/******/
	
	
	
	/******/
	$('form').submit(function(){

	
      socket.emit('chat_message', items); // socket.emit, 'chat_message'형태로 내보냄...
  
  	  $('#m').val('');
	  return false;
      });



}


window.onload = codeopen;

</script>

</body>
</html>