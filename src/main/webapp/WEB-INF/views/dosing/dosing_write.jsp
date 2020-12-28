<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>투약 의뢰서 작성하기</title>
<style>
input {
	display: block;
    border: 2px solid white; 
    -webkit-box-shadow: 
      inset 0 0 8px  rgba(0,0,0,0.1),
            0 0 16px rgba(0,0,0,0.1); 
    -moz-box-shadow: 
      inset 0 0 8px  rgba(0,0,0,0.1),
            0 0 16px rgba(0,0,0,0.1); 
    box-shadow: 
      inset 0 0 8px  rgba(0,0,0,0.1),
            0 0 16px rgba(0,0,0,0.1); 
    padding: 5px;
    background: rgba(255,255,255,0.5);
    margin: 0 0 5px 0;
}
.row{
	margin-top: 10px;
	margin-bottom: 10px;
}
</style>
</head>
<body>
 <%@include file="/WEB-INF/views/header.jsp" %>
<script src="https://cdn.socket.io/socket.io-1.3.7.js"></script>
<br/><br/>
<section>
<article>
<!-- page content -->
<%// 투약의뢰폼 %>

    <form class="form-horizontal" action="dosing_write_ok.do" id="theForm">
	<div class="container well well-add-card">
	
		<div class = "title text-center">
			<h3>투약 의뢰서 작성하기</h3>
			<br/>
		</div>
    
        
        <div class="form-group">
            
            <div class="row">
            
              <div class="col-sm-3"></div>
			 
			  <div class="col-sm-1">             
          	  <label class="control-label" for="inputSuccess">원아명</label>
              </div>         
              <div class="col-sm-4">
                <input type="text" id="child_name" class="form-control" placeholder="원아이름을 입력하세요 ex) 안철수" name="child_name" value="${list.namechild}">
                <!-- <span class="help-block">아이디는 사용가능합니다.</span>  -->
              </div>
              
             </div>           
        </div>
    
                <input type="hidden" id="inputSuccess" class="form-control" name="child_idx" value="${list.idx}">
  
        
        
                <div class="form-group">
            
            <div class="row">
            
              <div class="col-sm-3"></div>
			 
			  <div class="col-sm-1">            
          	  <label class="control-label" for="inputSuccess">반명</label>
              </div>
              
              <div class="col-sm-4">
                <input type="text" id="inputSuccess" class="form-control" placeholder="반을 입력하세요 ex) H반"name="dosing_class" value="${list.groupchild}">
                <!-- <span class="help-block">아이디는 사용가능합니다.</span> -->
              </div>
              
             </div>           
        </div>
        
        
         <div class="form-group">
            
            <div class="row">
            
              <div class="col-sm-3"></div>
			 
			  <div class="col-sm-1">            
          	  <label class="control-label" for="inputSuccess">신청인</label>
              </div>
              
              <div class="col-sm-4">
                <input type="text" id="client" class="form-control inputname" placeholder="의뢰자를 입력하세요 ex) 영희" name="client" value="${list.name}">

                <!-- <span class="help-block">아이디는 사용가능합니다.</span> -->
              </div>
              
             </div>           
        </div>
        
        <div class="form-group">
            
            <div class="row">
            
              <div class="col-sm-3"></div>
			 
			  <div class="col-sm-1">            
          	  <label class="control-label" for="inputSuccess">증상</label>
              </div>
              
              <div class="col-sm-4">
                <input type="text" id="inputSuccess" class="form-control" placeholder="증상을 입력하세요!"name="symtom">

                <!-- <span class="help-block">아이디는 사용가능합니다.</span> -->
              </div>
              
             </div>           
        </div>
        

        
        <div class="form-group">
            
            <div class="row">
            
              <div class="col-sm-3"></div>
			 
			  <div class="col-sm-1">            
          	  <label class="control-label" for="inputSuccess">약재명</label>
              </div>
              
              <div class="col-sm-4">
                <input type="text" id="inputSuccess" class="form-control" placeholder="약재이름을 입력하세요! "name="medicine">

                <!-- <span class="help-block">아이디는 사용가능합니다.</span> -->
              </div>
              
             </div>           
        </div>
        
        
        <div class="form-group">
            
            <div class="row">
            
              <div class="col-sm-3"></div>
			 
			  <div class="col-sm-1">            
          	  <label class="control-label" for="inputSuccess">투약 횟수</label>
              </div>
              
              <div class="col-sm-4">
                <input type="text" id="inputSuccess" class="form-control" placeholder="투약횟수를 입력하세요! "name="dosing_capacity">

                <!-- <span class="help-block">아이디는 사용가능합니다.</span> -->
              </div>
              
             </div>           
        </div>
        
         <div class="form-group">
            
            <div class="row">
            
              <div class="col-sm-3"></div>
			 
			 
			 
			 
			  <div class="col-sm-1">            
          	  <label class="control-label" for="inputSuccess">날짜</label>
              </div>
              
              
              
              <div class="col-sm-4">
                <input type="text" id="current_time" class="form-control" placeholder="날짜를 입력하세요 ex) 2016-12-01"name="dosing_date_String">

                <!-- <span class="help-block">아이디는 사용가능합니다.</span> -->
              </div>
              
             </div>           
        </div>
        
        
        <div class="form-group">
            
            <div class="row">
            
              <div class="col-sm-3"></div>
			 
			  <div class="col-sm-1">            
          	  <label class="control-label" for="inputSuccess">투약시간</label>
              </div>
              
              <div class="col-sm-4">
                <input type="text" id="inputSuccess" class="form-control" placeholder="투약시간을 입력하세요! "name="dosing_time">

                <!-- <span class="help-block">아이디는 사용가능합니다.</span> -->
              </div>
              
             </div>           
        </div>
        
        <div class="form-group">
            
            <div class="row">
            
              <div class="col-sm-3"></div>
			 
			  <div class="col-sm-1">            
          	  <label class="control-label" for="inputSuccess">보관방법</label>
              </div>
              
              <div class="col-sm-4">
                <input type="text" id="inputSuccess" class="form-control" placeholder="보관방법을 입력하세요! "name="dosing_keep">
                <!-- <span class="help-block">아이디는 사용가능합니다.</span> -->
              </div>
              
             </div>           
        </div>
        
                 <div class="form-group">
            
            <div class="row">
            
              <div class="col-sm-3"></div>
			 
			 
			 
			 
			  <div class="col-sm-1">            
          	  <label class="control-label" for="inputSuccess">특이사항</label>
              </div>
              
              
              
              <div class="col-sm-4">
                <input type="text" id="dosing_etc" class="form-control" placeholder="특이사항을 입력해 주세요."name="etc">
                <!-- <span class="help-block">아이디는 사용가능합니다.</span> -->
              </div>
              
             </div>           
        </div>
        
        
         <input type="hidden" name="report_writer_name" placeholder="report_writer_name" value="none">
         <input type="hidden" id="hour" name="hour" placeholder="etc" value="none">
         <input type="hidden" id="minute"name="minute" placeholder="etc" value="none">
         <input type="hidden" id="second" name="second" placeholder="etc" value="none">
         <input type="hidden" id="hid" name="time">
         
         <input type = "hidden" name="hidd" id="hidd" value="${sessionScope.id}">
        
        <div class="row">
