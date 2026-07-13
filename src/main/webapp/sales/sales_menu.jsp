<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date, java.text.SimpleDateFormat" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>売上管理</title>
</head>
<body>
	<form action="${pageContext.request.contextPath}/sales/servlet/DailyProductSalesSummary.action">
		<input type="hidden" id="culcdate" name="culcdate" value="${culcdate}">
		<button type="submit">日次売上詳細</button>
	</form>
	<form action="${pageContext.request.contextPath}/sales/servlet/MounthlyProductSalesSummary.action">
		<input type="hidden" id="culcdate" name="culcdate" value="${culcdate}">
		<button type="submit">月次売上詳細</button>
	</form>
	<a href="${pageContext.request.contextPath}/sales/servlet/ProductSalesSummary.action">
			商品売上合計
	</a>
	<a href="${pageContext.request.contextPath}/sales/servlet/ProfitManagement.action">
			損益管理
	</a>
	<a href="${pageContext.request.contextPath}/sales/servlet/DailySalesCulcAction.action">
			日売上登録
	</a>
</body>
</html>