<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../header.jsp" %>

<div class="container-fluid">
    <div class="row">
        <%@ include file="../menu.jsp" %>

        <!-- メイン -->
        <main class="col-md-9 col-lg-10 p-4 bg-light">
            
            <!-- エラーメッセージカード（中央寄せ） -->
            <div class="d-flex justify-content-center align-items-center" style="min-height: 70vh;">
                <div class="card shadow-sm border-0 text-center p-5" style="max-width: 500px; width: 100%;">
                    
                    <!-- システムエラーを示す警告アイコン -->
                    <div class="mb-4">
                        <div class="bg-warning-subtle text-warning rounded-circle d-inline-flex align-items-center justify-content-center" style="width: 80px; height: 80px;">
                            <i class="bi bi-shield-slash-fill fs-1"></i>
                        </div>
                    </div>

                    <!-- メッセージ -->
                    <h3 class="h4 fw-bold text-dark mb-2">エラーが発生しました</h3>
                    <p class="text-muted small mb-4">
                        システム内で一時的なエラー、または予期しない問題が発生しました。<br>
                        恐れ入りますが、トップメニューからもう一度やり直してください。
                    </p>

                    <!-- メニューに戻るアクションボタン -->
                    <div class="d-grid">
                        <a href="${pageContext.request.contextPath}/sales/sales_menu.jsp" class="btn btn-secondary btn-lg">
                            <i class="bi bi-house-door me-2"></i>売上管理メニューへ戻る
                        </a>
                    </div>

                </div>
            </div>

        </main>
    </div>
</div>

<%@ include file="../footer.jsp" %>