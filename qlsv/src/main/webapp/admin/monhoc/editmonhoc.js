function checkandsave(event){
	event.preventDefault();
	var id = $('#idmonhoc').val();
	var name = $('#name').val();
	var tinchi = $('#tinchi').val();
	var idkhoa = $('#idkhoa').val();
	var action = $('#actionform').val();
	$.ajax({
		type:'post',
		data:{
			id:id,
			ten:name,
			tinchi:tinchi,
			idkhoa:idkhoa,
			action:action
		},
		url: 'ServerMonHoc',
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