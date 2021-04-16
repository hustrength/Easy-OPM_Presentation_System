function agree(sid, tid){
	
	 $.ajax({
	        url: "servlet/serUpdateApply?action=agree&SID="+sid+"&TID="+tid,
	        type: "GET",
	        async: false,
	        dataType: "text",
	        cache: false,
	        success: function (text) {
	            if (text === "success") {
					alert("已同意");
					$("#msg").load(location.href+" #msg");
	            }
	            else if (text === "full"){
	            	alert("队伍人数已满");
	            }
	            else {
	            	alert("操作失败")
	            }
	        }
})
}

function refuse(sid, tid){
	 $.ajax({
	        url: "servlet/serUpdateApply?action=refuse&SID="+sid+"&TID="+tid,
	        type: "GET",
	        async: false,
	        dataType: "text",
	        cache: false,
	        success: function (text) {
	            if (text === "success") {
					alert("已拒绝");
					$("#msg").load(location.href+" #msg");
	            }
	            else {
	            	alert("操作失败")
	            }
	        }
	 })
}

function apply_confirm(sid, tid){
	 $.ajax({
	        url: "servlet/serUpdateApply?action=confirm&SID="+sid+"&TID="+tid,
	        type: "GET",
	        async: false,
	        dataType: "text",
	        cache: false,
	        success: function (text) {
	            if (text === "success") {
					$("#msg").load(location.href+" #msg");
	            }
	            else {
	            	alert("确认失败")
	            }
	        }
	 })
}