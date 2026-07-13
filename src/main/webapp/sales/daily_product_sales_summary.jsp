<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>商品別売上合計確認</title>
</head>
<body>

<h1>商品別売上合計確認画面</h1>

<form action="${pageContext.request.contextPath}/sales/servlet/ProductSalesSummary.action" method="post">

    <h3>集計種別</h3>

    <input type="radio" id="daily" name="summaryType" value="daily" checked>
    <label for="daily">日別</label>

    <input type="radio" id="monthly" name="summaryType" value="monthly">
    <label for="monthly">月別</label>

    <br><br>

    <div id="dailyArea">
        <label>対象日</label>
        <input type="date" name="targetDate">
    </div>

    <div id="monthlyArea" style="display:none;">
        <label>対象月</label>
        <input type="month" name="targetMonth">
    </div>

    
    <br><br>
	<div>
    	<label>商品ID</label>
    	<input type="text" name="productId">
	</div>
    <br><br>

	<div>
    	<label>商品名</label>
    	<input type="text" name="productName">
	</div>
    <br><br>

	<div>
    <label>ジャンル</label>
    <input type="text" name="genreName">
	</div>
    <br><br>

    <input type="submit" value="検索">

</form>

<hr>

<table border="1">

    <tr>
        <th>商品ID</th>
        <th>商品名</th>
        <th>ジャンル</th>
        <th>売上合計数</th>
        <th>売上合計金額</th>
    </tr>

    <tr>
        <td>1</td>
        <td>ブレンドコーヒー</td>
        <td>ドリンク</td>
        <td>35</td>
        <td>17,500</td>
    </tr>

    <tr>
        <td>2</td>
        <td>チーズケーキ</td>
        <td>デザート</td>
        <td>12</td>
        <td>6,000</td>
    </tr>

</table>

</body>
<script>
const daily = document.getElementById("daily");
const monthly = document.getElementById("monthly");

const dailyArea = document.getElementById("dailyArea");
const monthlyArea = document.getElementById("monthlyArea");

function switchArea() {
    if (daily.checked) {
        dailyArea.style.display = "block";
        monthlyArea.style.display = "none";
    } else {
        dailyArea.style.display = "none";
        monthlyArea.style.display = "block";
    }
}

daily.addEventListener("change", switchArea);
monthly.addEventListener("change", switchArea);

// 初期表示
switchArea();
</script>
</html>