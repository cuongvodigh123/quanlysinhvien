<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="icon" type="image/x-icon" href="image/ech.png">
	<title>Export Excel Form</title>
	<meta name="viewport" content="width=device-width, initial-scale=1" />
    <script type="text/javascript" src="js/jquery-1.6.2.js"></script>
    <script type="text/javascript" src="js/excel-dist.js"></script></head>
<body>
    <div class="container">
    	<h2 class="text-center mt-4 mb-4">Export Excel</h2>
    	<div class="card">
    		<div class="card-header">
    			<div class="row">
    				<div class="col col-md-6 text-right">
    					<button type="button" id="student_button" class="btn btn-success btn-sm">Export</button>
    				</div>
    			</div>
    		</div>
    		<div class="card-body">
    			<table id="student_data" border="1" cellpadding="5">
    				<caption><h2>List of Students</h2></caption>
                    <tr>
                        <th>Mã sinh viên</th>
                        <th>Tên sinh viên</th>
                        <th>Lớp sinh viên</th>
                        <th>Giới tính</th>
                        <th>Ngày sinh</th>
                        <th>Số điện thoại</th>
                        <th>Email</th>
                        <th>Địa chỉ</th>
                        <th>Ghi chú</th>
                    </tr>
                    <c:forEach var="student" items="${list }">
                    	<tr>
                    		<td><c:out value="${student.getMaSV() }" /></td>
                    		<td><c:out value="${student.getTenSV() }" /></td>
                    		<td><c:out value="${student.getLopSV() }" /></td>
                    		<td><c:out value="${student.getGioiTinhString() }" /></td>
                    		<td><c:out value="${student.getNgaySinh() }" /></td>
                    		<td><c:out value="${student.getSoDienThoai() }" /></td>
                    		<td><c:out value="${student.getEmail() }" /></td>
                    		<td><c:out value="${student.getDiaChi() }" /></td>
                    		<td><c:out value="${student.getGhiChu() }" /></td>
                    		
                    	</tr>
                    </c:forEach>
                </table>
    		</div>
    	</div>
    </div>
</body>
<script type="text/javascript" src="js/xuatexcel.js"></script>
</html>