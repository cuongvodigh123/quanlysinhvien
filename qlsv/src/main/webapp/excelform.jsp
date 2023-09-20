<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="icon" type="image/x-icon" href="image/ech.png">
	<title>Excel Form</title>
	<meta name="viewport" content="width=device-width, initial-scale=1" />
    <script type="text/javascript" src="js/jquery-1.6.2.js"></script>
    <script type="text/javascript" src="js/excel-dist.js"></script>
</head>
<body>
    <div class="container">
    	<h2 class="text-center mt-4 mb-4">Nhập File Excel vào hệ thống</h2>
    	<div class="card">
    		<div class="card-header"><b>Chọn Excel File</b></div>
    		<div class="card-body">
    			<button onclick="chonfile()">Chọn</button>
                <input type="file" id="excel_file" hidden/>
    		</div>
    	</div>
        <div id="excel_data" class="mt-5"></div>
        <button onclick="savexcel()">Lưu</button>
        <div id="demo"></div>
    </div>
    <button onclick="check()">check</button>
    
</body>
<script type="text/javascript" src="js/excel.js"></script>
</html>