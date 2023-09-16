<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trang chủ</title>
<script type="text/javascript" src="js/jquery-1.6.2.js"></script>

</head>
<body>
	<div style="display: flex;flex-direction: column;">
	<img id="anhdaidien" src="data:image/jpeg;base64,${acountAccount.getAvatarIcon()}" alt="avata" style="width: 200px;height: 200px">
		
		<span><h4>Tài khoản:</h4></span>
	    <span style="display: inline;"><c:out value="${acountAccount.getUsername()}" /></span>
	    <span><h4>Role:</h4></span>
	    <span style="display: inline;"><c:out value="${acountAccount.getRole()}" /></span>
	</div>
    <br>
    <input id="add" type="hidden" value="${acountAccount.getAvatarIcon() }">
    <input type="hidden" id="username" value="${acountAccount.getUsername() }"/>
    
    <input type="file" id="fileInput" style="display:none">
    <button onclick="chooseFile()">Đổi Ảnh Đại Diện</button>
    
    <button id="doimk" onclick="doimatkhau()">Đổi mật khẩu</button>
    <button id="dssv">Danh sách sinh viên</button>
    
    <button id=check onclick="check()">Check</button>
    <div id="demo"></div>
    
</body>
<script type="text/javascript" src="js/trangchu.js"></script>
</html>