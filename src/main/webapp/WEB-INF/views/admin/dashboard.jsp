<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Trang quản trị</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
    .container-home {
       height: 511px;
    }
    .nav-item .active {
    color:white;
    }
    </style>
</head>
<body>


<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <a class="navbar-brand" href="/webBanHang">Dashboard</a>

    
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarContent"
            aria-controls="navbarContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

   
    <div class="collapse navbar-collapse" id="navbarContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link active " href="<c:url value='/product_view'/>">Sản phẩm</a>
            </li>
            <li class="nav-item">
                <a class="nav-link active" href="<c:url value='/product_create_form'/>">Chi tiết sản phẩm</a>
            </li>
            <li class="nav-item">
                <a class="nav-link active" href="<c:url value='/product_create_form'/>">Order</a>
            </li>
             
        </ul>

        
        <form class="form-inline my-2 my-lg-0">
            <button class="btn btn-outline-light my-2 my-sm-0" type="submit">Đăng xuất</button>
        </form>
    </div>
</nav>



<div class="container mt-4">
     <c:if test="${empty bodyPage }">
     <div class="d-flex container-home ">
        <h1 class="mx-3">tổng Kho:</h1>
        <h1>tổng order: </h1>
        </div>
    </c:if>
    <jsp:include page="${bodyPage}" />
</div>


<footer class="bg-primary text-white text-center py-3 mt-5">
    &copy; 2025 - Team code gà mờ
</footer>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
document.addEventListener("DOMContentLoaded", function () {
    const links = document.querySelectorAll(".nav-item");

    links.forEach(link => {
      link.addEventListener("click", function () {
        // Xoá class active khỏi tất cả các nav-link
        links.forEach(l => l.classList.remove("active"));

        // Thêm class active cho phần tử được click
        this.classList.add("active");
      });
    });
  });
</script>

</body>
</html>
