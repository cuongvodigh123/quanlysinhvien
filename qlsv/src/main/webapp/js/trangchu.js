function chooseFile() {
    var fileInput = document.getElementById('fileInput');
    fileInput.click();
}
document.getElementById('fileInput').addEventListener('change', function(event) {
    var file = event.target.files[0];
    var reader = new FileReader();

    reader.onload = function() {
        var preview = document.getElementById('anhdaidien');
        preview.src = reader.result;
        var base64Image = reader.result.split(',')[1]; // Lấy phần dữ liệu Base64
        loaddatabase(base64Image);
    }

    reader.readAsDataURL(file);
});
function loaddatabase(base64Image){
	var username = $('#username').val();
	$.ajax({
		type: 'post',
		data: {
			username : username,
			base64 : base64Image,
			action : "anhdaidien"
		},
		url : 'Update',
		success: function(result){	
			if(result=='ok'){
				var a = document.getElementById("demo");
				setTimeout(function(){
					a.innerHTML = "Đổi ảnh thành công.";
					setTimeout(function(){
						a.innerHTML = "";
				},2000);
				},100);
			}else{
				var a = document.getElementById("demo");
				setTimeout(function(){
					a.innerHTML = "Đổi ảnh thất bại. Có thể kích thước ảnh quá to.";
					setTimeout(function(){
						a.innerHTML = "";
				},2000);
				},100);
			}
		}
	});
}
function doimatkhau(){
	data = "<p>Mật khẩu cũ: <input type=\"text\" id=\"mkcu\"/></p>" +
    	"<p>Mật khẩu mới: <input type=\"text\" id=\"mkmoi\"/></p>" +
    	"<p>Nhập lại mật khẩu mới: <input type=\"text\" id=\"mkmoi1\"/></p>"+
    	"<button id=\"submk\" onclick=\"checkmk()\">Đổi</button>"+
    	"<button id=\"huymk\" onclick=\"huymk()\">Huỷ</button>";
	var a = document.getElementById("divmk");
	a.innerHTML = data;
}
function huymk(){
	document.getElementById("demo").innerHTML = "";
	document.getElementById("divmk").innerHTML = "";
}
function checkmk(){
	var mkcu = $('#mkcu').val();
	var mkmoi = $('#mkmoi').val();
	var mkmoi1 = $('#mkmoi1').val();
	var username = $('#username').val();
	if(mkmoi!=mkmoi1){
		document.getElementById("demo").innerHTML = "Mật khẩu mới nhập lại không đúng";
		return;
	}else{
		$.ajax({
			type: 'post',
			data : {
				username : username,
				mkcu : mkcu,
				mkmoi : mkmoi,
				mkmoi1 : mkmoi1,
				action : "doimk"
			},
			url : 'Update',
			success : function(result){
				if(result=='ok'){
					var a = document.getElementById("demo");
					setTimeout(function(){
						a.innerHTML = "Đổi mật khẩu thành công.";
						setTimeout(function(){
							a.innerHTML = "";
					},2000);
					},100);
					document.getElementById("divmk").innerHTML = "";
				}else{
					var a = document.getElementById("demo");
					setTimeout(function(){
						a.innerHTML = "Mật khẩu cũ có thể không đúng.";
						setTimeout(function(){
							a.innerHTML = "";
					},2000);
					},100);
				}
			}
		});
	}
	//asdfjhasdfhkjsdf
}

function dssv(){
	document.getElementById("gotodssv").click();
}
function dsmh(){
	document.getElementById("gotodsmh").click();
}
function dsnh(){
	document.getElementById("gotodsnh").click();
}
function dskhoa(){
	document.getElementById("gotodskhoa").click();
}
function dsgiangvien(){
	document.getElementById("gotodsgiangvien").click();
}
function dangxuat(){
	document.getElementById("dangxuat").click();
}
function trovehome(){
	document.getElementById("trovehome").click();
}
function resetTKSV(){
	var x = document.getElementById("resettaikhoan").value;
	$.ajax({
		type: 'post',
		data : {
			masv:x,
			action : "resettaikhoan"
		},
		url : 'ServletQLSV',
		success : function(result){
			if(result=='ok'){
				 alert("Reset tài khoản sinh viên thành công.");
				 document.getElementById("resettaikhoan").value="";
			}
		}
	});	
}