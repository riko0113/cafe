<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../../header.jsp" %>

<div class="container-fluid">
    <div class="row">
        <%@ include file="../../menu.jsp" %>

        <main class="col-md-9 col-lg-10 p-4 bg-light">
            
            <div class="d-flex justify-content-center align-items-center" style="min-height: 70vh;">
                <div class="card shadow-sm border-0 text-center p-5" style="max-width: 500px; width: 100%;">
                    
                    <div class="mb-4">
                        <div class="bg-danger-subtle text-danger rounded-circle d-inline-flex align-items-center justify-content-center" style="width: 80px; height: 80px;">
                            <i class="bi bi-exclamation-triangle-fill fs-1"></i>
                        </div>
                    </div>

                    <h3 class="h4 fw-bold text-dark mb-2">売上登録に失敗しました</h3>
                    <p class="text-muted small mb-4">
                        データの処理中にエラーが発生したか、必要な情報が不足している可能性があります。<br>
                        もう一度計算処理からやり直してください。
                    </p>

                    <div class="d-grid gap-2">
                        <a href="${pageContext.request.contextPath}/sales/servlet/DailySalesCulcAction.action" class="btn btn-danger btn-lg">
                            <i class="bi bi-arrow-counterclockwise me-2"></i>日売上計算画面へ戻る
                        </a>
                        <a href="${pageContext.request.contextPath}/sales/sales_menu.jsp" class="btn btn-outline-secondary">
                            <i class="bi bi-house-door me-2"></i>売上管理メニューに戻る
                        </a>
                    </div>

                </div>
            </div>

        </main>
    </div>
</div>

<%@ include file="../../footer.jsp" %>