<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Danh sách môn học</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="icon" type="image/x-icon" href="image/ech.png">
	<script type="text/javascript" src="js/jquery-1.6.2.js"></script>
</head>
<body>
    <header>
        <nav class="navbar navbar-expand-md navbar-dark" style="background-color: tomato">
            <div>
            	<form action="ServletQLSV" method="get">
            		<input type="hidden" name="action" value="trangchu">
            		<input type="hidden" name="username" value="${acountAccount.getUsername()}" >
					<button type="submit" >Trang chủ</button>            		
            	</form>
            </div>
        </nav>
    </header>
    <br>
    <div class="row">
        <div class="container">
            <h3 class="text-center">Danh sách môn học</h3>
            <hr>
            <div class="container text-left">    
               </div>
               <br>
               <table class="table table-bordered">
                   <thead>
                       <tr>
                           <th>Mã môn học</th>
                           <th>Tên môn học</th>
                           <th>Khoa</th>
                           <th>Số tín chỉ</th>
                           <th>Lựa chọn</th>
                       </tr>
                   </thead>
                   <tbody>
                    <c:forEach var="monhoc" items="${list}">
                        <tr>
                            <td><c:out value="${monhoc.getIdmonhoc()}" /></td>
                            <td><c:out value="${monhoc.getTen()}" /></td>
                            <td><c:out value="${monhoc.getKhoa().getTenkhoa()}" /></td>
                            <td><c:out value="${monhoc.getTinchi()}" /></td>
                            
                            <td style="display: flex;justify-content: space-around;;">	

                            	<form action="ServerMonHoc" method="get">
                            		<input type="hidden" name="action" value="formeditMH">
                            		<input type="hidden" name="id" value="${monhoc.getIdmonhoc()}">
                            		<input type="hidden" name="username" value="${acountAccount.getUsername()}" >
                            		<button type="submit">Edit</button>
                            	</form>
                            
                            	<form action="ServerMonHoc" method="post">
                            		<input type="hidden" name="action" value="deleteMH">
                            		<input type="hidden" name="id" value="${monhoc.getIdmonhoc()}">
                            		<input type="hidden" name="username" value="${acountAccount.getUsername()}" >
                            		<button type="submit">Delete</button>
                            	</form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
	<div>
		<form action="ServerMonHoc" method="post">
       		<input type="hidden" name="action" value="addnewMh">
       		<input type="hidden" name="username" value="${acountAccount.getUsername()}" >
       		<button type="submit">Thêm môn học</button>
       	</form>
	</div>
</body>
</html>