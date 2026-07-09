<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ジャンル</title>
</head>
<body>
  <h2>ジャンルのIDと名前を登録しよう</h2>
  <form action="../product/insert" method="post">
  ジャンルID:<input type="text" name="genre_id"><br>
  ジャンル名:<input type="text" name="genre_name"><br>
  <input type="submit" value="登録">
  </form>
</body>
</html>