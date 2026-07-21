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
    margin-left: 20px;
}

.page-header a:hover,
.operation button:hover,
.register-button button:hover {
    text-decoration: underline;
}

.register-area {
    width: 50%;
    margin-top: 20px;
}

.touroku {
    width: 50%;
    border-collapse: collapse;
    table-layout: fixed;
}
.genre-table {
    width: 100%;
    border-collapse: collapse;
    table-layout: fixed;
}

.touroku th,
.touroku td,
.genre-table th,
.genre-table td {
    border: 1px solid black;
    padding: 8px;
    text-align: center;
}

.touroku input,
.genre-table input {
    width: 100%;
    box-sizing: border-box;
    border: none;
    outline: none;
    background: transparent;
    padding: 7px;
    text-align: center;
}

.register-button {
    text-align: right;
    margin-top: 10px;
}

.register-button button,
.operation button {
    border: none;
    background: transparent;
    cursor: pointer;
    font-size: 16px;
}

.genre-list {
    width: 60%;
    margin-top: 35px;
}

.genre-table th:first-child {
    width: 25%;
}

.genre-table th:last-child {
    width: 25%;
}

.edit-area,
.edit-input {
    display: none;
}

.inline-form {
    display: inline;
}
</style>

<div class="page-header">
    <h1>ジャンル編集</h1>
    <div>
        <a href="${pageContext.request.contextPath}/inventory">在庫一覧</a>
        <a href="${pageContext.request.contextPath}/inventory-register">新規品登録</a>
    </div>
</div>

<hr>

<div class="register-area">
    <form action="${pageContext.request.contextPath}/genre-register" method="post">
        <table class="touroku">
            <tr>
                <th>ジャンル名</th>
            </tr>
            <tr>
                <td>
                    <input type="text" name="genreName" placeholder="ジャンル名" required>
                </td>
            </tr>
        </table>

        <div class="register-button">
            <button type="submit">追加</button>
        </div>
    </form>
</div>

<div class="genre-list">
    <table class="genre-table">
        <thead>
            <tr>
                <th>ジャンルID</th>
                <th>ジャンル名</th>
                <th>編集</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="genre" items="${genreList}">
                <tr>
                    <td>${genre.itemGenreId}</td>
                    <td>
                        <span class="view-area">${genre.genreName}</span>
                        <input class="edit-input" type="text" name="genreName"
                               value="${genre.genreName}"
                               form="genreUpdateForm${genre.itemGenreId}" required>
                    </td>
                    <td class="operation">
                        <button class="view-area" type="button" onclick="editGenre(this)">編集</button>

                        <div class="edit-area">
                            <form id="genreUpdateForm${genre.itemGenreId}"
                                  class="inline-form"
                                  action="${pageContext.request.contextPath}/genre-update"
                                  method="post">
                                <input type="hidden" name="itemGenreId" value="${genre.itemGenreId}">
                                <button type="submit">保存</button>
                            </form>

                            <form class="inline-form"
                                  action="${pageContext.request.contextPath}/genre-delete"
                                  method="post"
                                  onsubmit="return confirm('このジャンルを削除しますか？');">
                                <input type="hidden" name="itemGenreId" value="${genre.itemGenreId}">
                                <button type="submit">削除</button>
                            </form>
                        </div>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

<script>
function editGenre(button) {
    const row = button.closest("tr");

    row.querySelectorAll(".view-area").forEach(function(element) {
        element.style.display = "none";
    });

    row.querySelector(".edit-input").style.display = "block";
    row.querySelector(".edit-area").style.display = "block";
}
</script>
