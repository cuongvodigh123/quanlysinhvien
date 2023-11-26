function checkandsave(event){
	event.preventDefault();
	var id = $('#idmonhockyhoc').val();
	var idkyhoc = $('#idkyhoc').val();
	var idmonhoc = $('#idmonhoc').val();
	var action = $('#actionform').val();
	$.ajax({
		type:'post',
		data:{
			id:id,
			idkyhoc:idkyhoc,
			idmonhoc:idmonhoc,
			action:action
		},
		url: 'ServerMonHocKyHoc',
		success: function(result){
			if(result=='ok'){
				var a = document.getElementById("demo");
				var b = document.getElementById("buttontrove");
				b.style.display="block";
				var c = document.getElementById("buttonsave");
				c.style.display="none";
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
	})
	
}
function trove(event){
	event.preventDefault();
	document.getElementById("danhsachmh").submit();
}