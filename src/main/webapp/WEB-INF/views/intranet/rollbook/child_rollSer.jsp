<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>출석부</title>
<!-- js placed at the end of the document so the pages load faster -->
<script src="assets/js/jquery.js"></script>
<script src="assets/js/jquery-1.8.3.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
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

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<style>
.top-menu ul li{
	margin-top:15px;
}
.where {
  display: block;
  margin: 25px 15px;
  font-size: 11px;
  color: #000;
  text-decoration: none;
  font-family: verdana;
  font-style: italic;
} 

select {
  width: 200px;
  padding: .8em .5em;
  font-family: inherit;
  background: url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg) no-repeat 95% 50%;  
  -webkit-appearance: none;
     -moz-appearance: none;
          appearance: none;
  border: 0px solid #999;
  border-radius: 0px;
}

select::-ms-expand { /* for IE 11 */
    display: none;
}
</style>

<script> 
$(function() {
    $( "#datepicker" ).datepicker({
         showButtonPanel: true,       
         closeText: '닫기', 
         dateFormat: "yy-mm-dd",
         changeMonth: true, 
         dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
         dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
         monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
         monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']

  });

});
 
</script>
</head>
<body>
<input type="hidden" id="roll_CL" value="${CL}">

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
<section class="wrapper"><div id="content">
         <div style="margin-top:100px;margin-left: 30px;">
         
         <div style="height: 100px;" align="center">
               
               <script>
               function mySubmit(index){
                  if(index == 1){
                     document.myForm.action="rollSerach.do";
                  }
                  if(index == 2){
                     document.myForm.action='rollList.do';
                     
                  }
                  document.myForm.submit();
               }
            </script>
              
              <form name="myForm" method="post">
                  <input type="text" id="datepicker" name="date" class="btn btn-default" value="${today}" readonly="readonly">
                    <!--    <select id="roll_class" name="roll_class">
                     <option value="all" selected="selected">반선택</option>
                     <option value="A반">A반</option>
                     <option value="B반">B반</option>
                     <option value="C반">C반</option>
                     <option value="h반">h반</option>
                     <option value="k반">k반</option>
                  </select> -->
                  <c:choose>
	                  <c:when test="${empty sessionScope.groupchild}">
						    <select id="roll_class" name="roll_class">
						        <option value="all" selected>반 선택</option>
						        <option value="A반">A반</option>
						        <option value="B반">B반</option>
						        <option value="C반">C반</option>
						    </select>
				    </c:when>
				    <c:when test="${sessionScope.groupchild == 'A반'}">
				    <select id="roll_class" name="roll_class">
						        <option value="all" >반 선택</option>
						        <option value="A반" selected>A반</option>
						        <option value="B반">B반</option>
						        <option value="C반">C반</option>
						    </select>
				    </c:when>
				    <c:when test="${sessionScope.groupchild == 'B반'}">
				    <select id="roll_class" name="roll_class">
						        <option value="all" selected>반 선택</option>
						        <option value="A반">A반</option>
						        <option value="B반" selected>B반</option>
						        <option value="C반">C반</option>
						    </select>
				    </c:when>
				    <c:when test="${sessionScope.groupchild == 'C반'}">
				    <select id="roll_class" name="roll_class">
						        <option value="all" selected>반 선택</option>
						        <option value="A반">A반</option>
						        <option value="B반">B반</option>
						        <option value="C반" selected>C반</option>
						    </select>
				    </c:when>	
				</c:choose>
                  
                  <input type="button" value="검색하기" class="btn btn-warning" onclick="mySubmit(1)">
                  <input type="button" value="출석체크" class="btn btn-warning" onclick="mySubmit(2)">
              
             
              </form>
            
             </div> 

         
         </div>
         <div class="container">
            <div class="row">
               <div class="span5">
                  <form>
                           <table class="table table-striped table-condensed">
                                 <thead>
                                 <tr>
                                     <th>원아번호</th>
                                     <th>원아이름</th>
                                     <th>소속반</th>
                                     <th>출석정보</th>                                          
                                 </tr>
                             </thead>   
                             <tbody>
                             <c:if test="${empty list}">
                                검색 내용이 없습니다.
                             </c:if>
                             <c:forEach var="roll" items="${list}">
                             <!-- 출결정보 색상 -->
                            
                              <c:if test="${roll.roll_info==1}">
                                  <tr id="info_${roll.idx}" class = "success">
                              </c:if>
                              <c:if test="${roll.roll_info==2}">
                                  <tr id="info_${roll.idx}" class = "danger">
                              </c:if>
                              <c:if test="${roll.roll_info==5}">
                                  <tr id="info_${roll.idx}" class = "info">
                              </c:if>
                              <c:if test="${roll.roll_info==3}">
                                  <tr id="info_${roll.idx}" class = "warning">
                              </c:if>
                              <c:if test="${roll.roll_info==4}">
                                  <tr id="info_${roll.idx}" class = "warning">
                              </c:if>
                              <c:if test="${roll.roll_info==6}">
                                  <tr id="info_${roll.idx}" class = "warning">
                              </c:if>
                                  
                                      <td>${roll.member_idx}</td>
                                     
                                      <td>${roll.roll_name}</td>
                                      
                                      <td>${roll.roll_class}</td>
                                          
                                <td id="td_${roll.idx}">
                                     <c:choose>
                                     <c:when test="${roll.roll_info=='1'}">
                                   
                                     <label name="roll_info" value="1" id="update_${roll.idx}" onclick="myFunction(${roll.idx})">출석</label>
                                     </c:when>
                                   <c:when test="${roll.roll_info=='2'}">
                                     <label name="roll_info" value="2" id="update_${roll.idx}"onclick="myFunction(${roll.idx})">결석</label>
                                     </c:when>
                                       <c:when test="${roll.roll_info=='3'}">
                                     <label name="roll_info" value="3" id="update_${roll.idx}"onclick="myFunction(${roll.idx})">병결</label>
                                     </c:when>
                                       <c:when test="${roll.roll_info=='4'}">
                                     <label name="roll_info" value="4" id="update_${roll.idx}"onclick="myFunction(${roll.idx})">사고</label>
                                     </c:when>
                                       <c:when test="${roll.roll_info=='5'}">
                                     <label name="roll_info" value="5" id="update_${roll.idx}"onclick="myFunction(${roll.idx})">입소</label>
                                     </c:when>
                                     <c:when test="${roll.roll_info=='6'}">
                                     <label name="roll_info" value="6" id="update_${roll.idx}"onclick="myFunction(${roll.idx})">퇴소</label>
                                     </c:when>
                                     <c:otherwise>
                                     <label onclick="myFunction(${roll.idx})" >출석정보가 잘 못 되었습니다.</label>
                                    
                                     </c:otherwise>
                                 </c:choose>
                               </td>                               
                                  </tr>
                               </c:forEach>                   
                             </tbody>
                             <tfoot>
                             <tr>
                             <%-- <th>출석:${count}</th> 
                             
                             <c:choose><c:when test="${count2 ==0}">
                               <th>결석 없습니다.</th>
                             </c:when>
                             <c:otherwise><th>결석:${count2}</th></c:otherwise>
                             </c:choose>
                             
                             <c:choose><c:when test="${count3+count4 ==0}">
                               <th>병결,사고 없습니다.</th>
                             </c:when>
                             <c:otherwise><th>기타:${count3+count4}</th></c:otherwise>
                             </c:choose> --%>
                             
                             <th colspan="4">총원:${totalpeople}</th>                             
                             </tr>
                             </tfoot>
                           </table>
                          
                          <!-- 통계 버튼 -->
                           <div id="rollbookcount">
                              <div class="row">
                                      <div class="col-lg-12">
                                        
                                       
                                          <p class="btn  btn-info" id="attendance" name="roll_info" value="1" onclick="location.href='infoSerach.do?date=${date}&roll_class=${roll_class}&roll_info=1'">
                                            <i >${count}</i><br/>
                                                    		 출석
                                          </p>
                                       
                                          <p class="btn  btn-danger" id="noatt" name="roll_info" value="2" onclick="location.href='infoSerach.do?date=${date}&roll_class=${roll_class}&roll_info=2'">
                                            <i >${count2}</i><br/>
                                                 			    결석
                                          </p>
                                          
                                         
                                          <p class="btn  btn-warning" id="sick" name="roll_info" value="3" onclick="location.href='infoSerach.do?date=${date}&roll_class=${roll_class}&roll_info=3'">
                                            <i >${count3}</i><br/>
                                                 			    병결
                                                                                               </p>
                                         
                                          <p class="btn  btn-warning" id="acc" name="roll_info" value="4" onclick="location.href='infoSerach.do?date=${date}&roll_class=${roll_class}&roll_info=4'">
                                            <i >${count4}</i><br/>
                                                   			  사고
                                          </p>
                                          
                                          <p class="btn  btn-info" id="enter" name="roll_info" value="5" onclick="location.href='infoSerach.do?date=${date}&roll_class=${roll_class}&roll_info=5'">
                                            <i >${count5}</i><br/>
                                                   			  입소
                                          </p>
                                         
                                          <p  class="btn  btn-danger" id="out" name="roll_info" value="6" onclick="location.href='infoSerach.do?date=${date}&roll_class=${roll_class}&roll_info=6'">
                                            <i >${count6}</i><br/>
                                                   			 퇴소
                                          </p>
                                                
                                        
                                      </div>
                                 </div>
			<!-- 통계 버튼  -->
  
                          <!--  -->

 
                          <!--  -->
                           </div>   
                </form>
                     </div>
            </div>
         </div>
