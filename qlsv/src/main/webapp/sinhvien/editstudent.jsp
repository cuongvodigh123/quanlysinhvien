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
<script src="https://cdn.jsdelivr.net/npm/feather-icons/dist/feather.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css"
        integrity="sha512-NhSC1YmyruXifcj/KFRWoC561YpHpc5Jtzgvbuzx5VozKpWvQ+4nXhPdFgmx8xqexRcpAglTj9sIBWINXa8x5w=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="css/base.css">
<link rel="stylesheet" href="css/home.css">
</head>
<body>
	<div class="main">
        <div class="sider">
        	<ul class="menu">
            <h1>STUDENT MANAGEMENT</h1>
            	<li>
                    <a onclick="trovehome()">
                        <i data-feather="home"></i>
                        <span>Trang chủ</span>
                    </a>
                    <form action="ServerSinhVien" method="get">
	            		<input type="hidden" name="action" value="trangchu">
	            		<input type="hidden" name="username" value="${accountSinhVien.getMaSV()}" >
						<button type="submit" id="trovehome" style="display: none;"></button>            		
		            </form>
                </li>
              	<li>
              		<a onclick="editsinhvien()">
                        <i data-feather="users"></i>
                        <span>Thông tin cá nhân</span>
                    </a>
	                <form action="ServerSinhVien" method="get">
	                    <input type="hidden" name="action" value="edit">
	                    <input type="hidden" name="maSV" value="${accountSinhVien.getMaSV() }" >
	                    <button type="submit" id="editsinhvien" style="display: none;"></button>
	                </form>
                </li>
                <li>
                	<a onclick="dangky()">
                        <i data-feather="users"></i>
                        <span>Đăng ký môn học kỳ mới</span>
                    </a>
                    <form action="ServerSinhVien" method="get">
					  	<input type="hidden" name="action" value="dangkymon">
					  	<button type="submit" id="dangky" style="display: none;">Đăng ký môn học</button>
				  	</form>
                </li>
                <li>
                	<a onclick="xemdiem()">
                        <i data-feather="users"></i>
                        <span>Xem điểm</span>
                    </a>
                    <form action="ServerSinhVien" method="get">
					  	<input type="hidden" name="action" value="xemdiem">
					  	<button type="submit" id="xemdiem" style="display: none;"></button>
				  	</form>
                <li>
                	<a onclick="dangxuat()">
                            <i data-feather="log-out"></i>
                            <span>Đăng xuất</span>
                        </a>
                    <form action="ServletQLSV" method="get">
                        <input type="hidden" name="action" value="dangxuat">
                         <button id="dangxuat" type="submit" style="display: none;"></button>
                    </form>
                </li>
			</ul>
		</div>
        <div class="content">
    		<div class="content__header">
            	<div class="content__nav">
	                <ul class="content__icon">
	                    <li>
	                        <i data-feather="bell"></i>
	                    </li>
	                    <li>
	                        <i data-feather="settings"></i>
	                    </li>
	                </ul>
	                <div class="content__avatar">
	                    <img id="anhdaidien1" src="data:image/png;base64,${accountSinhVien.getAvatarIcon()}" alt="avata" style="width: 50px;height: 50px">
	                </div>
            	</div>
        	</div>	
			<div class="box_content">
				<div class="left_content">
					<div class="form-group">
                        <span>Mã sinh viên:</span>
                        <input id="maSV" type="text" value="<c:out value="${sinhvien.getMaSV()}" />">
                    </div>

                    <div class="form-group">
                        <span>Tên sinh viên:</span>
                        <input id="tenSV" type="text" value="<c:out value="${sinhvien.getTenSV()}" />">
                    </div>

                    <div class="form-group">
                        <span>Lớp sinh viên:</span>
                        <input id="lopSV" type="text" value="<c:out value="${sinhvien.getLopSV()}" />">
                    </div>

                    <div class="form-group">
                        <c:if test="${sinhvien.getGioiTinh() == 1}">
                            <div class="gender">
                                <div>
                                    <label for="male">Nam</label>
                                    <input type="radio" id="male" name="gender" value="1" checked>
                                </div>
                                <div>
                                    <label for="female">Nữ</label>
                                    <input type="radio" id="female" name="gender" value="0">
                                </div>
                            </div>
                        </c:if>
                    </div>

                    <div class="form-group">
                        <span>Ngày sinh:</span>
                        <input id="ngaySinh" type="text" placeholder="dd/MM/yyyy" value="<c:out value="
                            ${sinhvien.getNgaySinh()}" />">
                    </div>

                    <div class="form-group">
                        <span>Số điện thoại:</span>
                        <input id="soDienThoai" type="text" value="<c:out value="${sinhvien.getSoDienThoai()}" />">
                    </div>

                    <div class="form-group">
                        <span>Email:</span>
                        <input id="email" type="text" value="<c:out value="${sinhvien.getEmail()}" />">
                    </div>

                    <div class="form-group">
                        <span>Địa chỉ:</span>
                        <input id="diaChi" type="text" value="<c:out value="${sinhvien.getDiaChi()}" />">
                    </div>

                    <div class="form-group">
                        <span>Ghi chú:</span>
                        <input id="ghiChu" type="text" value="<c:out value="${sinhvien.getGhiChu()}" />">
                    </div>

                    <div class="form-group btn">
                        <button id="luu" onclick="luu()">Lưu</button>
                        
                        <button style="margin-left: 100px" id="huy" onclick="huy()">Huỷ</button>
                    </div>

				</div>
				<div class="right_content">
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
				</div>
			</div>

				<div id="demo"></div>

		</div>
	</div>
</body>
<script type="text/javascript" src="sinhvien/edit.js"></script>
<script type="text/javascript" src="sinhvien/trangchu.js"></script>
<script>
        feather.replace();
    </script>
</html>