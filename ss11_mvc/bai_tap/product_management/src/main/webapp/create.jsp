<%--
  Created by IntelliJ IDEA.
  User: chaumy
  Date: 14/04/2022
  Time: 17:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create Product</title>
</head>
<body>
<form method="post">
    <label>Tên sản phẩm</label>
    <input type="text" name="name"><br>
    <p style="color:red;">${error.get("name")}</p>
    <label>Giá</label>
    <input type="number" name="price"><br>
    <br>
    <label>Nhà sản xuất</label>
    <input type="text" name="manufactor"><br>
    <button type="submit">Thêm mới</button>
</form>

</body>
</html>
