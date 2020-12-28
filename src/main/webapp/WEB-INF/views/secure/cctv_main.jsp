<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<!-- 모달 CSS -->
		<link rel="stylesheet" type="text/css" href="assets/css/component2.css" />
		<link rel="stylesheet" type="text/css" href="assets/css/boom.css" />
 <%@include file="/WEB-INF/views/header.jsp" %>

<style>
.not {
display: none;
}
.yes{
}
.slideup > li {
 list-style-type:none;
  vertical-align: text-top;
  margin-bottom: 10px;
  height: 40px;
  margin-left: -20px;
}
.go_black {
color:black;
}
.go_white {
color:white;
}
/***/
.boom{
}
.boom {
  animation-duration: 0.8s;
  animation-name: slidein;
}
@keyframes slidein {
  from {
    margin-top: 50%;
    width: 300%; 
  }
  to {
    margin-top: -35%;
    width: 100%;
  }
}
.unseeing{
display: none;
}
.modal-backdrop.in {
	opacity: 0.5;
}
/***/
h2 {text-align: center; letter-spacing: -2px; text-transform: uppercase; color: #999; font-size: 2em; margin: 0;}
#block {width: 566px; background: rgba(0, 0, 0, 0.1); padding: 20px; border-radius: 10px; margin: 40px auto;}
p {text-align: center; font-size: 0.8em; color: #666;}
p input {padding: 10px; display: block; margin: 10px auto; width: 50px; border-radius: 2px; border: 1px solid #ccc; text-align: center;}
#loadingBar {border-radius: 3px; width: 500px; height: 30px; background: #efefef; border: 1px solid #ccc; padding: 2px; position: relative; overflow: hidden; margin: 20px auto 0; -moz-box-shadow: 0px 0px 10px 1px #aaa;
-webkit-box-shadow: 0px 0px 10px 1px #aaa; box-shadow: 0px 0px 10px 1px #aaa;}
#container {width: 100%; height: 100%; background: #fff; border-radius: 2px; position: relative; overflow: hidden;} 
#bar {width: 100%; height: 100%; background: #666; position: absolute; top: 0; left: -100%; color: #888; text-align: center; text-transform: uppercase; letter-spacing: 1px; line-height: 30px; font-weight: bold; font-size: 0.7em;}
#vid {
margin-left: 100px;
margin-top: 100px;
}

.progress-bar {
    background-color: #1a1a1a;
    height: 25px;
    padding: 5px;
    width: 250px;
       
    border-radius: 5px;
    box-shadow: 0 1px 5px #000 inset, 0 1px 0 #444;           
}

.progress-bar span {
    display: inline-block;
    height: 100%;
    border-radius: 3px;
    box-shadow: 0 1px 0 rgba(255, 255, 255, .5) inset;
    transition: width .4s ease-in-out;    
}


.orange span {
      background-color: #fecf23;
      background-image: linear-gradient(top, #fecf23, #fd9215);  
}   



.shine span {
    position: relative;
}

.shine span::after {
    content: '';
    opacity: 0;
    position: absolute;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
    background: #fff;
    border-radius: 3px;
    animation: animate-shine 2s ease-out infinite;             
}

@keyframes animate-shine {
    0% {opacity: 0; width: 0;}
    50% {opacity: .5;}
    100% {opacity: 0; width: 95%;}
}



.defaul{

z-index: 9999;
}

.video_class{

-webkit-box-shadow: 10px 10px 5px 0px rgba(0,0,0,0.75);
-moz-box-shadow: 10px 10px 5px 0px rgba(0,0,0,0.75);
box-shadow: 10px 10px 5px 0px rgba(0,0,0,0.75);
}

</style>

</head>
<body>

		<script src="assets/js/modernizr.custom.js"></script>
		<!-- 모달 CSS -->
	<script src="https://cdn.socket.io/socket.io-1.3.7.js"></script>
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.2.min.js"></script>
	<!-- 녹화  -->
	<script src="https://cdn.webrtc-experiment.com/RecordRTC/Whammy.js"></script>
	<script src="https://cdn.webrtc-experiment.com/RecordRTC/CanvasRecorder.js"></script>
	<script src="assets/js/canvas-designer.js"></script>
	<script src="assets/js/RecordRTC.js"></script>
	<script src="assets/js/getScreenId.js"></script>
	<!-- 적재시킬 라이브러리 -->

	<!-- 적재시킬 라이브러리 -->
<br><br><br><br><br>
<!-- 모달 영역, 감춰진 부분. -->

		<div class="md-modal md-effect-16" id="modal-11">
			<div class="md-content">
				<h3>녹화 완료 및 저장(관리자)</h3>
				<div class="row"id="recode_check">
					
				</div>
				<div>					
					<button style="color: black; display: inline;" onclick="save()">저장하기</button><button class="md-close" style="display: inline;color: black;">취소</button> <!-- <button style="display: inline;color: black; "onclick="base()">base64인코딩 타입txt</button> -->
				</div>
			</div>
		</div>
			<button class="md-trigger" data-modal="modal-11" id="button_okk" style="display: none;">Newspaper</button>

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





<!-- page header -->
<div class="row" id="page header" style="margin-bottom: 40px;">
	<div class="col-sm-12" style="text-align: center;font-size: x-large;height: 20px;">
			<span style=" margin-right: -350px;" id="rec" >
				<span class="progress-bar orange shine" style="margin-left: 300px;">
				녹화중입니다.
    			<span style="width: 100%"></span>
				</span>			
			</span>
			<span style="">
				<b class = "text-center">지킴이 서비스(${region})</b>
			</span>
	</div>
	
</div>
	
	
<!-- sub navigation, 한 row. -->
  <div class="row" id="sub_navigation">
    <div class="col-sm-2" style=""></div>
    
    <div class="col-sm-7" style="">
    	<div class="row" style="text-align: center;">
		
		</div>
	</div>

  </div>

<!-- page content -->
<div class="row" id="page_content" >

 <div class="col-sm-2" style=""></div>
 
 
	<div class="col-sm-9" style="">
    	
<div class="col-sm-4 "style="width: 550px;height: 350px;">

<span style="display: none;"><img id="play_1" style="border: 3px solid #e7e3e8;width: 500px; height: 300px;"></span>

<canvas id="preview" style="border: 1px solid ravendar; width: 100%;height: 100%;">



</canvas>


<br>

<div class="row" style="margin-top: 10px;">
<div class="col-xs-3" style="float: right;margin: 0px auto; margin-right: 20px;" id = "current_popul"  ></div>
<div class="col-xs-4"style="float: right;margin: 0px auto; margin-right: -50px;cursor: pointer;"><img src="https://s15.postimg.org/ins4qnm0b/image.jpg" style="border: none;" class="md-trigger" data-modal="modal-16" id="button_ok" onclick="recover()" ></div>
<div class="col-xs-4"style="float: left;margin: 0px auto;margin-right: -50px;" >
   <button id="start"><img src="https://s29.postimg.org/t35z0k0mv/666.jpg" style="width: 9px;height: 9px;">녹화시작</button>
   <button id="stop">중지</button>
</div>
<div id="frameover"class="col-xs-2"style="float: left;margin-left: 30px;" >

화질<input type="range" id="range"onchange="myFuncFrame()"/>
</div>
<script>
var socket = io('https://192.168.20.33:8080');
var recorder;var count=0;
var canvas2d = document.getElementById('preview');
var context = canvas2d.getContext('2d');
var recorder = new RecordRTC(canvas2d, {
    type: 'canvas'
});

var base64data;

save = function(){
	
	recorder.save('녹화영상');
	
}
document.getElementById('rec').className="not";


document.getElementById('start').onclick = function() {
	document.getElementById('recode_check').innerHTML="";
	document.getElementById('rec').className="yes";
	
	
	recorder.initRecorder();
  document.getElementById('start').disabled = true;
    isStoppedRecording = false;
    isRecordingStarted = true;
    playVideo(function() {
        recorder.startRecording();
        setTimeout(function() {
            document.getElementById('stop').disabled = false;
        }, 1000);
    });
};

	document.getElementById('stop').onclick = function() {
	 document.getElementById('stop').disabled = true;
	 document.getElementById('rec').className="not";
    isStoppedRecording = true;
    recorder.stopRecording(function() {
        var blob = recorder.getBlob();
        var video = document.createElement('video');
        video.src = URL.createObjectURL(blob);
        
        var reader = new window.FileReader();
        reader.readAsDataURL(blob); 
        reader.onloadend = function() {
                      base64data = reader.result;                
                      // console.log(base64data);
                      
                      
         }
         	
         
        
        video.setAttribute('style', 'height: 100%; width:100%; top:0;right:100;margin-bottom:-30px;');
        video.className="video_class";
       
        $( "#button_okk" ).click();
        document.getElementById('recode_check').appendChild(video);
        video.controls = true;
        
        video.play();
        document.getElementById('start').disabled = false;
        document.getElementById('stop').disabled = false;
    });
    count++;
};

base = function(){
	window.alert("base 확인 !");
	$('#button_okkk').click();
	//document.getElementById('').value = base64data;
	//document.getElementById('').className = "yes";
}


function playVideo(callback) {
    function successCallback(stream) {
        videoElement.onloadedmetadata = function() {
            callback();
        };
        videoElement.src = URL.createObjectURL(stream);
        videoElement.play();
    }
    function errorCallback(error) {
        console.error('get-user-media error', error);
        callback();
    }
    var mediaConstraints = { video: true };
    navigator.mediaDevices.getUserMedia(mediaConstraints).then(successCallback).catch(errorCallback);
}
	
	
	
	
</script>

</div>


</div>
 
<div class="col-sm-2 thumbnail" style="width: 250px;height: 400px;" >
	<div class="row">
	<span onclick="seeSet()" style="cursor: pointer; float: right; margin-right: 20px;"><img src = "https://s28.postimg.org/84m19gaj1/image.png"></span>
	</div>
	<div style=" display: inline-block; margin: 1px; ">
	
	 <ul id="messages" class="slideup" style="border: 1px solid gray; height: 300px;">
		    	<li class="go_white" id="li_1">1</li>
		    	<li class="go_white" id="li_2">1 </li>
		    	<li class="go_white" id="li_3"> 1</li>
		    	<li class="go_white" id="li_4"> 1</li>
				
		       	<li class="go_white" id="li_5"> 1</li>
			    <li class="go_white" id="li_6"> 1</li>
		    			    
		    </ul>
		    	 
    <form action="" id="form_send">
    	<table style=" width: 240px;">
    		<tr>
    			<td>
    			<a href=# id="user"></a><script>
    			
    			</script></td>
    			<td>
    			<c:if test="${!(empty sid)}">
    			<input id="m" autocomplete="off" /><button onclick="ip()">Send</button>
    			</c:if>
    			<c:if test="${empty sid}">
    			채팅 하려면 <a onclick="login_click()">로그인</a> 하세요
    			</c:if>
    			</td>
    		</tr>
    	</table>      
    </form>
		


</div>
</div>

<div class="col-sm-2 thumbnail not" style="" id = "popul_drop" ></div>

  

</div>
</div>

<!--  button footer -->
<div class="row">
 <div class="col-sm-2" style=""></div>
 
 
	<div class="col-sm-7" style="">
	
	<button onclick="location.href='cctv.do?del=yes&region=${region}'" class="btn btn-primary btn-lg sharp" > 삭제 </button>
	

	<button onclick="location.href='secure.do'" class="btn btn-primary btn-lg sharp" id="return"> 돌아가기 </button>
	
	</div>
</div>



<div>




</div>



<input type="hidden" value="${sid}" id="sid">
<input type="hidden" value="${sname}" id="sname">
<input type="hidden" value="${region}" id="region">



<input type="hidden" value="${region}" id="moda" data-toggle="modal" data-target="#myModal">
<input type="hidden" value="${region}" id="moda2" data-modal="modal-16">




<%//부트스트랩 모달 영역 %>
  <!-- Trigger the modal with a button -->
  <div class="modal fade" id="myModal2" aria-hidden="true" style="right: 1000px;" >
  <div class="modal-dialog"style="width: 700px;height: 530px;">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">녹화영상확인</h4>
      </div>
      <div class="modal-body">
      
      
      </div></div></div></div>
  <!-- Modal -->
<div class="modal fade" id="myModal" aria-hidden="true" style="right: 800px;" >
  <div class="modal-dialog"style="width: 800px;height: 630px;">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">물풍선 감사합니다.</h4>
      </div>
      <div class="modal-body">
      
        <img src="http://gifyu.com/images/ezgif.com-video-to-gif190dc5.gif" id="30000" style="width: 700px;height: 480px;" class="not">
        <img src="https://s24.postimg.org/bw2kx3gpx/e0055678_5588e57e9b371.jpg" id="100" style="width: 700px;height: 480px;" class="not">
        <img src="https://s24.postimg.org/bw2kx3gpx/e0055678_5588e57e9b371.jpg" id="200" style="width: 700px;height: 480px;" class="not">
        <img src="https://s24.postimg.org/bw2kx3gpx/e0055678_5588e57e9b371.jpg" id="1000" style="width: 700px;height: 480px;" class="not">
        <img src="https://s24.postimg.org/bw2kx3gpx/e0055678_5588e57e9b371.jpg" id="5000" style="width: 700px;height: 480px;" class="not">
        <img src="https://s24.postimg.org/bw2kx3gpx/e0055678_5588e57e9b371.jpg" id="10000" style="width: 700px;height: 480px;" class="not">
        <!-- <img src="" id="50000" style="width: 700px;height: 480px;" class="not"> -->
       <div id="50000" class="not">
<div id="block">
  <h2>로딩중..</h2>
  <div id="loadingBar">
    <div id="container">
      <div id="bar"></div>
    </div>
  </div>
  
</div>
<p>
    <label>어린이는 집에 들어가세요</label>
    <div class="acme not" id = "boom"></div>
</p>
</div>
              
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
  <section>
<!-- 모달 영역, 감춰진 부분. -->
		<div class="md-modal md-effect-16" id="modal-16" style="width: 100px;">
			<div class="md-content">
				<h3>물풍선 선물</h3>
				<div style="color:black;">
					<p>물풍선 몇개 선물 하실겁니까?</p>
					
					<!-- <button onclick="boollon(100)">100개</button> -->
					<button onclick="boollon(200)">200개</button>
					<button onclick="boollon(1000)">1000개</button>
					<button onclick="boollon(5000)">5000개</button>
					<button onclick="boollon(10000)">10000개</button>
					<button onclick="boollon(30000)">30000개</button>
				<!-- 	<button onclick="boollon(50000); nineteen();">50000개<img src="https://s28.postimg.org/k6moy5kn1/websearch_kr_20130107_001215.jpg"></button> -->
					
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
  
  
  
  </section>
  
  
    
<script>
var count =0;var click =0;var sid=document.getElementById('sid').value;var sname=document.getElementById('sname').value;
var codeLine=6;
//var url = 'https://192.168.20.33:8080';
//var url = 'https://192.168.219.181:8080';
var video = document.getElementById("video");
var canvas = document.getElementById("preview");
var context = canvas.getContext("2d");
var ani=0;
var boollonstate=0;var socketid=0;
recover = function(){
	document.getElementById("modal-16").className='md-modal md-effect-16';
	$('#modal-16').attr('style', '');
}
login_click = function(){
	console.log("aa click !!");
	
	document.getElementById("a").click();
}
var elemen=0;
var idy = [100,200,1000,5000,10000,30000,50000];
boollon = function (id){
	//window.alert("boollon !!!");
	boollonstate=1;
	//if(id === 30000){document.getElementById("30000").className='yes';}
	for(var i=0;i<idy.length;i++){
		document.getElementById(idy[i]).className='not';
		
	}
	
	for(var i=0;i<idy.length;i++){
	
		if(id === idy[i]){
			document.getElementById(id).className='yes';
			
			document.getElementById("modal-16").className='default';
			$('#modal-16').attr('style','display:none');
			
			break;
		}
	}
	

	
if(id === 30000){
	socket.emit('chat_message_b',"<span style='z-index:9999;'><img src='https://s27.postimg.org/o5610bsw3/30000.jpg' style='height:100px;'><br>"+sname+"("+sid+")"+"님이 선물하셨습니다.</span>")
}
if(id === 50000){
	ani=1;
	
	socket.emit('chat_message_b',"<img src='https://s27.postimg.org/o5610bsw3/30000.jpg' style='height:100px;'><br>"+sname+"("+sid+")"+"님이 선물하셨습니다.")
	
}
if(id === 100){
	
	//document.getElementById("li_5").className='unseeing';
	//document.getElementById("li_6").className='unseeing';
	
	socket.emit('chat_message_b',"<span style='z-index:9999;'><img src='https://s24.postimg.org/ybxnk5ksl/100.jpg' style='height:100px;'><br>"+sname+"("+sid+")"+"님이 선물하셨습니다.</span>")
}
}
function codeopen(){
	
	
	
	
	/**채팅**/
	$('#form_send').submit(function(){
		
		//document.getElementById("li_6").className='seeing';
		
		
		
		if(sid === "teacher"){
			
			socket.emit('chat_message', "<img src = 'https://s17.postimg.org/liqdx86dr/ee_00001.jpg'>"+"<font style='color:gray'>"+sname+"("+sid+")"+": </font><br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+$('#m').val(),socketid);
		}	
    
		if(sid && sid != "admin" &&sid != "teacher"){
		socket.emit('chat_message', "<img src = 'https://s18.postimg.org/a0b5wy3vt/999.jpg'>"+"<font style='color:gray'>"+sname+"("+sid+")"+": </font><br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+$('#m').val(),socketid);
		}
		
		if(sid === "admin"){
			socket.emit('chat_message', "<img src = 'https://s13.postimg.org/5ti1t1v47/ee_00002.jpg'>"+"<font style='color:gray'>"+sname+"("+sid+")"+": </font><br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+$('#m').val(),socketid);
			}
		
    
    $('#m').val('');
     return false;
 	});
	/*&&&*/var view=3;
	/*
	socket.on("private_"+socketid+"",function(){
		
		window.alert("욕하지마세요");
	});
	*/

	
	
  	socket.on('chat_message', function(msg){
  		
	
  		console.log("boollonstate: "+boollonstate);
  		view = 1;
 
  			document.getElementById("li_6").className = "go_black";	
  			  			
  
  		if(view===1){
  		if(count<codeLine){
		//document.getElementById('messages').className = "slidedown";
		document.getElementById("li_"+(codeLine-count)+"").className = "go_black";
		
  		}
		
  	    if(count>=0){
  			
			for(var i=1;i<=codeLine;i++){
			var j = codeLine -i;
			var elem = $("#li_"+(i+1)+"").html();
			document.getElementById("li_"+(i)+"").innerHTML = elem;
			}
		}
    if(count >=1 && count % codeLine ==0){
    	count = -1;
    	click=1;
    }
    count++;
	document.getElementById("li_"+codeLine+"").innerHTML = ""+msg+"";
  		}
  		
  		
  		
	});
	
	socket.on('chat_message_b', function(msg){
		
		
		/*여기서 손보면 된다.*/
		
		
		call();		
		
		document.getElementById("li_4").className = "boom";	
		
		document.getElementById("li_4").innerHTML = ""+msg+"";
		
		
		
		
		document.getElementById("li_5").innerHTML = "";
		document.getElementById("li_6").innerHTML = "";
		
		
		
		
		setTimeout(function(){ document.getElementById('moda').click(); }, 1000);
		back();
				
	});
	
	back = function(){
		
		for(var i=1;i<=6;i++){
			var el = document.getElementById("li_"+i+"").text;
			console.log("text: "+el);
			
		}
		
	}
	
	
	call = function(){
		//	setTimeout(function(){ console.log("set time !"); }, 2000);
		for(var i=1;i<=codeLine;i++){
			var j = codeLine -i;
		
			var eleme = $("#li_"+(codeLine-(j-1))+"").html();
			document.getElementById("li_"+((codeLine-(j)))+"").innerHTML = eleme;
			
		
			}
				
		for(var i=1;i<=codeLine-1;i++){
			var j = codeLine-1 -i;
			var eleme = $("#li_"+(codeLine-1-(j-1))+"").html();
			document.getElementById("li_"+((codeLine-1-(j)))+"").innerHTML = eleme;
			
			
			}
		
	//	document.getElementById("li_6").className = "go_white";
		//document.getElementById("li_5").className = "go_white";
		view=4;
		
	}
	
	/*
	socket.on('population', function(connectCounter){
	
		console.log(connectCounter);
		document.getElementById('current_popul').innerHTML = "<img src='https://s11.postimg.org/emx3l5ber/222.jpg' '>"+connectCounter+"명 시청중";
		
	});
*/



$('form').submit(function(){
	

	
	//  socket.emit('chat_message', msg,socketid); // socket.emit, 'chat_message'형태로 내보냄...
	
	  $('#m').val('');
	  return false;
	
	});
var location = document.getElementById('region').value;
$('document').ready(function(){
	socket.emit('view-request',sname);
	socket.emit("good-quality-request_from",location);
});
myFuncFrame = function(){
	
//	console.log(elem);
	
	
	var inp = document.getElementById('range');
	inp.addEventListener("mousemove", function () {
		
		socket.emit('request_change_quality',this.value,location);
		
	    console.log(this.value);
	    
		//document.getElementById('text').innerHTML = this.value;
	});
	
}	
console.log("뭐가문제냐?");
var myCanvas = document.getElementById('preview');
var ctx = myCanvas.getContext('2d');
var img = new Image;
var nameSet=0;



if(location === "열매방"){
	console.log("열매방");
	socket.emit('YUL','열');
	
	
	
	socket.on('YUL_count',function(viewer){
		console.log("YUL_count: "+viewer);
//		window.alert("YUL_count: "+viewer);
		document.getElementById('current_popul').innerHTML = "<img src='https://s11.postimg.org/emx3l5ber/222.jpg' '>"+viewer+"명 시청중";
	});
	
socket.on("streams_192.168.64.134", function(image){
	
	
	//console.log("vmware !");	
	//var img = document.getElementById("play_1");
	ctx.drawImage(img,0,0,300,150); // Or at whatever offset you like
	img.src = image;
	//img.src = image;
	
});
}

if(location === "초록방"){
	console.log("초록방");
	socket.emit('YUL','초',sname,sid);
	
	socket.on('CHO_count',function(viewer,snameSet,sidSet){
		console.log("CHO_count: "+viewer+"누가?:"+snameSet+"id:"+sidSet);
		document.getElementById('current_popul').innerHTML = "<img src='https://s11.postimg.org/emx3l5ber/222.jpg' '>"+viewer+"명 시청중";
		
		console.log("socket.id from CHO_count : "+ socket.id);
		sessionStorage.setItem("socketid",socket.id);
		console.log(socketid);
		
	
		
		try{
		
		var elem = sidSet;
		
		
		var ele= snameSet;
		console.log(ele);
		document.getElementById('popul_drop').innerHTML="";
		
		for(var i=0;i<ele.length;i++){
		var p = document.createElement("div");		
		
		
		
		
		if(ele[i] === "관리자"){
			console.log("관리자다!");
			p.innerHTML = "<img src='https://s13.postimg.org/5ti1t1v47/ee_00002.jpg'>"+ele[i]+"("+elem[i]+"]";
		}
		else if(ele[i] === "선생님"){
			console.log("선생!");
		
			p.innerHTML = "<img src='https://s17.postimg.org/liqdx86dr/ee_00001.jpg'>"+ele[i]+"("+elem[i]+"}";
		}
		else if (ele[i] === "") {
			console.log("Guest!");
			p.innerHTML = "<img src='https://s18.postimg.org/a0b5wy3vt/999.jpg'>Guest(Guest)";
		}
		else{
			console.log("일반!");
			p.innerHTML = "<img src='https://s18.postimg.org/a0b5wy3vt/999.jpg'>"+ele[i]+"("+elem[i]+")";
		
		}
		
		
		
		document.getElementById('popul_drop').appendChild(p);
		}				
		console.log("nameSet:==============");
		}catch(err){}
	
	});
			
	socketid = sessionStorage.getItem("socketid");
	console.log("왜 아이디가 다르냐고?:"+socketid);
	socket.on("private_"+socketid+"",function(data){
		console.log("왜안오지??");
		window.alert("부적절한 언행은 삼가해주세요");
		
	});
socket.on("streams_192.168.243.128", function(image){
	

	ctx.drawImage(img,0,0,300,150); // Or at whatever offset you like
	img.src = image;
	
});
}
if(location === "새싹방"){
	console.log("새싹방");
	socket.emit('YUL','새');
	
	socket.on('SAE_count',function(viewer){
		console.log("SAE_count: "+viewer);
		document.getElementById('current_popul').innerHTML = "<img src='https://s11.postimg.org/emx3l5ber/222.jpg' '>"+viewer+"명 시청중";
	});
socket.on("streams_192.168.20.25", function(image){
	console.log("채건아 좀 되라");
	ctx.drawImage(img,0,0,300,150); // Or at whatever offset you like
	img.src = image;
	
});
}
if(location === "별님방"){
	console.log("별님방");
	socket.emit('YUL','별');
	
	socket.on('BUL_count',function(viewer){
		console.log("BUL_count: "+viewer);
//		window.alert("YUL_count: "+viewer);
		document.getElementById('current_popul').innerHTML = "<img src='https://s11.postimg.org/emx3l5ber/222.jpg' '>"+viewer+"명 시청중";
	});
socket.on("streams_192.168.20.15", function(image){
	
	//console.log("vmware !");	
	//var img = document.getElementById("play_1");
	ctx.drawImage(img,0,0,300,150); // Or at whatever offset you like
	img.src = image;
	//img.src = image;
	
});
}
if(location === "별님반"){
	console.log("별님반");
	socket.emit('YUL','별');
	
	socket.on('BUL_count',function(viewer){
		console.log("BUL_count: "+viewer);
//		window.alert("YUL_count: "+viewer);
		document.getElementById('current_popul').innerHTML = "<img src='https://s11.postimg.org/emx3l5ber/222.jpg' '>"+viewer+"명 시청중";
	});
socket.on("streams_192.168.20.79", function(image){
	
	//console.log("vmware !");	
	//var img = document.getElementById("play_1");
	ctx.drawImage(img,0,0,300,150); // Or at whatever offset you like
	img.src = image;
	//img.src = image;
	
});
}
}
window.onload = codeopen;
window.onbeforeunload = function (e) {
	  var message = "Your confirmation message goes here.",
	  e = e || window.event;
	  // For IE and Firefox
	  if (e) {
		  socket.emit('normal-quality-request','go');
	    e.returnValue = message;
	  }
	  // For Safari
	  return message;
	};
	
var sclick =1;
	seeSet = function(){
	console.log("let see set");
	sclick++;
	if(sclick%2 === 0){
		document.getElementById('popul_drop').className = "col-sm-2 thumbnail yes";
		
		
		
	}
	if(!(sclick%2 === 0)){
		document.getElementById('popul_drop').className = "col-sm-2 thumbnail not";
		
	}

	
	}
	
/*녹화*/
/*
var canvas = document.querySelector('canvas');
var recorder = new CanvasRecorder(window.canvasElementToBeRecorded, {
    disableLogs: false
});
//start recording <canvas> drawings
recorder.record();
//a few minutes later
recorder.stop(function(blob) {
    var url = URL.createObjectURL(blob);
    window.open(url);
});
*/
/*
function animateLoad(animationLength){
	
	 $('#bar').css('left','-100%');
	 $('#bar').html('');
	 $('#bar').stop().animate({
	    left: '+=100%'
	  }, animationLength, function() {
	    $('#bar').html('인터넷 연결이 끊어졌습니다.');
	    document.getElementById('boom').className='acme yes';
	    
	    setTimeout(function(){ window.location.href="https://www.google.co.kr/webhp?sourceid=chrome-instant&ion=1&espv=2&ie=UTF-8#q=%EC%8B%9C%EB%85%B8%EC%9E%90%ED%82%A4%EC%95%84%EC%9D%B4"; }, 3600);
	    
	  })
	 
}); 
	$('document').ready(function(){
		
		nineteen = function(){
		
	  var animationLength = 25000;
	  $('#loadingTimer').change(function(){ 
	    animationLength = $(this).val() * 1000;
	
	    animateLoad(animationLength);
	    
	  });
	
	  animateLoad(animationLength);
	  
		}
	  
	});
	*/
	
</script>
</body>
</html>