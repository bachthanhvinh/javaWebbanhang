<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
<head>
    <title>Trang quản trị</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <style>
        .container-home {
            height: 511px;
        }

        .nav-link.active {
            background-color: #0d6efd;
            color: white !important;
            font-weight: bold;
            border-radius: 4px;
        }

        .navbar-brand.active {
            background-color: #0d6efd;
            padding: 5px 10px;
            border-radius: 6px;
            color: white !important;
            font-weight: bold;
        }
    </style>
</head>

<body>

<%-- Lấy URL hiện tại --%>
<c:set var="currentPage" value="${currentPath}" />
<c:set var="isProduct" value="${fn:contains(currentPage, 'product_view')}" />
<c:set var="isDetail" value="${fn:contains(currentPage, 'chi_tiet_san_pham')}" />
<c:set var="isOrder" value="${fn:contains(currentPage, 'order')}" />



<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <a class="navbar-brand " href="<c:url value='/'/>">Dashboard</a>

    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarContent"
            aria-controls="navbarContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link ${isProduct ? 'active' : ''}" href="<c:url value='/product_view'/>">Sản phẩm</a>
            </li>
            <li class="nav-item">
                <a class="nav-link ${isDetail ? 'active' : ''}" href="<c:url value='/chi_tiet_san_pham'/>">Chi tiết sản phẩm</a>
            </li>
            <li class="nav-item">
                <a class="nav-link ${isOrder ? 'active' : ''}" href="<c:url value='/order'/>">Order</a>
            </li>
        </ul>

        <!-- Nút đăng xuất -->
        <form class="form-inline my-2 my-lg-0">
            <button class="btn btn-outline-light my-2 my-sm-0" type="submit">Đăng xuất</button>
        </form>
    </div>
</nav>

<!-- Nội dung chính -->
<div class="container mt-4">
    <c:if test="${empty bodyPage}">
        <div class="d-flex container-home align-items-center">
            <h1 class="mx-3">Tổng kho:</h1>
            <h1>Tổng order:</h1>
        </div>
    </c:if>

    <c:if test="${not empty bodyPage}">
        <jsp:include page="${bodyPage}" />
    </c:if>
</div>

<!-- Footer -->
<footer class="bg-primary text-white text-center py-3 mt-5">
    &copy; 2025 - Team code gà mờ
</footer>

<!-- Bootstrap JS + jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
