function check() {
	var username = $('#username').val();
	var password = $('#password').val();
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
				action: "check"
			},
			url: 'CheckLogin',
			success: function(result) {
				if (result == "error") {
					document.getElementById("p1").innerHTML = "";
					document.getElementById("p2").innerHTML = "";
					$('#p3').html("Sai thông tin hoặc mật khẩu. Mời nhập lại.");
				}else{
					document.getElementById("trangchu").innerHTML +=
					"<a id=\"ok\" href=\"/qlsv/ServletQLSV?action=trangchu&username="+result+"\" ></a>";
					document.getElementById("ok").click();
				}

			}
		});
	}
}