<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
<div class = "container jumbotron" >

	<h2 align="center">content</h2>
   
	<div class="row">
	  <div class="col-md-4">
	    <img src="${menu.bob1_image}" class="img-responsive img-thumbnail" width="60%" alt="ALT NAME">
	    <label>${menu.bob1_content}</label>  
	  </div>	  
	  <div class="col-md-4">
	    <img src="${menu.bob2_image}" class="img-responsive img-thumbnail" width="60%" alt="ALT NAME">
	    <label>${menu.bob2_content}</label>	    
	  </div>  
	  <div class="col-md-4">  
	    <img src="${menu.bob3_image}" class="img-responsive img-thumbnail" width="60%" alt="ALT NAME">
	    <label>${menu.bob3_content}</label>	    
	  </div>
	  
	</div>

</div>
</body>
</html>