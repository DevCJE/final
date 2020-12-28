<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴하기</title>
</head>
<body>
 <%@include file="/WEB-INF/views/header.jsp" %>
 <style>
 .text-red{
 	color : red;
 }
 </style>
 <script>
 $(document).ready(function(){ 
	    $('#deactivationForm').submit(function(){ 
	        if(!$('#id_can_not_login_check').prop('checked') || !$('#id_delete_content_check').prop('checked') || !$('#id_read_deactivation_instruction_check').prop('checked')){ 
	            $('#submit').tooltip('show') 
	            return false;
	        }
	    });
	});
 </script>
 <br/><br/>
 <section>
 	<article>
		<div class = "container">
		<form id="deactivationForm" action="member_out.do" method="post">
		<div class = "col-xs-10 col-xs-offset-1">
		 <div class="panel panel-danger">
		    <div class="panel-heading">
		      <h4 class="panel-title">
		        탈퇴하기
		      </h4>
		    </div>
		    <div class="panel-body">
		      <h5 class="text-center">
		        회원탈퇴 신청에 앞서 아래의 사항을 반드시 확인하시기 바랍니다.
		      </h5><br/>
		      <div class="well">
		          <ol class="list-left-align">
		  <br/><li>
				    <strong>
				      사용하고 계신 아이디는 탈퇴할 경우 재사용 및 복구가 불가능합니다.
				    </strong>
				    <br><br/>
				    <small>
		  		    <strong class="text-red">탈퇴한 아이디는 본인과 타인 모두 재사용 및 복구가 불가</strong>하오니 신중하게 선택하시기 바랍니다.<br/><br/>
				    </small>
				  </li>
				
				  <li>
				    <strong>
				      회원정보 및 회원제 서비스의 정보 삭제
				    </strong>
				    <br><br/>
				
				    <small>회원탈퇴를 신청하시면 해당 아이디는 <strong class="text-red">즉시 탈퇴</strong>처리되며 해당 아이디로는 더이상 로그인 등을 할 수 없습니다. <br>또한 저장된 회원정보 역시 삭제 됩니다.<br/><br/></small>
				  </li>
		
				  <li>
				    <strong>
				      불량이용 및 이용제한에 관한 기록 1년 동안 보관
				    </strong>
				    <br><br/>
				
				    <small>개인정보취급방침에 따라 불량이용 및 이용제한에 관한 기록은 1년 동안 삭제되지 않고 보관됩니다.<br/><br/></small>
				  </li>
			</ol>
		  </div>
		      <hr class="hr-dashed">
		
		      <h3 class="text-center">
		        계정정보 재확인
		      </h3>
		
		      <div class="form-group">
		        <div class="form-xsmall text-left">
		          <p class="form-control-static">
		            <strong>아이디</strong>
		          </p>
		        </div>
		
		        <div class="form-medium">
		          <p class="form-control-static">
		            <strong>${sessionScope.id}</strong>
		          </p>
		        </div>
		      </div>
		
		      <div class="form-group">
		        <label class="form-xsmall" for="id_password">
		          비밀번호
		        </label>
		
		        <div class="form-small">
		          <input class="form-control" name="id" type="hidden" value="${sessionScope.id}"/>	
		          <input class="form-control" name="pwd" type="password" />
		          
		        </div>
		      </div>	
		
		        
		      </div>
		
		      <div class="form-group">
		        <div class="form-xsmall">&nbsp;</div>
		        <div class="form-medium col-xs-offset-4">
		          <label for="id_can_not_login_check">
		            <input id="id_can_not_login_check" type="checkbox" />
		            <small>회원 탈퇴 시 해당 아이디로 더는 로그인을 할 수 없습니다.</small>
		          </label>
					<br>
		          <label for="id_delete_content_check">
		            <input id="id_delete_content_check" type="checkbox" />
		            <small>해당 아이디에 속한 모든 콘텐츠가 삭제됩니다.</small>
		          </label>
					<br>
		          <label for="id_read_deactivation_instruction_check">
		            <input id="id_read_deactivation_instruction_check" type="checkbox" />
		            <small>탈퇴 안내 문구를 확인했습니다.</small>
		          </label>
		        </div>
		      </div>
				<br>
		      <hr class="hr-dashed">
		      <div class="text-center" style="padding-right: 20px; padding-bottom: 20px;">
			      <button class = "btn btn-primary" type="submit" id = "submit" data-trigger="manual" data-toggle="tooltip" data-placement="bottom" title="탈퇴 안내를 모두 확인하고 동의해 주세요.">회원탈퇴</button>
			      <button class = "btn btn-primary" type="button" onclick = "location.href='member_update.do'">취소</button>
		    </div>
		    </div>
		  </div>
		</form>
		</div>
	</article>
</section>
  <%@include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>