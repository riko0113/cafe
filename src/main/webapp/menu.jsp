<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<style>
        /* サイドバーリンクのカスタムスタイル */
        .sidebar-link {
            color: #adb5bd;
            text-decoration: none;
            display: block;
            padding: 10px 15px;
            border-radius: 5px;
            transition: all 0.2s ease;
        }

        .sidebar-link:hover {
            background-color: #495057;
            color: #ffffff;
        }

        .sidebar-link.active {
            background-color: #0d6efd;
            color: #ffffff;
            font-weight: bold;
        }
    </style>

            <nav class="col-md-3 col-lg-2 bg-dark text-white min-vh-100 p-3 shadow">
                <h5 class="mb-4 text-center border-bottom pb-3">
                    <i class="bi bi-shop me-2"></i>販売管理システム
                </h5>

                <ul class="nav flex-column gap-2">
                    <li class="nav-item">
                        <a href="/system/product/product_list.jsp" class="sidebar-link">
                            <i class="bi bi-box-seam me-2"></i>商品管理
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="/system/order/order_list.jsp" class="sidebar-link">
                            <i class="bi bi-cart me-2"></i>注文管理
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="/system/stock/stock_list.jsp" class="sidebar-link">
                            <i class="bi bi-boxes me-2"></i>在庫管理
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="${pageContext.request.contextPath}/sales/sales_menu.jsp" class="sidebar-link active">
                            <i class="bi bi-cash-stack me-2"></i>売上管理
                        </a>
                    </li>
                </ul>
            </nav>