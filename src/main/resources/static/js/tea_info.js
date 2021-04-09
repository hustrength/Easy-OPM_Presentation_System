var flag1=false,flag2=false;
function checkPassword() {
	
	var pass1 = document.getElementById("password_new");
	var pass2 = document.getElementById("repassword_new");
   
	if (pass1.value !== pass2.value){
		flag2=false;
		pass2.setCustomValidity("两次输入的密码不匹配");
	}
		
	else{
		pass2.setCustomValidity("");
		flag2=true;
	}
		
}

function checkOriginPassword(password_origin) {
	//alert(password_origin);
   var input_pw_origin=document.getElementById("password_origin");
   if(input_pw_origin.value!==password_origin){
	   flag1=false;
	   input_pw_origin.setCustomValidity("原密码错误");
   }
   else{
	   input_pw_origin.setCustomValidity("");
		flag1=true;
   }
}

function changePassword() {
	
	var pw_new=document.getElementById("repassword_new").value;
	 $.ajax({
	        url: "servlet/serUpdateTea?action=change_password&pw_new=" + pw_new,
	        type: "GET",
	        async: false,
	        dataType: "text",
	        cache: false,
	        success: function (text) {
	            if (text === "success") {
	            	alert("修改密码成功");
	            	location.reload();
	            } else {
	            	
					alert("修改密码失败");
				}
	            
	        }
	    })
		
}
