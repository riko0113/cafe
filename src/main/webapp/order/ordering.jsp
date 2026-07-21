<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ include file="../header.jsp" %>

<style>
/* 最小限のカスタムスタイル */
body { background-color: #f8f9fa; }

/* 商品カードの切り替え表示 */
.product-card { display: none; }
.product-card.active { display: flex; }

/* アクティブ（選択中）のスタイル */
.tax-type-btn.active, .tab.active {
    background-color: #212529 !important;
    color: #ffffff !important;
    border-color: #212529 !important;
}
</style>

<div class="container-fluid bg-light min-vh-100">
<div class="row">
<%@ include file="../../menu.jsp" %>

<main class="col-md-9 col-lg-10 p-4 bg-light text-dark">

    <!-- 上部ボタン -->
    <div class="d-flex gap-2 mb-4">
        <button type="button" class="btn btn-outline-secondary btn-sm rounded-3 px-3" onclick="location.href='../index.jsp'">
            ホーム画面
        </button>
        <button type="button" class="btn btn-outline-secondary btn-sm rounded-3 px-3" onclick="location.href='/cafe/order/OrderHistory.action'">
            注文履歴を見る
        </button>
    </div>

    <!-- 利用方法選択 -->
    <div class="d-flex align-items-center gap-3 mb-4 p-3 bg-white border rounded-3 shadow-sm">
        <span class="fw-bold text-secondary">利用方法：</span>
        <div class="btn-group">
            <button type="button" class="tax-type-btn btn btn-dark rounded-3 px-3 me-2" onclick="switchTaxType(this, 1.08)">お持ち帰り</button>
            <button type="button" class="tax-type-btn btn btn-outline-secondary rounded-3 px-3" onclick="switchTaxType(this, 1.10)">イートイン</button>
        </div>
    </div>

    <hr class="text-muted my-4">

    <!-- ジャンルタブ -->
    <div class="d-flex flex-wrap gap-2 mb-4">
        <c:set var="addedGenres" value="" />
        <c:forEach var="product" items="${products}">
            <c:if test="${!fn:contains(addedGenres, product.genreId)}">
                <span class="tab btn btn-outline-secondary rounded-3 px-3 py-1 ${empty addedGenres ? 'active' : ''}" 
                      data-genre-id="${product.genreId}" 
                      onclick="switchGenre('${product.genreId}')" 
                      style="cursor: pointer;">
                    <c:out value="${product.genreName}" />
                </span>
                <c:set var="addedGenres" value="${addedGenres},${product.genreId}" />
            </c:if>
        </c:forEach>
    </div>

    <hr class="text-muted my-4">

    <!-- 商品一覧 -->
    <div class="d-flex flex-wrap gap-3 mb-4">
        <c:forEach var="product" items="${products}" varStatus="status">
            <div class="product-card active card bg-white border rounded-3 p-2 shadow-sm align-items-center" data-genre-id="${product.genreId}">
                <div class="card-body d-flex align-items-center gap-3 p-1">
                    <button class="btn btn-outline-dark rounded-3 fw-bold btn-sm" onclick="addToCart('${product.productId}', '${product.productName}', ${product.price})">
                        <c:out value="${product.productName}" />
                    </button>
                    <span class="fs-6 fw-bold text-dark">
                        ￥<span class="product-price" data-raw-price="${product.price}"><fmt:formatNumber value="${product.price * 1.08}" pattern="#" /></span>
                    </span>
                </div>
            </div>
        </c:forEach>
    </div>

    <hr class="text-muted my-4">

    <!-- 注文リスト -->
    <div class="card bg-white border rounded-3 shadow-sm mb-4">
        <div class="card-header bg-white border-bottom fw-bold py-2 text-secondary">
            注文リスト
        </div>
        <div class="card-body p-3" id="cartList">
            <p id="emptyMessage" class="text-muted text-center m-0 small">商品が選択されていません</p>
        </div>
    </div>

    <!-- 合計金額 -->
    <div class="d-flex align-items-center justify-content-between p-3 bg-white border rounded-3 shadow-sm mb-4">
        <span class="fs-6 fw-bold text-secondary">合計:</span>
        <span class="fs-3 fw-bold text-dark"><span id="includingTaxPrice">0</span> 円</span>
        <span id="excludingTaxPrice" style="display: none;">0</span>
    </div>

    <!-- 注文確定ボタン -->
    <button class="btn btn-dark btn-lg rounded-3 w-100 py-3 fw-bold shadow-sm" onclick="submitOrder()">
        注文を確定する
    </button>

    <form id="hiddenOrderForm" action="/cafe/order/OrderCheck.action" method="POST">
        <input type="hidden" name="cartData" id="cartDataInput">
    </form>

</main>
</div>
</div>

<script src="../static/js/ordering.js"></script>
<%@ include file="../footer.jsp" %>