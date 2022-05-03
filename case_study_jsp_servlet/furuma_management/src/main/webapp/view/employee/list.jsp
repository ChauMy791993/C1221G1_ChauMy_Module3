<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 3/5/2022
  Time: 12:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
          integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap4.min.css">

</head>
<body>
<h1 style="text-align: center">
    <a href="/employee">Employee List</a>
    <c:if test="${message != null}">
        <div id="message" class="alert alert-success" role="alert">
                ${message}
        </div>
    </c:if>
</h1>
<h2>
    <form>
        <button type="submit">
            <input type="hidden" name="action" value="create">
            Add new employee
        </button>
    </form>
</h2>
<hr>
<h3>Search Employee</h3>
<div class="row">
    <form method="get" class="form-inline">
        <input type="hidden" name="action" value="search">
        <div class="col-4 mx-2">
            <input class="form-control mr-sm-2" type="search" placeholder="Search by id" aria-label="Search"
                   name="searchById" value="">
        </div>
        <div class="col-4 mx-2">
            <input class="form-control mr-sm-2" type="search" placeholder="Search by name" aria-label="Search"
                   name="searchByName" value="">
        </div>
        <div class="col-4 mx-2">
            <input class="form-control mr-sm-2" type="search" placeholder="Search by phone" aria-label="Search"
                   name="searchByPhone" value="">
        </div>
        <div class="col-4 mx-2">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
        </div>
    </form>
</div>
<table class="table table-striped" id="employee">
    <thead>
    <tr>
        <th>STT</th>
        <th>Mã nhân viên</th>
        <th>Họ và tên</th>
        <th>Ngày Sinh</th>
        <th>Số CMND</th>
        <th>lương</th>
        <th>Số điện thoại</th>
        <th>Email</th>
        <th>Địa chỉ</th>
        <th>Vị Trí</th>
        <th>Trình độ</th>
        <th>Bộ phận</th>
        <th>Sửa</th>
        <th>Xóa</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="employee" items="${employeeList}" varStatus="status">
        <tr>
            <th>${status.count}</th>
            <td>${employee.employeeId}</td>
            <td>${employee.employeeName}</td>
            <td>${employee.employeeBirthday}</td>
            <td>${employee.employeeIdCard}</td>
            <td>${employee.salary}</td>
            <td>${employee.phone}</td>
            <td>${employee.email}</td>
            <td>${employee.address}</td>
            <td>
                <c:forEach items="${positionList}" var="position">
                    <c:if test="${employee.position eq position.positionId}">
                        ${position.positionName}
                    </c:if>
                </c:forEach>
            </td>
            <td>
                <c:forEach items="${educationDegreeList}" var="educationDegree">
                    <c:if test="${employee.educationDegree eq educationDegree.educationDegreeId}">
                        ${educationDegree.educationDegreeName}
                    </c:if>
                </c:forEach>
            </td>
            <td>
                <c:forEach items="${divisionList}" var="division">
                    <c:if test="${employee.division eq division.divisionId}">
                        ${division.divisionName}
                    </c:if>
                </c:forEach>
            </td>
            <td>
                <button class="btn btn-info" type="button"><a href="/customer?action=edit&id=${product.id}"
                                                              style="color: white">Sửa</a></button>
            </td>
            <td>
                <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#deleteModal"
                        onclick="getId(${employee.employeeId}, '${employee.employeeName}')">
                    Xóa
                </button>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="deleteModalLabel">Delete Employee</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form method="post" action="/employee">
                <div class="modal-body">
                    <input type="hidden" name="action" value="delete">
                    <input type="hidden" id="get-id" name="id">
                    <h6>Employee delete: <h5 id="get-name"></h5></h6>
                    <h4 class="text-warning">Are you sure ?</h4>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-danger">Delete it !</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
<script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
        integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js"
        integrity="sha384-VHvPCCyXqtD5DqJeNxl2dtTyhF78xXNXdkwX1CZeRusQfRKp+tA7hAShOK/B/fQ2"
        crossorigin="anonymous"></script>
<script src="https://cdn.datatables.net/1.11.5/js/dataTables.bootstrap4.min.js"></script>
<script>
    function getId(id, name) {
        document.getElementById("get-id").value = id;
        document.getElementById("get-name").innerText = name;
    }

    $(document).ready(function () {
        $('#employee').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        });
    });
</script>
</body>
</html>
