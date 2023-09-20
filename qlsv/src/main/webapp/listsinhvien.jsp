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
</head>
<body>
    <center>
        <h1>Danh sách sinh viên</h1>
        <h2>
            <a href="/qlsv/ServletQLSV?action=edit&maSV=new" target="_blank">Thêm sinh viên</a>
            &nbsp;&nbsp;&nbsp;&nbsp;
           	<a href="/qlsv/ServletQLSV?action=excel" target="_blank">Nhập File Excel</a>
        </h2>
    </center>
    <div align="center">
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
    <button id="check" onclick="check()">Tìm</button>
    <br>
    <a id="xuatexcel" href="" target="_blank">Xuất File Excel Danh Sách Đang Hiển Thị</a>
        <table id="boxdssv" border="1" cellpadding="5">
            <caption><h2>Danh sách</h2></caption>
            <tr>
                <th onclick="sortmasv()">Mã sinh viên</th>
                <th onclick="sorttensv()">Tên sinh viên</th>
                <th onclick="sortlopsv()">Lớp</th>
                <th onclick="sortgioitinh()">Giới tính</th>
                <th onclick="sortngaysinh()">Ngày sinh</th>
                <th onclick="sortsdt()">Số điện thoại</th>
            </tr>     
            <!-- <td><a href="/qlsv/ServletQLSV?goto=edit&maSV=masinhvien" target="_blank">mã sinh viên</a></td> -->
        </table>
    </div>   
</body>
<script type="text/javascript" src="js/liststudent.js"></script>
</html>