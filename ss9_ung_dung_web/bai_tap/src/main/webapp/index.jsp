<%--
  Created by IntelliJ IDEA.
  User: chaumy
  Date: 13/04/2022
  Time: 09:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Product Discount Calculator</title>
</head>
<body>
<h2>Product Discount Calculator</h2>
<form action="/discount" method="post">
    <label>Product Description:</label>
    <br/>
    <input type="text" name="product" placeholder="Product"/>
    <br/>
    <label>List Price:</label>
    <br/>
    <input type="text" name="price" placeholder="Price" value="0"/>
    <br/>
    <label>Discount Percent: </label>
    <br/>
    <input type="text" name="percent" placeholder="Discount Percent"/>
    <br/>
    <input type="submit" id="submit" value="Calculate Discount"/>
</form>
</body>
</html>
