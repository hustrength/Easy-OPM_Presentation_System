function pro_release() {
	
    $.ajax({
    	url: "servlet/serDoInsertPro?action=create",
        type: "post",
        async: false,
        data: $('#form_pro').serialize(),
        cache: false,
        success: function (text) {
           if(text=="success"){
        	   alert("发布成功");
        	   location.reload();
           }else if(text=="user empty"){
        	   alert("用户登录信息失效，请重新登录");
           }
           else{
        	   alert("发布失败");
           }
        }
    })
}