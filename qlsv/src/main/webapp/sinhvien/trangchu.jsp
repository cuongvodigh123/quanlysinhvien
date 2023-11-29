<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trang chủ sinh viên</title>
<link rel="icon" type="image/x-icon" href="image/ech.png">
<script type="text/javascript" src="js/jquery-1.6.2.js"></script>
</head>
<body>
	<div style="display: flex;flex-direction: column;">
	<img id="anhdaidien" src="data:image/png;base64,${accountSinhVien.getAvatarIcon()}" alt="avata" style="width: 200px;height: 200px">
		
		<span><h4>Tài khoản:</h4></span>
	    <span style="display: inline;"><c:out value=" ${accountSinhVien.getMaSV()}" /></span>
	    <span><h4>Chức vụ:</h4></span>
	    <span style="display: inline;">Sinh viên</span>
	</div>
    <br>
    <input type="hidden" id="username" value="${accountSinhVien.getMaSV() }"/>
    
    <form action="ServerSinhVien" method="get" target="_blank">
    	<input type="hidden" name="maSV" value="${accountSinhVien.getMaSV() }"/>
    	<input type="hidden" name="action" value="edit">
    	<button type="submit">Thay đổi thông tin các nhân</button>
    </form>
    <br><br>
    
    <button id="doimk" onclick="doimatkhau()">Đổi mật khẩu</button>
    <div id="divmk"></div>
    <div id="demo"></div>
    
    <br> <br>
    <form action="ServerSinhVien" method="get">
    	<input type="hidden" name="action" value="dangkymon">
    	<button type="submit">Đăng ký môn học</button>
    </form>
    
    <br> <br>
    <form action="ServerSinhVien" method="get">
    	<input type="hidden" name="action" value="xemdiem">
    	<button type="submit">Xem điểm</button>
    </form>
    
    <br> <br>
    <form action="ServerSinhVien" method="get">
    	<input type="hidden" name="action" value="dangxuat">
    	<button type="submit">Đăng xuất</button>
    </form>
    
    
    
</body>
<script type="text/javascript" src="sinhvien/trangchu.js"></script>
</html>