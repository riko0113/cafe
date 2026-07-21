<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../header.jsp" %>

<div class="container-fluid">
    <div class="row">
        <%@ include file="../menu.jsp" %>

        <main class="col-md-9 col-lg-10 p-4 bg-light">
            
            <div class="d-flex justify-content-between align-items-center mb-4 border-bottom pb-2">
                <h2 class="h3 mb-0 text-secondary">
                    <i class="bi bi-pencil-square me-2"></i>日売上登録（売上計算）
                </h2>
            </div>

            <div class="card shadow-sm border-0" style="max-width: 600px;">
                <div class="card-body p-4">
                    <h5 class="card-title h6 fw-bold mb-4">
                        <i class="bi bi-calculator me-1 text-primary"></i>売上計算日の指定
                    </h5>
                    
                    <form action="${pageContext.request.contextPath}/sales/servlet/DailySalesRegister.action" method="post">
                        
                        <div class="mb-4">
                            <label for="calcdate" class="form-label fw-semibold text-muted">
                                売上を計算・登録する日付を選択してください
                            </label>
                            <input type="date" id="calcdate" name="calcdate" class="form-control form-control-lg" required>
                        </div>

                        <div class="d-grid">
                            <button type="submit" class="btn btn-primary btn-lg">
                                <i class="bi bi-play-circle me-2"></i>売上計算を実行する
                            </button>
                        </div>

                    </form>
                </div>
            </div>

            <div class="alert alert-info mt-4 border-0 shadow-sm" style="max-width: 600px;" role="alert">
                <h6 class="alert-heading fw-bold"><i class="bi bi-info-circle me-2"></i>売上計算について</h6>
                <p class="mb-0 small text-secondary">
                    指定された日付のすべての注文データを集計し、売上データとしてシステムに確定・登録します。<br>
                    ※すでに計算済みの日の場合、データが上書き更新されます。
                </p>
            </div>

        </main>
    </div>
</div>

<%@ include file="../footer.jsp" %>