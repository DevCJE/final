<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
// Dropdown Menu
var dropdown = document.querySelectorAll('.dropdown');
var dropdownArray = Array.prototype.slice.call(dropdown,0);
dropdownArray.forEach(function(el){
   var button = el.querySelector('a[data-toggle="dropdown"]'),
         menu = el.querySelector('.dropdown-menu'),
         arrow = button.querySelector('i.icon-arrow');

   button.onclick = function(event) {
      if(!menu.hasClass('show')) {
         menu.classList.add('show');
         menu.classList.remove('hide');
         arrow.classList.add('open');
         arrow.classList.remove('close');
         event.preventDefault();
      }
      else {
         menu.classList.remove('show');
         menu.classList.add('hide');
         arrow.classList.remove('open');
         arrow.classList.add('close');
         event.preventDefault();
      }
   };
})

Element.prototype.hasClass = function(className) {
return this.className && new RegExp("(^|\\s)" + className + "(\\s|$)").test(this.className);
};
</script>
</head>
<body>
    <div id='wrapper'>
      <!-- Sidebar -->
      <section id='sidebar'>
        <i class='icon-align-justify icon-large' id='toggle'></i>
        <ul id='dock'>
          <li class='active launcher'>           
            <a data-toggle="dropdown">서류관리<i class="icon-arrow"></i></a>
            	<ul class="dropdown-menu">
            		<li><a href="doc_docList.do">서류 목록</a></li>
            		<li><a href="doc_SignList.do?name=${sessionScope.name }">결재 서류 목록</a></li>
            		<li><a href="doc_StateList.do?name=${sessionScope.name }">결재 상태 보기</a></li>
            	</ul>
          </li>
          <li class='launcher'>
          	<a href="rollSave.do">출석부</a>
          </li>
          <c:if test="${sessionScope.auth == 5}">                         
          <li class='launcher'>
           <a data-toggle="dropdown">멤버관리<i class="icon-arrow"></i></a>                               
            <ul class="dropdown-menu">
            <li><a href="teNo_adminForm.do">미승인교사관리</a></li>
            <li><a href="te_adminForm.do">승인교사관리</a></li>
            <li><a href="chNo_adminForm.do">미승인원생관리</a></li>
            <li><a href="ch_adminForm.do">승인원생관리</a></li>
            </ul>
          </li>
          </c:if>
          <c:if test="${sessionScope.auth == 4}">
          <li class='launcher'>
          <a data-toggle="dropdown">원생관리<i class="icon-arrow"></i></a>                               
            <ul class="dropdown-menu">
            <li><a href="chNo_adminForm.do">미승인원생관리</a></li>
            <li><a href="ch_adminForm.do">승인원생관리</a></li>          
            </ul>                                          
          </li>
          </c:if> 
        </ul>
      </section>
      <!-- Tools -->
      <section id='tools'>
        <ul class='breadcrumb' id='breadcrumb'>
          <li class='title'>Dashboard</li>
        </ul>
      </section>
</body>
</html>