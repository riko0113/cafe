<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./header.jsp" %>

<style>
/* 最小限のカスタムスタイル */
body { background-color: #f8f9fa; }

/* メニューカードのホバーエフェクト */
.menu-card {
    transition: transform 0.2s ease, shadow 0.2s ease;
    text-decoration: none;
}
.menu-card:hover {
    transform: translateY(-3px);
    box-shadow: 0 .5rem 1rem rgba(0, 0, 0, .1) !important;
}
</style>

<div class="container-fluid min-vh-100">
    <div class="row">
        <%@ include file="./menu.jsp" %>

        <main class="col-md-9 col-lg-10 p-4 bg-light text-dark">
            
            <!-- ページヘッダー -->
            <div class="d-flex align-items-center justify-content-between mb-4 pb-2 border-bottom">
                <h2 class="fs-4 fw-bold text-dark mb-0">ダッシュボード</h2>
                <span class="badge bg-white text-secondary border px-3 py-2 rounded-pill">カフェ管理システム</span>
            </div>

            <!-- メニューカード一覧（2列〜3列のレスポンシブグリッド） -->
            <div class="row g-3">
                
                <!-- 1. 注文 -->
                <div class="col-12 col-md-6 col-xl-4">
                    <a href="${pageContext.request.contextPath}/order/OrderBasic.action" class="card h-100 bg-white border rounded-3 shadow-sm p-4 menu-card text-dark d-block">
                        <div class="d-flex align-items-center">
                            <span class="fs-1 me-3">📝</span>
                            <div>
                                <h3 class="fs-5 fw-bold mb-1">注文</h3>
                                <p class="text-secondary small mb-0">新規注文の受付および入力</p>
                            </div>
                        </div>
                    </a>
                </div>

                <!-- 2. 在庫管理 -->
                <div class="col-12 col-md-6 col-xl-4">
                    <a href="${pageContext.request.contextPath}/inventory" class="card h-100 bg-white border rounded-3 shadow-sm p-4 menu-card text-dark d-block">
                        <div class="d-flex align-items-center">
                            <span class="fs-1 me-3">📦</span>
                            <div>
                                <h3 class="fs-5 fw-bold mb-1">在庫管理</h3>
                                <p class="text-secondary small mb-0">原材料・商品の在庫状況の確認と管理</p>
                            </div>
                        </div>
                    </a>
                </div>

                <!-- 3. 商品管理 -->
                <div class="col-12 col-md-6 col-xl-4">
                    <a href="${pageContext.request.contextPath}/product/main.jsp" class="card h-100 bg-white border rounded-3 shadow-sm p-4 menu-card text-dark d-block">
                        <div class="d-flex align-items-center">
                            <span class="fs-1 me-3">🥪</span>
                            <div>
                                <h3 class="fs-5 fw-bold mb-1">商品管理</h3>
                                <p class="text-secondary small mb-0">提供メニューの登録・編集・価格変更</p>
                            </div>
                        </div>
                    </a>
                </div>

                <!-- 4. 売上管理 -->
                <div class="col-12 col-md-6 col-xl-4">
                    <a href="${pageContext.request.contextPath}/sales/sales_menu.jsp" class="card h-100 bg-white border rounded-3 shadow-sm p-4 menu-card text-dark d-block">
                        <div class="d-flex align-items-center">
                            <span class="fs-1 me-3">💰</span>
                            <div>
                                <h3 class="fs-5 fw-bold mb-1">売上管理</h3>
                                <p class="text-secondary small mb-0">売上データの集計・レポート確認</p>
                            </div>
                        </div>
                    </a>
                </div>

                <!-- 5. アカウント管理 -->
                <div class="col-12 col-md-6 col-xl-4">
                    <a href="${pageContext.request.contextPath}/account/manage/edit.jsp" class="card h-100 bg-white border rounded-3 shadow-sm p-4 menu-card text-dark d-block">
                        <div class="d-flex align-items-center">
                            <span class="fs-1 me-3">💬</span>
                            <div>
                                <h3 class="fs-5 fw-bold mb-1">アカウント管理</h3>
                                <p class="text-secondary small mb-0">ユーザー情報の編集や各種設定</p>
                            </div>
                        </div>
                    </a>
                </div>

            </div>

        </main>
    </div>
</div>

<%@ include file="./footer.jsp" %>