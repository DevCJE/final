<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


    {data:[
    
    <c:forEach var="ele" items= "${result}">
    {
    s1:'${ele.enc1}',
    s2:'${ele.enc2}',
    },
    </c:forEach>
    
  	]}
  	
  	