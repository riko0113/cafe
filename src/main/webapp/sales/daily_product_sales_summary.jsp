<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>日次商品別売上合計確認</title>
</head>
<body>

<h1>${targetDate}日商品別売上合計確認画面</h1>

<form action="${pageContext.request.contextPath}/sales/servlet/DailyProductSalesSummary.action" method="post">
    <h3>集計日</h3>
    <div id="dailyArea">
        <label>対象日</label>
        <input type="date" name="targetDate">
    </div>
    <button type="submit" value="検索">検索</button>
</form>

<hr>

<h3 class="mb-3">商品売上一覧</h3>
<table class="table table-striped table-bordered">
	<thead class="table-dark">
		<tr>
        	<th>商品ID</th>
        	<th>商品名</th>
        	<th>ジャンル</th>
        	<th>売上合計数</th>
        	<th>売上合計金額</th>
    	</tr>
		<c:choose>
			<c:when test="${empty dailysales}">
				</thead>
				</table>
				<p>まだ売上が登録されていません</p>
			</c:when>
			<c:otherwise>
				<c:forEach var="ds" items="${dailysales}">
					<tr>
						<td>${ds.product_id}</td>
						<td>${ds.product_name}</td>
						<td>${ds.genre_name}</td>
						<td>${ds.total_quantity}</td>
						<td>${ds.total_amount}</td>
					</tr>
				</c:forEach>
				</thead>
				</table>
			</c:otherwise>
		</c:choose>

</body>
<script>
</script>
</html>