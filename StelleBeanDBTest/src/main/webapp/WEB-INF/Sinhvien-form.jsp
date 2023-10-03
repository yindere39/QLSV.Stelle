<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Save Sinh Vien</title>
<link type="text/css" rel="stylesheet"
    href="${pageContext.request.contextPath}/source/style.css">
<link type="text/css" rel="stylesheet"
    href="${pageContext.request.contextPath}/source/add-style.css">
</head>
<body>
    <div id="wrapper">
        <div id="header">
            <h2>   Sinh vien manage form   </h2>
        </div>
    
    <div id="container">
         <h3>Save Student</h3>
         <form:form action="saveSinhvien" modelAttribute="sinhvien" method="post">
         <!-- Need to assiocated this data with customer id -->
             <form:hidden path="id"/>
             <table>
                 <tbody>                 
                     <tr>
                         <td>ID:</td>
                         <td><form:input path="id"/></td>                     
                     </tr>
                     <tr>
                         <td>Ten sinh vien:</td>
                         <td><form:input path="ten_sinh_vien"/></td>
                     </tr>
                     <tr>
                         <td>Lop ID:</td>
                         <td><form:input path="id_lop"/></td>
                     </tr>
                     <tr>
                         <td></td>
                         <td><input type="submit" value="Save" class="save"/></td>
                     </tr>
                 </tbody>
             </table>
         </form:form>
         
         <div class="clear;both">
             <p>
                 <a href="${pageContext.request.contextPath}/sinhvien/listSinhvien">Back to list</a>
             </p>
         </div>
    
    </div>
    </div>
</body>
</html>