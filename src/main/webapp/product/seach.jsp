<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../../header.jsp" %>

<div class="container-fluid">
    <div class="row">
        <%@ include file="../../menu.jsp" %>

        <main class="col-md-9 col-lg-10 p-4 bg-light">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>検索画面</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/style6.css">
</head>
<body>
  <h2>ジャンルIDを入力</h2>
  <form action="All.action" method="post">
  ジャンルID:<input type="text" name="genre_id"><br>
  <input type="submit" value="検索">
  </form>
</body>
</html>
<%@ include file="../../footer.jsp" %>