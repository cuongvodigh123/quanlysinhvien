<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Form lớp</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="icon" type="image/x-icon" href="image/ech.png">
	<script type="text/javascript" src="js/jquery-1.6.2.js"></script>
</head>
<body>
    <header>
        <nav class="navbar navbar-expand-md navbar-dark" style="background-color: tomato">
            <div>
                <form id="danhsachmh" action="ServerKhoa" method="get">
            		<input type="hidden" name="action" value="xem">
            		<input type="hidden" name="id" value="${khoa.getId()}">
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
                    <form id="formMH" action="ServerKhoa" method="post">
                    <input type="hidden" id="actionform" value="insert">
                    <input type="hidden" id="idkhoa" value="${khoa.getId()}">
                <caption>
                    <h2>
                        Tạo mới lớp của khoa ${khoa.getId()}
                    </h2>
                </caption>

                <fieldset class="form-group">
                    <label>Mã lớp:</label> 
                    <input type="text" value="" class="form-control" id="idlop" required="required">
                </fieldset>
                <button id="buttonsave" onclick="checkandsave(event)" class="btn btn-success">Save</button>
                <button id="buttontrove" onclick="trove(event)" class="btn btn-success" style="display: none">Trở về</button>
                <h3 id="demo"></h3>
                </form>
            </div>
        </div>
    </div>
</body>
<script type="text/javascript" src="admin/lopcuakhoa/edit.js"></script>
</html>