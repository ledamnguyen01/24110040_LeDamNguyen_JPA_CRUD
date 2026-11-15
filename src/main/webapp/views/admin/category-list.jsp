<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Category List - JPA</title>
</head>
<body>
<h2>Quản lý Danh mục (JPA 3.0)</h2>
<a href="<c:url value="/admin/category/add"/>">Add Category (Thêm danh mục)</a><br>
<hr>
<table border="1" cellpadding="8" cellspacing="0" width="100%">
    <thead>
        <tr bgcolor="#f2f2f2">
            <th>STT</th>
            <th>Images</th>
            <th>Category name</th>
            <th>Status</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${listcate}" var="cate" varStatus="STT">
            <tr align="center">
                <td>${STT.index + 1}</td>
                
                <!-- Phân biệt ảnh online https:// và ảnh upload local -->
                <c:choose>
                    <c:when test="${cate.images != null && cate.images.startsWith('http')}">
                        <c:url value="${cate.images}" var="imgUrl"></c:url>
                    </c:when>
                    <c:otherwise>
                        <c:url value="/image?fname=${cate.images}" var="imgUrl"></c:url>
                    </c:otherwise>
                </c:choose>
                
                <td>
                    <img height="100" width="120" src="${imgUrl}" onerror="this.src='https://placehold.co/120x100?text=No+Image';" />
                </td>
                <td align="left"><b>${cate.categoryname}</b></td>
                <td>
                    <c:choose>
                        <c:when test="${cate.status == 1}">
                            <span style="color: green; font-weight: bold;">Hoạt động</span>
                        </c:when>
                        <c:otherwise>
                            <span style="color: red; font-weight: bold;">Khóa</span>
                        </c:otherwise>
                    </c:choose>
                </td>
                <td>
                    <a href="<c:url value='/admin/category/edit?id=${cate.categoryId}'/>">Sửa</a> | 
                    <a href="<c:url value='/admin/category/delete?id=${cate.categoryId}'/>" 
                       onclick="return confirm('Bạn có chắc chắn muốn xóa danh mục này?');">Xóa</a>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>
</body>
</html>