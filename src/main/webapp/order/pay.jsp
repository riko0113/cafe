<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../header.jsp" %>

<h2>お会計内容</h2>

<div id="paymentContainer" data-cart='${sessionScope.cartJson}'>
    <div id="paymentList"></div>
</div>

<hr>

<h2>支払い方法を選択</h2>
<div>
    <button type="button" class="pay-method-btn" onclick="selectPaymentMethod(this, '現金')">現金</button>
    <button type="button" class="pay-method-btn" onclick="selectPaymentMethod(this, 'クレジットカード')">クレジットカード</button>
    <button type="button" class="pay-method-btn" onclick="selectPaymentMethod(this, '電子マネー')">電子マネー</button>
    <button type="button" class="pay-method-btn" onclick="selectPaymentMethod(this, 'QRコード決済')">QRコード決済</button>
</div>

<div id="cashInputArea" style="display: none; margin-top: 15px;">
    <label for="cashAmount">お預かり金額: </label>
    <input type="number" id="cashAmount" placeholder="金額を入力してください"> 円
</div>

<hr>

<button type="button" id="confirmPaymentBtn" onclick="executePayment()" style="font-size: 18px; padding: 10px;">
    支払いを確定する
</button>

<form id="finalPaymentForm" action="/cafe/order/OrderConfirm.action" method="POST">
    <input type="hidden" name="paymentMethod" id="paymentMethodInput">   
    <input type="hidden" name="totalExcludingTax" id="exTaxInput">       
    <input type="hidden" name="totalIncludingTax" id="inTaxInput">       
    <input type="hidden" name="cashAmount" id="cashAmountInput">
    <input type="hidden" name="isTakeOut" id="isTakeOutInput">         
</form>

<a href="/cafe/order/ordering.jsp">戻る</a>
<script src="../static/js/pay.js"></script>
<%@ include file="../footer.jsp" %>