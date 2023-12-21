<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Danh sách sinh viên</title>
<link rel="icon" type="image/x-icon" href="image/ech.png">
<script type="text/javascript" src="js/jquery-1.6.2.js"></script>
<script src="https://cdn.jsdelivr.net/npm/feather-icons/dist/feather.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css"
        integrity="sha512-NhSC1YmyruXifcj/KFRWoC561YpHpc5Jtzgvbuzx5VozKpWvQ+4nXhPdFgmx8xqexRcpAglTj9sIBWINXa8x5w=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="css/base.css">
<link rel="stylesheet" href="css/home.css">
<link rel="stylesheet" href="css/style.css">
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
                    <form action="ServletQLSV" method="get">
            		<input type="hidden" name="action" value="trangchu">
            		<input type="hidden" name="username" value="${acountAccount.getUsername()}" >
					<button type="submit" id="trovehome" style="display: none;"></button>            		
            </form>
                </li>
                <li>
                    <a id="dssv" onclick="dssv()">
                        <i data-feather="users"></i>
                        <span>Danh sách sinh viên</span>
                    </a>
                    <form action="ServletQLSV" method="get">
                        <input type="hidden" name="action" value="listsinhvien">
                        <input type="hidden" name="username" value="123">
                        <button type="submit" id="gotodssv" style="display: none;"></button>
                    </form>
                </li>
                <li>
                    <a id="dsmh" onclick="dsmh()">
                        <i data-feather="book-open"></i>
                        <span>Danh sách môn học</span>
                    </a>
                    <form action="ServletQLSV" method="get">
                        <input type="hidden" name="action" value="listmonhoc">
                        <input type="hidden" name="username" value="123">
                        <button type="submit" id="gotodsmh" style="display: none;"></button>
                    </form>
                </li>
                <li>
                    <a id="dskyhoc" onclick="dsnh()">
                        <i data-feather="calendar"></i>
                        <span>Danh sách kỳ học</span>
                    </a>
                    <form action="ServletQLSV" method="get">
                        <input type="hidden" name="action" value="listkyhoc">
                        <input type="hidden" name="username" value="123">
                        <button type="submit" id="gotodsnh" style="display: none;"></button>
                    </form>
                </li>
                <li>
                    <a id="dskhoa" onclick="dskhoa()">
                        <i data-feather="archive"></i>
                        <span>Danh sách khoa</span>
                    </a>
                    <form action="ServletQLSV" method="get">
                        <input type="hidden" name="action" value="listkhoa">
                        <input type="hidden" name="username" value="123">
                        <button type="submit" id="gotodskhoa" style="display: none;"></button>
                    </form>
                </li>
                <li>
                    <a id="dsgiangvien" onclick="dsgiangvien()">
                        <i data-feather="users"></i>
                        <span>Danh sách giảng viên</span>
                    </a>
                    <form action="ServletQLSV" method="get">
                        <input type="hidden" name="action" value="listgiangvien">
                        <input type="hidden" name="username" value="123">
                        <button type="submit" id="gotodsgiangvien" style="display: none;"></button>
                    </form>
                </li>
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
                        <img id="anhdaidien" src="data:image/png;base64,${acountAccount.getAvatarIcon()}" alt="avata" style="width: 50px;height: 50px">
                    </div>
                </div>
            </div>	
            <div class="container">
			    <center>
			        <h1>Danh sách sinh viên</h1>
			        <h2>
			           	<a href="/qlsv/ServletQLSV?action=excel" target="_blank">Nhập File Excel</a>
			        </h2>
			    </center>
			    <div>
				   	<p>Tìm theo:</p>
				    <select id="sapxep">
				    	<option value="maSV">Mã sinh viên</option>
				    	<option value="tenSV">Tên sinh viên</option>
				    	<option value="lopSV">Lớp</option>
				    	<option value="gioiTinh">Giới tính</option>
				    	<option value="ngaySinh">Ngày sinh</option>
				    	<option value="soDienThoai">Số điện thoại</option>
				    </select>
				    <input id="strFind" type="text">
				    <button id="check" onclick="timkiem()">Tìm</button>
			    </div>
			    <br>
			    <form action="ServletQLSV" method="post" target="_blank">
			    	<input type="hidden" name="action" value="exportexcel">
			    	<input id="q" type="hidden" name="q" value="">
			    	<input id="w" type="hidden" name="w" value="">
			    	<input id="e" type="hidden" name="e" value="">
			    	<input id="r" type="hidden" name="r" value="">
			    	<button type="submit" style="width: auto;height: 50px">Xuất File Excel Danh Sách Đang Hiển Thị</button>
			    </form>
		        <table id="boxdssv" border="1" cellpadding="5">
		            <caption><h2>Danh sách</h2></caption>
		            <tr>
		                <th onclick="sortmasv()">Mã sinh viên</th>
		                <th onclick="sorttensv()">Tên sinh viên</th>
		                <th onclick="sortlopsv()">Lớp</th>
		                <th onclick="sortgioitinh()">Giới tính</th>
		                <th onclick="sortngaysinh()">Ngày sinh</th>
		                <th onclick="sortsdt()">Số điện thoại</th>
		                <th>Action</th>
		            </tr>     
		            
		        </table>
		    </div>
	    </div>   
    </div>
</body>
<script type="text/javascript" src="js/liststudent.js"></script>
<script type="text/javascript" src="js/trangchu.js"></script>
<script>
        feather.replace();
    </script>
</html>