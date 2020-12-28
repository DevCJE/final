<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지킴이</title>


</head>
<body>
 <%@include file="/WEB-INF/views/header.jsp" %>
<br><br><br><br>
<!-- page header -->
<div class="row" id="page header">
	<div class="col-sm-12" style=":lavender;text-align: center;font-size: x-large;">
		지킴이 서비스
	</div>
</div>


<br><br>


<!-- sub navigation, 한 row. -->
  <div class="row" id="sub_navigation">
    <div class="col-sm-2" style=":lavenderblush;"></div>
    
    <div class="col-sm-7" style=":lavender;">
    	<div class="row" style="text-align: center;">
		
		</div>
	</div>

  </div>






<br><br><br><br>

<div class="row">
<div class="col-sm-3"></div>
<div class="col-sm-3" onclick = "cctv()" data-toggle="modal" data-target="#myModal">
          <div class="thumbnail">
             

<img src="https://s14.postimg.org/sk7gljrox/CCTV_yellow.png" style="cursor: pointer; height: 300px;" >
          </div>
</div>
<div class="col-sm-3" onclick = "facility()">
       <div class="thumbnail"> 
<img src="https://s15.postimg.org/not1l2vsb/2935262_orig.png" style="cursor: pointer; height: 300px;">
</div>
   </div>
</div>



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
        <div class="modal-body text-center">
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
<div style="border: 1px solid red; display: none;" id="di">

확인하고자 하는 반을 선택해 주세요 &nbsp;&nbsp;&nbsp; <select id="secure_class">
 <option value="A반">A반</option>
 <option value="B반">B반</option>
 <option value="H반">C반</option>
</select>
</div>

<br><br><br><br><br><br><br>
 <%@include file="/WEB-INF/views/footer.jsp" %>





<%//부트스트랩 모달 영역 %>
<script>

cctv = function(){
	
	var text = document.getElementById("di").innerHTML;
	
	document.getElementById('h4-title').innerHTML="반별 CCTV 선택하기";
	document.getElementById('modal_content_ptag').innerHTML=text;

}
facility = function(){
	location.href="facility.do";
}

myFunction_click = function() {
	var el = document.getElementById('secure_class').value;
	location.href="cctv.do?cl="+el+"";
	
	
}

</script>

</body>
</html>