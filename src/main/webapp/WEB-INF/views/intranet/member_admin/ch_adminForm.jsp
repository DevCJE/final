<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
$(function () {
    $( '#table' ).searchable({
        striped: true,
        searchType: 'fuzzy'
    });
    
    $( '#searchable-container' ).searchable({
        searchField: '#container-search',
        selector: '.row',
        childSelector: '.col-xs-4',
        show: function( elem ) {
            elem.slideDown(100);
        },
        hide: function( elem ) {
            elem.slideUp( 100 );
        }
    })
});
var ele;
var name;
function select(i){	
	var num;
	 var el = document.getElementById("sel1_"+i+"").value; 		 
	 ele = el;
	 }
function myFunction(id){	
	location.href='chBanChange.do?groupchild='+ele+'&id='+id+'&cp='+${cp}+'';
}
function myFunction2(idx){
	location.href='chDelete.do?idx='+idx+'&cp='+${cp}+'';
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

<style>
.top-menu ul li{
	margin-top:15px;
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
      </section>
	<!--main content start--> 
	<section id="main-content">
<section class="wrapper">
<div id="content" align="center">
  
                <div>
                    <table class="table" id="table" name="select" style="height: 200px; margin-top: 100px; width: 1150px;">                   
                        <thead>
                        <tr>
                         <th style="border: 0px;"><font size="5">승인된 원생보기</font></th>
                          <td colspan="6" align="right">
                                 <form name="ch" action="chSearch.do">
                                 <select name="serchgroup">
                                    <option value="namechild">원생 이름</option>
                                    <option value="name">부모님 이름</option>                                    
                                 </select>
                                 <input type="text" name="chsearch" placeholder="검색어 입력">
                                 <input type="submit" value="검색">
                                 </form>
                           </td>  
                        </tr>
                            <tr>
                                <th style="border: 0px;">원생 이름</th>
                                <th style="border: 0px;">부모님 이름</th>
                                <th style="border: 0px;">부모님 전화번호</th>
                                <th style="border: 0px;">반 이름</th>
                                <th style="border: 0px;">반 지정하기</th>
                                <th style="border: 0px;">퇴소</th>                                                               
                            </tr>
                        </thead>
                        <tbody>
                                               
                        <c:forEach var="dto" items="${list}">
                 
                            <tr>
                                <td>${dto.namechild}</td>                               
                                <td>${dto.name}</td>
                                <td>${dto.tel}</td>
                                <td>
                                <c:if test="${dto.groupchild==null}">
                                                                        미지정
                                </c:if>
                                <c:if test="${dto.groupchild!=null}">
                                ${dto.groupchild}
                                </c:if>
                                </td>
                               
                                <td>
                                <select onchange="select(${dto.idx})" id="sel1_${dto.idx}">
                                
                                   <option>반 선택</option>
                                   <option>A반</option>
                                   <option>B반</option>
                                   <option>C반</option>
                                </select>
                                <input type="button" value="반 수정" class="btn btn-warning" onclick="myFunction('${dto.id}')">
                                </td>
                                <td>
                                  <input type="button" value="퇴소" onclick="myFunction2('${dto.idx}')" class="btn btn-warning">
                                </td>
                 
                            </tr>
                         
                         </c:forEach>
                         <c:forEach var="serch" items="${list2}">
                         
                            <tr>
                                <td>${serch.namechild}</td>                               
                                <td>${serch.name}</td>
                                <td>${serch.tel}</td>
                                <td>
                                <c:if test="${serch.groupchild==null}">
                                                                        미지정
                                </c:if>
                                <c:if test="${serch.groupchild!=null}">
                                ${serch.groupchild}
                                </c:if>
                                </td>
                               
                                <td>
                                <select onchange="select(${serch.idx})" id="sel1_${serch.idx}">
                                
                                   <option>반 선택</option>
                                   <option>A반</option>
                                   <option>B반</option>
                                   <option>C반</option>
                                </select>
                                <input type="button" value="반 수정" class="btn btn-warning" onclick="myFunction('${serch.id}')">
                                </td>
                                <td>
                                  <input type="button" value="퇴소" onclick="myFunction2('${serch.idx}')" class="btn btn-warning">
                                </td>
                 
                            </tr>
                        
                         </c:forEach>                               
                        </tbody>
                    </table>
                </div>
	               <div>${pagStr}</div>	               
</div>
</section>
</section>
</body>
</html>