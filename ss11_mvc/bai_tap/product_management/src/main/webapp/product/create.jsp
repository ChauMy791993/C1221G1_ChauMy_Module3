<%--
  Created by IntelliJ IDEA.
  User: chaumy
  Date: 14/04/2022
  Time: 17:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Create Product</title>
</head>
<body>
<h3>Create Product Page</h3>
<%--<c:if test="${message != null}">--%>
<%--    <p style="color: green">${message}</p>--%>
<%--</c:if>--%>
<a href="/product">Back to list</a>
<form method="post">
    <fieldset>
        <legend>Add new Product</legend>
        <label>Product Name:</label>
        <input type="text" name="name" placeholder="Product Name"><br><br>
        <label>Product Price:</label>
        <input type="text" name="price" placeholder="Product Price"><br><br>
        <label>Manufacturer Name:</label>
        <input type="text" name="manufactor" placeholder="Manufacturer Name"><br><br>
        <input type="submit" value="Add">
    </fieldset>
</form>

</body>
</html>
