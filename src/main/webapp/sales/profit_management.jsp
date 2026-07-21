<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../header.jsp" %>

<div class="container-fluid">
    <div class="row">
        <%@ include file="../menu.jsp" %>

        <main class="col-md-9 col-lg-10 p-4 bg-light">
            
            <div class="d-flex justify-content-between align-items-center mb-4 border-bottom pb-2">
                <h2 class="h3 mb-0 text-secondary">
                    <i class="bi bi-graph-up-arrow me-2"></i>損益管理（粗利率計算）
                </h2>
            </div>

            <div class="card shadow-sm border-0">
                <div class="card-body">
                    <h5 class="card-title h6 fw-bold mb-3 text-dark">
                        <i class="bi bi-percent me-1 text-primary"></i>月別損益・粗利率一覧
                    </h5>

                    <c:choose>
                        <%-- データが空の場合 --%>
                        <c:when test="${empty profitlist}">
                            <div class="alert alert-warning mb-0" role="alert">
                                <i class="bi bi-exclamation-triangle-fill me-2"></i>売上または仕入データが登録されていないため、損益計算ができません。
                            </div>
                        </c:when>
                        
                        <%-- データが存在する場合 --%>
                        <c:otherwise>
                            <div class="table-responsive">
                                <table class="table table-striped table-hover align-middle mb-0">
                                    <thead class="table-dark">
                                        <tr>
                                            <th>対象月</th>
                                            <th class="text-end">合計売上金額</th>
                                            <th class="text-end">合計仕入額（コスト）</th>
                                            <th class="text-end">粗利率</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="pl" items="${profitlist}">
                                            <tr>
                                                <td class="fw-bold text-secondary">
                                                    <i class="bi bi-calendar-check me-2"></i>${pl.targetMonth}
                                                </td>
                                                <td class="text-end fw-bold text-primary">
                                                    ${pl.salesAmount} 円
                                                </td>
                                                <td class="text-end fw-bold text-danger">
                                                    ${pl.purchaseAmount} 円
                                                </td>
                                                <td class="text-end">
                                                    <span class="badge bg-success-subtle text-success fs-6 px-3 py-2 fw-bold">
                                                        ${pl.grossMarginRate}%
                                                    </span>
                                                </td>
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

<%@ include file="../footer.jsp" %>