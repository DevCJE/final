<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
     
     <link rel="shortcut icon" href="assets/img/main/ikon.png">
    
    <!-- Bootstrap 3.3.2 -->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="assets/css/animate.css">
    <link rel="stylesheet" href="assets/css/font-awesome.min.css">
    <link rel="stylesheet" href="assets/css/slick.css">
    <link rel="stylesheet" href="assets/js/rs-plugin/css/settings.css">
    <link rel="stylesheet" href="assets/css/styles.css">
    <link rel="stylesheet" href="assets/css/main.css">


    <script type="text/javascript" src="assets/js/modernizr.custom.32033.js"></script>
    <script src="assets/js/jquery-1.11.1.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/slick.min.js"></script>
    <script src="assets/js/placeholdem.min.js"></script>
    <script src="assets/js/rs-plugin/js/jquery.themepunch.plugins.min.js"></script>
    <script src="assets/js/rs-plugin/js/jquery.themepunch.revolution.min.js"></script>
    <script src="assets/js/waypoints.min.js"></script>
    <script src="assets/js/scripts.js"></script>
    
    <style>
    @font-face {
    font-family: 'Sumusaleuibom';
    src: url(assets/fonts/Sumusaleuibom.ttf) format('truetype');
	}
	body{
    	font-family : "Sumusaleuibom"
    }
    </style>
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
 <header>
        <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
                <div class="container">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                            <span class="fa fa-bars fa-lg"></span>
                        </button>
                        <a class="navbar-brand" href="index.do">
                            <img src="assets/img/main/logo.png" alt="" class="logo">
                        </a>
                    </div>

                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">

                        <ul class="nav navbar-nav navbar-right">
               		        <li><a href="#about"><b>About</b></a>
                            </li>
                            <li><a href="albumList.do"><b>앨범</b></a>
                            </li>
                            <li><a href="noteList.do"><b>알림장</b></a>
                            </li>
                            <li><a href="bobForm.do"><b>식단표</b></a>
                            </li>
                            <li><a href="secure.do"><b>지킴이</b></a>
                            </li>
                            <li><a href="notice_List.do"><b>공지사항</b></a>
                            </li>
                            <c:url var="Callogin" value="calendar_List.do?">
                            	<c:param name="id" value="${sessionScope.id}"/>
                            </c:url>
                            <li><a href="${Callogin }"><b>일정표</b></a>
                            </li>
                           
                       
                              <c:if test="${sessionScope.auth == 3}">
                           <li><a href="dosing.do"><b>투약</b></a>
                            </li> 
                            </c:if>
                            <c:if test="${sessionScope.auth == 4 || sessionScope.auth == 5 }">
                             <li><a href="dosing_admin.do"><b>투약</b></a>
                            </li> 
                            </c:if>
                            <c:if test="${sessionScope.auth == 3}">
                            <li><a href="consentList.do"><b>귀가</b></a>
                            </li> 
                            </c:if>
                            <c:if test="${sessionScope.auth == 4 || sessionScope.auth == 5 }">
                            <li><a href="consentAdminList.do"><b>귀가</b></a>
                            </li> 
                            </c:if>
                            <c:if test="${empty sessionScope.id}">
								<li class="dropdown">
						          <a href="#" class="dropdown-toggle" data-toggle="dropdown" id="a"><b>Login</b> <span class="caret"></span></a>
									<ul id="login-dp" class="dropdown-menu">
										<li>
											 <div class="row">
													<div class="col-md-12">
						                                KinderGarten Login <br/><br/>
						                                <c:if test="${empty region}">
														<form class="loginform" action="member_login.do" method="post">
														<div class="form-group">
																	 <label class="sr-only" for="id">ID</label>
																	 <input type="text" class="form-control" name="id" placeholder="ID를 입력하세요" required>
																</div>
																<div class="form-group">
																	 <label class="sr-only" for="password">Password</label>
																	 <input type="password" class="form-control" name="pwd" placeholder="Password" required>
						                                             <div class="help-block text-right"><a href="member_find.do">아이디 | 비밀번호 찾기</a></div>
																</div>
																<div class="form-group">
																	 <button type="submit" class="btn btn-primary btn-block">로그인</button>
																</div>
																<div class="checkbox">
																	 <label>
																	 <input type="checkbox" name = "idcheck" id = "idcheck"> 아이디 기억하기
																	 </label>
																	 <c:if test="${!empty cookie.id.value}">										
																	 	<script>
																	 			$("#idcheck").attr("checked", "checked");
																	            $("#id").attr("value", "${cookie.id.value}");
																	 	</script>
																	 </c:if>
																</div>
														 </form>
														</c:if>
														<c:if test="${!(empty region)}">
														<form class="loginform" action="cctv_member_login.do?region=${region}" method="post">
														<div class="form-group">
																	 <label class="sr-only" for="id">ID</label>
																	 <input type="text" class="form-control" name="id" placeholder="ID를 입력하세요" required>
																</div>
																<div class="form-group">
																	 <label class="sr-only" for="password">Password</label>
																	 <input type="password" class="form-control" name="pwd" placeholder="Password" required>
						                                             <div class="help-block text-right"><a href="member_find.do">아이디 | 비밀번호 찾기</a></div>
																</div>
																<div class="form-group">
																	 <button type="submit" class="btn btn-primary btn-block">로그인</button>
																</div>
																<div class="checkbox">
																	 <label>
																	 <input type="checkbox" name = "idcheck" id = "idcheck"> 아이디 기억하기
																	 </label>
																	 <c:if test="${!empty cookie.id.value}">										
																	 	<script>
																	 			$("#idcheck").attr("checked", "checked");
																	            $("#id").attr("value", "${cookie.id.value}");
																	 	</script>
																	 </c:if>
																</div>
														 </form>
														</c:if> 
																
													</div>
													<div class="bottom text-center">
														처음이세요 ? <b><a href="member_join.do">가입하기</a></b>
													</div>
											 </div>
										</li>
									</ul>
						        </li>
                            </c:if>
                            <c:if test="${!empty sessionScope.id}">
								<li class="dropdown">
						          <a href="#" class="dropdown-toggle" data-toggle="dropdown" id="b"><b>Info</b> <span class="caret"></span></a>
									<ul id="info-dp" class="dropdown-menu">
										<li>
											 <div class="row">
													<div class="col-md-12">								
															<div class="user-info-block">
												                <div class="user-heading">
												                    <h3>${sessionScope.name}</h3>
												                    <span class="help-block">
												                    회원등급&nbsp;:&nbsp;
									                                	<c:if test="${sessionScope.auth == 1}">
									                                	학부모(미승인)
									                                	</c:if>
									                                	<c:if test="${sessionScope.auth == 2}">
									                                	교사(미승인)
									                                	</c:if>
									                                	<c:if test="${sessionScope.auth == 3}">
									                                	학부모
									                                	</c:if>
									                                	<c:if test="${sessionScope.auth == 4}">
									                                	교사
									                                	</c:if>
									                                	<c:if test="${sessionScope.auth == 5}">
									                                	원장
									                                	</c:if>
												                    </span>
												                </div>
												                <ul class="loginnavigation">
												                    <li class="active">
												                        <a href="member_update.do">
												                            <span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;&nbsp;회원정보
												                        </a>
												                    </li>
												                    <c:if test="${sessionScope.auth == 4 || sessionScope.auth == 5 }">
												                    <li>
												                    	<c:url var="itnUrl" value="itn_lockscreen.do">
												                    		<c:param name="send_name">${sessionScope.name}</c:param>
												                    		<c:param name="recv_name">${sessionScope.name}</c:param>
												                    		<c:param name="userid">${sessionScope.id}</c:param>
												                    	</c:url>
												                        <a href="${itnUrl}">
												                            <span class="glyphicon glyphicon-cog"></span>&nbsp;&nbsp;&nbsp;인트라넷
												                        </a>
												                    </li>
												                    </c:if>
												                    <li>
												                    <c:if test="${empty region}">
												                        <a href="member_logout.do">
												                            <span class="glyphicon glyphicon-log-out"></span>&nbsp;&nbsp;&nbsp;로그아웃
												                        </a>
												                    </c:if>
												                    
												                    <c:if test="${!(empty region)}">
												                        <a href="cctv_main.do?out=1&region=${region}">
												                            <span class="glyphicon glyphicon-log-out"></span>&nbsp;&nbsp;&nbsp;로그아웃
												                        </a>
												                    </c:if>
												                    
												                        
												                    </li>
												                </ul>
												            </div>							 
													</div>
											 </div>
										</li>
									</ul>
						        </li>
                            </c:if>					        
                        </ul>
                    </div>
                    <!-- /.navbar-collapse -->
                </div>
                <!-- /.container-->
        </nav>
    </header>