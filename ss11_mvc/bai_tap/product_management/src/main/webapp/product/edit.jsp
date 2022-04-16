<%--
  Created by IntelliJ IDEA.
  User: chaumy
  Date: 14/04/2022
  Time: 17:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h3>Edit Product Page</h3>
<%--<c:if test="${message != null}">--%>
<%--    <p style="color: green">${message}</p>--%>
<%--</c:if>--%>
<a href="/product">Back to list</a>
<form method="post">
    <fieldset>
        <legend>Update Product</legend>
        <label>Product Name:</label>
        <input type="text" name="name" value="${product.getName()}"><br><br>
        <label>Product Price:</label>
        <input type="text" name="price" value="${product.getPrice()}"><br><br>
        <label>Manufacturer Name:</label>
        <input type="text" name="manufactor" value="${product.getManufactor()}"><br><br>
        <input type="submit" value="Update">
    </fieldset>
</form>
</body>
</html>
