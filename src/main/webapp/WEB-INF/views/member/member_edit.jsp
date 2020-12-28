<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
</head>
<body>
 <%@include file="/WEB-INF/views/header.jsp" %>
 <section>
 	<script type="text/javascript" src="//cdn.poesis.kr/post/popup.min.js" charset="UTF-8"></script>
 	<script type="text/javascript">
		$(document).ready(function(){
			
			$("#search_button").postcodifyPopUp();
			$('.postcodify_logo').css("display","none");
			
			$("link[href*=poesis").attr("href", "assets/css/search.css");
			
			var pwdcheck = "false";
			
			$('#memberUpdateForm').submit(function(){
				
				var addr = $('#addr').val();
				
				if(addr == ""){
					$('#addr').tooltip('show') 
		            return false;
				}
				
				var addrdetail = $('#addrdetail').val();
				
				var addr = addr + " - " + addrdetail;
				
				$('#addr').val(addr)
				
			});
			
			$('#memberPwdUpdateForm').submit(function(){
				
				var pwd = $('#pwd').val();
				var pwdconfirm = $('#pwdconfirm').val();
					
				if(pwd == pwdconfirm){
					pwdcheck = "true";
				} else {
					pwdcheck = "false";
				}		
				
				
				if(pwdcheck == "false"){
					$('#pwdUpdate').tooltip('show') 
		            return false;
				}
				
			});
			
		});
	</script>
 	<br/><br/>
 	<article>
		<div class="container">
		 <div class="row">
			 <div class = "row pull-right" style="padding-right: 17px;">
				<div class = "col-xs-11">
					<button class="btn btn-primary" type = "button" onclick = "location.href='member_out.do'">회원 탈퇴하기</button>
				</div>
			</div><br/><br/><br/>
		  <div class="col-md-12">
		   <div class="panel panel-danger">
		    <div class="panel-heading">비밀번호 수정</div>
			    <form name = "memberUpdateForm" id ="memberPwdUpdateForm" action = "member_update_pw.do" method="post">
			     <div class="panel-body">
				  <label>기존 비밀번호</label><input type='password' class='form-control' name = "prepwd"><br/>
				  <label>새 비밀번호</label><input type='password' class='form-control' name = "pwd" id = "pwd"><br/>
				  <label>새 비밀번호 확인</label><input type='password' class='form-control' name = "pwdconfirm" id = "pwdconfirm"><br/>
			      <br/><br/>
			      <input type = "hidden" name = "id" value = '${result.id}'>
			      <div class = "buttons text-center">
			      <button type = "submit" class = "btn btn-primary" id = "pwdUpdate" data-trigger="manual" data-toggle="tooltip" data-placement="top" title="비밀번호가 서로 맞지 않습니다">수정하기</button>
			      <button type = "button" class = "btn btn-primary" onclick = "location.href = 'index.do'">돌아가기</button><br/><br/>
			      </div>
			    </div>
			    </form>
		   </div>
		   <hr>
		   <div class="panel panel-danger">
		    <div class="panel-heading">회원정보 수정</div>
			    <form name = "memberUpdateForm" id = "memberUpdateForm" action = "member_update.do" method="post">
			     <div class="panel-body">
				  <label>이름 </label><input type='text' class='form-control' name = "name"  value='${result.name}' required="required"><br/>
				  <label>원아이름 </label><input type='text' class='form-control'  name = "namechild" value='${result.namechild}'><br/>
				  <label>연락처 </label><input type='text' class='form-control'  name = "tel" value='${result.tel}' required="required"><br/>
				  <label>이메일 </label><input type='text' class='form-control' name="email" value='${result.email}' required="required"><br/>
				  <p>
			      <label>주소 </label><input type='text' class='postcodify_address form-control' name="addr" id="addr"  value='${result.addr}' required="required" readonly="readonly" data-trigger="manual" data-toggle="tooltip" data-placement="bottom" title="검색창을 통해 주소를 등록해주세요."><br/>
			      <button type = "button" class = "btn btn-primary pull-right" id="search_button">검색</button>
			      </p><br/>
			      <label>세부주소 </label><input type='text' class='form-control' id="addrdetail"  value='${addrDetail}' required="required">
			      <br/><br/>
			      <input type = "hidden" name = "id" value = '${result.id}'>
			      <div class = "buttons text-center">
			      <button type = "submit" class = "btn btn-primary">수정하기</button>
			      <button type = "button" class = "btn btn-primary" onclick = "location.href = 'index.do'">돌아가기</button><br/><br/>
			      </div>
			    </div>
			    </form>
		   </div>
		  </div>
		 </div>
		</div>
		<div>
		</div>
 	</article>
 </section>
  <%@include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>