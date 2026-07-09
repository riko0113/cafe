<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../header.jsp" %>

<div>
    <c:forEach var="product" items="${productList}" varStatus="status">
        <span class="tab ${status.first ? 'active' : ''}" 
              data-genre-id="${product.genreId}" 
              onclick="switchGenre('${product.genreId}')" 
              style="margin-right: 15px; cursor: pointer; text-decoration: underline;">
            <c:out value="${product.genreName}" />
        </span>
    </c:forEach>
</div>

<hr>

<div>
    <c:forEach var="product" items="${productList}">
        <div class="product-card" data-genre-id="${product.genreId}">
            <button onclick="addToCart('${product.productId}', '${product.productName}', ${product.price * 1.08})">
                <c:out value="${product.productName}" />
            </button>
            ￥<c:out value="${product.price * 1.08}" />
        </div>
    </c:forEach>
</div>

<hr>

<h2>注文リスト</h2>
<div id="cartList">
    <p id="emptyMessage">商品が選択されていません</p>
</div>

<p>合計: <span id="totalPrice">0</span> 円</p>
<button onclick="submitOrder()">注文を確定する</button>

<script src="../static/js/ordering.js"></script>
<%@ include file="../footer.jsp" %>