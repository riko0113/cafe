<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../head.jsp" %>

<style>
/* 最小限のカスタムスタイル */
body { background-color: #f8f9fa; }

/* 画面中央に配置 */
.logout-container {
    max-width: 450px;
    margin: 40px auto;
}
</style>

<div class="container min-vh-100 d-flex flex-column justify-content-center">
    <div class="logout-container w-100">

        <!-- ログアウト確認カード -->
        <div class="card bg-white border rounded-3 shadow-sm p-4 text-center">
            
            <!-- アイコン/タイトル -->
            <div class="mb-3">
                <span class="fs-1 text-secondary">🚪</span>
                <h2 class="fs-4 fw-bold text-dark mt-2">ログアウト</h2>
            </div>

            <!-- メッセージ -->
            <p class="text-secondary small mb-4">
                ログアウトを行いますか？
            </p>

            <!-- 選択ボタン群 -->
            <div class="d-grid gap-2">
                <!-- はい：実行アクション -->
                <a href="${pageContext.request.contextPath}/account/Logout.action" class="btn btn-dark rounded-3 py-2 fw-bold shadow-sm">
                    はい（ログアウトする）
                </a>
                <!-- いいえ：キャンセル・戻る -->
                <a href="../../index.jsp" class="btn btn-outline-secondary rounded-3 py-2 fw-bold">
                    いいえ（トップページへ戻る）
                </a>
            </div>

        </div>

    </div>
</div>

<%@ include file="../../footer.jsp" %>