<div class="col-sm-3"></div>

<div class="col-sm-5 col-sm-offset-1" style="padding-left: 90px;">
<div id="cursors">	    
		</div>

		<canvas id="signature" width="200" height="100" style="border: 1px solid black;">
			
		</canvas>

</div>
</div>
	  	
	  


<div class="row">
	<div class="col-xs-12 text-center">
		<button type="button" onclick="sub()" class="btn btn-primary btn-lg sharp" > 제출 </button>
		<button onclick="location.href='dosing.do'" class="btn btn-primary btn-lg sharp"> 투약작성취소 </button>
	</div>	
</div>
   
</div>
	 </form>


<script type="text/javascript">

var base64str;
var name = document.getElementById('hidd').value;

sub = function(){
	
	
	// canvas 그림 불러와라.
	var canvas = document.getElementById("signature");
	var img    = canvas.toDataURL("image/png");
	base64str = img.replace('data:image/png;base64,', '');
	
	//console.log(img);
	//ert(img);
	
	var client = document.getElementById('client').value;
	var child_name = document.getElementById('child_name').value;
	
	ajax_sending_encodedimg(img,client,child_name,h,m,s);
	document.getElementById("theForm").submit();
	//setTimeout(() => {
	//}, 2000);
	
//	var idx = document.getElementById('is').value;
	//ert(idx);
	//ajax_requesting_encoding(idx);
	
	
	//var replaced = str.split(' ').join('+');
	
	
}
//서명 메소드입니다.

