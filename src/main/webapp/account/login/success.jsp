<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../head.jsp" %>

<style>
/* 最小限のカスタムスタイル */
body { background-color: #f8f9fa; }

/* 画面中央に配置 */
.success-container {
    max-width: 450px;
    margin: 40px auto;
}
</style>

<div class="container min-vh-100 d-flex flex-column justify-content-center">
    <div class="success-container w-100">

        <!-- 完了メッセージカード -->
        <div class="card bg-white border rounded-3 shadow-sm p-4 text-center">
            
            <!-- サクセスアイコン/タイトル -->
            <div class="mb-3">
                <span class="fs-1 text-success">✓</span>
                <h2 class="fs-4 fw-bold text-dark mt-2">登録が完了しました</h2>
            </div>

            <!-- メッセージ -->
            <p class="text-secondary small mb-4">
                アカウントの作成が正常に完了しました。<br>
                続けてログインを行ってください。
            </p>

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