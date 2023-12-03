<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trang chủ</title>
<link rel="icon" type="image/x-icon" href="image/ech.png">
<script type="text/javascript" src="js/jquery-1.6.2.js"></script>
<script src="https://cdn.jsdelivr.net/npm/feather-icons/dist/feather.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css"
        integrity="sha512-NhSC1YmyruXifcj/KFRWoC561YpHpc5Jtzgvbuzx5VozKpWvQ+4nXhPdFgmx8xqexRcpAglTj9sIBWINXa8x5w=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="css/base.css">
<link rel="stylesheet" href="css/home.css">
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
	            <div class="content__banner">
	                <h1>Welcome back, </h1>
	                <p>
	                    STUDENT MANAGEMENT SYSTEM DESIGNED BY GROUP 15 <br>
                   	 	<span style="display: inline;"><c:out value=" ${acountAccount.getUsername()}" /></span><br>
                    	<span style="display: inline;"><c:out value=" ${acountAccount.getRole()}" /></span><br>
	                </p>
				    <br>
			    </div>
			    <input id="add" type="hidden" value="${acountAccount.getAvatarIcon() }">
			    <input type="hidden" id="username" value="${acountAccount.getUsername() }"/>
			    
			    <input type="file" id="fileInput" style="display:none">
			   
			    
		     	
		     	<div class="content__box1">
	                <div class="content__info">
                    	<div class="content__info-item">
	                        <button onclick="resetTKSV()">Reset Tài khoản sinh viên</button>
			    			<input id="resettaikhoan" type="text">
                    	</div>
                    	<div id="divmk" class="content__info"></div>
                		<div id="demo" class="content__info"></div>  
                   	</div>
	                <div class="content__function">
			                <a onclick="chooseFile()" class="content__change">
		                        <div>
		                            <i data-feather="edit"></i>
		                        </div>
		                        <h3>Đổi ảnh đại diện</h3>
		                    </a>
		                    <a id="doimk" onclick="doimatkhau()" class="content__change">
		                        <div>
		                            <i data-feather="grid"></i>
		                        </div>
		                        <h3>Đổi mật khẩu</h3>
		                    </a>  
	                </div>
	            </div>         
         </div>
	</div>
</body>
<script>
        feather.replace();
    </script>
<script type="text/javascript" src="js/trangchu.js"></script>
</html>