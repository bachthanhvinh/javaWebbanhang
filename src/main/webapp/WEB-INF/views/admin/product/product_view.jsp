<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Danh sách sản phẩm</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>

<div class="container mt-5">
    <h2 class="text-center mb-4">DANH SÁCH SẢN PHẨM</h2>

    <div class="mb-3">
        <a href="product_create_form" class="btn btn-success">+ Thêm sản phẩm mới</a>
    </div>

    <table class="table table-bordered table-hover">
        <thead class="thead-dark">
            <tr>
                <th>ID</th>
                <th>Tên sản phẩm</th>
                <th>Mô tả</th>
                <th>Giá</th>
                <th>Hình ảnh</th>
                <th>Danh Mục</th>
                <th>Hành động</th>
            </tr>
        </thead>
        <tbody>
        <c:forEach var="product" items="${list}">
            <tr>
                <td>${product.productId}</td>
                <td>${product.productName}</td>
                <td>${product.description}</td>
                <td>${product.price}</td>
                
                <td>
                    <c:if test="${not empty product.imageUrl}">
                        <img src="${product.imageUrl}" alt="Hình ảnh" style="width: 100px; height: auto;">
                    </c:if>
                </td>
                <td>${product.categoryId}</td>
                <td >
                <div class="d-flex ">
                   <a href="editproduct/${product.productId}" class="btn btn-warning btn-sm mx-2">Sửa</a>
                    <a href="deleteproduct/${product.productId}" 
                       onclick="return confirm('Bạn có chắc chắn muốn xóa sản phẩm này không?');" 
                       class="btn btn-danger btn-sm">Xóa</a>
                </div>
                 
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>
