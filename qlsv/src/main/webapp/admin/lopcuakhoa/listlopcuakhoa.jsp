<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Danh sách lớp</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="icon" type="image/x-icon" href="image/ech.png">
	<script type="text/javascript" src="js/jquery-1.6.2.js"></script>
</head>
<body>
    <header>
        <nav class="navbar navbar-expand-md navbar-dark" style="background-color: tomato">
            <div>
            	<form action="ServletQLSV" method="get">
            		<input type="hidden" name="action" value="listkhoa">
            		<input type="hidden" name="username" value="${acountAccount.getUsername()}" >
					<button type="submit" >Trở lại</button>            		
            	</form>
            </div>
        </nav>
    </header>
    <br>
    <div class="row">
        <div class="container">
            <h3 class="text-center">Danh sách lớp của ${khoa.getTenkhoa() }</h3>
            <hr>
            <div class="container text-left">    
               </div>
               <br>
               <table class="table table-bordered">
                   <thead>
                       <tr>
                           <th>Mã lớp</th>
                       </tr>
                   </thead>
                   <tbody>
                    <c:forEach var="monhoc" items="${list}">
                        <tr>
                            <td><c:out value="${monhoc.getIdlop()}" /></td>

                            <td style="display: flex;justify-content: space-around;;">	
                            
                            	<form action="ServerLopCuaKhoa" method="post">
                            		<input type="hidden" name="action" value="delete">
                            		<input type="hidden" name="idlop" value="${monhoc.getIdlop()}">
                            		<input type="hidden" name="idkhoa" value="${khoa.getId()}">
                            		<input type="hidden" name="username" value="${acountAccount.getUsername()}" >
                            		<button type="submit">Delete</button>
                            	</form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <div>
				<form action="ServerLopCuaKhoa" method="post">
		       		<input type="hidden" name="action" value="addnew">
		       		<input type="hidden" name="idkhoa" value="${khoa.getId()}">
		       		<input type="hidden" name="username" value="${acountAccount.getUsername()}" >
		       		<button type="submit">Thêm khoa học</button>
		       	</form>
			</div>
        </div>
    </div>
	
</body>
</html>