<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../head.jsp" %>

<style>
/* 最小限のカスタムスタイル */
body { background-color: #f8f9fa; }

/* 画面中央に配置するコンテナ */
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
                <h2 class="fs-4 fw-bold text-dark mt-2">編集が完了しました</h2>
            </div>

            <!-- メッセージ -->
            <p class="text-secondary small mb-4">
                アカウント情報の更新が正常に完了いたしました。
            </p>

            <!-- 誘導ボタン群 -->
            <div class="d-grid gap-2">
                <a href="${pageContext.request.contextPath}/index.jsp" class="btn btn-dark rounded-3 py-2 fw-bold shadow-sm">
                    ホーム画面へ
                </a>
                <a href="${pageContext.request.contextPath}/account/manage/edit.jsp" class="btn btn-outline-secondary rounded-3 py-2 fw-bold">
                    引き続きアカウント設定を変更
                </a>
            </div>

        </div>

    </div>
</div>

<%@ include file="../../footer.jsp" %>