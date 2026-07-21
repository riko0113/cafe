<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ジャンル</title>
  <link rel="stylesheet" href="style2.css">
</head>
<body>
  <h2>ジャンルのIDと名前を登録しよう</h2>
  <form action="${pageContext.request.contextPath}/product/Insert.action" method="post">
  ジャンルID:<input type="text" name="genre_id"><br>
  ジャンル名:<input type="text" name="genre_name"><br>
  <input type="submit" value="登録">
  </form>
</body>
</html>
<%@ include file="../../footer.jsp" %>