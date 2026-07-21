<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../head.jsp" %>

<h3>本当に削除しますか</h3>
<form action="/cafe/account/Delete.action" method="post">
	<input type="hidden" name="account_id" value="${param.account_id}">
	<input type="submit" value="削除">
</form>

<a href="../../index.jsp">キャンセル</a>
<script src="../../static/js/login.js"></script>
<%@ include file="../../footer.jsp" %>