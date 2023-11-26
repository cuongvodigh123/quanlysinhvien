<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Form Khoa</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="icon" type="image/x-icon" href="image/ech.png">
	<script type="text/javascript" src="js/jquery-1.6.2.js"></script>
</head>
<body>
    <header>
        <nav class="navbar navbar-expand-md navbar-dark" style="background-color: tomato">
            <div>
                <form id="danhsachmh" action="ServletQLSV" method="get">
            		<input type="hidden" name="action" value="listkhoa">
            		<input type="hidden" name="username" value="${acountAccount.getUsername()}" >
					<button type="submit" >Danh sách Khoa</button>            		
            	</form>
            </div>
        </nav>
    </header>
    <br>
    <div class="container col-md-5">
        <div class="card">
            <div class="card-body">
                <c:if test="${khoa != null}">
                    <form id="formMH" action="ServerKhoa" method="post">
                    <input type="hidden" id="actionform" value="update">
                </c:if>
                <c:if test="${khoa == null}">
                    <form id="formMH" action="ServerKhoa" method="post">
                    <input type="hidden" id="actionform" value="insert">
                </c:if>
                <caption>
                    <h2>
                        <c:if test="${khoa != null}">Chỉnh sửa Khoa</c:if>
                        <c:if test="${khoa == null}">Tạo mới Khoa</c:if>
                    </h2>
                </caption>
                <c:if test="${khoa != null}">
                    <fieldset class="form-group">
                    <label>Mã Id khoa:</label> 
                    <input type="text" value="<c:out value='${khoa.getId()}' />" class="form-control" id="idkhoa" required="required" readonly="readonly">
                	</fieldset>
                </c:if>
                <c:if test="${khoa == null}">
                    <fieldset class="form-group">
                    <label>Mã Id khoa:</label> 
                    <input type="text" value="" class="form-control" id="idkhoa" required="required">
                	</fieldset>
                </c:if>
                <fieldset class="form-group">
                    <label>Tên khoa:</label> 
                    <input type="text" value="<c:out value='${khoa.getTenkhoa()}' />" class="form-control" id="name" required="required">
                </fieldset>
                <button id="buttonsave" onclick="checkandsave(event)" class="btn btn-success">Save</button>
                <button id="buttontrove" onclick="trove(event)" class="btn btn-success" style="display: none">Trở về</button>
                <h3 id="demo"></h3>
                </form>
            </div>
        </div>
    </div>
</body>
<script type="text/javascript" src="admin/khoa/edit.js"></script>
</html>