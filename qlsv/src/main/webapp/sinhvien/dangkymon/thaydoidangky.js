var checkboxes = document.querySelectorAll('.checkbox-group');
checkboxes.forEach(function(checkbox) {
    checkbox.addEventListener('change', function() {
        var group = this.getAttribute('data-group');
        var checkboxesInGroup = document.querySelectorAll('.checkbox-group[data-group="' + group + '"]');
        checkboxesInGroup.forEach(function(checkboxInGroup) {
            if (checkboxInGroup !== checkbox) {
                checkboxInGroup.checked = false;
                var tr = checkboxInGroup.parentNode.parentNode;
    			var trId = tr.id;
                $.ajax({
					type:'post',
					data:{
						idlophocphan:trId,
						action:"xoadangkylophocphan"
					},
					url: 'ServerSinhVien',
					success: function(result){
					}
				})
            }
        });
    });
});
function trove(){
	document.getElementById("danhsachmh").submit();
}

function luudangky(event) {
    var isChecked = event.target.checked;
    var tr = event.target.parentNode.parentNode;
    var trId = tr.id;

    if (isChecked) {
       	$.ajax({
			type:'post',
			data:{
				idlophocphan:trId,
				action:"luudangkylophocphan"
			},
			url: 'ServerSinhVien',
			success: function(result){
			}
		})
    } else {
        $.ajax({
			type:'post',
			data:{
				idlophocphan:trId,
				action:"xoadangkylophocphan"
			},
			url: 'ServerSinhVien',
			success: function(result){
			}
		})
    }
}
var rows = document.querySelectorAll('tbody tr');
for (var i = 0; i < rows.length-1; i++) {
    var currentClass = rows[i].className;
    var nextClass = rows[i + 1].className;
    if (nextClass !== currentClass) {
        var spacerRow = document.createElement('tr');
        spacerRow.innerHTML = '<td colspan="9">&nbsp;</td>';
        rows[i].parentNode.insertBefore(spacerRow, rows[i].nextSibling);
        i+=1;
    }
}