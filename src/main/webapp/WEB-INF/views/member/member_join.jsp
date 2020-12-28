<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KinderGarten SignUp</title>
</head>
<body>
    <%@include file="/WEB-INF/views/header.jsp" %>
    <script type="text/javascript" src="//cdn.poesis.kr/post/popup.min.js" charset="UTF-8"></script>
	<section>
	<script type="text/javascript">
		$(document).ready(function(){
			
			$("#search_button").postcodifyPopUp();
			$('.postcodify_logo').css("display","none");
			
			$("link[href*=poesis").attr("href", "assets/css/search.css");
			
			var idcheck = "false";
			var pwdcheck = "false";
			
		    $('#id').keyup(function(){
				
		    	if( $('#id').val().length == 0 ){
		    		$("#id_check").html("");
		    		 idcheck = "false";
		    	}	
		    	if( $('#id').val().length < 6 && $('#id').val().length > 0  ){
		    		 $("#id_check").css("color", "red").css("font-weight", "bold").html("&nbsp;&nbsp;&nbsp;아이디는 최소 6자 이상입니다");
		    		 idcheck = "false";
		    	}
		        if ( $('#id').val().length >= 6) {
		            var id = $(this).val();
		            
		            $.ajax({
		                type : 'POST',
		                url : 'member_check.do',
		                dataType : "json",
		                data:
		                {
		                    id: id,
		                },
		                success : function(result) {
		                    if (result.result == "false") {
		                    	$("#id_check").css("color", "green").css("font-weight", "bold").html("&nbsp;&nbsp;&nbsp;사용 가능한 아이디 입니다.");
		                        idcheck = "true";
		                    } else if(result.result == "true"){
		                    	$("#id_check").css("color", "red").css("font-weight", "bold").html("&nbsp;&nbsp;&nbsp;이미 등록된 아이디 입니다.");
		                        idcheck = "false";
		                    } else {
		                    	$("#id_check").css("color", "red").css("font-weight", "bold").html("&nbsp;&nbsp;&nbsp;아이디는 소문자와 숫자로만 가능합니다.");
		                        idcheck = "false";
		                    }
		                },
		                error:function(request,status,error){
		                    alert("code:"+request.status+"\n"+"error:"+error);
		                }
		            });
		        }
		        
		    });
		    
			$('#pwdconfirm').focusout(function(){
				
				var pwd = $('#pwd').val();
				var pwdconfirm = $('#pwdconfirm').val();
					
				if(pwd == pwdconfirm){
					$("#pwd_check").css("color", "green").css("font-weight", "bold").html("&nbsp;&nbsp;&nbsp; 비밀번호가 서로 잘 맞네요.");
					pwdcheck = "true";
				} else {
					$("#pwd_check").css("color", "red").css("font-weight", "bold").html("&nbsp;&nbsp;&nbsp; 비밀번호가 맞지 않습니다.");
					pwdcheck = "false";
				}			
			});
			
			$('#signform').submit(function(){
				
				var addr = $('#addr').val();
				
				if(addr == ""){
					$('#addr').tooltip('show') 
		            return false;
				}
				var addrdetail = $('#addrdetail').val();
				
				var addr = addr + " - " + addrdetail;
				
				$('#addr').val(addr);
				
				if(idcheck == "false" || pwdcheck == "false"){
					$('#join').tooltip('show') 
		            return false;
				}
				
			});			
			
		});
		
	</script>
	<br/><br/>
		<article>
			<div class = "container">
				<div class = "head text-center">
					<h2>회원가입하기</h2>
				</div><br/><br/>
				<form name = "signform" id="signform" action="member_join.do" method="post">
					<div class = "form-group well">
					<br/>
						<div class = "row">
							<div class = "col-xs-4 text-right">아이디</div>
							<div class = "col-xs-5"><input class = "form-control" type = "text" name = "id" id="id" required="required"></div>
							<div class = "col-xs-3"><p class = "idconfirm" id="id_check"></p></div>
						</div><br/><br/>
						<div class = "row">
							<div class = "col-xs-4 text-right">비밀번호</div>
							<div class = "col-xs-5"><input class = "form-control" type = "password" name = "pwd" id = "pwd" required="required"></div>
							<div class = "col-xs-3"><p class = "idconfirm"></p></div>
						</div><br/><br/>
						<div class = "row">
							<div class = "col-xs-4 text-right">비밀번호 확인</div>
							<div class = "col-xs-5"><input class = "form-control" type = "password" name = "pwdconfirm" id = "pwdconfirm" required="required"></div>
							<div class = "col-xs-3"><p class = "pwdconfirm" id="pwd_check"></p></div>
						</div><br/><br/>
						<div class = "row">
							<div class = "col-xs-4 text-right">회원 이름</div>
							<div class = "col-xs-5"><input class = "form-control" type = "text" name = "name" required="required"></div>
						</div><br/><br/>
						<div class = "row">
							<div class = "col-xs-4 text-right">원아 이름(선택)</div>
							<div class = "col-xs-5"><input class = "form-control" type = "text" name = "namechild"></div>
						</div><br/><br/>
						<div class = "row">
							<div class = "col-xs-4 text-right">연락처</div>
							<div class = "col-xs-5"><input class = "form-control" type = "text" name = "tel" required="required"></div>
						</div><br/><br/>
						<div class = "row">
							<div class = "col-xs-4 text-right">이메일</div>
							<div class = "col-xs-5"><input class = "form-control" type = "text" name = "email" required="required"></div>
						</div><br/><br/>
						<div class = "row">
							<div class = "col-xs-4 text-right">주소</div>
							<div class = "col-xs-5"><input class = "postcodify_address form-control" type = "text" name = "addr" id = "addr" required="required" readonly="readonly" data-trigger="manual" data-toggle="tooltip" data-placement="bottom" title="검색창을 통해 주소를 등록해주세요."></div>
							<div class = "col-xs-3"><button type = "button" class = "btn btn-primary" id="search_button">검색</button></div>
						</div><br/>
						<div class = "row">
							<div class = "col-xs-4 text-right">상세주소</div>
							<div class = "col-xs-5"><input class = "postcodify_details form-control" type = "text" name = "addrdetail" id = "addrdetail" ></div>
						</div><br/><br/>
						<input type = "hidden" name = "groupchild" value="">
						<div class = "row">
							<div class = "col-xs-6 col-xs-offset-5">
							<button class = "btn btn-primary" type="submit" id = "join" data-trigger="manual" data-toggle="tooltip" data-placement="bottom" title="아이디나 비밀번호를 다시 확인해 주세요!">가입하기</button>
							<button class = "btn btn-primary" type="reset">다시작성</button>
							</div>
						</div><br/><br/>
					</div>
				</form>
			</div>
		</article>
	</section>
    <%@include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>