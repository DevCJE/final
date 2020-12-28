<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function nameWrite(){
	var name = document.form.cb.value;
}
</script>
</head>
<body>
<form>
<table>
<c:forEach var="nameList" items="${names }">
	<tr>
		<td><input type="checkbox"	name=cb>${nameList }</td>
	</tr>
</c:forEach>
<tr>
	<td><input type="button" value="확인" onclick="nameWrite()"></td>
</tr>
</table>
</form>
</body>
</html>