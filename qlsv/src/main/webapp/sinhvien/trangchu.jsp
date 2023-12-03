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
                        <i data-feather="user"></i>
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
                        <i data-feather="table"></i>
                        <span>Đăng ký môn học kỳ mới</span>
                    </a>
                    <form action="ServerSinhVien" method="get">
					  	<input type="hidden" name="action" value="dangkymon">
					  	<button type="submit" id="dangky" style="display: none;">Đăng ký môn học</button>
				  	</form>
                </li>
                <li>
                	<a onclick="xemdiem()">
                        <i data-feather="file-text"></i>
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
	                    <img id="anhdaidien" src="data:image/png;base64,${accountSinhVien.getAvatarIcon()}" alt="avata" style="width: 50px;height: 50px">
	                </div>
            	</div>
        	</div>	
			<div class="content__banner">
                <h1>Welcome back, </h1>
                <p>
                    STUDENT MANAGEMENT SYSTEM DESIGNED BY GROUP 15 <br>
                  	 	<span style="display: inline;"><c:out value=" ${accountSinhVien.getMaSV()}" /></span><br>
                  	 	<span style="display: inline;"><c:out value=" ${accountSinhVien.getTenSV()}" /></span><br>
                </p>
			    <br>
		    </div>
		    <div class="content__box1">
	                <div class="content__info">
                    	<div id="divmk" class="content__info"></div>
                		<div id="demo" class="content__info"></div>  
                   	</div>
	                <div class="content__function">
	                    <a id="doimk" onclick="doimatkhau()" class="content__change">
	                        <div>
	                            <i data-feather="grid"></i>
	                        </div>
	                        <h3>Đổi mật khẩu</h3>
	                    </a>  
	                </div>
	            </div>  
		</div>   
    </div>
    
    
</body>
<script type="text/javascript" src="sinhvien/trangchu.js"></script>
<script>
        feather.replace();
    </script>
</html>