<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix="tag" uri="/WEB-INF/customTaglib.tld" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet"
 href="${pageContext.request.contextPath}/source/style.css">
</head>
<body>
<h2> Tim kiem sinh vien</h2>
<form th:action="@{/}">
    Ten sinh vien: <input type="text" name="keyword" id="keyword" VALUE="<%out.print(request.getParameter("keyword") != null ? request.getParameter("keyword") : "");%>" size="50" th:value="${keyword}" />
    &nbsp;
    Lop ID: <input type="text" name="lopStelle" id="lopStelle" VALUE="<%out.print(request.getParameter("lopStelle") != null ? request.getParameter("lopStelle") : "");%>" size="50" th:value="${lopStelle}" />
    &nbsp;
    <input type="submit" value="Search" />
    &nbsp;
    <input type="button" value="Clear" id="btnClear" onclick="clearSearch()" />
</form>
    <div id="wrapper">
        <div id="header">
            <h2>Simple Student list in Class X</h2>
        </div>    
    </div>
    <div id="container">
        <div id="content">
        <input type="button" value="Add Student" class="add-button"
            onclick="window.location.href='addSinhvien';return false;"/>
            <table>
                <tr>
                    <th>ID</th>
                    <th>Ten Sinh Vien</th>
                    <th>ID Lop</th>
                    <th>Action</th>
                </tr>
                <c:forEach var="tempStudent" items="${sinhvien}">
                    <!-- Constuct an update link -->
                    <c:url var="updateLink" value="/sinhvien/updateSinhvien">
                        <c:param name="sinhvienID" value="${tempStudent.id}"/>
                    </c:url>
                    <!-- Construct an delete link -->
                    <c:url var="deleteLink" value="/sinhvien/deleteSinhvien">
                        <c:param name="sinhvienID" value="${tempStudent.id}"/>
                    </c:url>
                    <tr>
                        <td>${tempStudent.id}</td>
                        <td>${tempStudent.ten_sinh_vien}</td>
                        <td>${tempStudent.id_lop}</td>
                        <!-- display update link -->
                        <td><a href="${updateLink}">Update</a>
                              <a href="${deleteLink}"
                              onclick="if(!(confirm('Ban chac chan muon xoa khong?'))) return false">Delete</a>
                        </td>
                    </tr>    
                </c:forEach>
            </table>
            <tag:paginate max="10" offset="${offset}" keyword="${keyword}" lopStelle="${lopStelle}" count="${count}" uri="listSinhvien" next="&raquo;" previous="&laquo;"/>
        </div>
    </div>   
</body>
</html>

<script type="text/javascript">
    function clearSearch() {
    	document.getElementById('keyword').value = '';
    }
</script>

<script type="text/javascript">
    function clearSearch() {
    	document.getElementById('lopStelle').value = '';
    }
</script>