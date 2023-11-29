function check() {
	var username = $('#username').val();
	var password = $('#password').val();
	var giangvien = document.getElementById("giangvien").checked;
	var sinhvien = document.getElementById("sinhvien").checked;
	var vaitro;
	if(giangvien) vaitro="giangvien";
	if(sinhvien) vaitro="sinhvien";
	if (username == "" || password == "") {
		if (username == "") document.getElementById("p1").innerHTML = "Không để trống.";
		else document.getElementById("p1").innerHTML = "";
		if (password == "") document.getElementById("p2").innerHTML = "Không để trống.";
		else document.getElementById("p2").innerHTML = "";
	} else {
		$.ajax({
			type: 'post',
			data: {
				username: username,
				password: password,
				vaitro:vaitro,
				action: "check"
			},
			url: 'CheckLogin',
			success: function(result) {
				if (result == "error") {
					document.getElementById("p1").innerHTML = "";
					document.getElementById("p2").innerHTML = "";
					$('#p3').html("Sai thông tin hoặc mật khẩu. Mời nhập lại.");
				}else if(result == "giangvien"){
					document.getElementById("trangchu").innerHTML +=
					"<a id=\"ok\" href=\"/qlsv/ServletQLSV?action=trangchu&username="+username+"\" ></a>";
					document.getElementById("ok").click();
				}else if(result=="sinhvien"){
					document.getElementById("trangchu").innerHTML +=
					"<a id=\"ok\" href=\"/qlsv/ServerSinhVien?action=trangchu&username="+username+"\" ></a>";
					document.getElementById("ok").click();
				}

			}
		});
	}
}
function chonGiangVien() {
    document.getElementById("sinhvien").checked = false;
}

function chonSinhVien() {
    document.getElementById("giangvien").checked = false;
}