function pro_edit(i, cid) {
	var pname_id = "Pname"+i.toString();
	var pname = document.getElementById(pname_id);
    $.ajax({
    	url: "servlet/serDoUpdatePro?action=update&PName="+pname.value+"&PNo="+cid,
    	//url: "servlet/serDoUpdatePro?action=update",
        type: "post",
        async: false,
        data: $('#form_pro'+i.toString()).serialize(),
        cache: false,
        success: function (text) {
           if(text=="success"){
        	   alert("修改成功");
        	   $("#form_pro").attr("action","tea/project_info_tea.jsp");
        	   
           }
           else{
        	   alert("修改失败");
           }
        }
    })
}

function remove_pro(pno) {
	
    $.ajax({
    	url: "servlet/serDeletePro?action=delete&PNo="+pno,
        type: "get",
        async: false,
       
        cache: false,
        success: function (text) {
           if(text=="success"){
        	   alert("删除成功");
        	   location.reload();
        	   
           }
           else{
        	   alert("删除失败");
           }
        }
    })
}