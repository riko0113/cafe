<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./header.jsp" %>
<div class="container-fluid">
    <div class="row">
        <%@ include file="./menu.jsp" %>

        <main class="col-md-9 col-lg-10 p-4 bg-light">

<a href="/cafe/order/OrderBasic.action">注文📝</a><br>
<a href="#">在庫管理📦</a><br>
<a href="#">商品管理🥪</a><br>
<a href="${pageContext.request.contextPath}/sales/sales_menu.jsp">売上管理💰</a><br>
<a href="${pageContext.request.contextPath}/account/manage/edit.jsp">アカウント管理💬</a>

<%@ include file="./footer.jsp" %>