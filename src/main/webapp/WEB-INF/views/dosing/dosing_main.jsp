<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>투약 의뢰서 상세내용</title>

<style>
.block-2 > input{
border: 1px solid red;
display: block;
width: 200px;
height: 90px;
}
.block-3 {
border: 1px solid blue;
display: block;
width: 200px;
}

#Box > span{
display: block;
border: 1px solid gray;
background: #ccff00;
padding-left: 20px;
}
.button-1{

height: 25px;
width: 50px;
display: inline;
padding: 4px;
}
.button-2{

height: 25px;
width: 50px;	
display: inline;
padding: 4px;
}

.well > * {
	margin-top: 20px;
	margin-bottom: 20px;
	padding-left: 20px;
}


</style>

<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.2.min.js"></script>
		<script src="https://cdn.socket.io/socket.io-1.3.7.js"></script>
</head>

<body>
<%@include file="/WEB-INF/views/header.jsp" %>
	
	
<c:forEach var = "result" items="${result}">			
    <div class="container" id="tourpackages-carousel" style="margin-top: 30px;">
      <div class="row">
        <div class="col-lg-12">
        </div>
        <div class="col-xs-8 col-xs-offset-2">
          <div class="thumbnail">
              <div class="caption">
                <div class='col-xs-12'>
                    <h3 class="text-center"> <img alt="투약의뢰" src="https://s13.postimg.org/h4k0hwanr/image.png"> 투약 의뢰서 상세내용</h3><h4 class="text-right"><fmt:formatDate pattern="yyyy-MM-dd" value="${result.dosing_date}" /></h4>
                </div><br/><br/>
                <div class='col-xs-12 well well-add-card' style="height: 450px;">
                
                    <p>증상 : ${result.symtom}</p>
                    <p>약의종류 : ${result.medicine}</p>
                    <p>투약용량 : ${result.dosing_capacity}</p>
                    <p>보관방법 : ${result.dosing_keep}</p>
                    <p>특이사항 : ${result.etc}</p>
                    
                    	<div style="display: none;">서명시간 : <input type="hidden" id="sig_time" value="${result.sig_time}"></div>
                    	<div style="display: none;">클라이언트 : <input type="hidden" id="client" value="${result.client}"></div>
                    	
                    <p id="imgTest">	</p>
                 
                    <br/>
                    <c:if test="${result.confirm == 'no'}">
                    <p class="text-center">투약 완료 후 알려드릴게요! 잠시만 기다려 주세요!</p>
                    </c:if>
                    <c:if test="${result.confirm == 'yes'}">
                    <p class="text-center">투약이 완료 되었습니다! 자세한 건 전화로 알려드리겠습니다!</p>
                    </c:if>
                </div>
                <div class='col-xs-12'>
                    <c:forEach var="replylist" items="${reply}">
                    	<span class="glyphicon glyphicon-envelope">&nbsp;To.선생님&nbsp;&nbsp;&nbsp;작성날짜:${replylist.replydate}</span>
                    	<p> &nbsp;&nbsp; ${replylist.content} </p>
                    </c:forEach>
                </div>
                <div class = "footmenu text-center">
                <c:if test="${sessionScope.auth == 3}">
	                <c:if test="${result.confirm == 'no'}">
	                <button type="button" class="btn btn-danger" disabled="disabled">현재 확인 중입니다</button>
	                </c:if>
	                <c:if test="${result.confirm == 'yes'}">
	                <button type="button" class="btn btn-success" disabled>투약 완료 되었어요</button>
	                </c:if>
	               
					<button type="button" class="btn btn-primary" onclick = "location.href='dosing.do'">목록으로</button>
                </c:if>
                <c:if test="${sessionScope.auth == 4 || sessionScope.auth == 5 }">
                
             
                	<c:if test="${result.confirm == 'no'}">
	               <!--  <button type="button" class="btn btn-danger" disabled="disabled">'인 대기중</button> -->
	                <button type="button" class="btn btn-primary" onclick="location.href='dosing_main_update.do?idx=${result.idx}&state=2'">승인 완료하기</button>
	                <button type="button" class="btn btn-primary" onclick = "location.href='dosing_admin.do'">목록으로</button>
	                </c:if>
	                
	                <c:if test="${result.confirm == 'yes'}">
	                <button type="button" class="btn btn-success" disabled>승인 완료</button>
	                <button type="button" class="btn btn-primary" onclick = "location.href='dosing_admin.do'">목록으로</button>
	                </c:if>
                </c:if>
                </div>
            </div>       
          </div>
        </div>
      </div><!-- End row -->
    </div><!-- End container -->
    </c:forEach>
    
    
    
    
    
