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
	if(mkmoi!=mkmoi1){
		document.getElementById("demo").innerHTML = "Mật khẩu mới nhập lại không đúng";
		return;
	}else{
		$.ajax({
			type: 'post',
			data : {
				mkcu : mkcu,
				mkmoi : mkmoi,
				mkmoi1 : mkmoi1,
				action : "doimk"
			},
			url : 'ServerSinhVien',
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
function editsinhvien(){
	document.getElementById("editsinhvien").click();
}
function dangky(){
	document.getElementById("dangky").click();
}
function xemdiem(){
	document.getElementById("xemdiem").click();
}
function dangxuat(){
	document.getElementById("dangxuat").click();
}
function trovehome(){
	document.getElementById("trovehome").click();
}