<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../head.jsp" %>

<style>
/* 最小限のカスタムスタイル */
body { background-color: #f8f9fa; }

/* 画面中央に配置するコンテナ */
.account-container {
    max-width: 500px;
    margin: 40px auto;
}
</style>

<div class="container min-vh-100 d-flex flex-column justify-content-center">
    <div class="account-container w-100">

        <!-- ページタイトル -->
        <h2 class="fs-4 fw-bold text-dark text-center mb-4">アカウント設定</h2>

        <!-- 1. 編集カード -->
        <div class="card bg-white border rounded-3 shadow-sm p-4 mb-4">
            <h3 class="fs-5 fw-bold text-dark mb-2">ユーザー情報の変更</h3>
            <p class="text-secondary small mb-3">ユーザーネームとパスワードの変更ができます。</p>

            <form action="${pageContext.request.contextPath}/account/Update.action" method="post">
                <input type="hidden" name="user_id" value="${sessionScope.account.accountId}">
                 
                <!-- ユーザーネーム -->
                <div class="mb-3">
                    <label for="user_name" class="form-label fw-bold text-secondary small">ユーザーネーム</label>
                    <input type="text" id="user_name" name="user_name" class="form-control rounded-3" value="${sessionScope.account.userName}" required>
                </div>
                            
                <!-- パスワード -->
                <div class="mb-3">
                    <label for="password" class="form-label fw-bold text-secondary small">パスワード</label>
                    <input type="password" id="password" name="password" class="form-control rounded-3" value="${sessionScope.account.password}" required>
                </div>

                <!-- パスワード表示チェックボックス -->
                <div class="form-check mb-4">
                    <input type="checkbox" id="display" name="display" class="form-check-input">
                    <label for="display" class="form-check-label text-secondary small">パスワードを表示する</label>
                </div>

                <!-- 変更ボタン -->
                <button type="submit" class="btn btn-dark rounded-3 w-100 py-2 fw-bold shadow-sm">
                    変更を保存する
                </button>
            </form>
        </div>

        <!-- 2. 削除カード（危険エリア） -->
        <div class="card bg-white border border-danger-subtle rounded-3 shadow-sm p-4 mb-4">
            <h3 class="fs-5 fw-bold text-danger mb-1">アカウントの削除</h3>
            <p class="text-secondary small mb-3">アカウントを完全に削除します。この操作は取り消せません。</p>

            <form action="${pageContext.request.contextPath}/account/manage/check.jsp" method="post">
                <input type="hidden" name="account_id" value="${sessionScope.account.accountId}">
                <button type="submit" class="btn btn-outline-danger rounded-3 w-100 py-2 fw-bold">
                    アカウント削除手続きへ
                </button>
            </form>
        </div>

        <!-- 戻るボタン -->
        <div class="text-center">
            <a href="../../index.jsp" class="btn btn-outline-secondary rounded-3 px-4 fw-bold">
                戻る
            </a>
        </div>

    </div>
</div>

<script src="../../static/js/login.js"></script>
<%@ include file="../../footer.jsp" %>