<div class="modal fade" id="teacherreply" >
  <div class="modal-dialog">
    <div class="modal-content">
      <!-- header -->
      <div class="modal-header">
        <!-- 닫기(x) 버튼 -->
        <button type="button" class="close" data-dismiss="modal">×</button>
        <!-- header title -->
        <h4 class="modal-title">승인 완료 답장하기</h4>
      </div>
      <!-- body -->
      <form name = "contentReply" action = "consentConfirm.do" method="post">
      <div class="modal-body">
      		답장 내용
            <input class = "form-control" type = "text" name = "reply">            
            <input type = "hidden" name = "idx" value = "${list.idx}">
      </div>
      <!-- Footer -->
      <div class="modal-footer">
        <button type="submit" class="btn btn-primary">작성완료</button>
        <button type="button" class="btn btn-primary" data-dismiss="modal">닫기</button>
      </div>
      </form>
    </div>
  </div>
</div>
    
<div class="modal fade" id="layerpop" >
  <div class="modal-dialog">
    <div class="modal-content">
      <!-- header -->
      <div class="modal-header">
        <!-- 닫기(x) 버튼 -->
        <button type="button" class="close" data-dismiss="modal">×</button>
        <!-- header title -->
        <h4 class="modal-title">답장하기</h4>
      </div>
      <!-- body -->
      <form name = "contentReply" action = "consentReply.do" method="post">
      <div class="modal-body">
      		답장 내용
            <input class = "form-control" type = "text" name = "content">            
            <input type = "hidden" name = "come_home_idx" value = "${list.idx}">
      </div>
      <!-- Footer -->
      <div class="modal-footer">
        <button type="submit" class="btn btn-primary">작성완료</button>
        <button type="button" class="btn btn-primary" data-dismiss="modal">닫기</button>
      </div>
      </form>
    </div>
  </div>
</div>

    <%@include file="/WEB-INF/views/footer.jsp" %>
    
    
     
 
 
 
 
 
 
 
 
 
 
 <br><br> <br><br> <br><br> <br><br> <br><br>

<!-- page header -->
<div class="row" id="page header">
	<div class="col-sm-12" style="background-color:lavender;text-align: center;font-size: x-large;">
		<img alt="투약의뢰" src="https://s13.postimg.org/h4k0hwanr/image.png">투약의뢰서
	</div>
</div>



<!-- sub navigation, 한 row. -->
  <div class="row" id="sub_navigation">
    <div class="col-sm-3" style="background-color:lavenderblush;"></div>
    
    <div class="col-sm-5" style="background-color:lavender;">
    	<div class="row">
		<h2>xx원아 투약의뢰서</h2>
		</div>
	</div>

  </div>




<!-- page content -->
<div class="row" id="page_content" >

 <div class="col-sm-3" style="background-color:lavenderblush;"></div>
 
 
	<div class="col-sm-5" style="background-color:lavender;">
    	<div class="row">
    		<div><img alt="" src="https://s11.postimg.org/yn0l4nvr7/image.png"></div>
    		<div>금일 자녀의 투약을 의뢰합니다.</div>
    	
		
		
		
		</div>
		<div class="row">
			<table class="table table-striped">			
			<c:forEach var = "key" items="${result}">			
				<tr>
					<td>증상:&nbsp;&nbsp;${key.symtom} </td>
				</tr>
				<tr>
					<td>약의 종류:&nbsp;&nbsp;${key.medicine}</td>
				</tr>
				<tr>
					<td>투약 용량:&nbsp;&nbsp;${key.dosing_capacity}</td>
				</tr>
				<tr>
					<td>투약 횟수:&nbsp;&nbsp;${key.dosing_number}</td>
				</tr>
				<tr>
					<td>투약 시간:&nbsp;&nbsp;${key.dosing_time}</td>
				</tr>
				<tr>
					<td>보관 방법:&nbsp;&nbsp;${key.dosing_keep}</td>
				</tr>
				<tr>
					<td>특이 사항 :&nbsp;&nbsp;${key.etc}</td>
				</tr>
				<tr>
					<td>서명 시간 :&nbsp;&nbsp;${key.sig_time}</td>
				</tr>
				
				<c:set var = "key2" value="${key.idx}"/>				
			</c:forEach>					
			</table>
		
		
		</div>
		
	</div>





