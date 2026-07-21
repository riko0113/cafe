<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../../header.jsp" %>

<div class="container-fluid">
    <div class="row">
        <%@ include file="../../menu.jsp" %>

        <main class="col-md-9 col-lg-10 p-4 bg-light">
<h2>商品一覧</h2>
<table border="1" style="border-collapse: collapse; width: 100%;">
<tr style="background-color: #e3f2fd;">
<th>商品ID</th>
<th>商品名</th>
<th>ジャンルID</th>
<th>価格</th>
<th>操作</th>
</tr>

<c:forEach var="p" items="${products}">

<tr>
  <td>${p.productId}</td>
  <td>${p.productName}</td>
  <td>${p.genreId}</td>
  <td>${p.price}</td>
  <td>


<form action="${pageContext.request.contextPath}/product/Delete.action" method="post" style="display:inline;">
<input type="hidden" name="product_id" value="${p.productId}">
<input type="submit" value="削除" onclick="return confirm('本当に削除しますか？');">
</form>
</td>
</tr>
</c:forEach>
</table>
<%@ include file="../../footer.jsp" %>