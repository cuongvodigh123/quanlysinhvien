<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng nhập</title>
<link rel="icon" type="image/x-icon" href="image/ech.png">
<script type="text/javascript" src="js/jquery-1.6.2.js"></script>
<script src="https://cdn.jsdelivr.net/npm/feather-icons/dist/feather.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css"
        integrity="sha512-NhSC1YmyruXifcj/KFRWoC561YpHpc5Jtzgvbuzx5VozKpWvQ+4nXhPdFgmx8xqexRcpAglTj9sIBWINXa8x5w=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="css/base.css">
<link rel="stylesheet" href="css/login.css">
</head>
<body>
    <!-- main -->
    <div class="main">
        <div class="content">
            <div class="form_login">
                <p class="form_banner">Đăng nhập vào hệ thống quản lý sinh viên</p>
                <div class="form_content">
                    <label class="username">Username:</label>
                    <div style="display: inline;">
		                <input  type="text" id="username" required="required">
		                <p style="display: inline;color: red;" id="p1"></p>
		            </div>
                </div>
                <br>
                <div class="form_content" >
                    <label class="password">Password:</label>
                    <div style="display: inline;">
		                <input  type="password" id="password" required="required">
		                <p style="display: inline;color: red;" id="p2"></p>
		            </div>
                </div>
                <div class="form_content">
                    <div class="form_radio">
                        <div>
                            <label>Giảng viên </label>
                            <input type="radio" name="check" id="giangvien" onclick="chonGiangVien()">
                        </div>
                        <div>
                            <label >Sinh viên</label>
                            <input type="radio" name="check" id="sinhvien" onclick="chonSinhVien()" checked="checked">
                        </div>
                    </div>      
                </div>
                <p style="display: inline;color: red;" id="p3"></p>
                <br>
                <button onclick="check()">Đăng nhập</button>
                <br>
                <br>
                <div id="trangchu"></div>
            
            </div>
        </div>

        </div>
    </div>
</body>
<script type="text/javascript" src="js/checklogin.js"></script>
<script>
        feather.replace();
</script>
</html>