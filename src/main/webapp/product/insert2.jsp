<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ジャンル</title>
<link rel="stylesheet" href="style4.css">
</head>
<body>
  <h2>ジャンルのIDと名前を登録しよう</h2>
  <form action="../product/insert2" method="post">
  商品ID:<input type="text" name="product_id"><br>
  商品名:<input type="text" name="product_name"><br>
  ジャンルID:<input type="text" name="genre_id"><br>
  価格:<input type="text" name="price"><br>
  <input type="submit" value="登録">
  </form>
</body>
</html>