</div>
<div class="row">
 <div class="col-sm-3" style="background-color:lavenderblush;"></div>
 
 
	<div class="col-sm-5" style="background-color:lavender;">
	<button class="btn  btn-lg sharp" style="width: 100%; height: 130%;" onclick="reportFunc()">투약보고서 작성</button>
	</div>
</div>

<div class="row ">
 <div class="col-sm-3" style="background-color:lavenderblush;"></div>
 <div class="col-sm-5 col_5" id='col' style="background-color:lavender;">
 sfsdf
 </div>

</div>

<div class="row">
 <div class="col-sm-3" style="background-color:lavenderblush;"></div>
 	<div class="col-sm-5" style="background-color:lavender;">
 	
 	<button class="btn btn-lg sharp" style="width: 33%; height: 130%;">출력</button>
 	<button class="btn btn-lg sharp" onclick="location.href='dosing_delete.do?idx=${key2}'" style="width: 33%; height: 130%;">삭제</button>
 	<button class="btn btn-lg sharp" onclick = "location.href='dosing.do'" style="float:right; width: 33%; height: 130%;">목록</button>
 	
 	</div>
 
</div>




<script>
var el;
var KEY = ${key2};
var ele;
var innerSpan;
var innerSpan2;
var report_content;

var time = document.getElementById('sig_time').value;
var client = document.getElementById('client').value;


ajax_requesting_encoding = function(){
	
	ajax_state=7;
	
	createXMLHttpRequest();
	//ert(time);
	var url = "dosing_GETsignature.do?&client="+client+"&time="+time+"";
	xmlHttp.onreadystatechange = loader;
	xmlHttp.open("GET", url, true);
	xmlHttp.send(null);	
	
	
}

window.onload = ajax_requesting_encoding;

function createXMLHttpRequest() {
	if(window.ActiveXObject) { 
		xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");		
	} else if(window.XMLHttpRequest) { 
	xmlHttp = new XMLHttpRequest();
	}
}


reportFunc = function(){
	console.log('eee');
	
	var ele = document.getElementById('col');
	ele.innerHTML="<textarea rows='3' style='width: 70%;'></textarea><button style='width:20%; height80px;'>제출</button>";
}






function showReport(){
	$('#ChildList').prop("onclick", null);
	ele = document.getElementById('ChildList');
	ele.innerHTML="";
	innerSpan = document.createElement("span");
	innerSpan2 = document.createElement("span");
	innerSpan.className = 'block-2';
	innerSpan2.className = 'block-3';
	ele.appendChild(innerSpan);
	ele.appendChild(innerSpan2);
	innerSpan.innerHTML = "<input type = textarea id='ReportText'>";	
	innerSpan2.innerHTML="<input type='button' value='제출' onclick='copen()'><input type='button' value='text2'>";	
}

function copen(){
	//ert("hi");
	var elem = document.getElementById('ReportText').value;
	//ert(elem);
	ajax_report(elem);
}

function createXMLHttpRequest() {
	if(window.ActiveXObject) { 
	xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");		
	} else if(window.XMLHttpRequest) { 
	xmlHttp = new XMLHttpRequest();
	}
}

function ajax_report(el){
	var u="1";
	report_content = el;
	ajax_state=1;
	createXMLHttpRequest();
	var url = "ajaxReport.do?content="+report_content+"&idx="+KEY+"";
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
			if(ajax_state === 7){
				
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
				
				var elem = document.getElementById('imgTest');
				elem.innerHTML="<div class='row'><div class = 'col-xs-6 col-xs-offset-4'><img src="+str+" style='width:100px; height:50px; border:1px solid #7f777f;'></div></div>";
		}
			
		}
	}
}
</script>



</body>
</html>