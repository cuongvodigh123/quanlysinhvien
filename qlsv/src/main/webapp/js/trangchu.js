function chinhsuataikhoan(){
	
}
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
	});;
}
function check(){
	var username = $('#username').val();
	document.getElementById("demo").innerHTML = username;
}