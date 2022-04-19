<%--
  Created by IntelliJ IDEA.
  User: chaumy
  Date: 19/04/2022
  Time: 16:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
<header class=" px-3 navbar navbar-light" style="background-color: #c7ecee">
    <a class="navbar-brand" href="#">
        <img src="https://furamavietnam.com/wp-content/uploads/2018/10/logo.png" height="100" width="100" alt="">
    </a>
    <div class="my-2 my-lg-0">
        <h3> Châu Mỹ</h3>
    </div>
</header>

<nav class=" px-5 navbar navbar-expand-lg navbar-dark fs-5" style="background-color: #95afc0">
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item ">
                <a class="nav-link active" href="#">Home</a>
            </li>
            <li class="nav-item ">
                <a class="nav-link" href="#">Employee</a>
            </li>
            <li class="nav-item ">
                <a class="nav-link" href="#">Customer</a>
            </li>
            <li class="nav-item ">
                <a class="nav-link" href="#">Service</a>
            </li>
            <li class="nav-item ">
                <a class="nav-link" href="#">Contract</a>
            </li>
        </ul>
        <form class="form-inline my-2 my-lg-0">
            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
        </form>
    </div>
</nav>


<div class="row">
    <div class="col-sm-2 border-end bg-white" id="sidebar">
        <div class="list-group list-group-flush border">
            <a class="list-group-item list-group-item-action  p-3" href="#!">Item one</a>
            <a class="list-group-item list-group-item-action  p-3" href="#!">Item two</a>
            <a class="list-group-item list-group-item-action  p-3" href="#!">Item three</a>
        </div>
    </div>
    <div class="col-sm-10 px-3">
        <p>body</p>
    </div>
</div>


<footer class="text-center text-lg-start">
    <div class="text-center p-4" style="background-color: #535c68;color: white">
        © FURAMA Resort Da Nang
    </div>
</footer>






<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
</body>
</html>
