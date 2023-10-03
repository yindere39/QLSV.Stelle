<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Quản Lý Sinh Viên</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/boots
trap.min.css">
</head>
<body>
	<header>
		<nav class="navbar navbar-expand-md navbar-dark"
			style="background-color: tomato">
			<div>
				<a href="#" class="navbar-brand"> Quản Lý </a>
			</div>
			<ul class="navbar-nav">
				<li><a href="<%=request.getContextPath()%>/list"
					class="nav-link">Sinh viên</a></li>
			</ul>
		</nav>
	</header>
	<br>
	<div class="row">
		<!-- <div class="alert alert-success" 
*ngIf='message'>{{message}}</div> -->
		<div class="container">
			<h3 class="text-center">Danh sách sinh viên</h3>
			<hr>
			<div class="container text-left">
				<a href="<%=request.getContextPath()%>/newsv"
					class="btn 
btn-success">Thêm Sinh Viên Mới</a>
			</div>
			<br>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>ID</th>
						<th>Tên Sinh viên</th>
						<th>Lớp ID</th>
					</tr>
				</thead>
				<tbody>
					<!-- for (Todo todo: todos) { -->
					<c:forEach var="sv" items="${listSV}">
						<tr>
							<td><c:out value="${sv.id}" /></td>
							<td><c:out value="${sv.ten}" /></td>
							<td><c:out value="${sv.lop_id}" /></td>
							<td><a href="editsv?id=<c:out value='${sv.id}' />">Sửa</a>
								&nbsp;&nbsp;&nbsp;&nbsp; <a
								href="deletesv?id=<c:out 
value='${sv.id}' />">Xoá</a></td>
						</tr>
					</c:forEach>
					<!-- } -->
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>