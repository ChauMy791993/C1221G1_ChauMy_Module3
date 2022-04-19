<%--
  Created by IntelliJ IDEA.
  User: chaumy
  Date: 18/04/2022
  Time: 15:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %><html>
<head>
    <title>User Management Application</title>
</head>
<body>
<center>
    <h1><a href="/users">User Management</a></h1>
    <h2>
        <a href="/users?action=create">Add New User</a>
    </h2>
</center>
<center>
    <form method="get">
        <input type="hidden" name="action" value="search">
        <input type="text" name="keyword">
        <button type="submit" >Search</button>
    </form>
    <form method="get">
        <input type="hidden" name="action" value="sort">
        <input type="submit" value="sort">
    </form>
</center>
<div align="center">
    <table border="1" cellpadding="5">
        <caption><h2>List of Users</h2></caption>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Country</th>
            <th>Actions</th>
        </tr>
        <c:forEach var="user" items="${listUser}">
            <tr>
                <td><c:out value="${user.id}"/></td>
                <td><c:out value="${user.name}"/></td>
                <td><c:out value="${user.email}"/></td>
                <td><c:out value="${user.country}"/></td>
                <td>
                    <a href="/users?action=edit&id=${user.id}">Edit</a>
                    <a href="/users?action=delete&id=${user.id}">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
