<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../head.jsp" %>

<h3>新規登録</h3>
<form action="/cafe/account/Insert.action" method="post">

	<label for="id">アカウントID</label>
	<input type="text" name="account_id" placeholder="admin1234" required><br>
                
	<label for="id">ユーザーネーム</label>
	<input type="text" name="user_name" required><br>
                    
	<label for="pass">パスワード</label>
	<input type="password" id="password" name="password" required><br>

	<label for="diaplay"></label><input type="checkbox" id="display" name="display">パスワードを表示する</label><br>

	<input type="submit" value="登録">

</form>

<script src="../../static/js/login.js"></script>
<%@ include file="../../footer.jsp" %>