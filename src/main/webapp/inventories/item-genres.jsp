<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/header.jsp" %>

<style>
.zaiko {
    width: 100%;
    border-collapse: collapse;
    table-layout: fixed;
}

.zaiko th,
.zaiko td {
    border: 1px solid black;
    padding: 8px;
    text-align: center;
    font-size: 14px;
}

.zaiko th {
    padding: 0;
    height: 38px;
}

.zaiko th input {
    width: 100%;
    height: 38px;
    box-sizing: border-box;
    border: none;
    outline: none;
    background: transparent;
    padding: 8px;
    text-align: center;
    font-weight: bold;
}

.zaiko td input,
.zaiko td select {
    width: 100%;
    box-sizing: border-box;
    border: none;
    outline: none;
    background: transparent;
    padding: 5px;
    text-align: center;
}

.zaiko th:nth-child(1) { width: 8%; }
.zaiko th:nth-child(2) { width: 18%; }
.zaiko th:nth-child(3) { width: 14%; }
.zaiko th:nth-child(4) { width: 10%; }
.zaiko th:nth-child(5) { width: 13%; }
.zaiko th:nth-child(6) { width: 15%; }
.zaiko th:nth-child(7) { width: 14%; }
.zaiko th:nth-child(8) { width: 8%; }

.ue {
    width: 100%;
    border-collapse: collapse;
    table-layout: fixed;
}

.ue td:first-child {
    width: 25%;
}

.ue td:last-child {
    width: 75%;
}

.ue h1 {
    margin: 0;
    font-size: 32px;
}

.a a {
    color: #000;
    text-decoration: none;
    margin-right: 20px;
}

.a a:hover,
.operation button:hover {
    text-decoration: underline;
}

.operation button {
    border: none;
    background: transparent;
    cursor: pointer;
    font-size: 14px;
}

.edit-area,
.edit-input {
    display: none;
}

.inline-form {
    display: inline;
}

#displayCount {
    font-weight: bold;
}
</style>

<table class="ue">
    <tr>
        <td><h1>在庫管理</h1></td>
        <td class="a">
            <a href="${pageContext.request.contextPath}/inventory-register">＋ 新規在庫追加</a>
            <a href="${pageContext.request.contextPath}/genre-edit">＋ ジャンル編集</a>
            <a href="${pageContext.request.contextPath}/purchase-register">＋ 仕入れ</a>
        </td>
    </tr>
</table>

<hr>

<p>${inventoryList.size()}件中 <span id="displayCount">${inventoryList.size()}</span>件表示</p>

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
                <td>${item.quantity}</td>
                <td>
                    <span class="view-area">${item.standardStock}</span>
                    <input class="edit-input" type="number" name="standardStock"
                           value="${item.standardStock}" min="0"
                           form="updateForm${item.itemId}" required>
                </td>
                <td>
                    <c:choose>
                        <c:when test="${item.quantity < item.standardStock}">
                            要仕入れ -${item.standardStock - item.quantity}
                        </c:when>
                        <c:otherwise>
                            正常
                        </c:otherwise>
                    </c:choose>
                </td>
                <td>${item.supplierName}</td>
                <td class="operation">
                    <button class="view-area" type="button" onclick="editItem(this)">編集</button>

                    <div class="edit-area">
                        <form id="updateForm${item.itemId}"
                              class="inline-form"
                              action="${pageContext.request.contextPath}/inventory-update"
                              method="post">
                            <input type="hidden" name="itemId" value="${item.itemId}">
                            <button type="submit">保存</button>
                        </form>

                        <form class="inline-form"
                              action="${pageContext.request.contextPath}/inventory-delete"
                              method="post"
                              onsubmit="return confirm('この在庫を削除しますか？');">
                            <input type="hidden" name="itemId" value="${item.itemId}">
                            <button type="submit">削除</button>
                        </form>
                    </div>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>

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

    row.querySelector(".edit-area").style.display = "block";
}
</script>
