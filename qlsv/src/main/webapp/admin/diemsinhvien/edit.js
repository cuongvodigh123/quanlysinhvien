
function html_table_to_excel(type){
	
    var data = document.getElementById('student_data');

    var file = XLSX.utils.table_to_book(data, {sheet: "sheet1"});

    XLSX.write(file, { bookType: type, bookSST: true, type: 'base64' });

    XLSX.writeFile(file, 'DSSV.' + type);
}

const export_button = document.getElementById('student_button');

export_button.addEventListener('click', () =>  {
    html_table_to_excel('xlsx');
});

function chonfile(){
	document.getElementById("excel_file").click();
}
const excel_file = document.getElementById('excel_file');
excel_file.addEventListener('change', (event) => {
    if(!['application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'application/vnd.ms-excel'].includes(event.target.files[0].type))
    {
        document.getElementById('excel_data').innerHTML = '<div class="alert alert-danger">Only .xlsx or .xls file format are allowed</div>';
        excel_file.value = '';
        return false;
    }
    var reader = new FileReader();
    reader.readAsArrayBuffer(event.target.files[0]);
    reader.onload = function(event){
		var iddangkyhoc = document.getElementsByClassName("iddangkyhoc");
		var diem1 = document.getElementsByClassName("diem1");
		var diem2 = document.getElementsByClassName("diem2");
		var diem3 = document.getElementsByClassName("diem3");
		var diemtrungbinh = document.getElementsByClassName("diemtrungbinh");
		
        var data = new Uint8Array(reader.result);
        var work_book = XLSX.read(data, {type:'array'});
        var sheet_name = work_book.SheetNames;
        var sheet_data = XLSX.utils.sheet_to_json(work_book.Sheets[sheet_name[0]], {header:1});
        if(sheet_data.length > 0)
        {
			var p=0;
            for(var row = 1; row < sheet_data.length; row++)
            {
				var k=0;
				var d1,d2,d3;
				var dd=iddangkyhoc[p].innerHTML;
                for(var cell = 0; cell < sheet_data[row].length; cell++)
                {            
                    if(row == 0)
                    {
                    }
                    else
                    {
                        if(k==3){
							diem1[p].innerHTML=sheet_data[row][cell];
							d1=sheet_data[row][cell];
						}else if(k==4){
							diem2[p].innerHTML=sheet_data[row][cell];
							d2=sheet_data[row][cell];
						}else if(k==5){
							diem3[p].innerHTML=sheet_data[row][cell];
							d3=sheet_data[row][cell];
						}
                        k+=1;
                    }
                }		
               	luudiem(dd,d1,d2,d3);
		        diemtrungbinh[p].innerHTML = (d1 * 0.1 + d2 * 0.2 + d3 * 0.7).toFixed(2);
		        p+=1; 	
            } 
        }
        excel_file.value = '';
    }
});
function luudiem(id,d1,d2,d3){
	$.ajax({
		type:'post',
		data:{
			id:id,
			diem1:d1,
			diem2:d2,
			diem3:d3,
			action:"luudiem"
		},
		url: 'ServerDiemSinhVien',
		success: function(result){
		}
	})
}