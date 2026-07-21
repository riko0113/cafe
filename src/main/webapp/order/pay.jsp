<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../header.jsp" %>

<style>
/* 最小限のカスタムスタイル */
body { background-color: #f8f9fa; }

/* 支払い方法ボタン選択時のスタイル（黒反転） */
.pay-method-btn.active {
    background-color: #212529 !important;
    color: #ffffff !important;
    border-color: #212529 !important;
}
</style>

<div class="container-fluid bg-light min-vh-100">
<div class="row">
<%@ include file="../../menu.jsp" %>

<main class="col-md-9 col-lg-10 p-4 bg-light text-dark">

    <!-- 戻るリンク -->
    <div class="mb-4">
        <a href="/cafe/order/OrderBasic.action" class="btn btn-outline-secondary btn-sm rounded-3 px-3 text-decoration-none">
            ← 注文入力へ戻る
        </a>
    </div>

    <!-- お会計内容エリア -->
    <div class="card bg-white border rounded-3 shadow-sm mb-4">
        <div class="card-header bg-white border-bottom fw-bold py-3 fs-5 text-dark">
            お会計内容
        </div>
        <div class="card-body p-4" id="paymentContainer" data-cart='${sessionScope.cartJson}'>
            <div id="paymentList"></div>
        </div>
    </div>

    <!-- 支払い方法選択エリア -->
    <div class="card bg-white border rounded-3 shadow-sm mb-4 p-4">
        <h2 class="fs-5 fw-bold text-dark mb-3">支払い方法を選択</h2>
        
        <div class="d-flex flex-wrap gap-2">
            <button type="button" class="pay-method-btn btn btn-outline-secondary rounded-3 px-4 py-2 fw-bold" onclick="selectPaymentMethod(this, '現金')">
                現金
            </button>
            <button type="button" class="pay-method-btn btn btn-outline-secondary rounded-3 px-4 py-2 fw-bold" onclick="selectPaymentMethod(this, 'クレジットカード')">
                クレジットカード
            </button>
            <button type="button" class="pay-method-btn btn btn-outline-secondary rounded-3 px-4 py-2 fw-bold" onclick="selectPaymentMethod(this, '電子マネー')">
                電子マネー
            </button>
            <button type="button" class="pay-method-btn btn btn-outline-secondary rounded-3 px-4 py-2 fw-bold" onclick="selectPaymentMethod(this, 'QRコード決済')">
                QRコード決済
            </button>
        </div>

        <!-- 現金入力エリア -->
        <div id="cashInputArea" class="mt-4 p-3 bg-light rounded-3 border" style="display: none;">
            <label for="cashAmount" class="form-label fw-bold text-secondary mb-2">お預かり金額</label>
            <div class="input-group" style="max-width: 300px;">
                <input type="number" id="cashAmount" class="form-control form-control-lg rounded-start-3" placeholder="0">
                <span class="input-group-text bg-white border-start-0 rounded-end-3">円</span>
            </div>
        </div>
    </div>

    <!-- 支払い確定ボタン -->
    <button type="button" id="confirmPaymentBtn" class="btn btn-dark btn-lg rounded-3 w-100 py-3 fw-bold shadow-sm" onclick="executePayment()">
        支払いを確定する
    </button>

    <form id="finalPaymentForm" action="${pageContext.request.contextPath}/order/OrderConfirm.action" method="POST">
        <input type="hidden" name="paymentMethod" id="paymentMethodInput">   
        <input type="hidden" name="totalExcludingTax" id="exTaxInput">       
        <input type="hidden" name="totalIncludingTax" id="inTaxInput">       
        <input type="hidden" name="cashAmount" id="cashAmountInput">
        <input type="hidden" name="isTakeOut" id="isTakeOutInput">         
    </form>

</main>
</div>
</div>

<script src="../static/js/pay.js"></script>
<%@ include file="../footer.jsp" %>