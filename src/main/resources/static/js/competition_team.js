function break_group(gno,sno) {
    $.ajax({
    	url: "servlet/serDeleteGPS?action=break&GNo="+gno+"&SNo="+sno,
        type: "GET",
        async: false,
        dataType: "text",
        cache: false,
        success: function (text) {
           if(text=="success"){
        	   alert("解散成功");
        	   location.reload();
           }
           else{
        	   alert("解散失败");
           }
        }
    })
}

function remove_member(gno,sno){
	alert("正在被移出的队员ID："+sno);
	$.ajax({
    	url: "servlet/serUpdateGPS?action=remove&GNo="+gno+"&SNo="+sno,
        type: "GET",
        async: false,
        dataType: "text",
        cache: false,
        success: function (text) {
           if(text=="success"){
        	   alert("踢出成功");
        	   location.reload();
           }
           else{
        	   alert("踢出失败");
           }
        }
    })
}

function transfer_leader(gno,new_sno, old_sno){
	$.ajax({
    	url: "servlet/serUpdateGPS?action=transfer&GNo="+gno+"&newCaptain="+new_sno+"&oldCaptain="+old_sno,
        type: "GET",
        async: false,
        dataType: "text",
        cache: false,
        success: function (text) {
           if(text=="success"){
        	   alert("转让成功");
        	   location.reload();
           }
           else{
        	   alert("转让失败");
           }
        }
    })
}

function quit_group(gno,sno){
	
	$.ajax({
    	url: "servlet/serUpdateGPS?action=remove&GNo="+gno+"&SNo="+sno,
        type: "GET",
        async: false,
        dataType: "text",
        cache: false,
        success: function (text) {
           if(text=="success"){
        	   alert("退出成功");
        	   location.reload();
           }
           else{
        	   alert("退出失败");
           }
        }
    })
}