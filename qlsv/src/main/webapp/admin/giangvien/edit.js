function checkandsave(event){
	event.preventDefault();
	var id = $('#idgiangvien').val();
	var name = $('#name').val();
	var action = $('#actionform').val();
	$.ajax({
		type:'post',
		data:{
			id:id,
			ten:name,
			action:action
		},
		url: 'ServerGiangVien',
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