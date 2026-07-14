<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../header.jsp" %>

<h2>注文履歴</h2>

<!-- 日付選択エリア -->
<form id="dateForm" action="/cafe/order/OrderHistory.action" method="GET">
    <label for="orderDate">表示する日付を指定：</label>
    <input type="date" id="orderDate" name="orderDate" value="${selectedDate}" onchange="document.getElementById('dateForm').submit();">
</form>

<hr>

<!-- 履歴表示エリア -->
<c:choose>
    <%-- 履歴が1件も存在しない場合 --%>
    <c:when test="${empty historyList}">
        <p>指定された日付の注文履歴はありません。</p>
    </c:when>
    
    <%-- 履歴が存在する場合（親ループ：注文ごと） --%>
    <c:otherwise>
        <c:forEach var="order" items="${historyList}">
            
            <!-- 注文の基本情報 -->
            <h3>注文日時: <c:out value="${order.datetime}" /></h3>
            <p>
                合計金額: <c:out value="${order.payAmount}" /> 円 / 
                支払方法ID: <c:out value="${order.payWayId}" /> / 
            </p>
            
            <!-- 内訳（子ループ：その注文に含まれるメニュー名と個数） -->
            <table border="1">
                <thead>
                    <tr>
                        <th>メニュー名</th>
                        <th>個数</th>
                        <th>小計(税抜)</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="detail" items="${order.details}">
                        <tr>
                            <td><c:out value="${detail.productName}" /></td>
                            <td><c:out value="${detail.num}" /> 個</td>
                            <td><c:out value="${detail.subtotal}" /> 円</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            
            <hr>
        </c:forEach>
    </c:otherwise>
</c:choose>

<!-- 注文画面へ戻るボタン -->
<p>
    <button type="button" onclick="location.href='/cafe/order/Ordering.action'">
        注文画面に戻る
    </button>
</p>

<%@ include file="../footer.jsp" %>