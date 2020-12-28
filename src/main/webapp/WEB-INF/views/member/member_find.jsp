<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디|비밀번호 찾기</title>
</head>
<body>
 <%@include file="/WEB-INF/views/header.jsp" %>
 <section>
 	<br/><br/>
 	<article>
 	<div class = "container">
 		<div class="panel panel-danger">
			 <div class="panel-heading">
			      <h4 class="panel-title">
			        아이디 찾기
			      </h4>
			    </div>
				<form name = "signform" action="member_find_id.do">
					<div class = "form-group">
						<br/><br/>
						<div class = "row">
							<div class = "col-xs-4 text-right">이름</div>
							<div class = "col-xs-5"><input class = "form-control" type = "text" name = "name" required="required"></div>
							<div class = "col-xs-3"><p class = "idconfirm"></p></div>
						</div><br/><br/>
						<div class = "row">
							<div class = "col-xs-4 text-right">전화번호</div>
							<div class = "col-xs-5"><input class = "form-control" type = "text" name = "tel" placeholder="(ex : 010-1234-1234)" required="required"></div>
							<div class = "col-xs-3"><p class = "idconfirm"></p></div>
						</div><br/><br/>
						<div class = "row">
							<div class = "col-xs-6 col-xs-offset-5">
							<button class = "btn btn-primary" type="submit"><span>아이디 찾기</span></button>
							</div>
						</div><br/><br/>
					</div>
				</form>
			</div>
				<hr>
				<div class="panel panel-danger">
				<div class="panel-heading">
			      <h4 class="panel-title">
			        비밀번호 찾기
			      </h4>
			    </div>
				<form name = "signform" action="member_find_pwd.do">
					<div class = "form-group">
						<br/><br/><br/>
						<div class = "row">
							<div class = "col-xs-4 text-right">아이디</div>
							<div class = "col-xs-5"><input class = "form-control" type = "text" name = "id" required="required"></div>
							<div class = "col-xs-3"><p class = "idconfirm"></p></div>
						</div><br/><br/>
						<div class = "row">
							<div class = "col-xs-4 text-right">이름</div>
							<div class = "col-xs-5"><input class = "form-control" type = "text" name = "name" required="required"></div>
							<div class = "col-xs-3"><p class = "idconfirm"></p></div>
						</div><br/><br/>
						<div class = "row">
							<div class = "col-xs-4 text-right">전화번호</div>
							<div class = "col-xs-5"><input class = "form-control" type = "text" name = "tel" placeholder="(ex : 010-1234-1234)"  required="required"></div>
							<div class = "col-xs-3"><p class = "idconfirm"></p></div>
						</div><br/><br/>
						<div class = "row">
							<div class = "col-xs-6 col-xs-offset-5">
							<button class = "btn btn-primary" type="submit"><span>비밀번호 찾기</span></button>
							</div>
						</div><br/><br/>
					</div>
				</form>
				</div>
			</div>
 	</article>
 </section>
  <%@include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>