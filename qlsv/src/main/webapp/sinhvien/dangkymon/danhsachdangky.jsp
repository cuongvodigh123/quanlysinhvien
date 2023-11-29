<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Danh sách đã đăng ký</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="icon" type="image/x-icon" href="image/ech.png">
	<script type="text/javascript" src="js/jquery-1.6.2.js"></script>
</head>
<body>
<header>
        <nav class="navbar navbar-expand-md navbar-dark" style="background-color: tomato">
            <div>
            	<form action="ServerSinhVien" method="get">
            		<input type="hidden" name="action" value="dangkymon">
					<button type="submit" >Trở về</button>            		
            	</form>
            </div>
        </nav>
    </header>
<div class="row">
        <div class="container">
            <h3 class="text-center">Danh sách đăng ký của ${sinhvien.getTenSV() }</h3>
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
	                           <th>Tiền đóng</th>
	                       </tr>
	                   	</thead>
	                   	<tbody> 
                   		<c:forEach var="ketqua" items="${list}">
                   			
	                   			<tr>
		                        	<td>${ketqua.getDangkyhoc().getLophocphan().getMhkh().getMh().getIdmonhoc() }</td>
		                        	<td>${ketqua.getDangkyhoc().getLophocphan().getTen() }</td>
		                        	<td>${ketqua.getDangkyhoc().getLophocphan().getMhkh().getMh().getTen() }</td>
		                        	<td>${ketqua.getDangkyhoc().getLophocphan().getMhkh().getMh().getTinchi() }</td>
		                        	<td>${ketqua.getDangkyhoc().getLophocphan().getGiangvien().getTen() }</td>
		                        	<td>${ketqua.getDangkyhoc().getLophocphan().getMhkh().getMh().getTinchi()*2000000 } đồng</td>
		                        	
		                        	
		                        </tr>
		                        
                   		</c:forEach>
                   		
	                	</tbody>        	
	            </table> 
	            
	          <div>
	            	<form action="ServerSinhVien" method="get">
	            		<input type="hidden" name="action" value="thaydoidangky">
	            		<input type="hidden" name="idkyhoc" value="${kyhoc.getId()}">
						<button type="submit" >Thay đổi</button>            		
	            	</form>
	            </div>  
	            
        </div>
        
    </div>
</body>
<script type="text/javascript" src="sinhvien/dangkymon/chonkyhoc.js"></script>
</html>