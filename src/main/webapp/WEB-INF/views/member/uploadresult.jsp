<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${result == 1 }">
	<script>
		alert("파일은 10MB까지 업로드 가능합니다.");
		history.go(-1);
	</script>
</c:if>

<c:if test="${result == 2 }">
	<script>
		alert("jpg, jpeg, gif, png 확장자만 업로드 가능합니다.");
		history.go(-1);
	</script>
</c:if>