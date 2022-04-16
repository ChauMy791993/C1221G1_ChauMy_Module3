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
    <title>Delete Product</title>
</head>
<body>
<h3>Delete Product Page</h3>
<%--<c:if test="${message != null}">--%>
<%--    <p style="color: green">${message}</p>--%>
<%--</c:if>--%>
<a href="/product">Back to list</a>
<form method="post">
    <h3>Are you sure?</h3>
    <fieldset>
        <legend>Product information</legend>
        <label>Product Name:</label>
        <p>${product.getName()}</p>
        <label>Product Price:</label>
        <p>${product.getPrice()}</p>
        <label>Manufacturer Name:</label>
        <p>${product.getManufactor()}</p>
        <input type="submit" value="Delete product">
    </fieldset>

</form>
</body>
</html>
