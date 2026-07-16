<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>売上詳細</title>
</head>
<body>
<h1>日次売上合計確認画面</h1>


<h3 class="mb-3">売上一覧</h3>
<table class="table table-striped table-bordered">
	<thead class="table-dark">
		<tr>
        	<th>日付</th>
        	<th>売上合計金額</th>
        	<th>合計支払金額（税込）</th>
        	<th>合計税額</th>
    	</tr>
		<c:choose>
			<c:when test="${empty salessummarys}">
				</thead>
				</table>
				<p>まだ売上が登録されていません</p>
			</c:when>
			<c:otherwise>
				<c:forEach var="ss" items="${salessummarys}">
					<tr>
						<td>${ss.targetDate}</td>
						<td>${ss.totalInclTax}</td>
						<td>${ss.totalExclTax}</td>
						<td>${ss.totalTax}</td>
					</tr>
				</c:forEach>
				</thead>
				</table>
			</c:otherwise>
		</c:choose>
</body>
</html>