<%--
  Created by IntelliJ IDEA.
  User: chaumy
  Date: 24/04/2022
  Time: 22:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Edit Customer</title>
    <title>Create Customer</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
          integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap4.min.css">
</head>
<body>
<center>
    <h1>Edit Customer</h1>
    <h2>
        <a href="/customer?action=list">List All Customer</a>
    </h2>
    <c:if test="${message != null}">
        <div class="alert alert-success" role="alert">
                ${message}
        </div>
    </c:if>
</center>
<div align="center">
    <form method="post">
        <table border="1" cellpadding="5">
            <c:if test="${customerList != null}">
                <input type="hidden" name="id" value='${customerList.idCustomer}'/>
            </c:if>
            <tr>
                <th>Name:</th>
                <td>
                    <input type="text" name="name" id="name" size="45" value="${customerList.name}"/>
                    <p style="color: red">${validate.get("name")}</p>
                </td>
            </tr>
            <tr>
                <th>Date Of Birth:</th>
                <td>
                    <input type="date" name="dateOfBirth" id="dateOfBirth" size="45" value="${customerList.dateOfBirth}"/>
                </td>
            </tr>
            <tr>
                <th>Gender:</th>
                <td>
                    <c:if test="${customerList.gender == 1}">
                        <select name="gender" id="gender">
                            <option selected value="1">Male</option>
                            <option value="0">Female</option>
                        </select>
                    </c:if>
                    <c:if test="${customerList.gender == 0}">
                        <select name="gender" id="gender">
                            <option value="1">Male</option>
                            <option selected value="0">Female</option>
                        </select>
                    </c:if>

                </td>
            </tr>
            <tr>
                <th>Id Card:</th>
                <td>
                    <input type="text" name="idCard" id="idCard" size="15" value="${customerList.idCard}"/>
                    <p style="color: red">${validate.get("idCard")}</p>
                </td>
            </tr>
            <tr>
                <th>Phone:</th>
                <td>
                    <input type="text" name="phone" id="phone" size="15" value="${customerList.phone}"/>
                    <p style="color: red">${validate.get("phone")}</p>
                </td>
            </tr>
            <tr>
                <th>Email:</th>
                <td>
                    <input type="text" name="email" id="email" size="15" value="${customerList.email}"/>
                    <p style="color: red">${validate.get("email")}</p>
                </td>
            </tr>
            <tr>
                <th>Address:</th>
                <td>
                    <input type="text" name="address" id="address" size="15" value="${customerList.address}"/>
                </td>
            </tr>
            <tr>
                <th>Type:</th>
                <td>
                    <select name="type" id="type">
                        <c:forEach items="${customerTypeList}" var="type">
                            <c:if test="${customerList.type == type.idCustomerType}">
                                <option selected value="${type.idCustomerType}">${type.nameCustomerType}</option>
                            </c:if>
                            <c:if test="${customerList.type != type.idCustomerType}">
                                <option value="${type.idCustomerType}">${type.nameCustomerType}</option>
                            </c:if>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="Save"/>
                </td>
            </tr>
        </table>
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
        integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js"
        integrity="sha384-VHvPCCyXqtD5DqJeNxl2dtTyhF78xXNXdkwX1CZeRusQfRKp+tA7hAShOK/B/fQ2"
        crossorigin="anonymous"></script>
</body>
</html>
