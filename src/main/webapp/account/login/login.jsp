<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../head.jsp" %>

<style>
/* 最小限のカスタムスタイル */
body { background-color: #f8f9fa; }

/* 画面中央に配置 */
.login-container {
    max-width: 450px;
    margin: 40px auto;
}
</style>

<div class="container min-vh-100 d-flex flex-column justify-content-center">
    <div class="login-container w-100">

        <!-- ログインフォームカード -->
        <div class="card bg-white border rounded-3 shadow-sm p-4">
            
            <h2 class="fs-4 fw-bold text-dark text-center mb-4">ログイン</h2>

            <form action="${pageContext.request.contextPath}/account/Login.action" method="post">

                <!-- アカウントID -->
                <div class="mb-3">
                    <label for="id" class="form-label fw-bold text-secondary small">アカウントID</label>
                    <input type="text" id="id" name="account_id" class="form-control rounded-3" placeholder="例 admin1234" required>
                </div>

                <!-- パスワード -->
                <div class="mb-3">
                    <label for="password" class="form-label fw-bold text-secondary small">パスワード</label>
                    <input type="password" id="password" name="password" class="form-control rounded-3" placeholder="パスワードを入力" required>
                </div>

                <!-- パスワード表示チェックボックス -->
                <div class="form-check mb-4">
                    <input type="checkbox" id="display" name="display" class="form-check-input">
                    <label for="display" class="form-check-label text-secondary small">パスワードを表示する</label>
                </div>

                <!-- ログインボタン -->
                <button type="submit" class="btn btn-dark btn-lg rounded-3 w-100 py-2 fs-6 fw-bold shadow-sm mb-3">
                    ログイン
                </button>

            </form>

            <hr class="text-muted my-3">

            <!-- 新規登録案内 -->
            <div class="text-center pt-2">
                <p class="text-muted small mb-2">まだ新規登録が済んでいない方はこちら</p>
                <a href="insert.jsp" class="btn btn-outline-secondary btn-sm rounded-3 px-4 fw-bold">
                    新規登録画面へ
                </a>
            </div>

        </div>

    </div>
</div>

<script src="../../static/js/login.js"></script>
<%@ include file="../../footer.jsp" %>