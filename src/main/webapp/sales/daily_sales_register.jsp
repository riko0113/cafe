<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../../header.jsp" %>

<div class="container-fluid">
    <div class="row">
        <%@ include file="../../menu.jsp" %>

        <main class="col-md-9 col-lg-10 p-4 bg-light">
            
            <div class="d-flex justify-content-between align-items-center mb-4 border-bottom pb-2">
                <h2 class="h3 mb-0 text-secondary">
                    <i class="bi bi-calculator me-2"></i>
                    ${calcdate} 日 売上登録確認
                </h2>
            </div>

            <div class="card shadow-sm border-0 mb-4">
                <div class="card-body">
                    <h5 class="card-title h6 fw-bold mb-3">
                        <i class="bi bi-check2-square me-1 text-success"></i>計算結果一覧
                    </h5>

                    <c:choose>
                        <%-- 売上が空の場合 --%>
                        <c:when test="${empty dailysales}">
                            <div class="alert alert-warning mb-0 animate__animated animate__fadeIn" role="alert">
                                <i class="bi bi-exclamation-triangle-fill me-2"></i>
                                この日の売上データ（注文データ）がまだ存在しないか、確認できません。
                            </div>
                        </c:when>
                        
                        <%-- 売上が存在する場合 --%>
                        <c:otherwise>
                            <div class="table-responsive">
                                <table class="table table-striped table-hover align-middle mb-0">
                                    <thead class="table-dark">
                                        <tr>
                                            <th>商品ID</th>
                                            <th>商品名</th>
                                            <th class="text-end" style="width: 20%;">売上数</th>
                                            <th class="text-end" style="width: 25%;">売上金額</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="d" items="${dailysales}">
                                            <tr>
                                                <td class="fw-bold">${d.product_id}</td>
                                                <td>${d.product_name}</td>
                                                <td class="text-end text-primary fw-bold">${d.total_quantity}</td>
                                                <td class="text-end text-success fw-bold">${d.total_amount} 円</td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>

            <c:if test="${not empty dailysales}">
                <div class="card shadow-sm border-0 border-start border-primary border-4">
                    <div class="card-body d-flex align-items-center justify-content-between py-3">
                        <div class="text-muted small">
                            <i class="bi bi-info-circle-fill text-primary me-1"></i>
                            内容を確認し、問題がなければ「登録」ボタンを押してデータベースに売上を確定させてください。
                        </div>
                        <form action="${pageContext.request.contextPath}/sales/servlet/DailySalesRegistration.action" method="post" class="m-0">
                            <input type="hidden" id="calcdate" name="calcdate" value="${calcdate}">
                            <button type="submit" class="btn btn-success btn-lg px-5">
                                <i class="bi bi-cloud-upload me-2"></i>この内容で登録する
                            </button>
                        </form>
                    </div>
                </div>
            </c:if>

        </main>
    </div>
</div>

<%@ include file="../../footer.jsp" %>