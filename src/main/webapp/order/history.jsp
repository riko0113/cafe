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

    <!-- タイトル＆注文画面に戻るボタン -->
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2 class="fs-4 fw-bold text-dark m-0">注文履歴</h2>
        <button type="button" class="btn btn-outline-secondary btn-sm rounded-3 px-3 fw-bold" onclick="location.href='${pageContext.request.contextPath}/order/Ordering.action'">
            ← 注文画面に戻る
        </button>
    </div>

    <!-- 日付選択エリア -->
    <div class="card bg-white border rounded-3 shadow-sm mb-4 p-3">
        <form id="dateForm" action="/cafe/order/OrderHistory.action" method="GET" class="d-flex align-items-center gap-3 m-0">
            <label for="orderDate" class="fw-bold text-secondary mb-0">表示する日付を指定：</label>
            <input type="date" id="orderDate" name="orderDate" value="${selectedDate}" class="form-control form-control-sm rounded-3" style="max-width: 200px;" onchange="document.getElementById('dateForm').submit();">
        </form>
    </div>

    <!-- 履歴表示エリア -->
    <c:choose>
        <%-- 履歴が1件も存在しない場合 --%>
        <c:when test="${empty historyList}">
            <div class="card bg-white border rounded-3 shadow-sm p-4 text-center">
                <p class="text-muted m-0">指定された日付の注文履歴はありません。</p>
            </div>
        </c:when>
        
        <%-- 履歴が存在する場合（親ループ：注文ごと） --%>
        <c:otherwise>
            <div class="d-flex flex-column gap-4">
                <c:forEach var="order" items="${historyList}">
                    <div class="card bg-white border rounded-3 shadow-sm overflow-hidden">
                        
                        <!-- 注文の基本情報（ヘッダー部分） -->
                        <div class="card-header bg-white border-bottom p-3 d-flex flex-wrap justify-content-between align-items-center gap-2">
                            <div>
                                <span class="text-muted small d-block">注文日時</span>
                                <span class="fw-bold text-dark fs-6"><c:out value="${order.datetime}" /></span>
                            </div>
                            <div class="d-flex align-items-center gap-3">
                                <span class="badge bg-light text-dark border px-3 py-2 rounded-2">
                                    <c:out value="${order.payWayName}" />
                                </span>
                                <span class="fs-5 fw-bold text-dark">
                                    <c:out value="${order.payAmount}" /> 円
                                </span>
                            </div>
                        </div>

                        <!-- 内訳（テーブル部分） -->
                        <div class="card-body p-0">
                            <div class="table-responsive">
                                <table class="table table-hover align-middle mb-0">
                                    <thead class="table-light border-bottom">
                                        <tr class="text-secondary small">
                                            <th class="ps-4">メニュー名</th>
                                            <th class="text-center">個数</th>
                                            <th class="text-end pe-4">小計 (税抜)</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="detail" items="${order.details}">
                                            <tr>
                                                <td class="ps-4 fw-bold text-dark">
                                                    <c:out value="${detail.productName}" />
                                                </td>
                                                <td class="text-center">
                                                    <span class="badge bg-light text-dark border px-2 py-1 rounded-2">
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
                </c:forEach>
            </div>
        </c:otherwise>
    </c:choose>

</main>
</div>
</div>

<%@ include file="../footer.jsp" %>