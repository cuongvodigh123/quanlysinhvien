var monhoc = $('#monhoc').val();
$.ajax({
	type:'post',
	data: {
		id:monhoc,
		idlop:"0",
		action : "getListDiemMonHoc"
	},
	url : 'ServerMonHoc',
	success : function(set){
		var a = document.getElementById("boxtable");
		a.innerHTML = set;
	}
});
var tongsolop = $('#tongsolop').val()
var x = document.getElementById("sonhom");
x.innerHTML += "<option value=\"0\">Tất cả</option>";
for(var i=1;i<=tongsolop;i++){
	x.innerHTML += "<option value=\""+i+"\">Nhóm "+i+"</option>";
}
function chon1nhom(){
	var sonhom = $('#sonhom').val();
	$.ajax({
		type:'post',
		data: {
			id:monhoc,
			idlop:sonhom,
			action : "getListDiemMonHoc"
		},
		url : 'ServerMonHoc',
		success : function(set){
			var a = document.getElementById("boxtable");
			a.innerHTML = set;
		}
	});
}