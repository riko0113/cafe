<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../head.jsp" %>

<h3>編集:ユーザーネームとパスワードの変更ができます</h3>
<form action="${pageContext.request.contextPath}/account/Update.action" method="post">
    <input type="hidden" name="user_id" value="${sessionScope.account.accountId}">
     
	<label for="id">ユーザーネーム</label>
	<input type="text" name="user_name" value="${sessionScope.account.userName}" required><br>
                    
	<label for="pass">パスワード</label>
	<input type="password" id="password" name="password" value="${sessionScope.account.password}" required><br>

	<label for="diaplay"><input type="checkbox" id="display" name="display">パスワードを表示する</label><br>

	<input type="submit" value="変更">

</form>

<h3>削除:アカウントを削除できます</h3>
<form action="/cafe/account/manage/check.jsp" method="post">
	<input type="hidden" name="account_id" value="${sessionScope.account.accountId}">
	<input type="submit" value="削除">
</form>

<a href="../../index.jsp">戻る</a>
<script src="../../static/js/login.js"></script>
<%@ include file="../../footer.jsp" %>