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
                <h2 class="fs-4 fw-bold text-dark mt-2">エラーが発生しました</h2>
            </div>

            <!-- エラーメッセージ -->
            <div class="p-3 bg-light rounded-3 border mb-4 text-start">
                <p class="text-secondary fw-bold small mb-1">【原因の可能性】</p>
                <ul class="text-secondary small mb-0 ps-3">
                    <li>既に登録されているアカウントIDです</li>
                    <li>入力内容に誤りがあります</li>
                </ul>
            </div>

            <p class="text-muted small mb-4">お手数ですが、最初からやり直してください。</p>

            <!-- 誘導ボタン群 -->
            <div class="d-grid gap-2">
                <a href="${pageContext.request.contextPath}/account/login/insert.jsp" class="btn btn-dark rounded-3 py-2 fw-bold shadow-sm">
                    新規作成画面へ
                </a>
                <a href="${pageContext.request.contextPath}/account/login/login.jsp" class="btn btn-outline-secondary rounded-3 py-2 fw-bold">
                    ログイン画面へ
                </a>
            </div>

        </div>

    </div>
</div>

<%@ include file="../../footer.jsp" %>