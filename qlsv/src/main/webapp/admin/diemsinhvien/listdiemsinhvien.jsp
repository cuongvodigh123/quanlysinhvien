<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Danh sách sinh viên</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="icon" type="image/x-icon" href="image/ech.png">
	<script type="text/javascript" src="js/jquery-1.6.2.js"></script>
	<script type="text/javascript" src="js/excel-dist.js"></script>
</head>
<body>
    <header>
        <nav class="navbar navbar-expand-md navbar-dark" style="background-color: tomato">
            <div>
            	<form action="ServerMonHocKyHoc" method="get">
            		<input type="hidden" name="action" value="xem">
            		<input type="hidden" name="id" value="${lophocphan.getMhkh().getId() }">
            		<input type="hidden" name="username" value="${acountAccount.getUsername()}" >
					<button type="submit" >Trở lại</button>            		
            	</form>
            </div>
        </nav>
    </header>
    <br>
	<div class="row">
        <div class="container">
            <h3 class="text-center">Danh sách điểm sinh viên</h3>
            <hr>
            
            <div class="card" style="display: flex;flex-direction: row;">
	    		<div class="card-header"><b>Nhập file điểm</b></div>
	    		<div class="card-body">
	    			<button onclick="chonfile()">Chọn</button>
	                <input type="file" id="excel_file" hidden/>
	    		</div>
	    		<div id="excel_data"></div>
	    	</div>
	    	<div class="card" style="display: flex;flex-direction: row">
	    		<div class="card-header"><b>Xuất file điểm</b></div>
	    		<div class="card-body">
	    			<button id="student_button">Xuất</button>
	                <input type="file" id="excel_file" hidden/>
	    		</div>
	    	</div>
            
            <div class="container text-left">    
               </div>
               <br>
               <table class="table table-bordered" id="student_data">
                   <thead>
                       <tr>
                           <th>Mã sinh viên</th>
                           <th>Tên sinh viên</th>
                           <th>Điểm 10%</th>
                           <th>Điểm 20%</th>
                           <th>Điểm 70%</th>
                           <th>Điểm trung bình môn</th>
                       </tr>
                   </thead>
                   <tbody>
                    <c:forEach var="ketqua" items="${list}">
                        <tr>
                        	<td style="display: none;"><p class="iddangkyhoc">${ketqua.getDangkyhoc().getId() }</p></td>
                            <td><p>${ketqua.getDangkyhoc().getSinhvien().getMaSV()}</p></td>
                            <td><p>${ketqua.getDangkyhoc().getSinhvien().getTenSV()}</p></td>
                            <td><p class="diem1">${ketqua.getDiem1()}</p></td>
                            <td><p class="diem2">${ketqua.getDiem2()}</p></td>
                            <td><p class="diem3">${ketqua.getDiem3()}</p></td>
                            <td><p class="diemtrungbinh">${ketqua.getDiemTrungBinh()}</p></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</body>

<script type="text/javascript" src="admin/diemsinhvien/edit.js"></script>
</html>