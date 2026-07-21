<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../header.jsp" %>
<div class="container-fluid">
    <div class="row">
        <%@ include file="../../menu.jsp" %>
        <link rel="stylesheet" href="style.css?v=1">

        <main class="col-md-9 col-lg-10 p-4 bg-light">
  			<a href="${pageContext.request.contextPath}/product/insert.jsp" class="btn-register">商品登録画面</a>
  			<a href="${pageContext.request.contextPath}/product/All.action" class="btn-views">参照画面</a>
  			<a href="${pageContext.request.contextPath}/product/seach.jsp" class="btn-seachs">検索</a>
			<hr>
<%@ include file="../../footer.jsp" %>