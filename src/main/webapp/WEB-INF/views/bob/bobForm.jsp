<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="../header.jsp" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">  
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style>
#bobimg{
 	width: 250px;
 	height: 250px;
}
#content{
 	width: 250px;
 	height: 110px; 	
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

var num="";
 
</script>

</head>
<body>
  
  <div style="height: 80px;">
  </div>

   
        <div class = "container">
         
                         
             <c:if test="${empty dto}">
             <div>                      
             <form name="menu" action="menuChart.do">
             <h2>${menu_date}일 식단표                   
               &nbsp;&nbsp;&nbsp;<input type="submit" value="검색하기" class="btn icon-btn btn-primary pull-right">
               <input type="text" id="datepicker" name="calender" class="btn icon-btn btn-primary pull-right" value="${menu_date}">
               <input type="button" value="월별 목록 보기" onclick="location.href='monthCalender.do'" class="btn icon-btn btn-primary pull-right">          
             </h2>
             </form>
             
             </div>
             <div align="center" style="padding-bottom: 180px; padding-top: 180px;"><font size="5">작성된 식단표가 없습니다.</font></div>
			 <c:if test="${sessionScope.auth == 4||sessionScope.auth == 5}">
			<div style="margin-bottom: 120px;">			
			<input type="button" value="식단표 작성하기" class="btn icon-btn btn-primary pull-right" onclick="location.href='menuWrite.do?menu_date=${menu_date}'">
			</div>	                                	
			 </c:if>
             
             </c:if>            
            
             <c:if test="${!empty dto}">       
            <div>             
             <form name="menu" action="menuChart.do">         
               <h2>${menu_date}일 식단표            
               &nbsp;&nbsp;&nbsp;<input type="submit" value="검색하기" class="btn icon-btn btn-primary pull-right">   
               <input type="text" id="datepicker" name="calender" class="btn icon-btn btn-primary pull-right" value="${menu_date}">
               <input type="button" value="월별 목록 보기" onclick="location.href='monthCalender.do'" class="btn icon-btn btn-primary pull-right">               
               </h2>     
              </form>
           </div>
             <div class=row style="margin-top: 70px;" >
               <div class="thumbnails">
            	  <div class="col-md-4">
              		 <div class="thumbnail">
                     <p align="center" style="padding-top: 28px;">아침간식</p> 
                     <img src="${dto.bob1_image}" id="bobimg" alt="ALT NAME">                     
                     <div style="padding-top: 10px;"><p align="center">${dto.bob1_name}</p></div>  
                     <div class="caption">                     
                     </div>
              		</div>              		
              	   </div>
              	   <div class="col-md-4">
              		 <div class="thumbnail">
                     <p align="center" style="padding-top: 28px;">점심</p> 
                     <img src="${dto.bob2_image}" id="bobimg" alt="ALT NAME">
                     <div style="padding-top: 10px;"><p align="center">${dto.bob2_name}</p></div>  
                     <div class="caption">                     
                     </div>
              		</div>              		
              	   </div>
              	   <div class="col-md-4">
              		 <div class="thumbnail">
                     <p align="center" style="padding-top: 28px;">오후간식</p> 
                     <img src="${dto.bob3_image}" id="bobimg" alt="ALT NAME">
                     <div style="padding-top: 10px;"><p align="center">${dto.bob3_name}</p></div>  
                     <div class="caption">                     
                     </div>
              		</div>              		
              	   </div>
            	 </div>           
               </div>                     		                                  
             
             <div class=row style="margin-bottom: 50px;" align="center">
               <div class="thumbnails">
            	  <div class="col-md-4">
              		 <div class="thumbnail">                                          
                     <p align="center" style="padding-top: 28px;" id="content">${dto.bob1_content}</p>  
                     <div class="caption">                     
                     </div>
              		</div>              		
              	   </div>
              	   <div class="col-md-4">
              		 <div class="thumbnail">
                     <p align="center" style="padding-top: 28px;" id="content">${dto.bob2_content}</p>                                        
                     <div class="caption">                     
                     </div>
              		</div>              		
              	   </div>
              	   <div class="col-md-4">
              		 <div class="thumbnail">
                     <p align="center" style="padding-top: 28px;" id="content">${dto.bob3_content}</p>                                           
                     <div class="caption">                     
                     </div>
              		</div>              		
              	   </div>
            	 </div>           
               </div>  
			 <c:if test="${sessionScope.auth == 4||sessionScope.auth == 5}">
			 <div class="pull-right" style="padding-bottom: 100px;"><input type="button" value="수정하기" class="btn icon-btn btn-primary" onclick="location.href='menuUpdateForm.do?menu_date=${menu_date}'">
             <input type="button" value="삭제하기" class="btn icon-btn btn-primary" onclick="location.href='menuDeleteOk.do?menu_date=${menu_date}'">                  
             
             </div>                                	
			 </c:if>
             </c:if>
            
             </div>      

  <%@include file="../footer.jsp" %>
</body>
</html>