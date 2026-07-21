<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../head.jsp" %>

<style>
/* 最小限のカスタムスタイル */
body { background-color: #f8f9fa; }

/* 画面中央にフォームを配置 */
.form-container {
    max-width: 450px;
    margin: 40px auto;
}
</style>

<div class="container min-vh-100 d-flex flex-column justify-content-center">
    <div class="form-container w-100">

        <!-- 登録フォームカード -->
        <div class="card bg-white border rounded-3 shadow-sm p-4">
            
            <h2 class="fs-4 fw-bold text-dark text-center mb-4">新規アカウント登録</h2>

            <form action="${pageContext.request.contextPath}/account/Insert.action" method="post">

                <!-- アカウントID -->
                <div class="mb-3">
                    <label for="account_id" class="form-label fw-bold text-secondary small">アカウントID</label>
                    <input type="text" id="account_id" name="account_id" class="form-control rounded-3" placeholder="半角英数字で入力" required>
                </div>

                <!-- ユーザーネーム -->
                <div class="mb-3">
                    <label for="user_name" class="form-label fw-bold text-secondary small">ユーザーネーム</label>
                    <input type="text" id="user_name" name="user_name" class="form-control rounded-3" placeholder="表示名を入力" required>
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

                <!-- 登録ボタン -->
                <button type="submit" class="btn btn-dark btn-lg rounded-3 w-100 py-2 fs-6 fw-bold shadow-sm">
                    登録する
                </button>

            </form>
		
		    <div class="text-center pt-2">
                <a href="login.jsp" class="btn btn-outline-secondary btn-sm rounded-3 px-4 fw-bold">
                    ホーム画面へ戻る
                </a>
            </div>
            
        </div>

    </div>
</div>

<script src="../../static/js/login.js"></script>
<%@ include file="../../footer.jsp" %>