<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Form Kỳ Học</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="icon" type="image/x-icon" href="image/ech.png">
	<script type="text/javascript" src="js/jquery-1.6.2.js"></script>
</head>
<body>
    <header>
        <nav class="navbar navbar-expand-md navbar-dark" style="background-color: tomato">
            <div>
                <form id="danhsachmh" action="ServletQLSV" method="get">
            		<input type="hidden" name="action" value="listkyhoc">
            		<input type="hidden" name="username" value="${acountAccount.getUsername()}" >
					<button type="submit" >Danh sách Kỳ Học</button>            		
            	</form>
            </div>
        </nav>
    </header>
    <br>
    <div class="container col-md-5">
        <div class="card">
            <div class="card-body">
                <c:if test="${kyhoc != null}">
                    <form id="formMH" action="ServerKhoa" method="post">
                    <input type="hidden" id="actionform" value="update">
                </c:if>
                <c:if test="${kyhoc == null}">
                    <form id="formMH" action="ServerKhoa" method="post">
                    <input type="hidden" id="actionform" value="insert">
                </c:if>
                <caption>
                    <h2>
                        <c:if test="${kyhoc != null}">Chỉnh sửa Khoa</c:if>
                        <c:if test="${kyhoc == null}">Tạo mới Khoa</c:if>
                    </h2>
                </caption>
                <c:if test="${kyhoc != null}">
                    <fieldset class="form-group">
                    <label>Mã Id kỳ học:</label> 
                    <input type="text" value="<c:out value='${kyhoc.getId()}' />" class="form-control" id="idkyhoc" required="required" readonly="readonly">
                	</fieldset>
                </c:if>
                <c:if test="${kyhoc == null}">
                    <fieldset class="form-group">
                    <label>Mã Id Kỳ học:</label> 
                    <input type="text" value="" class="form-control" id="idkyhoc" required="required">
                	</fieldset>
                </c:if>
                <fieldset class="form-group">
                    <label>Tên kỳ học:</label> 
                    <input type="text" value="<c:out value='${kyhoc.getMota()}' />" class="form-control" id="mota" required="required">
                </fieldset>
                <fieldset class="form-group">
                    <label>Chọn trạng thái</label> 
                    <br>
                    <select id="danghoc" style="width: 100%;height: 40px" required="required">
                    	<c:if test="${kyhoc == null}">
                  			<option value="" disabled selected>Select an option</option>
                  			<option value="0" >Đã kết thúc</option>
                  			<option value="1" >Đang giảng dạy</option>
                  			<option value="2" >Đang đăng ký</option>
                		</c:if>
				    	<c:if test="${kyhoc != null}">
				    		<c:if test="${kyhoc.getDangHocInt()=='0'}">
				    			<option value="0" selected="selected">Đã kết thúc</option>
				    			<option value="1" >Đang giảng dạy</option>
                  				<option value="2" >Đang đăng ký</option>
				    		</c:if>
                  			
                  			<c:if test="${kyhoc.getDangHocInt()=='1'}">
				    			<option value="0">Đã kết thúc</option>
				    			<option value="1" selected="selected">Đang giảng dạy</option>
                  				<option value="2" >Đang đăng ký</option>
				    		</c:if>
				    		
				    		<c:if test="${kyhoc.getDangHocInt()=='2'}">
				    			<option value="0" >Đã kết thúc</option>
				    			<option value="1" >Đang giảng dạy</option>
                  				<option value="2" selected="selected">Đang đăng ký</option>
				    		</c:if>
                		</c:if>
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
<script type="text/javascript" src="admin/kyhoc/edit.js"></script>
</html>