<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Student</title>
<script type="text/javascript" src="js/jquery-1.6.2.js"></script>
</head>
<body>
	<div>
		<input type="hidden" value="${sinhvien.getMaSV() }" id="maSVold">
		<c:if test="${sinhvien.getAvatarIcon() == \"\"}">
			<img id="anhdaidien" src="image/avatar.jpg" alt="avata" style="width: 200px;height: 200px">
		</c:if>
		<c:if test="${sinhvien.getAvatarIcon() != \"\"}">
			<img id="anhdaidien" src="data:image/png;base64,${sinhvien.getAvatarIcon()}" alt="avata" style="width: 200px;height: 200px">
		</c:if>	
		<button onclick="chooseFile()">Đổi ảnh</button>
		<br>
		<p>Mã sinh viên:<input id="maSV" type="text" value="<c:out value="${sinhvien.getMaSV()}" />"></p>
		<p>Tên sinh viên:<input id="tenSV" type="text" value="<c:out value="${sinhvien.getTenSV()}" />"></p>
		<p>Lớp sinh viên:<input id="lopSV" type="text" value="<c:out value="${sinhvien.getLopSV()}" />"></p>
		
		
		<!-- <p>Giới tính :<input id="gioiTinh" type="text" value="<c:out value=" ${sinhvien.getGioiTinh()}" />"></p> -->
		<c:if test="${sinhvien.getGioiTinh() == 1}">
			<label for="male">Nam</label>
			<input type="radio" id="male" name="gender" value="1" checked>
			
			<label for="female">Nữ</label>
			<input type="radio" id="female" name="gender" value="0">
		</c:if>
		<c:if test="${sinhvien.getGioiTinh() == 0}">
			<label for="male">Nam</label>
			<input type="radio" id="male" name="gender" value="1">
			
			<label for="female">Nữ</label>
			<input type="radio" id="female" name="gender" value="0" checked>
		</c:if>
		
		
		<p>Ngày sinh:<input id="ngaySinh" type="text" placeholder="dd/MM/yyyy" value="<c:out value="${sinhvien.getNgaySinh()}" />"></p>
		<p>Số điện thoại:<input id="soDienThoai" type="text" value="<c:out value="${sinhvien.getSoDienThoai()}" />"></p>
		<p>Email:<input id="email" type="text" value="<c:out value="${sinhvien.getEmail()}" />"></p>
		<p>Địa chỉ:<input id="diaChi" type="text" value="<c:out value="${sinhvien.getDiaChi()}" />"></p>
		<p>Ghi chú:<input id="ghiChu" type="text" value="<c:out value="${sinhvien.getGhiChu()}" />"></p>
		<button id="luu" onclick="luu()">Lưu</button>
		<button id="huy" onclick="huy()">Huỷ</button>
	</div>
	
	<input type="file" id="fileInput" style="display:none">
	<button onclick="check()">Check</button>
	<div id="demo"></div>
	<div id="demo1"></div>
</body>
<script type="text/javascript" src="js/edit.js"></script>
</html>