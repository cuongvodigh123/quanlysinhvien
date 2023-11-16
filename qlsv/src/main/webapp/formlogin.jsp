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
<script type="text/javascript" src="js/checklogin.js"></script>
</head>
<body>
    <div style="border: 4px solid purple;display: flex; flex-direction: column;align-items: center;justify-content: center;">
        <p style="font-size: 20px;color: purple;">Đăng nhập vào hệ thống quản lý sinh viên.</p>
        <div style="display: flex;width: 20%;">
            <div style="width: 100px;text-align: left;">Tài Khoản:</div>
            <div style="display: inline;">
                <input  type="text" id="username" required="required">
                <p style="display: inline;color: red;" id="p1"></p>
            </div>
            
        </div>
        <br>
        <div style="display: flex;width: 20%;">
            <div  style="width: 100px;text-align: left;">Mật khẩu:</div>
            <div style="display: inline;">
                <input  type="password" id="password" required="required">
                <p style="display: inline;color: red;" id="p2"></p>
            </div>
        </div>
        <p style="display: inline;color: red;" id="p3"></p>
        <br>
        <button onclick="check()">Đăng nhập</button>
        <br>
        <br>
        <div id="trangchu"></div>
    </div>
</body>
</html>