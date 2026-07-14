<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${culcdate}日売上登録</title>
</head>
<body>
	<table class="table table-striped table-bordered">
		<thead class="table-dark">
  			<tr>
				<th>商品ID</th>
    			<th>商品名</th>
    			<th>売上数</th>
    			<th>売上金額</th>
			</tr>
  			<c:choose>
    			<c:when test="${empty dailysales }">
					</thead>
    				</table>
				    <p>まだ売上が確認されていません</p>
			    </c:when>
    		<c:otherwise>
			    <c:forEach var="d" items="${dailysales}">
        			<tr>
        				<td>${d.product_id}</td>
			        	<td>${d.product_name}</td>
        				<td>${d.total_quantity}</td>
        				<td>${d.total_amount}</td>
	        		</tr>
			    </c:forEach>
        		</thead>
			    </table>
    		</c:otherwise>
			</c:choose>
	<form action="${pageContext.request.contextPath}/sales/servlet/DailySalesRegistration.action">
		<input type="hidden" id="culcdate" name="calcdate" value="${calcdate}">
		<button type="submit">登録</button>
	</form>
</body>
</html>