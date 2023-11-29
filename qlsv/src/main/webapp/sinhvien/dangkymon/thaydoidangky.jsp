<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thay đổi đăng ký</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="icon" type="image/x-icon" href="image/ech.png">
	<script type="text/javascript" src="js/jquery-1.6.2.js"></script>
</head>
<body>
<header>
        <nav class="navbar navbar-expand-md navbar-dark" style="background-color: tomato">
            <div>
            	<form action="ServerSinhVien" method="get" id="danhsachmh">
            		<input type="hidden" name="action" value="getdangkymonhoc">
            		<input type="hidden" name="idkyhoc" value="${kyhoc.getId()}">
					<button type="submit" >Trở về</button>            		
            	</form>
            </div>
        </nav>
    </header>
<div class="row">
        <div class="container">
            <h3 class="text-center">Danh sách lớp học phần</h3>
            <hr>

            <div class="container text-left">    
               </div>
	               <br>
	               <br>
	               
	               <table class="table table-bordered">
	               		<caption style="caption-side: top;"><h3>Kỳ học: ${kyhoc.getMota()}</h3></caption>
	                   	<thead>
	                       <tr>
	                       	   <th>STT</th>
	                           <th>Mã Môn</th>
	                           <th>Tên Lớp HP</th>
	                           <th>Tên Môn</th>
	                           <th>Số Tín</th>
	                           <th>Giảng Viên</th>
	                           <th>Số lượng</th>
	                           <th>Còn lại</th>
	                           <th>Trạng thái</th>
	                       </tr>
	                   	</thead>
	                   	<tbody> 
                   		<c:forEach var="lhp" items="${list}" varStatus="index">
                   			<c:if test="${dangkyhocDao.getDaDangKy(lhp.getIdstt(),sinhvien.getMaSV()) ==1}">
	                   			<tr id="${lhp.getIdstt() }" class="${lhp.getMhkh().getMh().getIdmonhoc() }">
	                   				<td>${index.index +1}</td>
	                   				<td>${lhp.getMhkh().getMh().getIdmonhoc() }</td>
	                   				<td>${lhp.getTen() }</td>
	                   				<td>${lhp.getMhkh().getMh().getTen() }</td>
	                   				<td>${lhp.getMhkh().getMh().getTinchi() }</td>
	                   				<td>${lhp.getGiangvien().getTen()}</td>
	                   				<td>${lhp.getSoluong()}</td>
	                   				<td>${lhp.getSoluong()-dangkyhocDao.getSLConLai(lhp.getIdstt())}</td>
	                   				<td><input type="checkbox" checked="checked" onchange="luudangky(event)" class="checkbox-group" data-group="${lhp.getMhkh().getMh().getIdmonhoc()}"></td>
		                        </tr>
                   			</c:if>
                   			<c:if test="${dangkyhocDao.getDaDangKy(lhp.getIdstt(),sinhvien.getMaSV()) ==0}">
	                   			<tr id="${lhp.getIdstt() }" class="${lhp.getMhkh().getMh().getIdmonhoc() }">
	                   				<td>${index.index +1}</td>
	                   				<td>${lhp.getMhkh().getMh().getIdmonhoc() }</td>
	                   				<td>${lhp.getTen() }</td>
	                   				<td>${lhp.getMhkh().getMh().getTen() }</td>
	                   				<td>${lhp.getMhkh().getMh().getTinchi() }</td>
	                   				<td>${lhp.getGiangvien().getTen()}</td>
	                   				<td>${lhp.getSoluong()}</td>
	                   				<td>${lhp.getSoluong()-dangkyhocDao.getSLConLai(lhp.getIdstt())}</td>
	                   				<td><input type="checkbox" onchange="luudangky(event)" class="checkbox-group" data-group="${lhp.getMhkh().getMh().getIdmonhoc()}"></td>
		                        </tr>
                   			</c:if>
	                        
                   		</c:forEach>
                   		
	                	</tbody>        	
	            </table> 
	            
	         	<div>
	                <button id="buttontrove" onclick="trove()" class="btn btn-success">Trở về</button>
	            </div>  
	            
        </div>
        
    </div>
</body>
<script type="text/javascript" src="sinhvien/dangkymon/thaydoidangky.js"></script>
</html>