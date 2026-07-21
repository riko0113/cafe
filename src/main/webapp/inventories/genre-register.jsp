<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/header.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/inventories/inventories.css">

<div class="container-fluid">
    <div class="row">
        <%@ include file="../../menu.jsp" %>

        <main class="col-md-9 col-lg-10 p-4 bg-light inventory-page">
            <div class="page-header">
                <h1 class="page-title">
                    <i class="bi bi-tags"></i>ジャンル編集
                </h1>
                <div class="page-actions">
                    <a class="page-link-button" href="${pageContext.request.contextPath}/inventory">
                        <i class="bi bi-arrow-left"></i>在庫一覧
                    </a>
                    <a class="page-link-button" href="${pageContext.request.contextPath}/inventory-register">
                        <i class="bi bi-box-seam"></i>新規品登録
                    </a>
                </div>
            </div>

            <section class="content-card narrow-card">
                <div class="card-heading">
                    <h2><i class="bi bi-plus-circle me-2"></i>ジャンル追加</h2>
                </div>
                <div class="card-body-area">
                    <form action="${pageContext.request.contextPath}/genre-register" method="post">
                        <table class="touroku form-table">
                            <thead>
                                <tr>
                                    <th>ジャンル名</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>
                                        <input type="text" name="genreName" placeholder="例：ドリンク" required>
                                    </td>
                                </tr>
                            </tbody>
                        </table>

                        <div class="form-actions">
                            <button class="action-button register" type="submit">
                                <i class="bi bi-plus-circle"></i>追加
                            </button>
                        </div>
                    </form>
                </div>
            </section>

            <section class="content-card narrow-card">
                <div class="card-heading">
                    <h2><i class="bi bi-list-ul me-2"></i>登録済みジャンル</h2>
                </div>
                <div class="table-scroll">
                    <table class="genre-table">
                        <thead>
                            <tr>
                                <th>ジャンルID</th>
                                <th>ジャンル名</th>
                                <th>操作</th>
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
                                        <button class="view-area action-button edit" type="button" onclick="editGenre(this)">
                                            <i class="bi bi-pencil"></i>編集
                                        </button>

                                        <div class="edit-area">
                                            <form id="genreUpdateForm${genre.itemGenreId}"
                                                  class="inline-form"
                                                  action="${pageContext.request.contextPath}/genre-update"
                                                  method="post">
                                                <input type="hidden" name="itemGenreId" value="${genre.itemGenreId}">
                                                <button class="action-button save" type="submit">
                                                    <i class="bi bi-check-lg"></i>保存
                                                </button>
                                            </form>

                                            <form class="inline-form"
                                                  action="${pageContext.request.contextPath}/genre-delete"
                                                  method="post"
                                                  onsubmit="return confirm('このジャンルを削除しますか？');">
                                                <input type="hidden" name="itemGenreId" value="${genre.itemGenreId}">
                                                <button class="action-button delete" type="submit">
                                                    <i class="bi bi-trash"></i>削除
                                                </button>
                                            </form>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </section>
        </main>
    </div>
</div>

<script>
function editGenre(button) {
    const row = button.closest("tr");

    row.querySelectorAll(".view-area").forEach(function(element) {
        element.style.display = "none";
    });

    row.querySelector(".edit-input").style.display = "block";
    row.querySelector(".edit-area").style.display = "flex";
}
</script>
