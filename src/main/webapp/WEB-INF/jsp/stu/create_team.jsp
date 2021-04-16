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
<script src="/js/lib/jquery-3.5.1.min.js"></script>
<!-- Bootstrap Js -->
<script src="/assets/js/bootstrap.min.js"></script>
<!-- Metis Menu Js -->
<script src="/assets/js/jquery.metisMenu.js"></script>
<!-- Custom Js -->
<script src="/assets/js/custom-scripts.js"></script>
<!-- Jquery Js -->
<script type="text/javascript" src="/js/jquery-latest.js"></script>
<!-- CreateGroup Js -->
<script type="text/javascript" src="/js/my/createTeam.js"></script>
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
                    <a class="active-menu" href="<%=stuMainPath %>competition_team"><i class="fa fa-edit"></i> 比赛与团队</a>
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
            <div class="row">
                <div class="col-md-12">
                    <h1 class="page-header">
                        创建团队 <small></small>
                    </h1>
                </div>
            </div>
            <!-- /. ROW  -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            团队信息
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div id="form_create">
                                        <div class="form-group">
                                            <label>团队名称</label>
                                            <input class="form-control" id="Gname" name="Gname" required="required"
                                                   onchange="check_gname_repeat()">
                                        </div>
                                        <div class="form-group">
                                            <label>选择比赛</label>

                                            <select id="PNo" name="PNo" class="form-control">
                                                <option class="input_bt" value="" selected>--请选择--</option>
                                                <%
                                                    Competition comp;
                                                    CompetitionMapper competitionMapper = EasyOpmMapper.getCompetitionMapper();
                                                    List<Competition> list = competitionMapper.queryAllCompetition();
                                                    for (Competition competition : list) {
                                                        comp = competition;
                                                %>
                                                <option value="<%=comp.getCID() %>"><%=comp.getCName() %>
                                                </option>
                                                <%
                                                    }
                                                %>
                                            </select>
                                        </div>
                                        <div style="margin-top:-10px;margin-bottom:10px;font-size:10px">
                                            <i id="remained_group">&nbsp;
                                            </i>
                                        </div>
                                        <div class="form-group">
                                            <label>团队人数</label>
                                            <select class="input" name="Gsnum" id="Gsnum" required="required" style="height:30px"
                                                    oninvalid="setCustomValidity('该项不可为空')" oninput="setCustomValidity('')">
                                                <option class="input_bt" value="" selected>--请选择--</option>
                                                <option class="input_bt" value="1">1 人</option>
                                                <option class="input_bt" value="2">2 人</option>
                                                <option class="input_bt" value="3">3 人</option>
                                                <option class="input_bt" value="4">4 人</option>
                                            </select>
                                        </div>
                                        <hr>
                                        <input type="submit" class="btn btn-primary" value="创建" onclick="create_team()">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <footer><p>版权所有 ©2020-2021 团队比赛报名系统 保留所有权利</p></footer>
            <!-- /. PAGE INNER  -->
        </div>
        <!-- /. PAGE WRAPPER  -->
    </div>
</div>
</body>
</html>
