<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Danh sách MHKH</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="icon" type="image/x-icon" href="image/ech.png">
	<script type="text/javascript" src="js/jquery-1.6.2.js"></script>
</head>
<body>
    <header>
        <nav class="navbar navbar-expand-md navbar-dark" style="background-color: tomato">
            <div>
            	<form action="ServletQLSV" method="get">
            		<input type="hidden" name="action" value="listkyhoc">
            		<input type="hidden" name="username" value="${acountAccount.getUsername()}" >
					<button type="submit" >Trở lại</button>            		
            	</form>
            </div>
        </nav>
    </header>
    <br>
    <div class="row">
        <div class="container">
            <h3 class="text-center">Danh sách môn học của ${kyhoc.getMota() } </h3>
            <hr>
            <div class="container text-left">    
               </div>
               <br>
               <table class="table table-bordered">
                   <thead>
                       <tr>
                           <th>ID</th>
                           <th>ID Môn Học</th>
                           <th>Tên Môn</th>
                           <th>Lựa chọn</th>
                       </tr>
                   </thead>
                   <tbody>
                    <c:forEach var="monhoc" items="${list}">
                        <tr>
                            <td><c:out value="${monhoc.getId()}" /></td>
                            <td><c:out value="${monhoc.getMh().getIdmonhoc()}" /></td>
                            <td><c:out value="${monhoc.getMh().getTen()}" /></td>
                            
                            <td style="display: flex;justify-content: space-around;;">	
                            	<form action="ServerMonHocKyHoc" method="get">
                            		<input type="hidden" name="action" value="xem">
                            		<input type="hidden" name="id" value="${monhoc.getId()}">
                            		<input type="hidden" name="username" value="${acountAccount.getUsername()}" >
                            		<button type="submit">Xem</button>
                            	</form>
                            

                            	<form action=ServerMonHocKyHoc method="get">
                            		<input type="hidden" name="action" value="formedit">
                            		<input type="hidden" name="id" value="${monhoc.getId()}">
                            		<input type="hidden" name="idkyhoc" value="${kyhoc.getId()}" >
                            		<input type="hidden" name="username" value="${acountAccount.getUsername()}" >
                            		<button type="submit">Edit</button>
                            	</form>

                            	
                            	<form action="ServerMonHocKyHoc" method="post">
                            		<input type="hidden" name="action" value="delete">
                            		<input type="hidden" name="id" value="${monhoc.getId()}">
                            		<input type="hidden" name="idkyhoc" value="${kyhoc.getId()}" >
                            		<input type="hidden" name="username" value="${acountAccount.getUsername()}" >
                            		<button type="submit">Delete</button>
                            	</form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <div>
				<form action="ServerMonHocKyHoc" method="post">
		       		<input type="hidden" name="action" value="addnew">
		       		<input type="hidden" name="soluong" value="${list.size() }">
		       		<input type="hidden" name="idkyhoc" value="${kyhoc.getId()}" >
		       		<input type="hidden" name="username" value="${acountAccount.getUsername()}" >
		       		<button type="submit">Thêm môn học vào kỳ học này</button>
		       	</form>
			</div>
        </div>
    </div>
	
</body>
</html>