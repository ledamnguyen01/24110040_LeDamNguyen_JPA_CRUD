<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Category</title>
</head>
<body>
<h2>Cập Nhật Danh Mục (JPA)</h2>
<form action="<c:url value="/admin/category/update"/>" method="post" enctype="multipart/form-data">
    <input type="hidden" name="categoryid" value="${cate.categoryId}">

    <label for="categoryname"><b>Category name (Tên danh mục):</b></label><br>
    <input type="text" id="categoryname" name="categoryname" value="${cate.categoryname}" style="width: 300px;" required><br><br>

    <label for="images"><b>Link images (URL ảnh Online):</b></label><br>
    <input type="text" id="images" name="images" value="${cate.images}" style="width: 300px;"><br><br>

    <!-- Hiển thị ảnh hiện tại -->
    <c:choose>
        <c:when test="${cate.images != null && cate.images.startsWith('http')}">
            <c:url value="${cate.images}" var="imgUrl"></c:url>
        </c:when>
        <c:otherwise>
            <c:url value="/image?fname=${cate.images}" var="imgUrl"></c:url>
        </c:otherwise>
    </c:choose>
    <label><b>Ảnh hiện tại:</b></label><br>
    <img height="100" width="120" src="${imgUrl}" onerror="this.src='https://placehold.co/120x100?text=No+Image';" /><br><br>

    <label for="images1"><b>Upload images (Chọn nếu muốn đổi ảnh mới từ máy):</b></label><br>
    <input type="file" id="images1" name="images1" accept="image/*"><br><br>

    <label><b>Status (Trạng thái):</b></label><br>
    <input type="radio" id="ston" name="status" value="1" ${cate.status == 1 ? 'checked' : ''}>
    <label for="ston">Hoạt động</label>
    <input type="radio" id="stoff" name="status" value="0" ${cate.status != 1 ? 'checked' : ''}>
    <label for="stoff">Khóa</label>
    <br><br>

    <input type="submit" value="Update (Cập nhật)">
    <a href="<c:url value='/admin/categories'/>">Quay lại danh sách</a>
</form>
</body>
</html>