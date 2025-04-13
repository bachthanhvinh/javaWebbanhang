<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Danh sách sản phẩm</title>
    <style>
        .product {
            border: 1px solid #ccc;
            padding: 10px;
            margin: 10px;
            float: left;
            width: 200px;
            text-align: center;
        }
        img {
            width: 100%;
            height: auto;
        }
    </style>
</head>
<body>
    <h2>Danh sách sản phẩm</h2>
    <div>
        <c:forEach var="p" items="${products}">
            <div class="product">
                <img src="${p.image}" alt="${p.name}">
                <h3>${p.name}</h3>
                <p>Giá: ${p.price} đ</p>
                <p>${p.description}</p>
                <button>Thêm vào giỏ</button>
            </div>
        </c:forEach>
    </div>
</body>
</html>
