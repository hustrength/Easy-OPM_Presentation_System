<%@ page import="com.rsh.model.Student" %>
<%@ page import="com.rsh.model.Apply" %>
<%@ page import="com.rsh.model.Team" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.List" %>
<%@ page import="com.rsh.mapper.StuMapper" %>
<%@ page import="com.rsh.mapper.EasyOpmMapper" %>
<%@ page import="com.rsh.mapper.ApplyMapper" %>
<%@ page import="com.rsh.mapper.StuTeamMapper" %>
<%@ page pageEncoding="utf-8" %>
<%
    String stuMainPath = "/stu/";
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>团队比赛报名管理系统——学生界面</title>
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
<script src="/assets/js/jquery-1.10.2.js"></script>
<!-- Bootstrap Js -->
<script src="/assets/js/bootstrap.min.js"></script>
<!-- Metis Menu Js -->
<script src="/assets/js/jquery.metisMenu.js"></script>
<!-- Custom Js -->
<script src="/assets/js/custom-scripts.js"></script>
<!-- Jquery Js -->
<script type="text/javascript" src="/js/jquery-latest.js"></script>
<!-- CreateGroup Js -->
<script type="text/javascript" src="/js/my_info.js"></script>
<script type="text/javascript" src="/js/msg.js"></script>
<div id="wrapper">
    <nav class="navbar navbar-default top-navbar" role="navigation">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand">团队比赛报名管理系统--学生端</a>
        </div>
        <div id="msg">
            <ul class="nav navbar-top-links navbar-right">
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
                        <i class="fa fa-envelope fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-messages">
                        <%
                            Student stu;
                            stu = (Student) session.getAttribute("student");
                            if (stu == null) {
                                System.out.println("JSP: User does not sign in, redirect to the login page");
                                response.sendRedirect("/index");
                            }


                            StuMapper stuMapper = EasyOpmMapper.getStuMapper();
                            List<Integer> TID_list = stuMapper.queryTeamIdByCaptainId(stu.getStuID());


                            for (int TID : TID_list) {
                                String applicantID;
                                Apply apply;
                                ApplyMapper applyMapper = EasyOpmMapper.getApplyMapper();
                                List<Apply> list_apply = applyMapper.queryNotProcessedApplyByTid(TID);

                                for (Apply value : list_apply) {

                                    apply = value;
                                    int status = apply.getStatus();
                                    if (status == 0) {
                                        applicantID = apply.getApplicantID();
                                        Student applicant = stuMapper.queryById(applicantID);
                        %>

                        <li style="margin:3px 0px 0px 15px">

                            <div>
                                <strong><%=applicant.getStuName() %>
                                </strong>
                                <span class="pull-right text-muted">
	                                        <em></em>
	                                    </span>
                            </div>
                            <div style="display:flex;">
                                <div style="margin-top:5px">申请加入你的团队</div>
                                <input type="button" value="同意" class="btn btn-info btn-sm" style="margin-left:20px"
                                       onclick="agree('<%=apply.getApplicantID()%>', '<%=apply.getTID() %>')">
                                <input type="button" value="拒绝" class="btn btn-danger btn-sm" style="margin-left:10px"
                                       onclick="refuse('<%=apply.getApplicantID()%>', '<%=apply.getTID() %>')">
                            </div>

                        </li>
                        <li class="divider"></li>
                        <%
                                    }
                                }
                            }
                        %>

                        <%
                            ApplyMapper applyMapper = EasyOpmMapper.getApplyMapper();
                            StuTeamMapper stuTeamMapper = EasyOpmMapper.getStuTeamMapper();
                            List<Apply> list_apply = applyMapper.queryProcessedApplyBySid(stu.getStuID());
                            Student captain;
                            Team team;


                            for (Apply curApply : list_apply) {

                                team = stuTeamMapper.queryTeamByTid(curApply.getTID());
                                captain = stuMapper.queryById(team.getCaptainID());

                                int status = curApply.getStatus();
                                if (status != 0) {

                        %>

                        <li style="margin:3px 0px 0px 15px">

                            <div>
                                <strong><%=captain.getStuName() %>
                                </strong>
                                <span class="pull-right text-muted">
	                                        <em></em>
	                                    </span>
                            </div>

                            <div style="display:flex;">
                                <%
                                    if (status == 1) {
                                %>
                                <div style="margin-top:5px">同意你加入团队<%=team.getTName() %>
                                </div>
                                <%
                                } else if (status == 2) {
                                %>
                                <div style="margin-top:5px">拒绝你加入团队<%=team.getTName() %>
                                </div>
                                <%
                                    }
                                %>
                                <input type="button" value="确定" class="btn btn-info btn-sm" style="margin-left:10px"
                                       onclick="apply_confirm('<%=curApply.getApplicantID()%>', '<%=curApply.getTID() %>')">
                            </div>

                        </li>
                        <li class="divider"></li>
                        <%
                                }
                            }

                        %>
                    </ul>
                    <!-- /.dropdown-messages -->
                </li>
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
                        <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="<%=stuMainPath %>my_info"><i class="fa fa-user fa-fw"></i> 个人信息</a>
                        <li class="divider"></li>
                        <li><a href="/logout"><i class="fa fa-sign-out fa-fw"></i> 注销</a>
                        </li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
            </ul>
        </div>
    </nav>
    <!--/. NAV TOP  -->
    <nav class="navbar-default navbar-side" role="navigation">
        <div class="sidebar-collapse">
            <ul class="nav" id="main-menu">
                <li>
                    <a href="<%=stuMainPath %>main"><i class="fa fa-bell"></i> 参赛须知</a>
                </li>
                <li>
                    <a href="<%=stuMainPath %>project_info"><i class="fa fa-desktop"></i> 比赛信息</a>
                </li>
                <li>
                    <a href="<%=stuMainPath %>all_team"><i class="fa fa-users"></i> 所有团队</a>
                </li>
                <li>
                    <a href="<%=stuMainPath %>competition_team"><i class="fa fa-edit"></i> 比赛与团队</a>
                </li>

                <li>
                    <a class="active-menu" href="<%=stuMainPath %>my_info"><i class="fa fa-user"></i> 我的信息</a>
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
                                <div style="align:right">
                                    <strong>用户名：</strong><%=stu.getStuID() %>
                                </div>
                            </div>
                            <div class="alert alert-info">
                                <strong>姓名：</strong><%=stu.getStuName() %>
                            </div>
                            <div class="alert alert-warning">
                                <strong>性别：</strong><%=!stu.isSex() ? "男" : "女"%>
                            </div>
                            <%--                             <div class="alert alert-danger">
                                                            <strong>班级：</strong><%=stu.getSclass()%>
                                                        </div>
                            --%>
                            <%
                                List<Team> Team_list = stuMapper.queryTeamByStuId(stu.getStuID());
                                Iterator<Team> it_team = Team_list.iterator();
                                int num = 0;

                                while (it_team.hasNext()) {
                                    team = it_team.next();

                            %>
                            <div class="alert alert-success">
                                <strong>所属团队<%=++num %>：</strong><%=team.getTName()%>
                                <div>
                                    <strong>团队职位：</strong><%=team.getCaptainID().equals(stu.getStuID()) ? "队长" : "队员"%>
                                </div>
                            </div>

                            <%
                                }
                            %>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-3">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            用户头像
                        </div>
                        <img src="/img/profile.png" style="max-width:70%; max-height:70%; margin-left:15%;">
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
                        <div class="form-group" style="margin-left:16px; margin-right:20px; margin-top:20px">
                            <label>请输入初始密码</label>
                            <input class="form-control" type="password" id="password_origin" name="password_origin"
                                   required="required" oninput="checkOriginPassword('<%=stu.getPassword() %>')">
                        </div>
                        <div class="form-group" style="margin-left:16px; margin-right:20px; margin-top:20px">
                            <label>请输入新密码</label>
                            <input class="form-control" type="password" id="password_new" name="password_new"
                                   required="required">
                        </div>
                        <div class="form-group" style="margin-left:16px; margin-right:20px; margin-top:20px">
                            <label>请再次输入新密码</label>
                            <input class="form-control" type="password" id="repassword_new" name="repassword_new"
                                   required="required" oninput="checkPassword()">
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
                                            <input type="button" class="btn btn-primary" value="更改" data-dismiss="modal"
                                                   onclick="changePassword()">
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
