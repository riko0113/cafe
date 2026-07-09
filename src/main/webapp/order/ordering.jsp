<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../header.jsp" %>

<span>利用方法を選択：</span>
<button type="button" class="tax-type-btn active" onclick="switchTaxType(this, 1.08)">お持ち帰り</button>
<button type="button" class="tax-type-btn" onclick="switchTaxType(this, 1.10)">イートイン</button>

<hr>

<div>
    <c:forEach var="product" items="${products}" varStatus="status">
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
    <c:forEach var="product" items="${products}">
        <div class="product-card" data-genre-id="${product.genreId}">
            <button onclick="addToCart('${product.productId}', '${product.productName}', ${product.price})">
                <c:out value="${product.productName}" />
            </button>
            ￥<span class="product-price" data-raw-price="${product.price}"><c:out value="${product.price * 1.08}" /></span>
        </div>
    </c:forEach>
</div>

<hr>

<h2>注文リスト</h2>
<div id="cartList">
    <p id="emptyMessage">商品が選択されていません</p>
</div>

<p>合計: <span id="includingTaxPrice">0</span> 円</p>
<span id="excludingTaxPrice" style="display: none;">0</span>

<button onclick="submitOrder()">注文を確定する</button>
<form id="hiddenOrderForm" action="/cafe/order/OrderCheck.action" method="POST">
    <input type="hidden" name="cartData" id="cartDataInput">
</form>

<script src="../static/js/ordering.js"></script>
<%@ include file="../footer.jsp" %>