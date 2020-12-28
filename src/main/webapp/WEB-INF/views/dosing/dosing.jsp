<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>투약 동의서</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>
<body>
	<%@include file="/WEB-INF/views/header.jsp" %>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script> 
$(function() {
    $( "#datepickerstart, #datepickerend" ).datepicker({
         showButtonPanel: true,       
         closeText: '닫기', 
         dateFormat: "yy-mm-dd",
         changeMonth: true, 
         dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
         dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
         monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
         monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']

  });
    
    $('#dateSearch').submit(function(){
		
		var datepickerstart = $('#datepickerstart').val();
		var datepickerend = $('#datepickerend').val();
		
		if(datepickerstart == "처음 날짜" || datepickerend == "마지막 날짜"){
			window.alert('날짜를 모두 선택하시고 검색해주세요!')
			return false;
		}
	
	});		
});
 
</script>
    <div class="container" id="tourpackages-carousel">
      <div class="row">
        <div class="col-lg-12">
        <form name = "dateSearch"  id = "dateSearch" action = "dosingDateSearch.do">
        	<h1>투약 동의서
        		<c:if test="${empty param.calenderstart}">
        		<input type="text" id="datepickerstart" name="calenderstart" class="btn icon-btn btn-primary pull-center " value="처음 날짜">
        		<input type="text" id="datepickerend" name="calenderend" class="btn icon-btn btn-primary pull-center " value="마지막 날짜">
        		</c:if>
        		<c:if test="${!empty param.calenderstart}">
        		<input type="text" id="datepickerstart" name="calenderstart" class="btn icon-btn btn-primary pull-center " value="${param.calenderstart }">
        		<input type="text" id="datepickerend" name="calenderend" class="btn icon-btn btn-primary pull-center " value="${param.calenderend }">
        		</c:if>
        		<input type="submit" class="btn icon-btn btn-primary" value="날짜 검색하기">
        		<a class="btn icon-btn btn-primary pull-right" href="dosing_write.do"><span class="glyphicon btn-glyphicon glyphicon-plus img-circle"></span> 투약확인서 작성하기 </a>
        	</h1>
        </form>
        <br/><br/>
        </div>
        <c:if test="${empty list}">
        	<h4 class = "text-center">투약 동의서 신청 내역이 없습니다.</h4>
        </c:if>
        <c:forEach var="list" items="${list}">
        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
          <div class="thumbnail">
              <div class="caption">
                <div class='col-lg-12'>
                    <span class="glyphicon glyphicon-envelope"></span>
                </div>
                <div class='col-lg-12 well well-add-card'>
                    <h4>원아 : ${list.child_name}</h4>
                </div>
                <div class='col-lg-12'>
                    <p>증상 : ${list.symtom}</p>
                    <p>작성일 :
                     <fmt:formatDate pattern="yyyy-MM-dd" value="${list.dosing_date}" />
                    </p>
                    
                    <p>반이름 : ${list.dosing_class} </p> 
                </div>
                <button type="button" class="btn btn-primary btn-xs btn-update btn-add-card" onclick="location.href='dosing_main.do?idx=${list.idx}'">상세보기</button>
              <c:if test="${list.confirm == 'no'}">
                <button type="button" class="btn btn-danger pull-right" disabled="disabled">투약 대기중</button>
              </c:if>
              <c:if test="${list.confirm == 'yes'}">
                <button type="button" class="btn btn-success pull-right">투약 완료</button>
              </c:if>
            </div>
          </div>
        </div>
        </c:forEach>
	         
      </div><!-- End row -->
    </div><!-- End container -->
  <div class="row">
<div class = "col-xs-12 text-center" id = "paging">
									 <ul class="pagination">
										 <c:forEach var="i" begin="1" end="${page}" step="1">
											<c:if test="${empty param.calenderstart }">
												<c:if test = "${i==cp}">
													<li class="active"><a href="dosing.do?cp=${i}"><c:out value="${i}"/></a></li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												</c:if>
												<c:if test = "${i!=cp}">
													<li><a href="dosing.do?cp=${i}"><c:out value="${i}"/></a></li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												</c:if>
											 </c:if>
											 <c:if test="${!empty param.calenderstart }">
											 	<c:if test = "${i==cp}">
													 <li class="active"><a href="dosingDateSearch.do?cp=${i}&calenderstart=${param.calenderstart}&calenderend=${param.calenderend}"><c:out value="${i}"/></a></li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												</c:if>
												<c:if test = "${i!=cp}">
													 <li><a href="dosingDateSearch.do?cp=${i}&calenderstart=${param.calenderstart}&calenderend=${param.calenderend}"><c:out value="${i}"/></a></li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												</c:if>
											 </c:if>
										  </c:forEach>
									   </ul>
  </div>
