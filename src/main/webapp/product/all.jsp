<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Map" %>

<jsp:include page="all.jsp" />
<h2>商品一覧</h2>
<table border="1" style="border-collapse: collapse; width: 100%;">
<tr style="background-color: #e3f2fd;">
<th>商品ID</th>
<th>商品名</th>
<th>ジャンルID</th>
<th>価格</th>
<th>操作</th>
</tr>
<%
List<Map<String, Object>> products = (List<Map<String, Object>>) request.getAttribute("products");
if (products != null) {
   for (Map<String, Object> product : products) {
%>

<tr>
<td><%= product.get("id") %></td>
<td><%= product.get("name") %></td>
<td><%= product.get("genreId") %></td>
<td><%= product.get("price") %></td>
<td>

<form action="DeleteServlet" method="post" style="display:inline;">
<input type="hidden" name="product_id" value="<%= product.get("id") %>">
<input type="submit" value="削除" onclick="return confirm('本当に削除しますか？');">
</form>

<form action="EditServlet" method="get" style="display:inline; margin-left: 5px;">
<input type="hidden" name="product_id" value="<%= product.get("id") %>">
<input type="submit" value="変更">
</form>
</td>
</tr>
<%
   }
}
%>
</table>

<jsp:include page="main.jsp" />