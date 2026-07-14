<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../header.jsp" %>

<h2>注文完了</h2>

<hr>

<c:if test="${order.payWayId == 1 && not empty change}">
        <li>
            <strong>お預かり金額：</strong> 
            <c:out value="${charge}" /> 円
        </li>
        <li>
            <strong>お釣り：</strong> 
            <strong><c:out value="${change}" /></strong> 円
        </li>
    </c:if>

<h3>詳細</h3>
<ul>
    <li>
        <strong>支払方法：</strong>
        <c:choose>
            <c:when test="${order.payWayId == 1}">現金</c:when>
            <c:when test="${order.payWayId == 2}">クレジットカード</c:when>
            <c:when test="${order.payWayId == 3}">電子マネー</c:when>
            <c:when test="${order.payWayId == 4}">QRコード決済</c:when>
        </c:choose>
    </li>
    <li>
        <strong>利用区分：</strong>
        ${order.isTakeOut ? 'お持ち帰り（8%）' : 'イートイン（10%）'}
    </li>
    <li>
        <strong>お支払い金額（税込）：</strong> 
        <strong><c:out value="${order.payAmount}" /></strong> 円
    </li>
</ul>

<h3>📦 注文メニュー明細</h3>
<table border="1">
    <thead>
        <tr>
            <th>商品ID</th>
            <th>個数</th>
            <th>小計(税抜)</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="detail" items="${details}">
            <tr>
                <td>商品ID: <c:out value="${detail.productId}" /></td>
                <td><c:out value="${detail.num}" /> 個</td>
                <td><c:out value="${detail.subtotal}" /> 円</td>
            </tr>
        </c:forEach>
    </tbody>
</table>

<hr>

<p>
    <button type="button" onclick="location.href='/cafe/order/OrderBasic.action'">
    	注文画面へ
    </button>
</p>

<%@ include file="../footer.jsp" %>