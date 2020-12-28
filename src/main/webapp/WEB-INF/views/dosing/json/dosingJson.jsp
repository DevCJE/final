<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
   	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
  	{data:[
    
    <c:forEach var="ele" items= "${dosing_getAllChildlist}" >
    {
    class_:'${ele.dosing_class}',
    symtom:'${ele.symtom}',
    name:'${ele.child_name}',
    idx:'${ele.child_idx}',
    R_idx:'${ele.idx}',
    client:'${ele.client}',
    date:'<fmt:formatDate pattern="yyyy-MM-dd" value="${ele.dosing_date}" />'
    },
    </c:forEach>
    
  	]}
  	