<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>カフェ管理</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
</head>
<body>

    <header class="navbar navbar-dark bg-dark px-3 sticky-top shadow-sm">
        <span class="navbar-brand mb-0 h1">
            <i class="bi bi-graph-up me-2"></i>カフェ管理システム
        </span>
        <div class="d-flex align-items-center text-white">
            
            <c:choose>
                <%-- ログインしている場合 --%>
                <c:when test="${not empty sessionScope.account}">
                    <span class="me-3 small text-light">
                        <i class="bi bi-person-circle me-1 text-info"></i>
                        ${sessionScope.account.user_name} 様
                    </span>
                    <a class="btn btn-sm btn-outline-danger" href="${pageContext.request.contextPath}account/logout/logout.jsp">
                        <i class="bi bi-box-arrow-left me-1"></i>ログアウト
                    </a>
                </c:when>
                
                <%-- ログインしていない場合 --%>
                <c:otherwise>
                    <a class="btn btn-sm btn-outline-light" href="${pageContext.request.contextPath}account/login/login.jsp">
                        <i class="bi bi-box-arrow-in-right me-1"></i>ログイン
                    </a>
                </c:otherwise>
            </c:choose>
            
        </div>
    </header>
