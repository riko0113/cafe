<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../head.jsp" %>

<h3>エラー</h3>
<p>既に登録されているか、入力に誤りがあります</p>
<p>最初からやり直してください</p>
<a href="${pageContext.request.contextPath}/account/login/insert.jsp">新規作成画面</a>
<a href="${pageContext.request.contextPath}/account/login/login.jsp">ログイン画面</a>

<%@ include file="../../footer.jsp" %>