</div>
</section>
</section>
<script>



function createXMLHttpRequest() {
      if(window.ActiveXObject) { 
         xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");      
      } else if(window.XMLHttpRequest) { 
      xmlHttp = new XMLHttpRequest();
      }
   }

myFunction = function(i){
   //ert("click ! :"+i);
   //var element = document.getElementsByClassName("update").value;
   //console.log(element);
   ajax_state=1;
   createXMLHttpRequest();
    var url = "aja.do?idx="+i+"";
    xmlHttp.onreadystatechange = loader;
    xmlHttp.open("GET", url, true);
    xmlHttp.send(null);   
   
}

   function check(arr, val) {
        return arr.some(function(arrVal) {
           return/*if include*/val === arrVal;
        });
   }
   
   /* function ajax_rollbookcount(){
	   var date = document.getElementById('datepicker').value;
	   var roll_class = document.getElementById('roll_class').value;
	   
	   
	   ajax_state==3
	   createXMLHttpRequest();
	   var url = "ajaxCount.do?date="+date+"&roll_class="+roll_class;
	   console.log("check!")
	   xmlHttp.onreadystatechange = loader;
	   xmlHttp.open("GET",url,true);
	   xmlHttp.send(null);
	   
	   
   } */

   function loader() {
      if(xmlHttp.readyState == 4) {
         if(xmlHttp.status == 200) {
            //ert("로더확인!");
            temp = xmlHttp.responseText;
            var DATA = xmlHttp.responseText;
            DATA=eval('('+DATA+')'); // 소괄호를 라벨로 인식함??
            
                  
           if( ajax_state==1){
                  //ert(DATA.data[0].el);
            var idx  = DATA.data[0].el;
                  //ert(idx);               
                  
                  var ele = document.getElementById("td_"+idx+"");
               ele.innerHTML = "<input type='radio' id='출석' value='1' name='roll_info' onclick='youFunction1("+idx+")'> 출석 <input type='radio' id='결석' name='roll_info' onclick='youFunction2("+idx+")'> 결석 <input type='radio' id='병결' name='roll_info' onclick='youFunction3("+idx+")'> 병결"
               +"<input type='radio' id='사고' value='4' name='roll_info' onclick='youFunction4("+idx+")'> 사고 <input type='radio' id='입소' value='5' name='roll_info' onclick='youFunction5("+idx+")'> 입소 <input type='radio' id='출석' value='6' name='roll_info' onclick='youFunction6("+idx+")'> 퇴소";                           
            }
            if(ajax_state==2){
               //ert("ajax2상태");
               var idx  = DATA.data[0].el;
               var roll_info  = DATA.data[1].el;
               ////
             
               ////
               console.log("idx: "+idx+", val: "+roll_info);
               
               var ele = document.getElementById("td_"+idx+"");
               var countP=[];
              
               countP[0] = document.getElementById("attendance");
               countP[1] = document.getElementById("noatt");
               countP[2] = document.getElementById("sick");
               countP[3] = document.getElementById("acc");
               countP[4] = document.getElementById("enter");
               countP[5] = document.getElementById("out");
               
               var name;
               if (roll_info==1){name="출석";} if (roll_info==2){name="결석";} if (roll_info==3){name="병결";} if (roll_info==4){name="사고";} if (roll_info==5){name="입소";} if (roll_info==6){name="퇴소";}
               ele.innerHTML = "<label onclick='myFunction("+idx+")'>"+name+"<label>";
              
               
               countP[0].innerHTML =  "<i >"+DATA.data[0].attendance+"<br/> 출석</i>";
               countP[1].innerHTML =  "<i >"+DATA.data[0].noatt+"<br/> 결석</i>";
               countP[2].innerHTML =  "<i >"+DATA.data[0].sick+"<br/> 병결</i>";
               countP[3].innerHTML =  "<i >"+DATA.data[0].acc+"<br/> 사고</i>";
               countP[4].innerHTML =  "<i >"+DATA.data[0].enter+"<br/> 입소</i>";
               countP[5].innerHTML =  "<i >"+DATA.data[0].out+"<br/> 퇴소</i>";
               
               
              
               
            }
          
            
            
            }
      }
   }
   var ajax_state;
   var date = document.getElementById('datepicker').value;
   var roll_class = document.getElementById('roll_class').value;
   var roll_CL = document.getElementById('roll_CL').value;
   
   //ert("roll_CL: "+roll_CL);
   
   
   youFunction1 = function(i){
      
      ajax_state=2;
      createXMLHttpRequest();
       var url = "ajaa.do?idx="+i+"&roll_info=1&date="+date+"&roll_class="+roll_CL+"";
		$("#info_"+i).removeClass();
		$("#info_"+i).addClass("success");
      xmlHttp.onreadystatechange = loader;
       xmlHttp.open("GET", url, true);
       xmlHttp.send(null);   
      
   }
