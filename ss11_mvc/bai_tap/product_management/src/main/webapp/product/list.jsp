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
<h1>Product List</h1>
<a href="/product?action=create">Create new product</a>
<a href="/product?action=search">Search product</a>
<%--<c:if test="${message} != null}">--%>
    <p style="color: green">${message}</p>
<%--</c:if>--%>
<table border="1">
    <tr>
        <td>STT</td>
        <td>Tên</td>
        <td>Giá</td>
        <td>Nhà sản xuất</td>
        <td>Sửa</td>
        <td>Xóa</td>
    </tr>
    <c:choose>
        <c:when test="${product != null}">
            <c:forEach items='${product}' var="product" varStatus="index">
                <tr>
                    <td>${product.getId()}</td>
                    <td>${product.getName()}</td>
                    <td>${product.getPrice()}</td>
                    <td>${product.getManufactor()}</td>
                    <td><a href="/product?action=update&id=${product.getId()}">Sửa</a></td>
                    <td><a href="/product?action=delete&id=${product.getId()}">Xóa</a></td>
                </tr>
            </c:forEach>
        </c:when>
        <c:otherwise>
            <tr>
                <td>
                    Chưa có sản phẩm nào trong danh sách
                </td>
            </tr>
        </c:otherwise>


    </c:choose>



</table>
</body>
</html>
