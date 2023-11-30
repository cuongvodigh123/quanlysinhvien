<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Danh sách kỳ học</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="icon" type="image/x-icon" href="image/ech.png">
	<script type="text/javascript" src="js/jquery-1.6.2.js"></script>
</head>
<body>
    <div class="container">
        <div class="top-div">
            <h1 onclick="trovehome()">STUDENT MANAGEMENT</h1>
            <form action="ServletQLSV" method="get">
            		<input type="hidden" name="action" value="trangchu">
            		<input type="hidden" name="username" value="${acountAccount.getUsername()}" >
					<button type="submit" id="trovehome" style="display: none;"></button>            		
            </form>
        </div>
        <div class="box-duoi">
            <div class="left-div">
                <nav>
                    <ul class="menu">
                        <li class="nutbam">
                            <a class="thanhphan-menu" id="dssv"  onclick="dssv()">Danh sách sinh viên</a>
                            <form action="ServletQLSV" method="get">
                                <input type="hidden" name="action" value="listsinhvien">
                                <input type="hidden" name="username" value="123">
                                <button type="submit" id="gotodssv" style="display: none;"></button>
                            </form>
                        </li>
                        <li class="nutbam">
                            <a class="thanhphan-menu" id="dsmh"  onclick="dsmh()">Danh sách môn học</a>
                            <form action="ServletQLSV" method="get">
                                <input type="hidden" name="action" value="listmonhoc">
                                <input type="hidden" name="username" value="123">
                                <button type="submit" id="gotodsmh" style="display: none;"></button>
                            </form>
                        </li>
                        <li class="nutbam">
                            <form action="ServletQLSV" method="get">
                                <input type="hidden" name="action" value="listkyhoc">
                                <input type="hidden" name="username" value="123">
                                <button type="submit" id="gotodsnh" style="display: none;"></button>
                            </form>
                            <a class="thanhphan-menu" id="dskyhoc"  onclick="dsnh()">Danh sách kỳ học</a>
                        </li>
                        <li class="nutbam">
                            <a class="thanhphan-menu" id="dskhoa"  onclick="dskhoa()">Danh sách khoa</a>
                            <form action="ServletQLSV" method="get">
                                <input type="hidden" name="action" value="listkhoa">
                                <input type="hidden" name="username" value="123">
                                <button type="submit" id="gotodskhoa" style="display: none;"></button>
                            </form>
                        </li>
                        <li class="nutbam">
                            <a class="thanhphan-menu" id="dsgiangvien"  onclick="dsgiangvien()">Danh sách giảng viên</a>
                            <form action="ServletQLSV" method="get">
                                <input type="hidden" name="action" value="listgiangvien">
                                <input type="hidden" name="username" value="123">
                                <button type="submit" id="gotodsgiangvien" style="display: none;"></button>
                            </form>
                        </li>
                        <li class="nutbam">
                        	<a class="thanhphan-menu"  onclick="dangxuat()">Đăng xuất</a>
                            <form action="ServletQLSV" method="get">
                                <input type="hidden" name="action" value="dangxuat">
                                <button id="dangxuat" type="submit" style="display: none;"></button>
                            </form>
                        </li>
                    </ul>
                </nav>
            </div>
            <div class="right-div" style="margin-top: 100px;margin-left: 100px">
		    <div class="row">
		        <div class="container">
		            <h3 class="text-center">Danh sách kỳ học</h3>
		               <br>
		               <table class="table table-bordered">
		                   <thead>
		                       <tr>
		                           <th>Mã kỳ học</th>
		                           <th>Mô tả</th>
		                           <th>Trạng thái</th>
		                           <th>Lựa chọn</th>
		                       </tr>
		                   </thead>
		                   <tbody>
		                    <c:forEach var="monhoc" items="${list}">
		                        <tr>
		                            <td><c:out value="${monhoc.getId()}" /></td>
		                            <td><c:out value="${monhoc.getMota()}" /></td>
		                            <td><c:out value="${monhoc.getDanghoc()}" /></td>
		                            
		                            <td style="display: flex;justify-content: space-around;;">	
		                            	<form action="ServerKyHoc" method="get">
		                            		<input type="hidden" name="action" value="xem">
		                            		<input type="hidden" name="id" value="${monhoc.getId()}">
		                            		<input type="hidden" name="username" value="${acountAccount.getUsername()}" >
		                            		<button type="submit">Xem</button>
		                            	</form>
		                            
		
		                            	<form action="ServerKyHoc" method="get">
		                            		<input type="hidden" name="action" value="formedit">
		                            		<input type="hidden" name="id" value="${monhoc.getId()}">
		                            		<input type="hidden" name="username" value="${acountAccount.getUsername()}" >
		                            		<button type="submit">Edit</button>
		                            	</form>
		
		                            	
		                            	<form action="ServerKyHoc" method="post">
		                            		<input type="hidden" name="action" value="delete">
		                            		<input type="hidden" name="id" value="${monhoc.getId()}">
		                            		<input type="hidden" name="username" value="${acountAccount.getUsername()}" >
		                            		<button type="submit">Delete</button>
		                            	</form>
		                            </td>
		                        </tr>
		                    </c:forEach>
		                </tbody>
		            </table>
		            <div>
						<form action="ServerKyHoc" method="post">
				       		<input type="hidden" name="action" value="addnew">
				       		<input type="hidden" name="username" value="${acountAccount.getUsername()}" >
				       		<button type="submit">Thêm môn học</button>
				       	</form>
					</div>
		        </div>
		    </div>
			
		</div>
	</div>
</body>
<script type="text/javascript" src="js/trangchu.js"></script>
</html>