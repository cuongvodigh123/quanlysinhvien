function chooseFile() {
    var fileInput = document.getElementById('fileInput');
    fileInput.click();
}
var base64Image = $('#anhdaidienhienco').val();
document.getElementById('fileInput').addEventListener('change', function(event) {
    var file = event.target.files[0];
    var reader = new FileReader();

    reader.onload = function() {
        var preview = document.getElementById('anhdaidien');
        preview.src = reader.result;
        base64Image = reader.result.split(',')[1];
        //document.getElementById('demo').innerHTML = base64Image;
    }

    reader.readAsDataURL(file);
});
function check(){
	var tenSV = encodeURIComponent($('#tenSV').val());
	document.getElementById('demo1').innerHTML = tenSV;
}
function huy(){
	var isConfirmed = confirm("Bạn có chắc muốn đóng trang này? Dữ liệu sẽ không được lưu.");
    if (isConfirmed) {
        window.close();
    }
}

function luu(){
	var maSVold = $('#maSVold').val();
	var maSV = $('#maSV').val();
	var tenSV = $('#tenSV').val();
	var lopSV = $('#lopSV').val();
	var gioiTinh = document.querySelector('input[name="gender"]:checked').value;
	var ngaySinh = $('#ngaySinh').val();
	var soDienThoai = $('#soDienThoai').val();
	var email = $('#email').val();
	var diaChi = $('#diaChi').val();	
	var ghiChu = $('#ghiChu').val();	
	if(base64Image==null){
		base64Image="";
	}
	var action ="savestudent";
	if(maSVold==""){
		action ="addstudent";
	}
	$.ajax({
		type: 'post',
		data: {
			base64 : base64Image,
			maSVold :maSVold,
			maSV : maSV,
			tenSV : tenSV,
			lopSV : lopSV,
			gioiTinh : gioiTinh,
			ngaySinh : ngaySinh,
			soDienThoai : soDienThoai,
			email : email,
			diaChi : diaChi,
			ghiChu : ghiChu,
			action : action
		},
		url : 'Update',
		success: function(result){	
			if(result=='ok'){
				var a = document.getElementById("demo");
				setTimeout(function(){
					a.innerHTML = "Lưu thành công.";
					setTimeout(function(){
						a.innerHTML = "";
				},2000);
				},100);
			}else{
				var a = document.getElementById("demo");
				setTimeout(function(){
					a.innerHTML = "Lưu không thành công. Hãy xem lại.";
					setTimeout(function(){
						a.innerHTML = "";
				},2000);
				},100);
			}
		}
	});
}