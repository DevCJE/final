<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:if test="${admin_result==1 && state == 2}">
<script>
window.alert("완료 되었습니다.");
location.href="dosing_admin.do";
</script>
</c:if>



<c:if test="${result==1}">
<script>
window.alert("작성 완료 되었습니다.");
location.href="dosing.do";
</script>
</c:if>
<c:if test="${result==0}">
<script>
window.alert("작성에 실패하였습니다.");
location.href="dosing.do";
</script>
</c:if>
    
    