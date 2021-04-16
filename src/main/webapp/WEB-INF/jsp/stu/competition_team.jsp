<%@ page import="com.rsh.model.Student" %>
<%@ page import="com.rsh.model.Apply" %>
<%@ page import="com.rsh.model.Team" %>
<%@ page import="com.rsh.model.Competition" %>
<%@ page import="java.util.List" %>
<%@ page import="com.rsh.mapper.*" %>
<%@ page pageEncoding="utf-8" %>
<%
    String stuMainPath = "/stu/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>团队比赛报名管理系统——学生界面</title>
    <!-- Bootstrap Styles-->
    <link href="/assets/css/bootstrap.css" rel="stylesheet"/>
    <!-- FontAwesome Styles-->
    <link href="/assets/css/font-awesome.css" rel="stylesheet"/>
    <!-- Morris Chart Styles-->
    <link href="/assets/js/morris/morris-0.4.3.min.css" rel="stylesheet"/>
    <!-- Custom Styles-->
    <link href="/assets/css/custom-styles.css" rel="stylesheet"/>
</head>

<body>
<!-- /. WRAPPER  -->
<!-- JS Scripts-->
<!-- jQuery Js -->
<div>
</div>
<script src=" /js/lib/jquery-3.5.1.min.js"></script>
<!-- Bootstrap Js -->
<script src="/assets/js/bootstrap.min.js"></script>
<!-- Metis Menu Js -->
<script src="/assets/js/jquery.metisMenu.js"></script>
<!-- Morris Chart Js -->
<script src="/assets/js/morris/raphael-2.1.0.min.js"></script>
<script src="/assets/js/morris/morris.js"></script>
<!-- Custom Js -->
<script src="/assets/js/custom-scripts.js"></script>

