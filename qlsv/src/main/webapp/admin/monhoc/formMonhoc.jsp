<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Form môn học</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="icon" type="image/x-icon" href="image/ech.png">
	<script type="text/javascript" src="js/jquery-1.6.2.js"></script>
</head>
<body>
    <header>
        <nav class="navbar navbar-expand-md navbar-dark" style="background-color: tomato">
            <div>
                <form id="danhsachmh" action="ServletQLSV" method="get">
            		<input type="hidden" name="action" value="listmonhoc">
            		<input type="hidden" name="username" value="${acountAccount.getUsername()}" >
					<button type="submit" >Danh sách môn học</button>            		
            	</form>
            </div>
        </nav>
    </header>
    <br>
    <div class="container col-md-5">
        <div class="card">
            <div class="card-body">
                <c:if test="${monhoc != null}">
                    <form id="formMH" action="ServerMonHoc" method="post">
                    <input type="hidden" id="actionform" value="update">
                </c:if>
                <c:if test="${monhoc == null}">
                    <form id="formMH" action="ServerMonHoc" method="post">
                    <input type="hidden" id="actionform" value="insert">
                </c:if>
                <caption>
                    <h2>
                        <c:if test="${monhoc != null}">Chỉnh sửa Môn học</c:if>
                        <c:if test="${monhoc == null}">Tạo mới môn học</c:if>
                    </h2>
                </caption>
                <c:if test="${monhoc != null}">
                    <fieldset class="form-group">
                    <label>Mã Id môn học:</label> 
                    <input type="text" value="<c:out value='${monhoc.getIdmonhoc()}' />" class="form-control" id="idmonhoc" required="required" readonly="readonly">
                	</fieldset>
                </c:if>
                <c:if test="${monhoc == null}">
                    <fieldset class="form-group">
                    <label>Mã Id môn học:</label> 
                    <input type="text" value="" class="form-control" id="idmonhoc" required="required">
                	</fieldset>
                </c:if>
                <fieldset class="form-group">
                    <label>Tên môn học:</label> 
                    <input type="text" value="<c:out value='${monhoc.getTen()}' />" class="form-control" id="name" required="required">
                </fieldset>
                <fieldset class="form-group">
                    <label>Số tín chỉ:</label> 
                    <input type="text" value="<c:out value='${monhoc.getTinchi()}' />" class="form-control" id="tinchi" required="required">
                </fieldset>
                <fieldset class="form-group">
                    <label>Chọn khoa</label> 
                    <br>
                    <select id="idkhoa" style="width: 100%;height: 40px" required="required">
                    	<c:if test="${monhoc == null}">
                  			<option value="" disabled selected>Select an option</option>
                		</c:if>
				    	<c:forEach var="khoa" items="${list }">
				    		<c:if test="${monhoc.getKhoa().getId() == khoa.getId()}">
					    		<option value="<c:out value='${khoa.getId()}' />" selected="selected">
					    			<p ><c:out value='${khoa.getTenkhoa()}' /></p>		    			
					    		</option>
				    		</c:if>
				    		<c:if test="${monhoc.getKhoa().getId() != khoa.getId()}">
					    		<option value="<c:out value='${khoa.getId()}' />">
					    			<p ><c:out value='${khoa.getTenkhoa()}' /></p>		    			
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
<script type="text/javascript" src="admin/monhoc/editmonhoc.js"></script>
</html>