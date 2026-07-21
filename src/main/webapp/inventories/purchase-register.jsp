<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/header.jsp" %>

<style>
.page-header {
    width: 100%;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.page-header h1 {
    margin: 0;
    font-size: 32px;
}

.page-header a,
.supplier-link a {
    color: #000;
    text-decoration: none;
}

.page-header a:hover,
.supplier-link a:hover,
.register-button button:hover {
    text-decoration: underline;
}

.register-area {
    width: 90%;
    margin-top: 20px;
}

.supplier-link {
    text-align: right;
    margin-bottom: 8px;
}

.touroku {
    width: 100%;
    border-collapse: collapse;
    table-layout: fixed;
}

.touroku th,
.touroku td {
    border: 1px solid black;
    padding: 0;
    text-align: center;
}

.touroku th {
    height: 38px;
}

.touroku input,
.touroku select {
    width: 100%;
    height: 40px;
    box-sizing: border-box;
    border: none;
    outline: none;
    background: transparent;
    padding: 8px;
    text-align: center;
}

.register-button {
    text-align: right;
    margin-top: 10px;
}

.register-button button {
    border: none;
    background: transparent;
    cursor: pointer;
    font-size: 18px;
}
</style>

<div class="page-header">
    <h1>仕入れ登録</h1>
    <a href="${pageContext.request.contextPath}/inventory">在庫一覧</a>
</div>

<hr>

<div class="register-area">
    <div class="supplier-link">
        <a href="${pageContext.request.contextPath}/supplier-register">＋ 仕入れ先追加</a>
    </div>

    <form action="${pageContext.request.contextPath}/purchase-register" method="post">
        <table class="touroku">
            <tr>
                <th>在庫名</th>
                <th>仕入れ先</th>
                <th>仕入れ日</th>
                <th>仕入れ数</th>
                <th>仕入れ単価</th>
            </tr>
            <tr>
                <td>
                    <select name="itemId" required>
                        <option value="">選択してください</option>
                        <c:forEach var="item" items="${inventoryList}">
                            <option value="${item.itemId}">${item.itemName}</option>
                        </c:forEach>
                    </select>
                </td>
                <td>
                    <select name="supplierId" required>
                        <option value="">選択してください</option>
                        <c:forEach var="supplier" items="${supplierList}">
                            <option value="${supplier.supplierId}">${supplier.supplierName}</option>
                        </c:forEach>
                    </select>
                </td>
                <td>
                    <input type="date" name="purchaseDate" required>
                </td>
                <td>
                    <input type="number" name="purchaseQuantity" min="1" required>
                </td>
                <td>
                    <input type="number" name="purchasePrice" min="0" required>
                </td>
            </tr>
        </table>

        <div class="register-button">
            <button type="submit">登録</button>
        </div>
    </form>
</div>