</div>    

<br>



 <%@include file="/WEB-INF/views/footer.jsp" %>




 
 <script type="text/javascript">
 var click =1;
 var idx = [];var d;			var arr = [];
 // ajax_state == 1 -> 전체원아 정보 select box에 출력
 // ajax_state == 2 -> select 해당된 원아 정보 하단에 출력
 
 
 myFu = function(){
	 ajax_calen();
		
		 
		 

	 
	 
 }
 
 

 var ajax_state =0;
 $('#SelectDropDown').change(function(){
		
		var selection = this.value; //grab the value selected
		var z = $("#SelectDropDown option:selected").index();	
	    
	    ajax2(idx[z-1]); // z 번째 idx값은 (...)이다.
	 			
	});
 $("#SelectDropDown").on("mouseover",function(e){	

    if(click===1){ // 클릭 한번만했을때, 여러번 하면 append됨.
    ajax(); // get child info
    }
    click =0;
});


//**ajax !**
function createXMLHttpRequest() {
	if(window.ActiveXObject) { 
		xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");		
	} else if(window.XMLHttpRequest) { 
	xmlHttp = new XMLHttpRequest();
	}
}

function ajax() {	
		var u="1";
		ajax_state=1;
		createXMLHttpRequest();
		var url = "ajaxTest.do";
		xmlHttp.onreadystatechange = loader;
		xmlHttp.open("GET", url, true);
		xmlHttp.send(null);	
}

function ajax2(i) {
	var u="1";
	ajax_state=2;
	createXMLHttpRequest();
	var url = "ajax_show_childinfo.do?idx="+i+"";
	xmlHttp.onreadystatechange = loader;
	xmlHttp.open("GET", url, true);
	xmlHttp.send(null);	
}
function ajax_calen(){
	 ajax_state=5;
	 createXMLHttpRequest();
		var url = "ajax_calen.do";
		xmlHttp.onreadystatechange = loader;
		xmlHttp.open("GET", url, true);
		xmlHttp.send(null);	
	
}

function check(arr, val) {
	  return arr.some(function(arrVal) {
		  return/*if include*/val === arrVal;
	  });
}

