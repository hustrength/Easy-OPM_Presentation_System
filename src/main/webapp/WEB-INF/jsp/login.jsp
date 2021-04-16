<%@ page pageEncoding="utf-8" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

    <base href="">

    <meta charset="UTF-8">
    <title>团队比赛报名管理系统</title>
    <link href="/css/stulogin.css" type="text/css" rel="stylesheet"/>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">

    <script type="text/javascript" src="/js/lib/jquery-3.5.1.min.js"></script>
    <script type="text/javascript" src="/js/my/login_register.js"></script>
</head>

<body>
<div class="login_bg">
    <div class="login-wrap">
        <div class="login-html">
            <input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">登录</label>
            <input id="tab-2" type="radio" name="tab" class="sign-up"><label for="tab-2" class="tab">注册</label>
            <div class="login-form">
                <div id="form_login">
                    <div class="sign-in-htm">
                        <div><br></div>
                        <div><br></div>
                        <div class="group1">
                            <label for="userid_signin" class="label1">用户名</label>
                            <input id="userid_signin" name="userid_signin" type="text" class="input1"
                                   required="required"
                                   oninvalid="setCustomValidity('该项不可为空')" oninput="setCustomValidity('')">
                        </div>
                        <div><br></div>
                        <div><br></div>
                        <div class="group1">
                            <label for="password_signin" class="label1">密码</label>
                            <input id="password_signin" name="password_signin" type="password" class="input1"
                                   data-type="password"
                                   required="required"
                                   oninvalid="setCustomValidity('该项不可为空')" oninput="setCustomValidity('')">
                        </div>
                        <div><br></div>
                        <div><br></div>
                        <div class="group1">
                            <label for="status" class="label1">身份</label>
                            <select class="input1" name="status" id="status" required="required" style="height:40px"
                                    oninvalid="setCustomValidity('该项不可为空')" oninput="setCustomValidity('')">
                                <option class="input_bt" value="" selected>--请选择--</option>
                                <option class="input_bt" value="stu">学生</option>
                                <option class="input_bt" value="tea">教师</option>
                            </select>
                        </div>
                        <div><br></div>
                        <div><br></div>
                        <div><br></div>
                        <div class="group1">
                            <input type="submit" class="button1" value="登录" onclick="commitForm_signin()">
                        </div>
                        <div class="hr"></div>
                        <div class="foot-lnk">
                            <a style="font-size:12px"> 忘记密码？请联系管理员：18888888888</a>
                        </div>
                    </div>
                </div>
                <div id="form_signup">
                    <div class="sign-up-htm">
                        <div class="group">
                            <label for="userid_signup" class="label">用户名</label>
                            <input id="userid_signup" name="userid_signup" type="text" class="input"
                                   required="required" onchange="checkUserid()">
                        </div>
                        <div class="group">
                            <label for="password_signup" class="label">密码</label>
                            <input id="password_signup" name="password_signup" type="password" class="input"
                                   data-type="password" required="required">
                        </div>
                        <div class="group">
                            <label for="repassword" class="label">确认密码</label>
                            <input id="repassword" name="repassword" type="password" class="input" data-type="password"
                                   required="required" oninput="checkPassword()">
                        </div>
                        <div class="group">
                            <label for="username" class="label">真实姓名</label>
                            <input id="username" name="username" type="text" class="input" required="required"
                                   oninvalid="setCustomValidity('该项不可为空')" oninput="setCustomValidity('')">
                        </div>
                        <div class="group">
                            <label for="sex" class="label">性别</label>
                            <select class="input" name="sex" id="sex" required="required" style="height:30px"
                                    oninvalid="setCustomValidity('该项不可为空')" oninput="setCustomValidity('')">
                                <option class="input_bt" value="" selected>--请选择--</option>
                                <option class="input_bt" value="男">男</option>
                                <option class="input_bt" value="女">女</option>
                            </select>
                        </div>
                        <div class="group">
                            <label for="signup_code" class="label">教师注册码</label>
                            <input id="signup_code" name="signup_code" type="password" class="input"
                                   data-type="password" placeholder="学生注册无需填写">
                        </div>
                        <div><br></div>
                        <div class="group">
                            <input type="submit" class="button" value="注册" onclick="commitForm_signup()">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="copyright">版权所有 ©2020-2021 团队比赛报名系统 保留所有权利</div>
</div>
</body>
</html>