youFunction2 = function(i){
   ajax_state=2;
   createXMLHttpRequest();
    var url = "ajaa.do?idx="+i+"&roll_info=2&date="+date+"&roll_class="+roll_CL+"";
    $("#info_"+i).removeClass();
	$("#info_"+i).addClass("danger");
    xmlHttp.onreadystatechange = loader;
    xmlHttp.open("GET", url, true);
    xmlHttp.send(null);   
   
   }
youFunction3 = function(i){
   ajax_state=2;
   createXMLHttpRequest();
    var url = "ajaa.do?idx="+i+"&roll_info=3&date="+date+"&roll_class="+roll_CL+"";
    $("#info_"+i).removeClass();
	$("#info_"+i).addClass("warning");
    xmlHttp.onreadystatechange = loader;
    xmlHttp.open("GET", url, true);
    xmlHttp.send(null);   
   
}
youFunction4 = function(i){
   ajax_state=2;
   createXMLHttpRequest();
    var url = "ajaa.do?idx="+i+"&roll_info=4&date="+date+"&roll_class="+roll_CL+"";
    $("#info_"+i).removeClass();
	$("#info_"+i).addClass("warning");
    xmlHttp.onreadystatechange = loader;
    xmlHttp.open("GET", url, true);
    xmlHttp.send(null);   
   
}
youFunction5 = function(i){
   ajax_state=2;
   createXMLHttpRequest();
    var url = "ajaa.do?idx="+i+"&roll_info=5&date="+date+"&roll_class="+roll_CL+"";
    $("#info_"+i).removeClass();
	$("#info_"+i).addClass("info");
    xmlHttp.onreadystatechange = loader;
    xmlHttp.open("GET", url, true);
    xmlHttp.send(null);   
   
}
youFunction6 = function(i){
   ajax_state=2;
   createXMLHttpRequest();
    var url = "ajaa.do?idx="+i+"&roll_info=6&date="+date+"&roll_class="+roll_CL+"";
    $("#info_"+i).removeClass();
	$("#info_"+i).addClass("warning");
    xmlHttp.onreadystatechange = loader;
    xmlHttp.open("GET", url, true);
    xmlHttp.send(null);   

}


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