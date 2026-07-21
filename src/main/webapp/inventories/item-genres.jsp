<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/header.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/inventories/inventories.css">

<div class="container-fluid">
    <div class="row">
        <%@ include file="../../menu.jsp" %>

        <main class="col-md-9 col-lg-10 p-4 bg-light inventory-page">
            <div class="page-header">
                <h1 class="page-title">
                    <i class="bi bi-boxes"></i>在庫管理
                </h1>
                <div class="page-actions">
                    <a class="page-link-button primary" href="${pageContext.request.contextPath}/inventory-register">
                        <i class="bi bi-plus-circle"></i>新規在庫追加
                    </a>
                    <a class="page-link-button" href="${pageContext.request.contextPath}/genre-edit">
                        <i class="bi bi-tags"></i>ジャンル編集
                    </a>
                    <a class="page-link-button" href="${pageContext.request.contextPath}/purchase-register">
                        <i class="bi bi-truck"></i>仕入れ
                    </a>
                </div>
            </div>

            <section class="content-card wide-card">
                <div class="card-heading">
                    <h2><i class="bi bi-list-ul me-2"></i>在庫一覧</h2>
                    <p class="count-text">
                        ${inventoryList.size()}件中
                        <span id="displayCount">${inventoryList.size()}</span>件表示
                    </p>
                </div>

                <div class="table-scroll">
                    <table class="zaiko" id="zaikoTable">
                        <thead>
                            <tr>
                                <th><input type="text" class="filter" data-column="0" placeholder="在庫ID"></th>
                                <th><input type="text" class="filter" data-column="1" placeholder="在庫名"></th>
                                <th><input type="text" class="filter" data-column="2" placeholder="ジャンル"></th>
                                <th><input type="text" class="filter" data-column="3" placeholder="在庫数"></th>
                                <th><input type="text" class="filter" data-column="4" placeholder="標準在庫数"></th>
                                <th><input type="text" class="filter" data-column="5" placeholder="状態"></th>
                                <th><input type="text" class="filter" data-column="6" placeholder="仕入れ先"></th>
                                <th>操作</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="item" items="${inventoryList}">
                                <tr>
                                    <td>${item.itemId}</td>
                                    <td>
                                        <span class="view-area">${item.itemName}</span>
                                        <input class="edit-input" type="text" name="itemName"
                                               value="${item.itemName}" form="updateForm${item.itemId}" required>
                                    </td>
                                    <td>
                                        <span class="view-area">${item.genreName}</span>
                                        <select class="edit-input" name="itemGenreId"
                                                form="updateForm${item.itemId}" required>
                                            <option value="${item.itemGenreId}">${item.genreName}</option>
                                            <c:forEach var="genre" items="${genreList}">
                                                <c:if test="${genre.itemGenreId != item.itemGenreId}">
                                                    <option value="${genre.itemGenreId}">${genre.genreName}</option>
                                                </c:if>
                                            </c:forEach>
                                        </select>
                                    </td>
                                    <td>
                                        <span class="view-area">${item.quantity}</span>
                                        <input class="edit-input" type="number" name="quantity"
                                               value="${item.quantity}" min="0"
                                               form="updateForm${item.itemId}" required>
                                    </td>
                                    <td>
                                        <span class="view-area">${item.standardStock}</span>
                                        <input class="edit-input" type="number" name="standardStock"
                                               value="${item.standardStock}" min="0"
                                               form="updateForm${item.itemId}" required>
                                    </td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${item.quantity < item.standardStock}">
                                                <span class="status-badge shortage">
                                                    <i class="bi bi-exclamation-triangle"></i>
                                                    要仕入れ -${item.standardStock - item.quantity}
                                                </span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="status-badge normal">
                                                    <i class="bi bi-check-circle"></i>正常
                                                </span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>${item.supplierName}</td>
                                    <td class="operation">
                                        <button class="view-area action-button edit" type="button" onclick="editItem(this)">
                                            <i class="bi bi-pencil"></i>編集
                                        </button>

                                        <div class="edit-area">
                                            <form id="updateForm${item.itemId}"
                                                  class="inline-form"
                                                  action="${pageContext.request.contextPath}/inventory-update"
                                                  method="post">
                                                <input type="hidden" name="itemId" value="${item.itemId}">
                                                <button class="action-button save" type="submit">
                                                    <i class="bi bi-check-lg"></i>保存
                                                </button>
                                            </form>

                                            <form class="inline-form"
                                                  action="${pageContext.request.contextPath}/inventory-delete"
                                                  method="post"
                                                  onsubmit="return confirm('この在庫を削除しますか？');">
                                                <input type="hidden" name="itemId" value="${item.itemId}">
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
const filters = document.querySelectorAll(".filter");
const rows = document.querySelectorAll("#zaikoTable tbody tr");
const displayCount = document.getElementById("displayCount");

filters.forEach(function(filter) {
    filter.addEventListener("input", filterTable);
});

function filterTable() {
    let count = 0;

    rows.forEach(function(row) {
        let show = true;

        filters.forEach(function(input) {
            const column = Number(input.dataset.column);
            const searchText = input.value.toLowerCase();
            const cellText = row.cells[column].textContent.trim().toLowerCase();

            if (!cellText.includes(searchText)) {
                show = false;
            }
        });

        row.style.display = show ? "" : "none";

        if (show) {
            count++;
        }
    });

    displayCount.textContent = count;
}

function editItem(button) {
    const row = button.closest("tr");

    row.querySelectorAll(".view-area").forEach(function(element) {
        element.style.display = "none";
    });

    row.querySelectorAll(".edit-input").forEach(function(element) {
        element.style.display = "block";
    });

    row.querySelector(".edit-area").style.display = "flex";
}
</script>
