<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


    {data:[
    
    <c:forEach var="ele" items= "${result}">
    {
    idx:'${ele.idx}',
    name:'${ele.child_name}',
    date:'<fmt:formatDate pattern="yyyy-MM-dd" value="${ele.dosing_date}" />'
    },
    </c:forEach>
    
  	]}
  	
  	