function loader() {
	if(xmlHttp.readyState == 4) {
		if(xmlHttp.status == 200) {
			temp = xmlHttp.responseText;
			var DATA = xmlHttp.responseText;
			DATA=eval('('+DATA+')'); // 소괄호를 라벨로 인식함??
			
					
					
					
			if(ajax_state === 1){
			idx = []; // clear idx
			var ele = document.getElementById('SelectDropDown');
			
			for(var i=0;i<DATA.data.length;i++){
			var option = document.createElement("option");
			var TEXT = option.text;
			var indexnum = parseInt(DATA.data[i].idx);
			
			
			if(!(check(idx,indexnum))){
			idx.push(indexnum);
			option.text = DATA.data[i].name;
			ele.add(option);
			}

			}

			}

			if(ajax_state === 2){
				arr = [];

				var ele = document.getElementById('ChildList');
				ele.innerHTML = "";
				
					
				var innerDiv = document.createElement("div");
				innerDiv.className = 'row';
				$(innerDiv).attr('id', 'q1'); /**innerDiv(#q1) : row**/
				
				ele.appendChild(innerDiv);
				var blank = document.createElement('div');
				blank.className = 'col-sm-3';
				document.getElementById("q1").appendChild(blank);/**blank(.col-sm-3) : 빈공간. **/	
				
				
				for(var i=0;i<DATA.data.length;i++){
					
					var newElement = document.createElement('div');
					newElement.className = 'col_effect col-sm-2';
					
					newElement.innerHTML = "<img src = 'https://s11.postimg.org/yn0l4nvr7/image.png'> "+DATA.data[i].name+"<br><h1>"+DATA.data[i].date+"</h1> 증상: "+DATA.data[i].symtom+"<br> 의뢰자: "+DATA.data[i].client+"<br> 반정보: "+DATA.data[i].classinfo;					
					document.getElementById("q1").appendChild(newElement); /**newElement(.col-sm-2) : 추가 되는 공간**/
					$(newElement).attr('style', 'background-color:lavender;'); 
					
					arr.push(DATA.data[i].R_idx);
					//(arr);
					
				}
			}
			
			
			if(ajax_state === 3){
				
				
				
				
				
				var ele = document.getElementById('row_div');
				ele.innerHTML = "";
				
				for(var i=0;i<DATA.data.length;i++){
					
				
					
					
					


					var innerDiv = document.createElement("div");
					innerDiv.className = 'col-xs-12 col-sm-4 col-md-4 col-lg-4';
					
					innerDiv.innerHTML= " <div class='thumbnail'style=''><div class='caption' ><div class='col-lg-12'><span class='glyphicon glyphicon-envelope'></span></div><div class='col-lg-12 well well-add-card'><h4>보호자 : "+DATA.data[i].client+"</h4></div><div class='col-lg-12'><p>증상 :"+DATA.data[i].symtom+"</p><p>의뢰자 : "+DATA.data[i].name+" </p><p>반정보 : "+DATA.data[i].classinfo+"</p> </div><button type='button' class='btn btn-primary btn-xs btn-update btn-add-card' onclick='location.href='dosing_main.do''>상세보기</button><button type='button' class='btn btn-danger pull-right' disabled='disabled'>승인 대기중</button><button type='button' class='btn btn-success pull-right'>승인 완료</button></div></div>";
					ele.appendChild(innerDiv);
					//var blank = document.createElement('div');
					//blank.className = 'col-sm-3';
					//document.getElementById("q1").appendChild(blank);/**blank(.col-sm-3) : 빈공간. **/	
					
					
					
					
					

					
				
					/***
					if((i)%3!=0 || i==0){
					
					var newElement = document.createElement('div');
					newElement.className = 'col_effect col-sm-2';
					
					newElement.innerHTML = "<img src = 'https://s11.postimg.org/yn0l4nvr7/image.png'> "+DATA.data[i].name+"<br><h1>"+DATA.data[i].date+"</h1> 증상: "+DATA.data[i].symtom+"<br> 의뢰자: "+DATA.data[i].client+"<br> 반정보: "+DATA.data[i].classinfo;					
					document.getElementById("q1").appendChild(newElement); /**newElement(.col-sm-2) : 추가 되는 공간**/
					/**
					$(newElement).attr('style', 'background-color:lavender;');
					
					arr.push(DATA.data[i].R_idx);
					////(arr);
					/**
					z_counter++;
					}
					else{
						console.log("enter !!!");
						var blank = document.createElement('div');
						blank.className = 'col-sm-3';
						document.getElementById("q1").appendChild(blank);//blank(.col-sm-3) : 빈공간. /	
						
						var newElement = document.createElement('div');
						newElement.className = 'col_effect col-sm-2';
						
						newElement.innerHTML = "<img src = 'https://s11.postimg.org/yn0l4nvr7/image.png'> "+DATA.data[i].name+"<br><h1>"+DATA.data[i].date+"</h1> 증상: "+DATA.data[i].symtom+"<br> 의뢰자: "+DATA.data[i].client+"<br> 반정보: "+DATA.data[i].classinfo;					
						document.getElementById("q1").appendChild(newElement); //newElement(.col-sm-2) : 추가 되는 공간
						$(newElement).attr('style', 'background-color:lavender;');
						z_counter++;
						
						arr.push(DATA.data[i].R_idx);
						////(arr);
					
					}	
					**/
					
					
				}
				
				
				
				
			}
			
			if(ajax_state==5){
				for(var i=0;i<8;i++){
				console.log(DATA.data[i].date);
				}
				
				
				
				
				
				document.getElementById('cal').innerHTML = ""
				
				
				
			}
		}
	}

	var elems = document.getElementsByClassName('col_effect');
	var j;
	function addEventListenerList(list, event) {
	    for (var i = 0, len = list.length; i < len; i++) {
	    	 (function () {
	    	        var k = i + 1;
	    	        var boxa = i;
	    	        list[i].addEventListener("click", function() { 
	    	        	console.log(boxa); 	 
	    	        	
	    	        	location.href="dosing_main.do?idx="+arr[boxa]+"";
	    	        	
	    	        }, false);	    	       
	    	    }()); // immediate invocation	        
	    }
	}
	addEventListenerList(elems, 'click');
}
//**ajax !

			var z_counter=0;
			var x_counter=0;

ajax3 = function (){

	console.log("ajax3 !!!");
		ajax_state=3;
		createXMLHttpRequest();
		var url = "ajax_show_childinfo.do?state=1";
		xmlHttp.onreadystatechange = loader; 
		xmlHttp.open("GET", url, true);
		xmlHttp.send(null);	

}


//window.onload= ajax3;


</script>





</body>
</html>



