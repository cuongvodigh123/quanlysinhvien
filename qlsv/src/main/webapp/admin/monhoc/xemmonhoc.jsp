<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Xem môn hoc</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="icon" type="image/x-icon" href="image/ech.png">
<script type="text/javascript" src="js/jquery-1.6.2.js"></script>
</head>
<body>
<header>
        <nav class="navbar navbar-expand-md navbar-dark" style="background-color: tomato">
            <div>
            	<form action="ServletQLSV" method="get">
            		<input type="hidden" name="action" value="listmonhoc">
            		<input type="hidden" name="username" value="${acountAccount.getUsername()}" >
					<button type="submit" >Trở về</button>            		
            	</form>
            </div>
        </nav>
    </header>
    <h3>Môn học ${monhoc.getTen() }</h3>
    <input type="hidden" id="monhoc" value="${monhoc.getIdmonhoc() }">
    <input type="hidden" id="tongsolop" value="${monhoc.getSolop() }">
    <div class="row">
        <div class="container">
            <h3 class="text-center">Danh sách sinh viên môn học</h3>
            <hr>
            <div style="display: flex;">
	            <h3>Chọn nhóm:</h3>
			    <select id="sonhom" onchange="chon1nhom()"></select>
            </div>
            
            <div class="container text-left">    
               </div>
               <br>
               <table class="table table-bordered">
                   <thead>
                       <tr>
                           <th>Số nhóm</th>
                           <th>Mã sinh viên</th>
                           <th>Tên sinh viên</th>
                           <th>Điểm 10%</th>
                           <th>Điểm 20%</th>
                           <th>Điểm 70%</th>
                           <th>Lựa chọn</th>
                       </tr>
                   </thead>
                   <tbody id="boxtable">
                    
                	</tbody>
            	</table>
            
        </div>
    </div>
</body>
<script type="text/javascript" src="js/xemmonhoc.js"></script>
</html>