<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Danh sách sinh viên</title>
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
			    <center>
			        <h1>Danh sách sinh viên</h1>
			        <h2>
			            
			           	<a href="/qlsv/ServletQLSV?action=excel" target="_blank">Nhập File Excel</a>
			        </h2>
			    </center>
			    <div> 
			    <div style="display: flex;;justify-content:center;align-items: center;flex-direction: column;">
			    	<div>
					   <p>Tìm theo:</p>
					    <select id="sapxep">
					    	<option value="maSV">Mã sinh viên</option>
					    	<option value="tenSV">Tên sinh viên</option>
					    	<option value="lopSV">Lớp</option>
					    	<option value="gioiTinh">Giới tính</option>
					    	<option value="ngaySinh">Ngày sinh</option>
					    	<option value="soDienThoai">Số điện thoại</option>
					    </select>
					    <input id="strFind" type="text">
					    <button id="check" onclick="check()">Tìm</button>
				    </div>
				    <br>
				    <form action="ServletQLSV" method="post" target="_blank">
				    	<input type="hidden" name="action" value="exportexcel">
				    	<input id="q" type="hidden" name="q" value="">
				    	<input id="w" type="hidden" name="w" value="">
				    	<input id="e" type="hidden" name="e" value="">
				    	<input id="r" type="hidden" name="r" value="">
				    	<button type="submit" style="width: auto;height: 50px">Xuất File Excel Danh Sách Đang Hiển Thị</button>
				    </form>
				    <br>
			        <table id="boxdssv" border="1" cellpadding="5">
			            <caption><h2>Danh sách</h2></caption>
			            <tr>
			                <th onclick="sortmasv()">Mã sinh viên</th>
			                <th onclick="sorttensv()">Tên sinh viên</th>
			                <th onclick="sortlopsv()">Lớp</th>
			                <th onclick="sortgioitinh()">Giới tính</th>
			                <th onclick="sortngaysinh()">Ngày sinh</th>
			                <th onclick="sortsdt()">Số điện thoại</th>
			            </tr>     
			            
			        </table>
			    </div>
			    </div>   
	    </div>
    </div> 
</body>
<script type="text/javascript" src="js/liststudent.js"></script>
<script type="text/javascript" src="js/trangchu.js"></script>
</html>