<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/header.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/inventories/inventories.css">

<div class="container-fluid">
    <div class="row">
        <%@ include file="../../menu.jsp" %>

        <main class="col-md-9 col-lg-10 p-4 bg-light inventory-page">
            <div class="page-header">
                <h1 class="page-title">
                    <i class="bi bi-building-add"></i>仕入れ先追加
                </h1>
                <div class="page-actions">
                    <a class="page-link-button" href="${pageContext.request.contextPath}/purchase-register">
                        <i class="bi bi-arrow-left"></i>仕入れ登録
                    </a>
                </div>
            </div>

            <section class="content-card wide-card">
                <div class="card-heading">
                    <h2><i class="bi bi-building me-2"></i>仕入れ先情報を入力</h2>
                </div>

                <div class="card-body-area">
                    <form action="${pageContext.request.contextPath}/supplier-register" method="post">
                        <div class="table-scroll">
                            <table class="touroku form-table">
                                <thead>
                                    <tr>
                                        <th>仕入れ先名</th>
                                        <th>住所</th>
                                        <th>電話番号</th>
                                        <th>メールアドレス</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td><input type="text" name="supplierName" placeholder="例：〇〇商店" required></td>
                                        <td><input type="text" name="supplierAddress" placeholder="例：東京都〇〇区"></td>
                                        <td><input type="text" name="supplierPhone" placeholder="例：03-1234-5678"></td>
                                        <td><input type="email" name="supplierEmail" placeholder="例：sample@example.com"></td>
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
