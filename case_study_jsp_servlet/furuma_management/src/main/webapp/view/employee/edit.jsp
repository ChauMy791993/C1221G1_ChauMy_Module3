<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 3/5/2022
  Time: 12:09 PM
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
    <h1>Edit Employee</h1>
    <h2>
        <a href="/employee?action=list">List All Employee</a>
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
            <c:if test="${employee != null}">
                <input type="hidden" name="id" value='${employee.employeeId}'/>
            </c:if>
            <tr>
                <th>Employee Name:</th>
                <td>
                    <input type="text" name="name" id="name" size="45" value="${employee.employeeName}"/>
                    <p style="color: red">${validate.get("name")}</p>
                </td>
            </tr>
            <tr>
                <th>Employee Birthday:</th>
                <td>
                    <input type="number" name="birthday" id="birthday" size="15" value="${employee.employeeBirthday}"/>
                </td>
            </tr>
            <tr>
                <th>Employee IdCard:</th>
                <td>
                    <input type="date" name="idCard" id="idCard" size="15" value="${employee.employeeIdCard}"/>
                    <p style="color: red">${validate.get("idCard")}</p>
                </td>
            </tr>
            <tr>
                <th>salary:</th>
                <td>
                    <input type="number" name="salary" id="salary" size="15" value="${employee.salary}"/>
                </td>
            </tr>
            <tr>
                <th>phone:</th>
                <td>
                    <input type="text" name="phone" id="phone" size="15" value="${employee.phone}"/>
                    <p style="color: red">${validate.get("phone")}</p>
                </td>
            </tr>
            <tr>
                <th>email:</th>
                <td>
                    <input type="text" name="email" id="email" size="15" value="${employee.email}"/>
                    <p style="color: red">${validate.get("email")}</p>
                </td>
            </tr>
            <tr>
                <th>address:</th>
                <td>
                    <input type="text" name="address" id="address" size="15" value="${employee.address}"/>
                </td>
            </tr>
            <tr>
                <th>position:</th>
                <td>
                    <select name="idPosition" id="idPosition">
                        <c:forEach items="${positionList}" var="position">
                            <c:if test="${employee.position == position.positionId}">
                                <option selected value="${position.positionId}">${position.positionName}</option>
                            </c:if>
                            <c:if test="${employee.position != position.positionId}">
                                <option value="${position.positionId}">${position.positionName}</option>
                            </c:if>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <th>EducationDegree:</th>
                <td>
                    <select name="idEducationDegree" id="idEducationDegree">
                        <c:forEach items="${educationDegreeList}" var="educationDegree">
                            <c:if test="${employee.educationDegree == educationDegree.educationDegreeId}">
                                <option selected value="${educationDegree.educationDegreeId}">${educationDegree.educationDegreeName}</option>
                            </c:if>
                            <c:if test="${employee.educationDegree != educationDegree.educationDegreeId}">
                                <option value="${educationDegree.educationDegreeId}">${educationDegree.educationDegreeName}</option>
                            </c:if>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <th>Division:</th>
                <td>
                    <select name="idDivision" id="idDivision">
                        <c:forEach items="${divisionList}" var="division">
                            <c:if test="${employee.division == division.divisionId}">
                                <option selected value="${division.divisionId}">${division.divisionName}</option>
                            </c:if>
                            <c:if test="${employee.division != division.divisionId}">
                                <option value="${division.divisionId}">${division.divisionName}</option>
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
