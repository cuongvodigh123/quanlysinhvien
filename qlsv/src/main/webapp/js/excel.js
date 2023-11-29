 var maid = {
    0 : "qwe",
    1 : "maSV",
    2 : "tenSV",
    3 : "lopSV",
    4 : "gioiTinh",
    5 : "ngaySinh",
    6 : "soDienThoai",
    7 : "email",
    8 : "diaChi",
    9 : "ghiChu"
}  
function savexcel(){
	var maSV = document.getElementsByClassName("maSV");
	var tenSV = document.getElementsByClassName("tenSV");
	var lopSV = document.getElementsByClassName("lopSV");
	var gioiTinh = document.getElementsByClassName("gioiTinh");
	var ngaySinh = document.getElementsByClassName("ngaySinh");
	var soDienThoai = document.getElementsByClassName("soDienThoai");
	var email = document.getElementsByClassName("email");
	var diaChi = document.getElementsByClassName("diaChi");
	var ghiChu = document.getElementsByClassName("ghiChu");
	
	for(var i=0;i<maSV.length;i++){
		var maSV1 = maSV[i].value;
		if(maSV1=="") continue;
		var tenSV1 = tenSV[i].value;
		var lopSV1 = lopSV[i].value;
		var gioiTinh1 = gioiTinh[i].value;
		if(gioiTinh1=='Nam') gioiTinh1 = 1;
		else gioiTinh1 = 0;
		var ngaySinh1 = ngaySinh[i].value;
		var soDienThoai1 = soDienThoai[i].value;
		var email1 = email[i].value;
		var diaChi1 = diaChi[i].value;
		var ghiChu1 = ghiChu[i].value;
		var base64Image="";
		
		var action ="addstudent";
		$.ajax({
			type: 'post',
			data: {
				base64 : base64Image,
				maSV : maSV1,
				tenSV : tenSV1,
				lopSV : lopSV1,
				gioiTinh : gioiTinh1,
				ngaySinh : ngaySinh1,
				soDienThoai : soDienThoai1,
				email : email1,
				diaChi : diaChi1,
				ghiChu : ghiChu1,
				action : action
			},
			url : 'Update',
			success: function(result){	
				if(result=="ok"){
				}else{	
					document.getElementById("demo").innerHTML += result;
				}
			}
		});
	}
}

var d=0;
function check(){
	var maSV = document.getElementsByClassName("maSV");
	var tenSV = document.getElementsByClassName("tenSV");
	var lopSV = document.getElementsByClassName("lopSV");
	var gioiTinh = document.getElementsByClassName("gioiTinh");
	var ngaySinh = document.getElementsByClassName("ngaySinh");
	var soDienThoai = document.getElementsByClassName("soDienThoai");
	var email = document.getElementsByClassName("email");
	var diaChi = document.getElementsByClassName("diaChi");
	var ghiChu = document.getElementsByClassName("ghiChu");
    document.getElementById("demo").innerHTML = maSV[d].value+" "+tenSV[d].value+" "+
    											lopSV[d].value+" "+gioiTinh[d].value+" "+maSV.length;
    d+=1;
}
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
        var data = new Uint8Array(reader.result);
        var work_book = XLSX.read(data, {type:'array'});
        var sheet_name = work_book.SheetNames;
        var sheet_data = XLSX.utils.sheet_to_json(work_book.Sheets[sheet_name[0]], {header:1});
        if(sheet_data.length > 0)
        {
            var table_output = '<table class="table table-striped table-bordered">';

            for(var row = 0; row < sheet_data.length; row++)
            {

                table_output += '<tr>';
                var p=0;
                var idsinhvien = "";
                for(var cell = 0; cell < sheet_data[row].length; cell++)
                {            
                    if(row == 0)
                    {
                        table_output += '<th>'+sheet_data[row][cell]+'</th>';
                    }
                    else
                    {
                        if(p==0) table_output += '<td>'+sheet_data[row][cell]+'</td>';
                        else if (p==1) {
                            table_output += '<td><input type="text" id="'+sheet_data[row][cell]+'" style="width: 85px;" class="'+maid[p]+'" value="'+sheet_data[row][cell]+'"></td>';
                            idsinhvien=sheet_data[row][cell];
                        }
                        else if (p==2) table_output += '<td><input type="text" style="width: 160px;" class="'+maid[p]+'" value="'+sheet_data[row][cell]+'"></td>';
                        else if (p==3) table_output += '<td><input type="text" style="width: 100px;" class="'+maid[p]+'" value="'+sheet_data[row][cell]+'"></td>';
                        else if (p==4) table_output += '<td><input type="text" style="width: 50px;" class="'+maid[p]+'" value="'+sheet_data[row][cell]+'"></td>';
                        else if (p==5) table_output += '<td><input type="text" style="width: 80px;" class="'+maid[p]+'" value="'+sheet_data[row][cell]+'"></td>';
                        else if (p==6) table_output += '<td><input type="text" style="width: 80px;" class="'+maid[p]+'" value="'+sheet_data[row][cell]+'"></td>';
                        else if (p==9) table_output += '<td><input type="text" style="width: 80px;" class="'+maid[p]+'" value="'+sheet_data[row][cell]+
                            '"></td>';
                        else table_output += '<td><input type="text" class="'+maid[p]+'" value="'+sheet_data[row][cell]+'"></td>';
                        p+=1;
                    }
                }
                table_output += '</tr>';
            }
            table_output += '</table>';
            document.getElementById('excel_data').innerHTML = table_output;
        }
        excel_file.value = '';
    }

});
