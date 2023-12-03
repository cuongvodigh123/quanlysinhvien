 var tbody = document.getElementsByTagName("tbody");
 for(var i=0;i<tbody.length;i++){
	 if(i%2===1) continue;
	 var rows = tbody[i].getElementsByTagName("tr");
	 for (var j = 0; j < rows.length; j++) {
        var cell = document.createElement("td");
        cell.textContent = j+1;
        rows[j].insertBefore(cell, rows[j].firstChild);
    }
 }
 
