$.ajax({
	type:'post',
	data: {
		action : "getliststudent"
	},
	url : 'Update',
	success : function(set){
		
		var a = document.getElementById("boxdssv");
		a.innerHTML += set;
		document.getElementById("q").value="maSV";
		document.getElementById("w").value="";
		document.getElementById("e").value="maSV";
		document.getElementById("r").value="0";
	}
});

function setuptable(){
	var a = document.getElementById("boxdssv");
	a.innerHTML = "<caption><h2>Danh sách</h2></caption>\r\n"
	+ "            <tr>\r\n"
	+ "                <th onclick=\"sortmasv()\">Mã sinh viên</th>\r\n"
	+ "                <th onclick=\"sorttensv()\">Tên sinh viên</th>\r\n"
	+ "                <th onclick=\"sortlopsv()\">Lớp</th>\r\n"
	+ "                <th onclick=\"sortgioitinh()\">Giới tính</th>\r\n"
	+ "                <th onclick=\"sortngaysinh()\">Ngày sinh</th>\r\n"
	+ "                <th onclick=\"sortsdt()\">Số điện thoại</th>\r\n"
	+ "                <th>Action</th>\r\n"
	+ "            </tr>";
}
function timkiem(){
	var desc=0;
	var strFind = $('#strFind').val();
	var sapxep = $('#sapxep').val();
	$.ajax({
		type:'post',
		data: {
			typesort : sapxep,
			strFind : strFind,
			sortBy : sapxep,
			desc : desc,
			action : "sort"
		},
		url : 'Update',
		success : function(set){
			setuptable();
			var a = document.getElementById("boxdssv");
			a.innerHTML += set;
			document.getElementById("q").value=sapxep;
			document.getElementById("w").value=strFind;
			document.getElementById("e").value=sapxep;
			document.getElementById("r").value=desc;
		}
	});
}
var masv=0;
function sortmasv(){
	var desc=masv;
	var strFind = $('#strFind').val();
	var sapxep = $('#sapxep').val();
	$.ajax({
		type:'post',
		data: {
			typesort : sapxep,
			strFind : strFind,
			sortBy : "maSV",
			desc : desc,
			action : "sort"
		},
		url : 'Update',
		success : function(set){
			setuptable();
			var a = document.getElementById("boxdssv");
			a.innerHTML += set;
			document.getElementById("q").value=sapxep;
			document.getElementById("w").value=strFind;
			document.getElementById("e").value=sapxep;
			document.getElementById("r").value=desc;
		}
	});
	if(masv==0) masv=1;
	else masv=0;
}
var tenSV=0;
function sorttensv(){
	var desc=tenSV;
	var strFind = $('#strFind').val();
	var sapxep = $('#sapxep').val();
	$.ajax({
		type:'post',
		data: {
			typesort : sapxep,
			strFind : strFind,
			sortBy : "tenSV",
			desc : desc,
			action : "sort"
		},
		url : 'Update',
		success : function(set){
			setuptable();
			var a = document.getElementById("boxdssv");
			a.innerHTML += set;
			document.getElementById("q").value=sapxep;
			document.getElementById("w").value=strFind;
			document.getElementById("e").value=sapxep;
			document.getElementById("r").value=desc;
		}
	});
	if(tenSV==0) tenSV=1;
	else tenSV=0;
}
var lopSV=0;
function sortlopsv(){
	var desc=lopSV;
	var strFind = $('#strFind').val();
	var sapxep = $('#sapxep').val();
	$.ajax({
		type:'post',
		data: {
			typesort : sapxep,
			strFind : strFind,
			sortBy : "lopSV",
			desc : desc,
			action : "sort"
		},
		url : 'Update',
		success : function(set){
			setuptable();
			var a = document.getElementById("boxdssv");
			a.innerHTML += set;
			document.getElementById("q").value=sapxep;
			document.getElementById("w").value=strFind;
			document.getElementById("e").value=sapxep;
			document.getElementById("r").value=desc;
		}
	});
	if(lopSV==0) lopSV=1;
	else lopSV=0;
}
var gioiTinh=0;
function sortgioitinh(){
	var desc=gioiTinh;
	var strFind = $('#strFind').val();
	var sapxep = $('#sapxep').val();
	$.ajax({
		type:'post',
		data: {
			typesort : sapxep,
			strFind : strFind,
			sortBy : "gioiTinh",
			desc : desc,
			action : "sort"
		},
		url : 'Update',
		success : function(set){
			setuptable();
			var a = document.getElementById("boxdssv");
			a.innerHTML += set;
			document.getElementById("q").value=sapxep;
			document.getElementById("w").value=strFind;
			document.getElementById("e").value=sapxep;
			document.getElementById("r").value=desc;
		}
	});
	if(gioiTinh==0) gioiTinh=1;
	else gioiTinh=0;
}
var ngaySinh=0;
function sortngaysinh(){
	var desc=ngaySinh;
	var strFind = $('#strFind').val();
	var sapxep = $('#sapxep').val();
	$.ajax({
		type:'post',
		data: {
			typesort : sapxep,
			strFind : strFind,
			sortBy : "ngaySinh",
			desc : desc,
			action : "sort"
		},
		url : 'Update',
		success : function(set){
			setuptable();
			var a = document.getElementById("boxdssv");
			a.innerHTML += set;
			document.getElementById("q").value=sapxep;
			document.getElementById("w").value=strFind;
			document.getElementById("e").value=sapxep;
			document.getElementById("r").value=desc;
		}
	});
	if(ngaySinh==0) ngaySinh=1;
	else ngaySinh=0;
}
var soDienThoai=0;
function sortsdt(){
	var desc=soDienThoai;
	var strFind = $('#strFind').val();
	var sapxep = $('#sapxep').val();
	$.ajax({
		type:'post',
		data: {
			typesort : sapxep,
			strFind : strFind,
			sortBy : "soDienThoai",
			desc : desc,
			action : "sort"
		},
		url : 'Update',
		success : function(set){
			setuptable();
			var a = document.getElementById("boxdssv");
			a.innerHTML += set;
			document.getElementById("q").value=sapxep;
			document.getElementById("w").value=strFind;
			document.getElementById("e").value=sapxep;
			document.getElementById("r").value=desc;
		}
	});
	if(soDienThoai==0) soDienThoai=1;
	else soDienThoai=0;
}