<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp" %>
         
<h3>ログイン</h3>

<form action="/cafe/account/Login.action" method="post">
    <label for="id">アカウントID</label>
    <input type="text" id="id" name="teacher_id" placeholder="例 admin1234" required><br>

    <label for="pass">パスワード</label>
    <input type="password" id="password" name="password" required><br>

    <label for="diaplay"></label><input type="checkbox" id="display" name="display">パスワードを表示する</label><br>

    <input type="submit" value="ログイン">
</form>
            
<p>まだ新規登録が済んでいない方はこちらへ</p>
<a href="insert.jsp">新規登録</a>

<script src="../../static/js/login.js"></script>
<%@ include file="../../footer.jsp" %>