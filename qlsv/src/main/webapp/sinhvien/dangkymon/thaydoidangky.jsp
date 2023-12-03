<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thay đổi đăng ký</title>
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
                    <form action="ServerSinhVien" method="get">
	            		<input type="hidden" name="action" value="trangchu">
	            		<input type="hidden" name="username" value="${accountSinhVien.getMaSV()}" >
						<button type="submit" id="trovehome" style="display: none;"></button>            		
		            </form>
                </li>
              	<li>
              		<a onclick="editsinhvien()">
                        <i data-feather="users"></i>
                        <span>Thông tin cá nhân</span>
                    </a>
	                <form action="ServerSinhVien" method="get">
	                    <input type="hidden" name="action" value="edit">
	                    <input type="hidden" name="maSV" value="${accountSinhVien.getMaSV() }" >
	                    <button type="submit" id="editsinhvien" style="display: none;"></button>
	                </form>
                </li>
                <li>
                	<a onclick="dangky()">
                        <i data-feather="users"></i>
                        <span>Đăng ký môn học kỳ mới</span>
                    </a>
                    <form action="ServerSinhVien" method="get">
					  	<input type="hidden" name="action" value="dangkymon">
					  	<button type="submit" id="dangky" style="display: none;">Đăng ký môn học</button>
				  	</form>
                </li>
                <li>
                	<a onclick="xemdiem()">
                        <i data-feather="users"></i>
                        <span>Xem điểm</span>
                    </a>
                    <form action="ServerSinhVien" method="get">
					  	<input type="hidden" name="action" value="xemdiem">
					  	<button type="submit" id="xemdiem" style="display: none;"></button>
				  	</form>
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
	                    <img id="anhdaidien" src="data:image/png;base64,${accountSinhVien.getAvatarIcon()}" alt="avata" style="width: 50px;height: 50px">
	                </div>
            	</div>
        	</div>	
            <div class="container">
            <h3 class="text-center">Danh sách lớp học phần</h3>
	               <table class="table table-bordered">
	               		<caption style="caption-side: top;"><h3>Kỳ học: ${kyhoc.getMota()}</h3></caption>
	                   	<thead>
	                       <tr>
	                       	   <th>STT</th>
	                           <th>Mã Môn</th>
	                           <th>Tên Lớp HP</th>
	                           <th>Tên Môn</th>
	                           <th>Số Tín</th>
	                           <th>Giảng Viên</th>
	                           <th>Số lượng</th>
	                           <th>Còn lại</th>
	                           <th>Trạng thái</th>
	                       </tr>
	                   	</thead>
	                   	<tbody> 
                   		<c:forEach var="lhp" items="${list}" varStatus="index">
                   			
                   			<c:if test="${dangkyhocDao.getDaDangKy(lhp.getIdstt(),sinhvien.getMaSV()) ==1}">
	                   			<tr id="${lhp.getIdstt() }" class="${lhp.getMhkh().getMh().getIdmonhoc() }">
	                   				<td>${index.index +1}</td>
	                   				<td>${lhp.getMhkh().getMh().getIdmonhoc() }</td>
	                   				<td>${lhp.getTen() }</td>
	                   				<td>${lhp.getMhkh().getMh().getTen() }</td>
	                   				<td>${lhp.getMhkh().getMh().getTinchi() }</td>
	                   				<td>${lhp.getGiangvien().getTen()}</td>
	                   				<td>${lhp.getSoluong()}</td>
	                   				<td>${lhp.getSoluong()-dangkyhocDao.getSLConLai(lhp.getIdstt())}</td>
	                   				<td><input type="checkbox" checked="checked" onchange="luudangky(event)" class="checkbox-group" data-group="${lhp.getMhkh().getMh().getIdmonhoc()}"></td>
		                        </tr>
                   			</c:if>
                   			<c:if test="${dangkyhocDao.getDaDangKy(lhp.getIdstt(),sinhvien.getMaSV()) ==0}">
                   				<c:if test="${lhp.getSoluong()-dangkyhocDao.getSLConLai(lhp.getIdstt()) ==0}">
                   					<tr id="${lhp.getIdstt() }" class="${lhp.getMhkh().getMh().getIdmonhoc() }">
	                   				<td>${index.index +1}</td>
	                   				<td>${lhp.getMhkh().getMh().getIdmonhoc() }</td>
	                   				<td>${lhp.getTen() }</td>
	                   				<td>${lhp.getMhkh().getMh().getTen() }</td>
	                   				<td>${lhp.getMhkh().getMh().getTinchi() }</td>
	                   				<td>${lhp.getGiangvien().getTen()}</td>
	                   				<td>${lhp.getSoluong()}</td>
	                   				<td>${lhp.getSoluong()-dangkyhocDao.getSLConLai(lhp.getIdstt())} </td>
	                   				<td><input type="checkbox" disabled="disabled" onchange="luudangky(event)" class="checkbox-group" data-group="${lhp.getMhkh().getMh().getIdmonhoc()}"></td>
		                        </tr>
                   				</c:if>
                   				
	                   			<c:if test="${lhp.getSoluong()-dangkyhocDao.getSLConLai(lhp.getIdstt()) !=0}">
                   					<tr id="${lhp.getIdstt() }" class="${lhp.getMhkh().getMh().getIdmonhoc() }">
	                   				<td>${index.index +1}</td>
	                   				<td>${lhp.getMhkh().getMh().getIdmonhoc() }</td>
	                   				<td>${lhp.getTen() }</td>
	                   				<td>${lhp.getMhkh().getMh().getTen() }</td>
	                   				<td>${lhp.getMhkh().getMh().getTinchi() }</td>
	                   				<td>${lhp.getGiangvien().getTen()}</td>
	                   				<td>${lhp.getSoluong()}</td>
	                   				<td>${lhp.getSoluong()-dangkyhocDao.getSLConLai(lhp.getIdstt())} </td>
	                   				<td><input type="checkbox" onchange="luudangky(event)" class="checkbox-group" data-group="${lhp.getMhkh().getMh().getIdmonhoc()}"></td>
		                        </tr>
                   				</c:if>
                   			</c:if>
	                        
                   		</c:forEach>
                   		
	                	</tbody>        	
	            </table> 
	            <br>
	         	<div>
	                <button id="buttontrove" onclick="trove()" class="btn btn-success">Trở về</button>
	                <form action="ServerSinhVien" method="get">
                   		<input type="hidden" name="action" value="getdangkymonhoc">
                   		<input type="hidden" name="idkyhoc" value="${kyhoc.getId()}">
                   		<button type="submit" id="trovedangkymonhoc" style="display: none;"></button>
                   	</form>
	            </div>  
	            
        </div>
        
    </div>
</body>
<script type="text/javascript" src="sinhvien/dangkymon/thaydoidangky.js"></script>
<script type="text/javascript" src="sinhvien/trangchu.js"></script>
<script>
        feather.replace();
    </script>
</html>