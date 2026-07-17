<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../../header.jsp" %>

<div class="container-fluid">
    <div class="row">
        <%@ include file="../../menu.jsp" %>

        <main class="col-md-9 col-lg-10 p-4 bg-light">
            
            <div class="d-flex justify-content-between align-items-center mb-4 border-bottom pb-2">
                <h2 class="h3 mb-0 text-secondary">
                    <i class="bi bi-calculator me-2"></i>日次売上合計確認
                </h2>
            </div>

            <div class="card shadow-sm border-0">
                <div class="card-body">
                    <h5 class="card-title h6 fw-bold mb-3 text-dark">
                        <i class="bi bi-list-check me-1 text-primary"></i>売上一覧
                    </h5>

                    <c:choose>
                        <%-- 売上データが空の場合 --%>
                        <c:when test="${empty salessummarys}">
                            <div class="alert alert-warning mb-0 animate__animated animate__fadeIn" role="alert">
                                <i class="bi bi-exclamation-triangle-fill me-2"></i>まだ売上が登録されていません。
                            </div>
                        </c:when>
                        
                        <%-- 売上データが存在する場合 --%>
                        <c:otherwise>
                            <div class="table-responsive">
                                <table class="table table-striped table-hover align-middle mb-0">
                                    <thead class="table-dark">
                                        <tr>
                                            <th>日付</th>
                                            <th class="text-end">売上合計金額</th>
                                            <th class="text-end">合計支払金額（税込）</th>
                                            <th class="text-end">合計税額</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="ss" items="${salessummarys}">
                                            <tr>
                                                <td class="fw-bold text-secondary">
                                                    <i class="bi bi-calendar3 me-2"></i>${ss.targetDate}
                                                </td>
                                                <td class="text-end fw-bold text-dark">${ss.totalInclTax} 円</td>
                                                <td class="text-end fw-bold text-success">${ss.totalExclTax} 円</td>
                                                <td class="text-end text-muted">${ss.totalTax} 円</td>
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