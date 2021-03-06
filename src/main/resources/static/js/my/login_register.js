var flag1 = false, flag2 = false;

function checkIdRepeat(val, ele, code) {
    console.log("check id repeat in js");
    $.ajax({
        url: "/register/checkIdRepeat.do",
        type: "post",
        data: {
            "userId": val,
            "signUpCode": code
        },
        success: function (text) {
            if (text === "true") {
                flag1 = true;
                ele.setCustomValidity("");
            } else {
                flag1 = false;
                ele.setCustomValidity("该用户名已被注册");
                $("userid_signup")[0].reset();
            }
        }
    })
}

function checkUserid() {
    console.log("check user id in js");
    var v = document.getElementById("userid_signup");
    var val = v.value;
    var signup_code = document.getElementById("signup_code");
    var code = signup_code.value;
    //var ptn = /^[A-Z][0-9]{1,15}$/;

    if (val == null || val.trim().length === 0 || val === "") {
        flag1 = false;
        v.setCustomValidity("该项不可为空");
    } else {
        flag1 = true;
        v.setCustomValidity("");
        checkIdRepeat(val, v, code);
    }
}

function checkPassword() {
    var pass1 = document.getElementById("password_signup");
    var pass2 = document.getElementById("repassword");

    if (pass1.value !== pass2.value) {
        flag2 = false;
        pass2.setCustomValidity("两次输入的密码不匹配");
    } else {
        pass2.setCustomValidity("");
        flag2 = true;
    }

}

function commitForm_signin() {
    console.log("sign in in js");
    const status = document.getElementById("status").value;

    if (status === "0"){
        alert("请选择登录身份");
        return false;
    }

    let login = "/stu/main";
    if ("tea" === status) login = "/tea/tea_main";

    const userid_signin = document.getElementById("userid_signin").value;
    const password_signin = document.getElementById("password_signin").value;

    const obj = {
        "userid": userid_signin,
        "password": password_signin,
        "status": status
    };

    $.ajax({
        url: "/register/logIn.do",
        type: "post",
        data: obj,
        success: function (text) {
            if (text === "success") {
                window.location.href = login;
            } else {
                alert("密码或用户名错误");
                $("userid_signin")[0].reset();
                $("password_signin")[0].reset();
            }
        }
    })
}

function commitForm_signup() {
    console.log("sign up in js");
    if (flag1 === false || flag2 === false) return false;

    var userid_signup = document.getElementById("userid_signup").value;
    var password_signup = document.getElementById("password_signup").value;
    var username = document.getElementById("username").value;
    var sex = document.getElementById("sex").value;
    var signup_code = document.getElementById("signup_code").value;

    if (sex === "0"){
        alert("请选择性别");
        return false;
    }

    var obj = {
        "userid": userid_signup,
        "password": password_signup,
        "username": username,
        "sex": sex,
        "signup_code": signup_code
    }

    $.ajax({
        url: "/register/signUp.do",
        type: "post",
        data: obj,
        success: function (text) {
            if (text === "success") {
                alert("注册成功");
                window.location.reload();
            } else if (text === "error_code") {
                alert("教师注册码错误");
            } else {
                alert("注册失败");
            }
        }
    })
}



