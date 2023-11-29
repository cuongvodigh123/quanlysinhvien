<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Xem điểm</title>
<link rel="icon" type="image/x-icon" href="image/ech.png">
<link rel="stylesheet" href="css/bootstrap.min.css">
<script type="text/javascript" src="js/jquery-1.6.2.js"></script>
</head>
<body>
	<div class="row">
        <div class="container">
            <h3 class="text-center">Danh sách điểm của ${sinhvien.getTenSV() }</h3>
            <hr>

            <div class="container text-left">    
               </div>
               <c:forEach var="kyhoc" items="${listkyhoc}">
	               <br>
	               <br>
	               
	               <table class="table table-bordered">
	               		<caption style="caption-side: top;"><h3>Kỳ học: ${kyhoc.getMota()}</h3></caption>
	                   	<thead>
	                       <tr>
	                       	   <th>STT</th>
	                           <th>Mã MH</th>
	                           <th>Tên Lớp HP</th>
	                           <th>Tên Môn</th>
	                           <th>Số Tín</th>
	                           <th>Điểm TB</th>
	                           <th>Điểm Hệ số</th>
	                           <th>Hệ số 4</th>
	                       </tr>
	                   	</thead>
	                   	<tbody> 
                   		<c:forEach var="ketqua" items="${list}">
                   			<c:if test="${kyhoc.getId()==ketqua.getDangkyhoc().getLophocphan().getMhkh().getKyhoc().getId() }">
	                   			<tr>
		                        	<td>${ketqua.getDangkyhoc().getLophocphan().getMhkh().getMh().getIdmonhoc() }</td>
		                        	<td>${ketqua.getDangkyhoc().getLophocphan().getTen() }</td>
		                        	<td>${ketqua.getDangkyhoc().getLophocphan().getMhkh().getMh().getTen() }</td>
		                        	<td>${ketqua.getDangkyhoc().getLophocphan().getMhkh().getMh().getTinchi() }</td>
		                        	<td>${ketqua.getDiemTrungBinh() }</td>
		                        	<td>${ketqua.getDiemHeSo() }</td>
		                        	<td>${ketqua.getDiemHeSo4(ketqua.getDiemHeSo()) }</td>
		                        </tr>
                   			</c:if>
	                        
                   		</c:forEach>
                   		
	                	</tbody>
	                	<tbody>
		                	<tr>
		                		<td colspan="8">
		                			Trung bình kỳ học: 
		                		</td>
		                	</tr>
	                	</tbody>
		                	
	                	
	            </table>
               </c:forEach>
               
        </div>
    </div>
</body>
<script type="text/javascript" src="sinhvien/xemdiem/diem.js"></script>
</html>