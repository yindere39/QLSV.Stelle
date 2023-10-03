<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Quản Lý Sinh Viên</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/boots
trap.min.css">
</head>
<body>
	<header>
		<nav class="navbar navbar-expand-md navbar-dark"
			style="background-color: tomato">
			<div>
				<a href="https://www.javaguides.net" class="navbar-brand"> Quản Lý </a>
			</div>
			<ul class="navbar-nav">
				<li><a href="<%=request.getContextPath()%>/list" class="nav-link">Sinh viên</a></li>
			</ul>
		</nav>
	</header>
	<br>
	<div class="container col-md-5">
		<div class="card">
			<div class="card-body">
				<c:if test="${sv != null}">
					<form action="updatesv" method="post">
				</c:if>
				<c:if test="${sv == null}">
					<form action="insertsv" method="post">
				</c:if>
				<caption>
					<h2>
						<c:if test="${sv != null}"> Sửa thông tin sinh viên </c:if>
						<c:if test="${sv == null}"> Thêm sinh viên mới </c:if>
					</h2>
				</caption>
				<c:if test="${sv != null}">
					<input type="hidden" name="id" value="<c:out value='${sv.id}' />" />
				</c:if>
				<fieldset class="form-group">
					<label>Tên sinh viên</label> <input type="text"
						value="<c:out value='${sv.ten}' />" class="form-control"
						name="ten" required="required">
				</fieldset>
				<fieldset class="form-group">
					<label>Lớp ID</label> <input type="text"
						value="<c:out value='${sv.lop_id}' />" class="form-control"
						name="lop_id">
				</fieldset>
				<button type="submit" class="btn btn-success">Lưu</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>