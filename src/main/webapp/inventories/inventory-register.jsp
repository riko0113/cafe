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
.register-button button:hover,
.genre-link a:hover {
    text-decoration: underline;
}

.register-area {
    width: 70%;
    margin-top: 20px;
}

.genre-link {
    text-align: right;
    margin-bottom: 8px;
}

.genre-link a {
    color: #000;
    text-decoration: none;
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
    <h1>新規品登録</h1>
    <a href="${pageContext.request.contextPath}/inventory">在庫一覧</a>
</div>

<hr>

<div class="register-area">
    <div class="genre-link">
        <a href="${pageContext.request.contextPath}/genre-edit">＋ ジャンル編集</a>
    </div>

    <form action="${pageContext.request.contextPath}/inventory-register" method="post">
        <table class="touroku">
            <tr>
                <th>在庫名</th>
                <th>ジャンル</th>
                <th>標準在庫数</th>
            </tr>
            <tr>
                <td>
                    <input type="text" name="itemName" placeholder="在庫名" required>
                </td>
                <td>
                    <select name="itemGenreId" required>
                        <option value="">選択してください</option>
                        <c:forEach var="genre" items="${genreList}">
                            <option value="${genre.itemGenreId}">${genre.genreName}</option>
                        </c:forEach>
                    </select>
                </td>
                <td>
                    <input type="number" name="standardStock" min="0"
                           placeholder="標準在庫数" required>
                </td>
            </tr>
        </table>

        <div class="register-button">
            <button type="submit">登録</button>
        </div>
    </form>
</div>
