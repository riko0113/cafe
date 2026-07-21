<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../../header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ジャンル</title>
<link rel="stylesheet" href="style4.css?v=1">
</head>
<body>
  <h2>ジャンルのIDと名前を登録しよう</h2>
  <form action="${pageContext.request.contextPath}/product/Insert2.action" method="post">
  商品ID:<input type="text" name="product_id"><br>
  商品名:<input type="text" name="product_name"><br>
  ジャンルID:<input type="text" name="genre_id"><br>
  価格:<input type="text" name="price"><br>
  <input type="submit" value="登録">
  </form>
</body>
</html>
<%@ include file="../../footer.jsp" %>