<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../header.jsp" %>

<style>
/* 最小限のカスタムスタイル */
body { background-color: #f8f9fa; }
</style>

<div class="container-fluid bg-light min-vh-100">
<div class="row">
<%@ include file="../../menu.jsp" %>

<main class="col-md-9 col-lg-10 p-4 bg-light text-dark">

    <!-- 注文完了メッセージ -->
    <div class="card bg-white border rounded-3 shadow-sm mb-4 p-4 text-center">
        <h2 class="fs-4 fw-bold text-dark m-0">✓ 注文が完了しました</h2>
        <p class="text-muted small mb-0 mt-1">ご利用ありがとうございました。</p>
    </div>

    <!-- お支払い・お釣り情報（現金の場合のみ表示） -->
    <c:if test="${order.payWayId == 1 && not empty change}">
        <div class="card bg-white border rounded-3 shadow-sm mb-4 p-4">
            <div class="d-flex justify-content-between align-items-center mb-2">
                <span class="fw-bold text-secondary">お預かり金額</span>
                <span class="fs-5 fw-bold text-dark"><c:out value="${charge}" /> 円</span>
            </div>
            <div class="d-flex justify-content-between align-items-center pt-2 border-top">
                <span class="fw-bold text-secondary">お釣り</span>
                <span class="fs-4 fw-bold text-dark"><c:out value="${change}" /> 円</span>
            </div>
        </div>
    </c:if>

    <!-- 注文詳細情報 -->
    <div class="card bg-white border rounded-3 shadow-sm mb-4">
        <div class="card-header bg-white border-bottom fw-bold py-3 text-secondary">
            注文詳細
        </div>
        <div class="card-body p-4">
            <div class="row g-3">
                <div class="col-md-4">
                    <span class="text-muted small d-block">支払方法</span>
                    <span class="fw-bold text-dark fs-6">
                        <c:choose>
                            <c:when test="${order.payWayId == 1}">現金</c:when>
                            <c:when test="${order.payWayId == 2}">クレジットカード</c:when>
                            <c:when test="${order.payWayId == 3}">電子マネー</c:when>
                            <c:when test="${order.payWayId == 4}">QRコード決済</c:when>
                        </c:choose>
                    </span>
                </div>
                <div class="col-md-4">
                    <span class="text-muted small d-block">利用区分</span>
                    <span class="fw-bold text-dark fs-6">
                        ${order.isTakeOut ? 'お持ち帰り（8%）' : 'イートイン（10%）'}
                    </span>
                </div>
                <div class="col-md-4">
                    <span class="text-muted small d-block">お支払い金額（税込）</span>
                    <span class="fw-bold text-dark fs-4"><c:out value="${order.payAmount}" /> 円</span>
                </div>
            </div>
        </div>
    </div>

    <!-- 注文メニュー明細 -->
    <div class="card bg-white border rounded-3 shadow-sm mb-4">
        <div class="card-header bg-white border-bottom fw-bold py-3 text-secondary">
            📦 注文メニュー明細
        </div>
        <div class="card-body p-0">
            <div class="table-responsive">
                <table class="table table-hover align-middle mb-0">
                    <thead class="table-light border-bottom">
                        <tr class="text-secondary small">
                            <th class="ps-4">商品ID</th>
                            <th class="text-center">個数</th>
                            <th class="text-end pe-4">小計 (税抜)</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="detail" items="${details}">
                            <tr>
                                <td class="ps-4 fw-bold text-dark">
                                    <c:out value="${detail.productId}" />
                                </td>
                                <td class="text-center">
                                    <span class="badge bg-light text-dark border px-3 py-2 rounded-2 fs-6">
                                        <c:out value="${detail.num}" /> 個
                                    </span>
                                </td>
                                <td class="text-end pe-4 fw-bold text-dark">
                                    <c:out value="${detail.subtotal}" /> 円
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- 注文画面へ戻るボタン -->
    <div class="mt-4">
        <button type="button" class="btn btn-dark btn-lg rounded-3 w-100 py-3 fw-bold shadow-sm" onclick="location.href='${pageContext.request.contextPath}/order/OrderBasic.action'">
            次の注文を入力する
        </button>
    </div>

</main>
</div>
</div>

<script>
	sessionStorage.removeItem('cafeCart');
	sessionStorage.removeItem('taxRate');
</script>

<%@ include file="../footer.jsp" %>