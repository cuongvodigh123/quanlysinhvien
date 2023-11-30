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
<link rel="stylesheet" href="css/style.css">
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
                <div style="display: flex;flex-direction: column;">
					<img id="anhdaidien" src="data:image/png;base64,${acountAccount.getAvatarIcon()}" alt="avata" style="width: 200px;height: 200px">
						
					<span><h4>Tài khoản:</h4></span>
				    <span style="display: inline;"><c:out value=" ${acountAccount.getUsername()}" /></span>
				    <span><h4>Chức vụ:</h4></span>
				    <span style="display: inline;"><c:out value=" ${acountAccount.getRole()}" /></span>
				</div>
				    <br>
			    <input id="add" type="hidden" value="${acountAccount.getAvatarIcon() }">
			    <input type="hidden" id="username" value="${acountAccount.getUsername() }"/>
			    
			    <input type="file" id="fileInput" style="display:none">
			    <button onclick="chooseFile()">Đổi Ảnh Đại Diện</button>
			    
			    <button id="doimk" onclick="doimatkhau()">Đổi mật khẩu</button>
		     	<div id="divmk"></div>
                <div id="demo"></div>           
            </div>
        </div>
    </div>
</body>
<script type="text/javascript" src="js/trangchu.js"></script>
</html>