<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/WEB-INF/views/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">  
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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
  var num="";
</script>
<script>
	function move(addr){
		location.href="doc_docList.do?id="+addr;
	}
</script>
</head>
<body>

<div style="height: 50px;">
</div>
  <div class = "container well well-add-card">
         <form name="calendar_WriteForm" action="calendar_Write.do" method="post">
            <div style="margin-top: 50px;" align="center"><h2>일정표 작성하기</h2></div>
                 <input type="hidden" name="id" value="${id }">
                  <div class=row style="margin-top: 50px;" >                  
                     <div class="col-md-6" style="margin-left: 293px;">                                                                                
                     <p style="padding-top: 15px;" align="center"><input type="text" id="datepicker" name="cal_date" class="btn icon-btn btn-primary" value="날짜 선택"></p>                    
                     <p style="padding-top: 15px;">제목</p>
			         <input type="text" name="cal_subject" class="form-control" required="required">
			         <p style="padding-top: 15px;">시간</p>
			         <input type="text" name="cal_time" class="form-control" required="required">
                     <p style="padding-top: 15px;">내용</p>
                     <textarea rows="7" cols="61" name="cal_content" required="required"></textarea>
                     <input type="hidden" name="cal_map" value="0">                     
                     <div class="caption">                     
                     </div>
              		</div>      
             </div> 
             <div align="center" style="margin-bottom: 50px; margin-top: 50px;">          
                   <button type = "submit" class="btn icon-btn btn-primary">작성완료</button>
                   <c:url var="canmove" value="calendar_List.do">
             		<c:param name="id" value="${sessionScope.id }"/>
             	   </c:url>
                   <a href="${canmove }"><input type="button" value="취소" class="btn icon-btn btn-primary"></a>
               </div>             
         </form>             
   </div>
<%@include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>