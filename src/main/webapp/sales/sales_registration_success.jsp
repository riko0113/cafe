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
                        <div class="bg-success-subtle text-success rounded-circle d-inline-flex align-items-center justify-content-center" style="width: 80px; height: 80px;">
                            <i class="bi bi-check-circle-fill fs-1"></i>
                        </div>
                    </div>

                    <h3 class="h4 fw-bold text-dark mb-2">売上登録が完了しました</h3>
                    <p class="text-muted small mb-4">
                        本日の売上データがデータベースに正常に記録されました。<br>
                        登録された内容は、以下の詳細画面より確認できます。
                    </p>

                    <div class="d-grid gap-2">
                        <a href="${pageContext.request.contextPath}/sales/servlet/DailyProductSalesSummary.action" class="btn btn-primary btn-lg">
                            <i class="bi bi-calendar-event me-2"></i>日次売上詳細画面へ
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