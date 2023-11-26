<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Form môn học kỳ học</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="icon" type="image/x-icon" href="image/ech.png">
	<script type="text/javascript" src="js/jquery-1.6.2.js"></script>
</head>
<body>
    <header>
        <nav class="navbar navbar-expand-md navbar-dark" style="background-color: tomato">
            <div>
                <form id="danhsachmh" action="ServerKyHoc" method="get">
            		<input type="hidden" name="action" value="xem">
            		<input type="hidden" name="id" value="${kyhoc.getId()}" >
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
                <c:if test="${mhkh != null}">
                    <form id="formMH" action="ServerMonHocKyHoc" method="post">
                    <input type="hidden" id="actionform" value="update">
                </c:if>
                <c:if test="${mhkh == null}">
                    <form id="formMH" action="ServerMonHocKyHoc" method="post">
                    <input type="hidden" id="actionform" value="insert">
                </c:if>
                <caption>
                    <h2>
                        <c:if test="${mhkh != null}">Chỉnh sửa Môn học kỳ học ${kyhoc.getMota() }</c:if>
                        <c:if test="${mhkh == null}">Tạo mới môn học kỳ học ${kyhoc.getMota() }</c:if>
                    </h2>
                </caption>
                <c:if test="${mhkh != null}">
                    <fieldset class="form-group">
                    <label>Mã Id môn học kỳ học:</label> 
                    <input type="text" value="<c:out value='${mhkh.getId()}' />" class="form-control" id="idmonhockyhoc" required="required" readonly="readonly">
                	</fieldset>
                </c:if>
                <c:if test="${mhkh == null}">
                    <fieldset class="form-group">
                    <label>Mã Id môn học kỳ học:</label> 
                    <input type="text" value="${soluong }" class="form-control" id="idmonhockyhoc" required="required">
                	</fieldset>
                </c:if>
                <input type="hidden" id="idkyhoc" value="${kyhoc.getId()}" >
                <fieldset class="form-group">
                    <label>Chọn môn</label> 
                    <br>
                    <select id="idmonhoc" style="width: 100%;height: 40px" required="required">
                    	<c:if test="${mhkh == null}">
                  			<option value="" disabled selected>Select an option</option>
                		</c:if>
				    	<c:forEach var="mh" items="${list }">
				    		<c:if test="${mhkh.getMh().getIdmonhoc() == mh.getIdmonhoc()}">
					    		<option value="<c:out value='${mh.getIdmonhoc()}' />" selected="selected">
					    			<p ><c:out value='${mh.getTen()}' /></p>		    			
					    		</option>
				    		</c:if>
				    		<c:if test="${mhkh.getMh().getIdmonhoc() != mh.getIdmonhoc()}">
					    		<option value="<c:out value='${mh.getIdmonhoc()}' />">
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
<script type="text/javascript" src="admin/monhockyhoc/edit.js"></script>
</html>