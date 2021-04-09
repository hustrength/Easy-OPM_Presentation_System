var flag=false;
function checkGnamerepeat() {
	var ele = document.getElementById("Gname");
	var val = ele.value;
	
    $.ajax({
        url: "servlet/serQueryGPS?action=checkGname&Gname=" + val,
        type: "GET",
        async: false,
        dataType: "text",
        cache: false,
        success: function (text) {
            if (text === "true") {
				flag=true;
            } else {
            	flag=false;
				ele.setCustomValidity("团队名已被注册");
			}
           
        }
    })
}

function create_team() {
	
	if(flag==false) return false;
	
	var group_project="stu/competition_team.jsp";
	
    $.ajax({
    	url: "servlet/serInsertGPS?action=create",
        type: "post",
        async: false,
        data: $('#form_create').serialize(),
        dataType: "text",
        success: function (text) {
           if(text=="success"){
        	   alert("创建成功");
        	   $("#form_create").attr("action",group_project);
           }else if(text=="user empty"){
        	   alert("用户登录信息失效，请重新登录");
           }
           else{
        	   alert("创建失败");
           }
        }
    })
    
}