<script type="text/javascript" src="/js/my/competition_team.js"></script>
<script type="text/javascript" src="/js/my/msg.js"></script>
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

                        <li style="margin:3px 0 0 15px">

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

                        <li style="margin:3px 0 0 15px">

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
                    <a class="active-menu" href="<%=stuMainPath %>competition_team"><i class="fa fa-edit"></i>
                        比赛与团队</a>
                </li>

                <li>
                    <a href="<%=stuMainPath %>my_info"><i class="fa fa-user"></i> 我的信息</a>
                </li>

            </ul>
        </div>
    </nav>
    <!-- /. NAV SIDE  -->
    <div id="page-wrapper">
        <div id="page-inner">
            <%
                if (!stuTeamMapper.hasJoinedTeam(stu.getStuID())) {
            %>
            <div class="row">
                <div class="col-md-12">
                    <div class="jumbotron">
                        <h1 style="font-size: 50px">你还未参加比赛！</h1>
                        <p>请选择加入团队或创建团队</p>
                        <hr>
                        <p>
                            <a href="<%=stuMainPath %>all_team" class="btn btn-primary btn-lg" role="button"
                               style="margin-right:50px">加入团队</a>
                            <a href="<%=stuMainPath %>create_team" class="btn btn-primary btn-lg" role="button">创建团队</a>
                        </p>
                    </div>
                </div>
            </div>
            <%
            } else {
            %>
            <div class="row">
                <div class="col-md-12">
                    <h1 class="page-header" style="margin-bottom:20px">
                        我的比赛与团队 <small></small>
                    </h1>
                </div>
            </div>
            <%
                CompetitionMapper competitionMapper = EasyOpmMapper.getCompetitionMapper();

                List<Team> allJoinedTeam = stuMapper.queryTeamByStuId(stu.getStuID());
                Competition comp;
                String intro;
                int counter = 0;


                for (Team joinedTeam : allJoinedTeam) {

                    comp = competitionMapper.queryByCid(joinedTeam.getCID());
                    intro = comp.getIntroduction();

                    intro = intro.replace("\r\n", "<br/>");

            %>
            <h3 style="margin-bottom:10px; margin-top:10px">
                比赛<%=++counter %> <small></small>
            </h3>
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            比赛信息
                        </div>

                        <div style="margin-left:20px; float:left;">
                            <h4>比赛：<%=comp.getCName()%>
                            </h4>
                        </div>
                        <div style="margin-right:20px; float:right;">
                            <h4>所属团队：<%=joinedTeam.getTName()%>
                            </h4>
                        </div>
                        <div style="clear:both;"></div>
                        <div class="panel-body">
                            <ul class="nav nav-tabs">
                                <li class="active"><a href="#home" data-toggle="tab">简介</a>
                                </li>
                                <li class=""><a href="#profile" data-toggle="tab">背景</a>
                                </li>
                                <li class=""><a href="#messages" data-toggle="tab">详情</a>
                                </li>
                                <li class=""><a href="#settings" data-toggle="tab">其他要求</a>
                                </li>
                            </ul>
                            <div class="tab-content" style="height:150px">
                                <div class="tab-pane fade active in" id="home">
                                    <p><%=intro %>
                                    </p>
                                </div>
                                <div class="tab-pane fade" id="profile">
                                    <p>test1</p>
                                </div>
                                <div class="tab-pane fade" id="messages">
                                    <p>test2</p>
                                </div>
                                <div class="tab-pane fade" id="settings">
                                    <p>test3</p>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

            <div class="panel panel-default">
                <div class="panel-heading">
                    团队信息
                </div>
                <h3 style="padding:20px 0 10px 29px"><%=joinedTeam.getTName() %>
                </h3>
                <div class="panel-body">
                    <div class="row" style="margin-left:0">
                        <div class="col-md-3">
                            <img src="/img/profile.png" style="max-width:80%; max-height:80%" alt="">
                        </div>
                        <%
                            captain = stuMapper.queryById(joinedTeam.getCaptainID());
                            int isCaptain = 0;
                        %>
                        <div class="col-md-5">
                            <div>
                                <h3>队长</h3>
                                <div style="margin-top:10px">
                                    <p><span>姓名：<%=captain.getStuName() %></span></p>
                                    <p><span>性别：<%=!captain.isSex() ? "男" : "女" %></span></p>
                                </div>
                            </div>
                        </div>

                        <%
                            if (stu.getStuID().equals(joinedTeam.getCaptainID())) {
                                isCaptain = 1;
                        %>
                        <div class="col-md-3">
                            <div class="row">
                                <button class="btn btn-primary btn-lg" style="margin-top:100px;" data-toggle="modal"
                                        data-target="#dismiss<%=counter %>">解散团队
                                </button>
                                <div class="modal fade" id="dismiss<%=counter %>" tabindex="-1" role="dialog"
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
                                                确认解散？
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-default" data-dismiss="modal">取消
                                                </button>
                                                <input id="quit_team<%=counter %>" type="button" class="btn btn-primary"
                                                       value="确认"
                                                       onclick="break_group(<%=joinedTeam.getTID()%>,'<%=stu.getStuID()%>')">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%
                            }
                        %>
                    </div>

                    <%
                        List<Student> allMembers = stuTeamMapper.queryAllMembers(joinedTeam.getTID());
                        int num = 0;

                        for (Student member : allMembers) {

                    %>
                    <hr>
                    <div class="row" style="margin-left:0">
                        <div class="col-md-3">
                            <img src="/img/profile.png" style="max-width:80%; max-height:80%">
                        </div>
                        <div class="col-md-5">
                            <div>
                                <h3>队员<%=++num %>
                                </h3>

                                <div style="margin-top:10px">
                                    <p><span>姓名：<%=member.getStuName() %></span></p>
                                    <p><span>性别：<%=!member.isSex() ? "男" : "女" %></span></p>
                                </div>
                            </div>
                        </div>
                        <%
                            if (isCaptain == 1) {
                        %>
                        <div class="col-md-3">
                            <div class="row">
                                <button class="btn btn-primary btn-lg" style="margin-top:50px;" data-toggle="modal"
                                        data-target="#remove1">踢出团队
                                </button>
                                <div class="modal fade" id="remove1" tabindex="-1" role="dialog"
                                     aria-labelledby="myModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal"
                                                        aria-hidden="true">
                                                    &times;
                                                </button>
                                                <h4 class="modal-title" id="tips1">提示</h4>
                                            </div>
                                            <div class="modal-body">
                                                确认踢出？
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-default" data-dismiss="modal">取消
                                                </button>
                                                <button type="button" class="btn btn-primary"
                                                        onclick="remove_member(<%=joinedTeam.getTID()%>,'<%=member.getStuID()%>')">
                                                    确认
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <button class="btn btn-primary btn-lg" style="margin-top:20px;" data-toggle="modal"
                                        data-target="#transfer1">转让队长
                                </button>
                                <div class="modal fade" id="transfer1" tabindex="-1" role="dialog"
                                     aria-labelledby="myModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal"
                                                        aria-hidden="true">
                                                    &times;
                                                </button>
                                                <h4 class="modal-title" id="tips2">提示</h4>
                                            </div>
                                            <div class="modal-body">
                                                确认转让？
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-default" data-dismiss="modal">取消
                                                </button>
                                                <button type="button" class="btn btn-primary"
                                                        onclick="transfer_leader(<%=joinedTeam.getTID()%>,'<%=member.getStuID()%>','<%=stu.getStuID()%>')">
                                                    确认
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%
                        } else {
                            if (member.getStuID().equals(stu.getStuID())) {


                        %>
                        <div class="row">
                            <button class="btn btn-primary btn-lg" style="margin-top:50px;" data-toggle="modal"
                                    data-target="#remove2">退出团队
                            </button>
                            <div class="modal fade" id="remove2" tabindex="-1" role="dialog"
                                 aria-labelledby="myModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal"
                                                    aria-hidden="true">
                                                &times;
                                            </button>
                                            <h4 class="modal-title" id="tips3">提示</h4>
                                        </div>
                                        <div class="modal-body">
                                            确认退出？
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">取消
                                            </button>
                                            <button type="button" class="btn btn-primary"
                                                    onclick="quit_group(<%=joinedTeam.getTID()%>,'<%=stu.getStuID()%>')">
                                                确认
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%
                                }
                            }
                        %>
                    </div>
                    <%
                        }

                    %>
                </div>
            </div>
            <!-- /. ROW  -->
            <%
                    }
                }
            %>
            <!-- /. ROW  -->
            <footer><p>版权所有 ©2020-2021 团队比赛报名系统 保留所有权利</p></footer>
        </div>
        <!-- /. PAGE INNER  -->
    </div>
    <!-- /. PAGE WRAPPER  -->
</div>
</body>
</html>