<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date, java.text.SimpleDateFormat" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../header.jsp" %>
<style>
        /* メインカードのホバーエフェクト */
        .menu-card {
            transition: transform 0.2s ease, box-shadow 0.2s ease;
            border: 1px solid rgba(0,0,0,0.125);
        }
        
        .menu-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
        }

        /* カードリンクのテキスト装飾をリセット */
        .card-link {
            text-decoration: none;
            color: inherit;
        }
</style>
<div class="container-fluid">
    <div class="row">
            <%@ include file="../../menu.jsp" %>

        <!-- メイン -->
        <main class="col-md-9 col-lg-10 p-4 bg-light">
                <div class="d-flex justify-content-between align-items-center mb-4 border-bottom pb-2">
                    <h2 class="h3 mb-0 text-secondary">
                        <i class="bi bi-cash-stack me-2"></i>売上管理メニュー
                    </h2>
                </div>
				
                <div class="row g-4">

                    <div class="col-md-6 col-lg-4">
                        <a href="${pageContext.request.contextPath}/sales/servlet/DailyProductSalesSummary.action" class="card-link">
                            <div class="card h-100 menu-card">
                                <div class="card-body d-flex align-items-start">
                                    <div class="bg-primary-subtle text-primary p-3 rounded me-3">
                                        <i class="bi bi-calendar-event fs-4"></i>
                                    </div>
                                    <div>
                                        <h5 class="card-title h6 fw-bold">日次売上詳細</h5>
                                        <p class="card-text text-muted small mb-0">商品別の日次売上を確認します</p>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>

                    <div class="col-md-6 col-lg-4">
                        <a href="${pageContext.request.contextPath}/sales/servlet/MonthlyProductSalesSummary.action" class="card-link">
                            <div class="card h-100 menu-card">
                                <div class="card-body d-flex align-items-start">
                                    <div class="bg-info-subtle text-info p-3 rounded me-3">
                                        <i class="bi bi-calendar-month fs-4"></i>
                                    </div>
                                    <div>
                                        <h5 class="card-title h6 fw-bold">月次売上詳細</h5>
                                        <p class="card-text text-muted small mb-0">商品別の月次売上を確認します</p>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>

                    <div class="col-md-6 col-lg-4">
                        <a href="${pageContext.request.contextPath}/sales/servlet/DailySalesSummary.action" class="card-link">
                            <div class="card h-100 menu-card">
                                <div class="card-body d-flex align-items-start">
                                    <div class="bg-success-subtle text-success p-3 rounded me-3">
                                        <i class="bi bi-calculator fs-4"></i>
                                    </div>
                                    <div>
                                        <h5 class="card-title h6 fw-bold">日売上合計</h5>
                                        <p class="card-text text-muted small mb-0">日別売上集計を確認します</p>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>

                    <div class="col-md-6 col-lg-4">
                        <a href="${pageContext.request.contextPath}/sales/servlet/MonthlySalesSummary.action" class="card-link">
                            <div class="card h-100 menu-card">
                                <div class="card-body d-flex align-items-start">
                                    <div class="bg-warning-subtle text-warning p-3 rounded me-3">
                                        <i class="bi bi-bar-chart-line fs-4"></i>
                                    </div>
                                    <div>
                                        <h5 class="card-title h6 fw-bold">月売上合計</h5>
                                        <p class="card-text text-muted small mb-0">月別売上集計を確認します</p>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>

                    <div class="col-md-6 col-lg-4">
                        <a href="${pageContext.request.contextPath}/sales/servlet/ProfitManagement.action" class="card-link">
                            <div class="card h-100 menu-card">
                                <div class="card-body d-flex align-items-start">
                                    <div class="bg-danger-subtle text-danger p-3 rounded me-3">
                                        <i class="bi bi-graph-down-arrow fs-4"></i>
                                    </div>
                                    <div>
                                        <h5 class="card-title h6 fw-bold">損益管理</h5>
                                        <p class="card-text text-muted small mb-0">利益・損失を確認します</p>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>

                    <div class="col-md-6 col-lg-4">
                        <a href="${pageContext.request.contextPath}/sales/servlet/DailySalesCalc.action" class="card-link">
                            <div class="card h-100 menu-card">
                                <div class="card-body d-flex align-items-start">
                                    <div class="bg-dark-subtle text-dark p-3 rounded me-3">
                                        <i class="bi bi-pencil-square fs-4"></i>
                                    </div>
                                    <div>
                                        <h5 class="card-title h6 fw-bold">日売上登録</h5>
                                        <p class="card-text text-muted small mb-0">当日の売上を登録します</p>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>

                </div>

            </main>

        </div>
    </div>
<%@ include file="../footer.jsp" %>