<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Chỉnh sửa sản phẩm</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .card {
            margin: 50px auto;
            max-width: 600px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .card-header {
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
        }
        .form-control, .btn {
            border-radius: 8px;
        }
        .btn {
            padding: 10px 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="card">
            <div class="card-header bg-primary text-white text-center">
                <h4>Chỉnh sửa sản phẩm</h4>
            </div>
            <div class="card-body">
                <form action="/webBanHang/editsave" method="post">
                    <input type="hidden" name="productId" value="${product.productId}">

                    <div class="mb-3">
                        <label for="productName" class="form-label">Tên sản phẩm:</label>
                        <input type="text" class="form-control" id="productName" name="productName"
                               value="${product.productName}" placeholder="Nhập tên sản phẩm" required>
                    </div>

                    <div class="mb-3">
                        <label for="description" class="form-label">Mô tả:</label>
                        <textarea class="form-control" id="description" name="description" rows="4" placeholder="Nhập mô tả sản phẩm">${product.description}</textarea>
                    </div>

                    <div class="mb-3">
                        <label for="price" class="form-label">Giá sản phẩm:</label>
                        <input type="number" step="0.01" class="form-control" id="price" name="price"
                               value="${product.price}" placeholder="Nhập giá sản phẩm" required>
                    </div>
              

                    <div class="mb-3">
                        <label for="imageUrl" class="form-label">Link hình ảnh:</label>
                        <input type="text" class="form-control" id="imageUrl" name="imageUrl"
                               value="${product.imageUrl}" placeholder="Nhập URL hình ảnh sản phẩm">
                    </div>
                     <div class="mb-3">
                        <label for="categoryId" class="form-label">Danh mục :</label>
                        <input type="text" class="form-control" id="categoryId" name="categoryId"
                               value="${product.categoryId}" placeholder="Nhập danh mục sản phẩm">
                    </div>

                    <div class="text-center">
                        <button type="submit" class="btn btn-success">Lưu</button>
                        <a href="/webBanHang/product_view" class="btn btn-secondary">Hủy</a>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
