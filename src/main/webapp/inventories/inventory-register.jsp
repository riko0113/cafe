<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/header.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/inventories/inventories.css">

<div class="container-fluid">
    <div class="row">
        <%@ include file="../../menu.jsp" %>

        <main class="col-md-9 col-lg-10 p-4 bg-light inventory-page">
            <div class="page-header">
                <h1 class="page-title">
                    <i class="bi bi-box-seam"></i>新規品登録
                </h1>
                <div class="page-actions">
                    <a class="page-link-button" href="${pageContext.request.contextPath}/inventory">
                        <i class="bi bi-arrow-left"></i>在庫一覧
                    </a>
                </div>
            </div>

            <section class="content-card medium-card">
                <div class="card-heading">
                    <h2><i class="bi bi-pencil-square me-2"></i>在庫情報を入力</h2>
                    <a class="page-link-button" href="${pageContext.request.contextPath}/genre-edit">
                        <i class="bi bi-tags"></i>ジャンル編集
                    </a>
                </div>

                <div class="card-body-area">
                    <form action="${pageContext.request.contextPath}/inventory-register" method="post">
                        <div class="table-scroll">
                            <table class="touroku form-table">
                                <thead>
                                    <tr>
                                        <th>在庫名</th>
                                        <th>ジャンル</th>
                                        <th>標準在庫数</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>
                                            <input type="text" name="itemName" placeholder="例：コーヒー豆" required>
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
                                                   placeholder="例：20" required>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

                        <div class="form-actions">
                            <button class="action-button register" type="submit">
                                <i class="bi bi-plus-circle"></i>登録
                            </button>
                        </div>
                    </form>
                </div>
            </section>
        </main>
    </div>
</div>
