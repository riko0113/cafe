<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>売上管理</title>
</head>
<body>
	<a href="${pageContext.request.contextPath}/sales/servlet/SalesSummary.action">
			売上詳細
	</a>
	<a href="${pageContext.request.contextPath}/sales/servlet/ProductSalesSummary.action">
			商品売上合計
	</a>
	<a href="${pageContext.request.contextPath}/sales/servlet/ProfitManagement.action">
			損益管理
	</a>
	<a href="${pageContext.request.contextPath}/sales/servlet/DailySalesRegisterAction.action">
			日売上登録
	</a>
</body>
</html>