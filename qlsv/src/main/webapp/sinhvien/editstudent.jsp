<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Student</title>
<link rel="icon" type="image/x-icon" href="image/ech.png">
<script type="text/javascript" src="js/jquery-1.6.2.js"></script>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
   <div class="container">
        <div class="top-div">
            <h1 onclick="trovehome()">STUDENT MANAGEMENT</h1>
            <form action="ServerSinhVien" method="get">
            		<input type="hidden" name="action" value="trangchu">
            		<input type="hidden" name="username" value="${sinhvien.getMaSV() }" >
					<button type="submit" id="trovehome" style="display: none;"></button>            		
            </form>
        </div>
        <div class="box-duoi">
            <div class="left-div">
                <nav>
                    <ul class="menu">
	                    <li class="nutbam">
	                            <a class="thanhphan-menu"  onclick="editsinhvien()">Thông tin cá nhân</a>
	                            <form action="ServerSinhVien" method="get">
	                                <input type="hidden" name="action" value="edit">
	                                <input type="hidden" name="maSV" value="${sinhvien.getMaSV() }" >
	                                <button type="submit" id="editsinhvien" style="display: none;"></button>
	                            </form>
	                        </li>
                        <li class="nutbam">
                            <a class="thanhphan-menu" onclick="dangky()">Đăng ký môn học kỳ mới</a>
                            <form action="ServerSinhVien" method="get">
						    	<input type="hidden" name="action" value="dangkymon">
						    	<button type="submit" id="dangky" style="display: none;">Đăng ký môn học</button>
						    </form>
                        </li>
                        <li class="nutbam">
                            <a class="thanhphan-menu"  onclick="xemdiem()">Xem điểm</a>
                            <form action="ServerSinhVien" method="get">
						    	<input type="hidden" name="action" value="xemdiem">
						    	<button type="submit" id="xemdiem" style="display: none;"></button>
						    </form>
                        </li>
                        <li class="nutbam">
                        	<a class="thanhphan-menu"  onclick="dangxuat()">Đăng xuất</a>
                            <form action="ServerSinhVien" method="get">
                                <input type="hidden" name="action" value="dangxuat">
                                <button id="dangxuat" type="submit" style="display: none;"></button>
                            </form>
                        </li>
                    </ul>
                </nav>
            </div>
            <div class="right-div" style="margin-top: 100px;margin-left: 100px">
				<div>
					<input type="hidden" value="${sinhvien.getMaSV() }" id="maSVold">
					<c:if test="${sinhvien.getAvatarIcon() == \"\"}">
						<img id="anhdaidien" src="image/avatar.jpg" alt="avata" style="width: 200px;height: 200px">
					</c:if>
					<c:if test="${sinhvien.getAvatarIcon() != \"\"}">
						<img id="anhdaidien" src="data:image/png;base64,${sinhvien.getAvatarIcon()}" alt="avata" style="width: 200px;height: 200px">
						<input type="hidden" id="anhdaidienhienco" value="${sinhvien.getAvatarIcon()}">
					</c:if>	
					<button onclick="chooseFile()">Đổi ảnh</button>
					<input type="file" id="fileInput" style="display:none">
					<br>
					<p>Mã sinh viên:<input id="maSV" type="text" value="<c:out value="${sinhvien.getMaSV()}" />"></p>
					<p>Tên sinh viên:<input id="tenSV" type="text" value="<c:out value="${sinhvien.getTenSV()}" />"></p>
					<p>Lớp sinh viên:<input id="lopSV" type="text" value="<c:out value="${sinhvien.getLopSV()}" />"></p>
					
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

				<div id="demo"></div>

		</div>
	</div>
</body>
<script type="text/javascript" src="sinhvien/edit.js"></script>
<script type="text/javascript">
function trovehome(){
	document.getElementById("trovehome").click();
}
</script>
</html>