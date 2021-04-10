<%@ page language="java" import="java.util.*,com.pss.user.*,com.pss.dao.*" pageEncoding="utf-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    String teaPath = path + "/tea/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
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
    <!-- Morris Chart Styles-->
    <link href="assets/js/morris/morris-0.4.3.min.css" rel="stylesheet"/>
    <!-- Custom Styles-->
    <link href="assets/css/custom-styles.css" rel="stylesheet"/>
    <!-- Google Fonts-->
    <link href="style_1.css" type="text/css" rel="stylesheet"/>
</head>
<body>

<!-- /. WRAPPER  -->
<!-- JS Scripts-->
<!-- jQuery Js -->
<script src="assets/js/jquery-1.10.2.js"></script>
<!-- Bootstrap Js -->
<script src="assets/js/bootstrap.min.js"></script>
<!-- Metis Menu Js -->
<script src="assets/js/jquery.metisMenu.js"></script>
<!-- Morris Chart Js -->
<script src="assets/js/morris/raphael-2.1.0.min.js"></script>
<script src="assets/js/morris/morris.js"></script>
<!-- Custom Js -->
<script src="assets/js/custom-scripts.js"></script>
<script type="text/javascript" src="js/tea_main.js"></script>

<script type="text/javascript">
    function edit_noti(title_old,content_old) {
        var btn = document.getElementById("edit");
        var title = document.getElementById("title");
        var content = document.getElementById("content");
        if (btn.value === "编辑") {
            btn.value = "复原";
            title.removeAttribute("readOnly");
            title.style.border = "0.5px solid #808080";
            content.removeAttribute("readOnly");
            content.style.border = "0.5px solid #808080";
        } else {
        	title_old=title_old.replace(/<br>/g, '\r\n');
        	content_old=content_old.replace(/<br>/g, '\r\n');
        
            title.value = title_old;
            content.value = content_old;
            btn.value = "编辑";
            title.setAttribute("readOnly", 'true');
            title.style.border = "0.5px solid #ffffff";
            content.setAttribute("readOnly", 'true');
            content.style.border = "0.5px solid #ffffff";
        }
    }
</script>

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
    <!--/. NAV TOP  -->
    <nav class="navbar-default navbar-side" role="navigation">
        <div class="sidebar-collapse">
            <ul class="nav" id="main-menu">
                <li>
                    <a class="active-menu" href="<%=teaPath %>tea_main.jsp"><i class="fa fa-bell"></i> 参赛须知</a>
                </li>
                <li>
                    <a><i class="fa fa-sitemap"></i> 比赛信息<span class="fa arrow"></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="<%=teaPath %>project_release.jsp">发布比赛</a><!--连接到发布比赛信息jsp，自动创建一个新的比赛信息数据结构  -->
                        </li>
                        <li>
                            <a href="<%=teaPath %>project_info_tea.jsp">查看比赛</a><!--连接到发布比赛信息jsp，自动创建一个新的比赛信息数据结构  -->
                        </li>
                    </ul>
                <li>
                    <a href="<%=teaPath %>tea_team.jsp"><i class="fa fa-users"></i> 学生组队信息</a>
                </li>
                <li>
                    <a href="<%=teaPath %>tea_info.jsp"><i class="fa fa-user"></i> 教师个人信息</a>
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
                        关于团队比赛报名相关事宜安排的通知 <small></small>
                    </h1>
                </div>
            </div>
            <%
            	Noti noti=null;
                DaoNoti daonoti = new DaoNoti();
                String cont = "";
                String title = "";
                noti = daonoti.query();
                if (noti != null){
                	cont=noti.getContent();
                    //cont=cont.replace("\r\n", "<br>");
                    
                    title=noti.getTitle();
                    //title=title.replace("\r\n","");
                }
            %>
            <div class="row">
                <div class="col-sm-12 col-xs-12">
                    <div class="panel panel-default">
                        <form id="form_noti">
                            <div class="panel-heading">
                                <input id="title" name="title" type="text" readonly="readonly" style="border:0.5px solid #ffffff;font-size:16px;
                                font-weight:700;padding:15px 10px 0px 10px;margin-bottom:-30px;margin-top:5px" value="<%=title %>">
                               
                            </div>
                            <hr>
                            <div style="width:100%;height:300px" class="textarea" contenteditable="true">
                                <textarea id="content" name="content" readonly="readonly" style="border:0.5px solid #ffffff;
                                padding:0px 10px 0px 10px;margin-left:15px;margin-right:10px;width:97.3%;height:300px"><%=cont %>
                                </textarea>
                            </div>
                            <hr>
                            <div style="display:flex">
                            
                                <input id="edit" type="button" value="编辑" class="btn btn-default"
                                       style="margin-left:18px;" onclick="edit_noti('','')">
                                <input type="button" value="提交" class="btn btn-primary" style="margin-left:18px;"
                                       data-toggle="modal" data-target="#dismiss">
                                <div class="modal fade" id="dismiss" tabindex="-1" role="dialog"
                                     aria-labelledby="myModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal"
                                                        aria-hidden="true">
                                                    &times;
                                                </button>
                                                <h4 class="modal-title" id="tips">提示</h4>
                                            </div>
                                            <div class="modal-body">
                                                确认修改？
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-default" data-dismiss="modal">取消
                                                </button>
                                                <input type="button" class="btn btn-primary" value="确认" data-dismiss="modal"
                                                       onclick="update_noti()">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <footer><p>版权所有 ©2020-2021 团队比赛报名系统 保留所有权利</p></footer>
        </div>
        <!-- /. PAGE INNER  -->
    </div>
    <!-- /. PAGE WRAPPER  -->
</div>
</body>
</html>