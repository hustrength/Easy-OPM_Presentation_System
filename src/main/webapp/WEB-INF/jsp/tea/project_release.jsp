<%@ page pageEncoding="utf-8" %>
<%
    String teaPath = "/tea/";
%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>团队比赛报名管理系统——教师界面</title>
    <!-- Bootstrap Styles-->
    <link href="/assets/css/bootstrap.css" rel="stylesheet"/>
    <!-- FontAwesome Styles-->
    <link href="/assets/css/font-awesome.css" rel="stylesheet"/>
    <!-- Custom Styles-->
    <link href="/assets/css/custom-styles.css" rel="stylesheet"/>
</head>
<body>
<!-- JS Scripts-->
<!-- jQuery Js -->
<script src="/js/lib/jquery-3.5.1.min.js"></script>
<!-- Bootstrap Js -->
<script src="/assets/js/bootstrap.min.js"></script>
<!-- Metis Menu Js -->
<script src="/assets/js/jquery.metisMenu.js"></script>
<!-- Custom Js -->
<script src="/assets/js/custom-scripts.js"></script>
<!-- project_release js -->
<script type="text/javascript" src="/js/my/project_release.js"></script>
<div id="page_wrapper">
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
                        <li><a href="<%=teaPath %>tea_info"><i class="fa fa-user fa-fw"></i> 个人信息</a>
                        <li class="divider"></li>
                        <li><a href="/ogout"><i class="fa fa-sign-out fa-fw"></i> 注销</a>
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
                        <a href="<%=teaPath %>tea_main"><i class="fa fa-desktop"></i> 参赛须知</a>
                    </li>

                    <li>
                        <a class="active-menu"><i class="fa fa-sitemap"></i> 比赛信息<span class="fa arrow"/></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="<%=teaPath %>project_release">发布比赛</a><!--连接到发布比赛信息jsp，自动创建一个新的比赛信息数据结构  -->
                            </li>
                            <li>
                                <a href="<%=teaPath %>project_info_tea">查看比赛</a><!--连接到查看比赛信息jsp，自动创建一个新的比赛信息数据结构  -->
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="<%=teaPath %>tea_team"><i class="fa fa-users"></i> 学生组队信息</a>
                    </li>
                    <li>
                        <a href="<%=teaPath %>tea_info"><i class="fa fa-user"></i> 教师个人信息</a>
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
                            发布比赛
                        </h1>
                    </div>
                </div>
                <!-- /. ROW  -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                比赛信息
                            </div>
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-lg-6">
                                        <div id="form_pro">
                                            <div class="form-group">
                                                <label>比赛名称</label>
                                                <input class="form-control" id="Pname" name="Pname" required="required">

                                            </div>

                                            <div class="form-group">
                                                <label>比赛简介</label>
                                                <textarea class="form-control" rows="3" id="Intro"
                                                          name="Intro"></textarea>
                                            </div>
                                            <div class="form-group">
                                                <label>比赛背景</label>
                                                <textarea class="form-control" rows="3" id="Bg" name="Bg"></textarea>
                                            </div>
                                            <div class="form-group">
                                                <label>比赛信息</label>
                                                <textarea class="form-control" rows="3" id="Info"
                                                          name="Info"></textarea>
                                            </div>
                                            <div class="form-group">
                                                <label>其他要求</label>
                                                <textarea class="form-control" rows="3" id="Other"
                                                          name="Other"></textarea>
                                            </div>
                                            <hr>
                                            <button type="submit" class="btn btn-primary" onclick="pro_release()">提交
                                            </button>
                                            <button type="reset" class="btn btn-default">重新填写</button>
                                        </div>
                                    </div>
                                    <!-- /.col-lg-6 (nested) -->

                                </div>
                                <footer><p>版权所有 ©2020-2021 团队比赛报名系统 保留所有权利</p></footer>
                            </div>
                            <!-- /. PAGE INNER  -->
                        </div>
                        <!-- /. PAGE WRAPPER  -->
                    </div>
                    <!-- /. WRAPPER  -->
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
