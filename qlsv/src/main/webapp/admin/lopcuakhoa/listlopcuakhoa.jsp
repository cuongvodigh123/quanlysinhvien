<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Danh sách lớp</title>
    <link rel="icon" type="image/x-icon" href="image/ech.png">
	<script type="text/javascript" src="js/jquery-1.6.2.js"></script>
<script src="https://cdn.jsdelivr.net/npm/feather-icons/dist/feather.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css"
        integrity="sha512-NhSC1YmyruXifcj/KFRWoC561YpHpc5Jtzgvbuzx5VozKpWvQ+4nXhPdFgmx8xqexRcpAglTj9sIBWINXa8x5w=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="css/base.css">
<link rel="stylesheet" href="css/home.css">
<link rel="stylesheet" href="css/style.css">
</head>
<body>
	<div class="main">
        <div class="sider">
            <ul class="menu">
                <h1>STUDENT MANAGEMENT</h1>
                <li>
                    <a onclick="trovehome()">
                        <i data-feather="home"></i>
                        <span>Trang chủ</span>
                    </a>
                    <form action="ServletQLSV" method="get">
            		<input type="hidden" name="action" value="trangchu">
            		<input type="hidden" name="username" value="${acountAccount.getUsername()}" >
					<button type="submit" id="trovehome" style="display: none;"></button>            		
            </form>
                </li>
                <li>
                    <a id="dssv" onclick="dssv()">
                        <i data-feather="users"></i>
                        <span>Danh sách sinh viên</span>
                    </a>
                    <form action="ServletQLSV" method="get">
                        <input type="hidden" name="action" value="listsinhvien">
                        <input type="hidden" name="username" value="123">
                        <button type="submit" id="gotodssv" style="display: none;"></button>
                    </form>
                </li>
                <li>
                    <a id="dsmh" onclick="dsmh()">
                        <i data-feather="book-open"></i>
                        <span>Danh sách môn học</span>
                    </a>
                    <form action="ServletQLSV" method="get">
                        <input type="hidden" name="action" value="listmonhoc">
                        <input type="hidden" name="username" value="123">
                        <button type="submit" id="gotodsmh" style="display: none;"></button>
                    </form>
                </li>
                <li>
                    <a id="dskyhoc" onclick="dsnh()">
                        <i data-feather="calendar"></i>
                        <span>Danh sách kỳ học</span>
                    </a>
                    <form action="ServletQLSV" method="get">
                        <input type="hidden" name="action" value="listkyhoc">
                        <input type="hidden" name="username" value="123">
                        <button type="submit" id="gotodsnh" style="display: none;"></button>
                    </form>
                </li>
                <li>
                    <a id="dskhoa" onclick="dskhoa()">
                        <i data-feather="archive"></i>
                        <span>Danh sách khoa</span>
                    </a>
                    <form action="ServletQLSV" method="get">
                        <input type="hidden" name="action" value="listkhoa">
                        <input type="hidden" name="username" value="123">
                        <button type="submit" id="gotodskhoa" style="display: none;"></button>
                    </form>
                </li>
                <li>
                    <a id="dsgiangvien" onclick="dsgiangvien()">
                        <i data-feather="users"></i>
                        <span>Danh sách giảng viên</span>
                    </a>
                    <form action="ServletQLSV" method="get">
                        <input type="hidden" name="action" value="listgiangvien">
                        <input type="hidden" name="username" value="123">
                        <button type="submit" id="gotodsgiangvien" style="display: none;"></button>
                    </form>
                </li>
                <li>
                	<a onclick="dangxuat()">
                            <i data-feather="log-out"></i>
                            <span>Đăng xuất</span>
                        </a>
                    <form action="ServletQLSV" method="get">
                        <input type="hidden" name="action" value="dangxuat">
                         <button id="dangxuat" type="submit" style="display: none;"></button>
                    </form>
                </li>
            </ul>
        </div>
        <div class="content">
        	<div class="content__header">
                <div class="content__nav">
                    <ul class="content__icon">
                        <li>
                            <i data-feather="bell"></i>
                        </li>
                        <li>
                            <i data-feather="settings"></i>
                        </li>
                    </ul>
                    <div class="content__avatar">
                        <img id="anhdaidien" src="data:image/png;base64,${acountAccount.getAvatarIcon()}" alt="avata" style="width: 50px;height: 50px">
                    </div>
                </div>
            </div>	
   	        <div class="container">
   	        <div>
            	<form action="ServletQLSV" method="get">
            		<input type="hidden" name="action" value="listkhoa">
            		<input type="hidden" name="username" value="${acountAccount.getUsername()}" >
					<button type="submit" >Trở lại</button>            		
            	</form>
            </div>
            <h3 class="text-center">Danh sách lớp của ${khoa.getTenkhoa() }</h3>
               <table class="table table-bordered">
                   <thead>
                       <tr>
                           <th>Mã lớp</th>
                           <th>Action</th>
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
	            <br>
	            <div>
					<form action="ServerLopCuaKhoa" method="post">
			       		<input type="hidden" name="action" value="addnew">
			       		<input type="hidden" name="idkhoa" value="${khoa.getId()}">
			       		<input type="hidden" name="username" value="${acountAccount.getUsername()}" >
			       		<button type="submit">Thêm</button>
			       	</form>
				</div>
	        </div>
	    </div>
    </div>
	
</body>
<script type="text/javascript" src="js/trangchu.js"></script>
<script>
        feather.replace();
    </script>
</html>