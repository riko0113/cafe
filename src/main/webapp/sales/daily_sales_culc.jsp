<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <form action="${pageContext.request.contextPath}/sales/servlet/DailySalesRegister.action">
  <label for="date">売上計算日を入力</label>
  <input type="date" id="culcdate" name="culcdate">
  <button type="submit">計算</button>
 </form>
</body>
</html>