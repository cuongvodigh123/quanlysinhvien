<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trang chủ sinh viên</title>
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
            		<input type="hidden" name="username" value="${accountSinhVien.getMaSV() }" >
					<button type="submit" id="trovehome" style="display: none;"></button>            		
            </form>
        </div>
        <div class="box-duoi">
            <div class="left-div">
                <nav>
                    <ul class="menu">
	                    <li class="nutbam">
	                            <a class="thanhphan-menu"  onclick="editsinhvien()">Thông tin cá nhân</a>
	                            <form action="ServerSinhVien" method="get">
	                                <input type="hidden" name="action" value="edit">
	                                <input type="hidden" name="maSV" value="${accountSinhVien.getMaSV() }" >
	                                <button type="submit" id="editsinhvien" style="display: none;"></button>
	                            </form>
	                        </li>
                        <li class="nutbam">
                            <a class="thanhphan-menu" onclick="dangky()">Đăng ký môn học kỳ mới</a>
                            <form action="ServerSinhVien" method="get">
						    	<input type="hidden" name="action" value="dangkymon">
						    	<button type="submit" id="dangky" style="display: none;">Đăng ký môn học</button>
						    </form>
                        </li>
                        <li class="nutbam">
                            <a class="thanhphan-menu"  onclick="xemdiem()">Xem điểm</a>
                            <form action="ServerSinhVien" method="get">
						    	<input type="hidden" name="action" value="xemdiem">
						    	<button type="submit" id="xemdiem" style="display: none;"></button>
						    </form>
                        </li>
                        <li class="nutbam">
                        	<a class="thanhphan-menu"  onclick="dangxuat()">Đăng xuất</a>
                            <form action="ServerSinhVien" method="get">
                                <input type="hidden" name="action" value="dangxuat">
                                <button id="dangxuat" type="submit" style="display: none;"></button>
                            </form>
                        </li>
                    </ul>
                </nav>
            </div>
            <div class="right-div" style="margin-top: 100px;margin-left: 100px">
				<div style="display: flex;flex-direction: column;">
				<img id="anhdaidien" src="data:image/png;base64,${accountSinhVien.getAvatarIcon()}" alt="avata" style="width: 200px;height: 200px">
					
					<span><h4>Tài khoản:</h4></span>
				    <span style="display: inline;"><c:out value=" ${accountSinhVien.getMaSV()}" /></span>
				    <span><h4>Chức vụ:</h4></span>
				    <span style="display: inline;">Sinh viên</span>
				</div>
			    <br>
			    <input type="hidden" id="username" value="${accountSinhVien.getMaSV() }"/>
		
			    
			    <button id="doimk" onclick="doimatkhau()">Đổi mật khẩu</button>
			    <div id="divmk"></div>
			    <div id="demo"></div>
			    
			    <br> <br>
			    
			    
			    <br> <br>
			    
    	</div>
    </div>
    
    
</body>
<script type="text/javascript" src="sinhvien/trangchu.js"></script>
<script type="text/javascript">
function trovehome(){
	document.getElementById("trovehome").click();
}
</script>
</html>