ajax_requesting_encoding = function(i){
	
	ajax_state=5;
	
	createXMLHttpRequest();
	var url = "dosing_GETsignature.do?idx="+i+"&hour="+h+"&minute="+m+"&second="+s+"";
	xmlHttp.onreadystatechange = loader;
	xmlHttp.open("GET", url, true);
	xmlHttp.send(null);	
	
	
}

ajax_sending_encodedimg = function (t,cl,ch,h,m,s){
	console.log("ajax3 !!!");
		ajax_state=4;
		createXMLHttpRequest();
		var url = "dosing_signature.do?t="+t+"&cl="+cl+"&ch="+ch+"&hour="+h+"&minute="+m+"&second="+s+"";
		xmlHttp.onreadystatechange = loader;
		xmlHttp.open("GET", url, true);
		xmlHttp.send(null);	
		
		
}


ajax_getChildName = function(){
	
	//window.alert("getchild");
	/*
	ajax_state=6;
	createXMLHttpRequest();
	var url = "dosing_getChildName?id="+name+"";
	xmlHttp.onreadystatechange = loader;
	xmlHttp.open("GET", url, true);
	xmlHttp.send(null); */
	
}

window.onload = ajax_getChildName;

var today = new Date();
var dd = today.getDate();
var mm = today.getMonth()+1; //January is 0!
var yyyy = today.getFullYear();

var h = today.getHours();
var m = today.getMinutes();
var s = today.getSeconds();
var time = h+""+m+""+s;
document.getElementById('hid').value= time;
	
	
	
	console.log("time: "+today.getHours()+"시"+today.getMinutes()+"분"+today.getSeconds()+"초");
	console.log("time: "+yyyy+"년"+mm+"월"+dd+"일");
	
	
	var eleme = document.getElementById('current_time');
	eleme.value = yyyy+"-"+mm+"-"+dd;
	
	document.getElementById('hour').value=h;
	document.getElementById('minute').value=m;
	document.getElementById('second').value=s;
		

function codeopen(){
	//("start !");
	//ert("crossbrowsing Test!!!");
	// HTML 5 지원여부 확인
	if(!('getContext' in document.createElement('canvas'))){
		//('지원불가 !');
		return false;
	}		
	// 노드 웹서버와 연겹.
	//var url = 'https://192.168.219.181:8080';// 클라이언트용
	var url = 'https://192.168.20.33:8080';// 서버용
	
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
				'x': e.pageX-685,
				'y': e.pageY-1030,
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

function createXMLHttpRequest() {
	if(window.ActiveXObject) { 
		xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");		
	} else if(window.XMLHttpRequest) { 
	xmlHttp = new XMLHttpRequest();
	}
}

function loader() {
	if(xmlHttp.readyState == 4) {
		if(xmlHttp.status == 200) {
			
			
			
			
			var DATA = xmlHttp.responseText;
			DATA=eval('('+DATA+')'); // 소괄호를 라벨로 인식함??
			
					if(ajax_state==6){
						window.alert("ajax_state==6");	
						
					}else{
					/*
			var s1 = DATA.data[0].s1;
			//ert(s1.length);
			var s2 = DATA.data[0].s2;
			//ert(s2.length);
			var imgdata = s1+s2;
			//ert(imgdata.length);
		
			
			
			var abc = ' ';
			var def = "쏘리질럿";
			function replaceAll(imgdata, abc, replace) {
				  return str.replace(new RegExp(abc, def), replace);
				}

			
			var str = imgdata.split(" ").join("+");
			
			
			
			////ert(replaced.length);
			var elem = document.getElementById('imgTest');
			elem.innerHTML="<img src="+str+">니가한 싸인이다 쏘리질럿 !";
			
			
			console.log("-------------------------");
			console.log(str);
			console.log("-------------------------");
						*/
					}
			
		}
						
		}
		}





</script>
<div id="imgTest"></div>
</article>
</section>
</body>
</html>