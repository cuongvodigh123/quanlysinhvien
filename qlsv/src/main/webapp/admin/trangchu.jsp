<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trang chủ</title>
<link rel="icon" type="image/x-icon" href="image/ech.png">
<script type="text/javascript" src="js/jquery-1.6.2.js"></script>

</head>
<body>
	<div style="display: flex;flex-direction: column;">
	<img id="anhdaidien" src="data:image/png;base64,${acountAccount.getAvatarIcon()}" alt="avata" style="width: 200px;height: 200px">
		
		<span><h4>Tài khoản:</h4></span>
	    <span style="display: inline;"><c:out value=" ${acountAccount.getUsername()}" /></span>
	    <span><h4>Chức vụ:</h4></span>
	    <span style="display: inline;"><c:out value=" ${acountAccount.getRole()}" /></span>
	</div>
    <br>
    <input id="add" type="hidden" value="${acountAccount.getAvatarIcon() }">
    <input type="hidden" id="username" value="${acountAccount.getUsername() }"/>
    
    <input type="file" id="fileInput" style="display:none">
    <button onclick="chooseFile()">Đổi Ảnh Đại Diện</button>
    
    <button id="doimk" onclick="doimatkhau()">Đổi mật khẩu</button>
    
    <button id="dssv"  onclick="dssv()">Danh sách sinh viên</button>
    <form action="ServletQLSV" method="get">
    	<input type="hidden" name="action" value="listsinhvien">
    	<input type="hidden" name="username" value="${acountAccount.getUsername() }">
    	<button type="submit" id="gotodssv" style="display: none;"></button>
    </form>
    <br>
    <p>Reset tài khoản</p>
    <input id="resettaikhoan">
    <p id="thongbaoreset"></p>
    <button onclick="resetTKSV()">Reset</button>
    <br>
   	<br>
    <button id="dsmh"  onclick="dsmh()">Danh sách môn học</button>
    <form action="ServletQLSV" method="get">
    	<input type="hidden" name="action" value="listmonhoc">
    	<input type="hidden" name="username" value="${acountAccount.getUsername() }">
    	<button type="submit" id="gotodsmh" style="display: none;"></button>
    </form>
    <br>
    <button id="dskyhoc"  onclick="dsnh()">Danh sách kỳ học</button>
    <form action="ServletQLSV" method="get">
    	<input type="hidden" name="action" value="listkyhoc">
    	<input type="hidden" name="username" value="${acountAccount.getUsername() }">
    	<button type="submit" id="gotodsnh" style="display: none;"></button>
    </form>
    <br>
    <button id="dskhoa"  onclick="dskhoa()">Danh sách khoa</button>
    <form action="ServletQLSV" method="get">
    	<input type="hidden" name="action" value="listkhoa">
    	<input type="hidden" name="username" value="${acountAccount.getUsername() }">
    	<button type="submit" id="gotodskhoa" style="display: none;"></button>
    </form>
    <br>
    <button id="dsgiangvien"  onclick="dsgiangvien()">Danh sách giảng viên</button>
    <form action="ServletQLSV" method="get">
    	<input type="hidden" name="action" value="listgiangvien">
    	<input type="hidden" name="username" value="${acountAccount.getUsername() }">
    	<button type="submit" id="gotodsgiangvien" style="display: none;"></button>
    </form>
	<br>
	<form action="ServletQLSV" method="get">
    	<input type="hidden" name="action" value="dangxuat">
    	<button type="submit">Đăng xuất</button>
    </form>
	<div id="divmk"></div>
    <div id="demo"></div>
</body>
<script type="text/javascript" src="js/trangchu.js"></script>
</html>