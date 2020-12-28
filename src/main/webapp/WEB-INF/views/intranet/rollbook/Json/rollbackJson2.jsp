<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  	{data:[
    
    <c:set var = "a" value="${at}"/>
    <c:set var = "na" value="${nat}"/>
    <c:set var = "s" value="${sick}"/>
    <c:set var = "ac" value="${acc}"/>
    <c:set var = "e" value="${enter}"/>
    <c:set var = "o" value="${out}"/>
    
    <c:forEach var="key" items= "${arr}" >
    {
    
    
    
    el : '${ key }',
    attendance : '${a}',
    noatt : '${na}',
    sick : '${s}',
    acc : '${ac}',
    enter : '${e}',
    out : '${o}'
    
    
    
    },
    </c:forEach>
    
  	]}