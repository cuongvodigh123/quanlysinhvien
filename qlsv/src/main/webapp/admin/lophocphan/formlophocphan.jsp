<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Form lớp học phần</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="icon" type="image/x-icon" href="image/ech.png">
	<script type="text/javascript" src="js/jquery-1.6.2.js"></script>
</head>
<body>
    <header>
        <nav class="navbar navbar-expand-md navbar-dark" style="background-color: tomato">
            <div>
                <form id="danhsachmh" action="ServerMonHocKyHoc" method="get">
            		<input type="hidden" name="action" value="xem">
            		<input type="hidden" name="id" value="${mhkh.getId()}" >
            		<input type="hidden" name="username" value="${acountAccount.getUsername()}" >
					<button type="submit" >Trở lại</button>            		
            	</form>
            </div>
        </nav>
    </header>
    <br>
    <div class="container col-md-5">
        <div class="card">
            <div class="card-body">
                <c:if test="${lophocphan != null}">
                    <form id="formMH" action="ServerLopHocPhan" method="post">
                    <input type="hidden" id="actionform" value="update">
                </c:if>
                <c:if test="${lophocphan == null}">
                    <form id="formMH" action="ServerLopHocPhan" method="post">
                    <input type="hidden" id="actionform" value="insert">
                </c:if>
                <caption>
                    <h2>
                        <c:if test="${lophocphan != null}">Chỉnh sửa lớp môn ${mhkh.getMh().getTen()} kỳ ${mhkh.getKyhoc().getMota()}</c:if>
                        <c:if test="${lophocphan == null}">Tạo mới môn ${mhkh.getMh().getTen()} kỳ ${mhkh.getKyhoc().getMota()}</c:if>
                    </h2>
                </caption>
                <c:if test="${lophocphan != null}">
                    <fieldset class="form-group">
                    <label>Mã Id:</label> 
                    <input type="text" value="<c:out value='${lophocphan.getId()}' />" class="form-control" id="idlophocphan" required="required" readonly="readonly">
                	</fieldset>
                </c:if>
                <c:if test="${lophocphan == null}">
                    <fieldset class="form-group">
                    <label>Mã Id:</label> 
                    <input type="text" value="${soluong }" class="form-control" id="idlophocphan" required="required">
                	</fieldset>
                </c:if>
                <fieldset class="form-group">
	                <label>Tên lớp:</label> 
	                <input type="text" value="${lophocphan.getTen()}" class="form-control" id="name" required="required">
            	</fieldset>


                <fieldset class="form-group">
	                <label>Số lượng:</label> 
	                <input type="text" value="${lophocphan.getSoluong()}" class="form-control" id="soluong" required="required">
            	</fieldset>
            	
            	<fieldset class="form-group">
	                <label>Mô tả:</label> 
	                <input type="text" value="${lophocphan.getMota()}" class="form-control" id="mota" required="required">
            	</fieldset>
            	
                <input type="hidden" id="idmhkh" value="${mhkh.getId()}" >
                <fieldset class="form-group">
                    <label>Chọn giảng viên</label> 
                    <br>
                    <select id="idgianvien" style="width: 100%;height: 40px" required="required">
                    	<c:if test="${lophocphan == null}">
                  			<option value="" disabled selected>Select an option</option>
                		</c:if>
				    	<c:forEach var="mh" items="${list }">
				    		<c:if test="${lophocphan.getGiangvien().getId() == mh.getId()}">
					    		<option value="<c:out value='${mh.getId()}' />" selected="selected">
					    			<p ><c:out value='${mh.getTen()}' /></p>		    			
					    		</option>
				    		</c:if>
				    		<c:if test="${lophocphan.getGiangvien().getId() != mh.getId()}">
					    		<option value="<c:out value='${mh.getId()}' />">
					    			<p ><c:out value='${mh.getTen()}' /></p>		    			
					    		</option>
				    		</c:if>
				    	</c:forEach>
				    </select>
                </fieldset>
                <button id="buttonsave" onclick="checkandsave(event)" class="btn btn-success">Save</button>
                <button id="buttontrove" onclick="trove(event)" class="btn btn-success" style="display: none">Trở về</button>
                <h3 id="demo"></h3>
                </form>
            </div>
        </div>
    </div>
</body>
<script type="text/javascript" src="admin/lophocphan/edit.js"></script>
</html>