<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link href="#" rel="stylesheet">
</head>
<body>
<c:choose>
	<c:when test= "${not empty sessionScope.account}">
		🌷${sessionScope.account.user_name}🌷
	</c:when>
<c:otherwise>
	<a href="../login/login.jsp">ログイン</a>
	</c:otherwise>
</c:choose>
<a href="../logout/logout.jsp">ログアウト</a>🌷

