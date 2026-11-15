<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Category</title>
</head>
<body>
<h2>Thêm Danh Mục Mới (JPA)</h2>
<form action="<c:url value="/admin/category/insert"/>" method="post" enctype="multipart/form-data">
    <label for="categoryname"><b>Category name (Tên danh mục):</b></label><br>
    <input type="text" id="categoryname" name="categoryname" style="width: 300px;" required><br><br>

    <label for="images"><b>Link images (URL ảnh Online):</b></label><br>
    <input type="text" id="images" name="images" style="width: 300px;" placeholder="https://..."><br><br>

    <label for="images1"><b>Upload images (Chọn file từ máy tính):</b></label><br>
    <input type="file" id="images1" name="images1" accept="image/*"><br><br>

    <label><b>Status (Trạng thái):</b></label><br>
    <input type="radio" id="ston" name="status" value="1" checked>
    <label for="ston">Hoạt động</label>
    <input type="radio" id="stoff" name="status" value="0">
    <label for="stoff">Khóa</label>
    <br><br>

    <input type="submit" value="Insert (Thêm mới)">
    <a href="<c:url value='/admin/categories'/>">Quay lại danh sách</a>
</form>
</body>
</html>