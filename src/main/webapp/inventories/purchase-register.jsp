<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/header.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/inventories/inventories.css">

<div class="container-fluid">
    <div class="row">
        <%@ include file="../../menu.jsp" %>

        <main class="col-md-9 col-lg-10 p-4 bg-light inventory-page">
            <div class="page-header">
                <h1 class="page-title">
                    <i class="bi bi-truck"></i>仕入れ登録
                </h1>
                <div class="page-actions">
                    <a class="page-link-button" href="${pageContext.request.contextPath}/inventory">
                        <i class="bi bi-arrow-left"></i>在庫一覧
                    </a>
                </div>
            </div>

            <section class="content-card wide-card">
                <div class="card-heading">
                    <h2><i class="bi bi-clipboard-plus me-2"></i>仕入れ内容を入力</h2>
                    <a class="page-link-button" href="${pageContext.request.contextPath}/supplier-register">
                        <i class="bi bi-building-add"></i>仕入れ先追加
                    </a>
                </div>

                <div class="card-body-area">
                    <form action="${pageContext.request.contextPath}/purchase-register" method="post">
                        <div class="table-scroll">
                            <table class="touroku form-table">
                                <thead>
                                    <tr>
                                        <th>在庫名</th>
                                        <th>仕入れ先</th>
                                        <th>仕入れ日</th>
                                        <th>仕入れ数</th>
                                        <th>仕入れ金額</th>
                                    </tr>
                                </thead>
                                <tbody>
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
                                            <input type="number" name="purchaseQuantity" min="1" placeholder="例：10" required>
                                        </td>
                                        <td>
                                            <input type="number" name="purchasePrice" min="0" placeholder="例：5000" required>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

                        <p class="helper-text mt-3">
                            仕入れ金額には、入力した数量全体の合計金額を入力してください。
                        </p>

                        <div class="form-actions">
                            <button class="action-button register" type="submit">
                                <i class="bi bi-check-circle"></i>登録
                            </button>
                        </div>
                    </form>
                </div>
            </section>
        </main>
    </div>
</div>
