<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../head.jsp" %>

<style>
/* 最小限のカスタムスタイル */
body { background-color: #f8f9fa; }

/* 画面中央に配置するコンテナ */
.confirm-container {
    max-width: 450px;
    margin: 40px auto;
}
</style>

<div class="container min-vh-100 d-flex flex-column justify-content-center">
    <div class="confirm-container w-100">

        <!-- 削除確認カード -->
        <div class="card bg-white border border-danger-subtle rounded-3 shadow-sm p-4 text-center">
            
            <!-- 警告アイコン/タイトル -->
            <div class="mb-3">
                <span class="fs-1 text-danger">⚠️</span>
                <h2 class="fs-4 fw-bold text-dark mt-2">アカウントの削除確認</h2>
            </div>

            <!-- 注意事項メッセージ -->
            <div class="p-3 bg-light rounded-3 border mb-4 text-start">
                <p class="text-danger fw-bold small mb-1">【ご注意】</p>
                <p class="text-secondary small mb-0">
                    本当にアカウントを削除しますか？<br>
                    削除されたデータや注文履歴は元に戻すことができません。
                </p>
            </div>

            <!-- 実行ボタン -->
            <form action="${pageContext.request.contextPath}/account/Delete.action" method="post" class="mb-2">
                <input type="hidden" name="account_id" value="${param.account_id}">
                <button type="submit" class="btn btn-danger rounded-3 w-100 py-2 fw-bold shadow-sm mb-2">
                    はい、アカウントを削除します
                </button>
            </form>

            <!-- キャンセルボタン -->
            <a href="../../index.jsp" class="btn btn-outline-secondary rounded-3 w-100 py-2 fw-bold">
                キャンセル（トップへ戻る）
            </a>

        </div>

    </div>
</div>

<script src="../../static/js/login.js"></script>
<%@ include file="../../footer.jsp" %>