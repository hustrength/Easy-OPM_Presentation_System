
function apply(tid,sid){
	 $.ajax({
	        url: "servlet/serInsertApply?action=apply&TID="+tid+"&Applicant="+sid,
	        type: "GET",
	        async: false,
	        data:{},
	        dataType: "text",
	        cache: false,
	        success: function (text) {
	            if (text === "success") {
					alert("提交加入申请成功");
	            } 
	            else if(text=="applied") {
	            	alert("你已申请过该团队");
				}
	            else {
	            	alert("申请失败");
	            }
	        }
  })
}


