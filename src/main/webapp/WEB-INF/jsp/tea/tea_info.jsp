<%@ page language="java" import="java.util.*,com.pss.user.*,com.pss.dao.*" pageEncoding="utf-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    String teaPath = path + "/tea/";
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <base href="<%=basePath%>">
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>团队比赛报名管理系统——教师界面</title>
    <!-- Bootstrap Styles-->
    <link href="assets/css/bootstrap.css" rel="stylesheet"/>
    <!-- FontAwesome Styles-->
    <link href="assets/css/font-awesome.css" rel="stylesheet"/>
    <!-- Custom Styles-->
    <link href="assets/css/custom-styles.css" rel="stylesheet"/>
    <!-- Google Fonts-->
    <link href='http://fonts.useso.com/css?family=Open+Sans' rel='stylesheet' type='text/css'/>
    <link href="assets/css/main.css" rel="stylesheet"/>
</head>
<body>

<!-- JS Scripts-->
<!-- jQuery Js -->
<script src="assets/js/jquery-1.10.2.js"></script>
<!-- Bootstrap Js -->
<script src="assets/js/bootstrap.min.js"></script>
<!-- Metis Menu Js -->
<script src="assets/js/jquery.metisMenu.js"></script>
<!-- Custom Js -->
<script src="assets/js/custom-scripts.js"></script>
<!-- Jquery Js -->
<script type="text/javascript" src="js/jquery-latest.js"></script>
<!-- CreateGroup Js -->
<script type="text/javascript" src="js/tea_info.js"></script>
<script type="text/javascript">
    function edit_input() {
        var btn = document.getElementById("edit");
        var title = document.getElementById("title");
        var content = document.getElementById("content");
        var string = "sds";
        if (btn.getAttribute('value') === "编辑") {
            btn.setAttribute("value", "复原");
            title.removeAttribute("readOnly");
            title.style.border = "0.5px solid #808080";
            content.removeAttribute("readOnly");
            content.style.border = "0.5px solid #808080";
           
        } else {
            title.value = "title";
            content.value = "content";
            content.setAttribute("value", "content");
            btn.setAttribute("value", "编辑");
            title.setAttribute("readOnly", 'true');
            title.style.border = "0.5px solid #ffffff";
            content.setAttribute("readOnly", 'true');
            content.style.border = "0.5px solid #ffffff";
        }
    }
</script>

<% Teacher tea = null;
    if (session.getAttribute("teacher") == null) {
    	response.sendRedirect(basePath+"llogin.jsp");
    } else {
        tea = (Teacher) session.getAttribute("teacher");
    }
   %>
<div id="wrapper">
    <nav class="navbar navbar-default top-navbar" role="navigation">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand">团队比赛报名管理系统--教师端</a>
        </div>
        <ul class="nav navbar-top-links navbar-right">
           
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
                    <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                </a>
                <ul class="dropdown-menu dropdown-user">
                    <li><a href="<%=teaPath %>tea_info.jsp"><i class="fa fa-user fa-fw"></i> 个人信息</a>
                    <li class="divider"></li>
                    <li><a href="<%=basePath%>login.jsp"><i class="fa fa-sign-out fa-fw"></i> 注销</a>
                    </li>
                </ul>
                <!-- /.dropdown-user -->
            </li>
           </ul>
         </ul>       
    </nav>
   <nav class="navbar-default navbar-side" role="navigation">
        <div class="sidebar-collapse">
            <ul class="nav" id="main-menu">
                <li>
                    <a href="<%=teaPath %>tea_main.jsp"><i class="fa fa-desktop"></i> 参赛须知</a>
                </li>
              
                <li>
                    <a><i class="fa fa-sitemap"></i> 比赛信息<span class="fa arrow"></a>
                    <ul class="nav nav-second-level">
                            <li>
                                <a href="<%=teaPath %>project_release.jsp">发布比赛</a><!--连接到发布比赛信息jsp，自动创建一个新的比赛信息数据结构  -->
                            </li>
                            <li>
                                <a href="<%=teaPath %>project_info_tea.jsp">查看比赛</a><!--连接到查看比赛信息jsp，自动创建一个新的比赛信息数据结构  -->
                            </li>
                        </ul>
                </li>
                <li>
                    <a href="<%=teaPath %>tea_team.jsp"><i class="fa fa-users"></i> 学生组队信息</a>
                </li>
                <li>
                    <a class="active-menu" href="<%=teaPath %>tea_info.jsp"><i class="fa fa-user"></i> 教师个人信息</a>
                </li>
            </ul>
        </div>
    </nav>
    <!-- /. NAV SIDE  -->
    
    <div id="page-wrapper">
        <div id="page-inner">
            <div class="row">
                <div class="col-md-12">
                    <h1 class="page-header">
                        我的信息 <small></small>
                    </h1>
                </div>
            </div>
            <!-- /. ROW  -->
            <div class="row">
                <div class="col-md-9">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            个人信息
                        </div>
                        <div class="panel-body">
                            <div class="alert alert-success">
                                <div style="width:240px; align:right">
                                <strong>姓名：</strong><%=tea.getTeaName()%></div>
                            </div>
                            <div class="alert alert-info">
                                <div style="width:240px; align:right">
                                <strong>用户名：</strong><%=tea.getTeaID() %></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-3">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            用户头像
                        </div>
                        <img src="img/profile.png" style="max-width:70%; max-height:70%; margin-left:15%;">
                        <div class="panel-footer">
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-9">
                    <!--  Modals-->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            登录密码修改
                        </div>
                        <div class="form-group" style="margin-left:16px; margin-right:20px; margin-top:10px">
                            <label>请输入初始密码</label>
                            <input class="form-control" type="password" id="password_origin" name="password_origin" 
                            required="required" oninput="checkOriginPassword('<%=tea.getPassword() %>')">
                        </div>
                        <div class="form-group" style="margin-left:16px; margin-right:20px; margin-top:20px">
                            <label>请输入新密码</label>
                            <input class="form-control" type="password" id="password_new" name="password_new" required="required" oninput="checkPassword()">
                        </div>
                        <div class="form-group" style="margin-left:16px; margin-right:20px; margin-top:20px">
                            <label>请再次输入新密码</label>
                            <input class="form-control" type="password" id="repassword_new" name="repassword_new" required="required" oninput="checkPassword()">
                        </div>
                        <div class="panel-body">
                            <button class="btn btn-primary" data-toggle="modal" data-target="#myModal">
                                点击修改
                            </button>
                            <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
                                 aria-labelledby="myModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                                &times;
                                            </button>
                                            <h4 class="modal-title" id="myModalLabel">提示</h4>
                                        </div>
                                        <div class="modal-body">
                                            确认更改？
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">取消
                                            </button>
                                            <input type="button" class="btn btn-primary" value="更改" data-dismiss="modal" onclick="changePassword()">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- End Modals-->
                </div>
            </div>
            <!-- /. ROW  -->
            <footer><p>版权所有 ©2020-2021 团队比赛报名系统 保留所有权利</p></footer>
        </div>
        <!-- /. PAGE INNER  -->
    </div>
    <!-- /. PAGE WRAPPER  -->
</div>
<!-- /. WRAPPER  -->
</body>
</html>
