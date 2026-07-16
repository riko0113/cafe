<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../../header.jsp" %>

<div class="container-fluid">
    <div class="row">
        <%@ include file="../../menu.jsp" %>

        <main class="col-md-9 col-lg-10 p-4 bg-light">
            
            <div class="d-flex justify-content-between align-items-center mb-4 border-bottom pb-2">
                <h2 class="h3 mb-0 text-secondary">
                    <i class="bi bi-calendar-month me-2"></i>
                    <c:choose>
                        <c:when test="${not empty targetMonth}">
                            ${targetMonth} 月商品別売上合計
                        </c:when>
                        <c:otherwise>
                            月次商品別売上合計確認
                        </c:otherwise>
                    </c:choose>
                </h2>
            </div>

            <div class="card mb-4 shadow-sm border-0">
                <div class="card-body">
                    <h5 class="card-title h6 fw-bold mb-3">
                        <i class="bi bi-search me-1"></i>集計月の指定
                    </h5>
                    
                    <form action="${pageContext.request.contextPath}/sales/servlet/MonthlyProductSalesSummary.action" method="post" class="row g-3 align-items-end">
                        <div class="col-auto">
                            <label class="form-label small text-muted">対象月</label>
                            <input type="month" name="targetMonth" class="form-control" value="${targetMonth}">
                        </div>
                        <div class="col-auto">
                            <button type="submit" class="btn btn-primary px-4">
                                <i class="bi bi-search me-1"></i>検索
                            </button>
                        </div>
                    </form>
                </div>
            </div>

            <div class="card shadow-sm border-0">
                <div class="card-body">
                    <h5 class="card-title h6 fw-bold mb-3">
                        <i class="bi bi-list-stars me-1"></i>商品売上一覧
                    </h5>

                    <c:choose>
                        <%-- データが空の場合 --%>
                        <c:when test="${empty monthlysales}">
                            <div class="alert alert-warning mb-0" role="alert">
                                <i class="bi bi-exclamation-triangle me-2"></i>対象月の売上データがまだ登録されていないか、月が選択されていません。
                            </div>
                        </c:when>
                        
                        <%-- データが存在する場合 --%>
                        <c:otherwise>
                            <div class="table-responsive">
                                <table class="table table-striped table-hover align-middle mb-0">
                                    <thead class="table-dark">
                                        <tr>
                                            <th>商品ID</th>
                                            <th>商品名</th>
                                            <th>ジャンル</th>
                                            <th class="text-end">売上合計数</th>
                                            <th class="text-end">売上合計金額</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="ms" items="${monthlysales}">
                                            <tr>
                                                <td class="fw-bold">${ms.product_id}</td>
                                                <td>${ms.product_name}</td>
                                                <td>
                                                    <span class="badge bg-secondary-subtle text-secondary-emphasis">
                                                        ${ms.genre_name}
                                                    </span>
                                                </td>
                                                <td class="text-end fw-bold text-primary">${ms.total_quantity}</td>
                                                <td class="text-end fw-bold text-success">${ms.total_amount} 円</td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>

        </main>
    </div>
</div>

<%@ include file="../../footer.jsp" %>