function update_noti() {
	
    $.ajax({
    	url: "servlet/serUpdateNoti?action=update",
        type: "post",
        async: false,
        data: $('#form_noti').serialize(),
        cache: false,
        success: function (text) {
           if(text=="success"){
        	   alert("修改成功");
        	   location.reload();
           }
           else{
        	   alert("修改失败");
           }
        }
    })
}