<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../head.jsp" %>

<style>
/* 最小限のカスタムスタイル */
body { background-color: #f8f9fa; }

/* 画面中央に配置 */
.error-container {
    max-width: 450px;
    margin: 40px auto;
}
</style>

<div class="container min-vh-100 d-flex flex-column justify-content-center">
    <div class="error-container w-100">

        <!-- エラーカード -->
        <div class="card bg-white border rounded-3 shadow-sm p-4 text-center">
            
            <!-- アイコン/タイトル -->
            <div class="mb-3">
                <span class="fs-1 text-secondary">⚠️</span>
                <h2 class="fs-4 fw-bold text-dark mt-2">エラー</h2>
            </div>

            <!-- メッセージ -->
            <div class="p-3 bg-light rounded-3 border mb-4">
                <p class="text-secondary small mb-0">既にログアウトされています</p>
            </div>

            <!-- ログイン画面への誘導ボタン -->
            <div class="d-grid">
                <a href="${pageContext.request.contextPath}/account/login/login.jsp" class="btn btn-dark rounded-3 py-2 fw-bold shadow-sm">
                    ログイン画面へ
                </a>
            </div>

        </div>

    </div>
</div>

<%@ include file="../../footer.jsp" %>