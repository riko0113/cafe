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

.page-header a {
    color: #000;
    text-decoration: none;
}

.page-header a:hover,
.register-button button:hover {
    text-decoration: underline;
}

.register-area {
    width: 90%;
    margin-top: 20px;
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

.touroku input {
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
    <h1>仕入れ先追加</h1>
    <a href="${pageContext.request.contextPath}/purchase-register">仕入れ登録</a>
</div>

<hr>

<div class="register-area">
    <form action="${pageContext.request.contextPath}/supplier-register" method="post">
        <table class="touroku">
            <tr>
                <th>仕入れ先名</th>
                <th>住所</th>
                <th>電話番号</th>
                <th>メールアドレス</th>
            </tr>
            <tr>
                <td><input type="text" name="supplierName" required></td>
                <td><input type="text" name="supplierAddress"></td>
                <td><input type="text" name="supplierPhone"></td>
                <td><input type="email" name="supplierEmail"></td>
            </tr>
        </table>

        <div class="register-button">
            <button type="submit">登録</button>
        </div>
    </form>
</div>
