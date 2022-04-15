<%--
  Created by IntelliJ IDEA.
  User: chaumy
  Date: 14/04/2022
  Time: 17:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Product List</title>
</head>
<body>
<p>
<a href="/customers?action=create">Create new customer</a>
</p>
<table border="1">
    <tr>
        <td>Id</td>
        <td>Tên</td>
        <td>Giá</td>
        <td>Nhà sản xuất</td>
        <td>Sửa</td>
        <td>Xóa</td>
    </tr>
    <c:forEach items='${products}' var="product">
        <tr>
            <td>${product.id}</td>
            <td>${product.name}</td>
            <td>${product.price}</td>
            <td>${product.manufactor}</td>
            <td><a href="">Sửa</a></td>
            <td><a href="">Xóa</a></td>
        </tr>
    </c:forEach>


</table>
</body>
</html>
