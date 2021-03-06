<%@ page import="com.rsh.model.Student" %>
<%@ page import="com.rsh.model.Apply" %>
<%@ page import="com.rsh.model.Team" %>
<%@ page import="com.rsh.model.Competition" %>
<%@ page import="com.rsh.mapper.*" %>
<%@ page import="java.util.*" %>
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
    <!-- TABLE STYLES-->
    <link href="/assets/js/dataTables/dataTables.bootstrap.css" rel="stylesheet"/>
</head>
<body>
<!-- JS Scripts-->
<!-- jQuery Js -->
<script src="/js/lib/jquery-3.5.1.min.js"></script>
<!-- Bootstrap Js -->
<script src="/assets/js/bootstrap.min.js"></script>
<!-- Metis Menu Js -->
<script src="/assets/js/jquery.metisMenu.js"></script>
<!-- DATA TABLE SCRIPTS -->
<script src="/assets/js/dataTables/jquery.dataTables.js"></script>
<script src="/assets/js/dataTables/dataTables.bootstrap.js"></script>

<script>
    $(document).ready(function () {
        $('#dataTables-example').dataTable();
    });
</script>
<!-- Custom Js -->
<script src="/assets/js/custom-scripts.js"></script>

<!-- CreateGroup Js -->
<script type="text/javascript" src="/js/my/all_team.js"></script>
<script type="text/javascript" src="/js/my/msg.js"></script>

<div id="wrapper">
    <div id="msg">
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
                                ApplyMapper applyMapper = EasyOpmMapper.getApplyMapper();
                                StuTeamMapper stuTeamMapper = EasyOpmMapper.getStuTeamMapper();
                                List<Apply> list_apply = applyMapper.queryNotProcessedApplyByTid(TID);

                                for (Apply apply : list_apply) {

                                    int status = apply.getStatus();
                                    if (status == 0) {
                                        applicantID = apply.getApplicantID();
                                        Student applicant = stuMapper.queryById(applicantID);
                                        Team team = stuTeamMapper.queryTeamByTid(apply.getTID());
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
                                <div style="margin-top:5px">申请加入"<%=team.getTName()%>"</div>
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
                                <div style="margin-top:5px">同意你加入"<%=team.getTName() %>"
                                </div>
                                <%
                                } else if (status == 2) {
                                %>
                                <div style="margin-top:5px">拒绝你加入"<%=team.getTName() %>"
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
    </div>
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
                    <a class="active-menu" href="<%=stuMainPath %>all_team"><i class="fa fa-users"></i> 所有团队</a>
                </li>
                <li>
                    <a href="<%=stuMainPath %>competition_team"><i class="fa fa-edit"></i> 比赛与团队</a>
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
                        所有团队 <small></small>
                    </h1>

                </div>
            </div>
            <!-- /. ROW  -->
            <div class="row">
                <div class="col-md-12">
                    <!-- Advanced Tables -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            所有团队
                        </div>

                        <div class="panel-body">
                            <div class="table-responsive">
                                <%

                                    List<Team> list = stuTeamMapper.queryAllTeam();
                                    Iterator<Team> it = list.iterator();

                                    CompetitionMapper competitionMapper = EasyOpmMapper.getCompetitionMapper();

                                    Competition comp;
                                %>
                                <table class="table table-striped table-bordered table-hover"
                                       id="dataTables-example" name="dataTables-example">
                                    <thead>
                                    <tr>
                                        <th style="width:11%">团队编号</th>
                                        <th style="width:16%">团队名</th>
                                        <th style="width:16%">所选比赛</th>
                                        <th style="width:13%">队长</th>
                                        <th style="width:9%">剩余成员数</th>
                                        <th style="width:9%">选择</th>

                                    </tr>
                                    </thead>
                                    <tbody>
                                    <%
                                        while (it.hasNext()) {
                                            team = it.next();
                                            comp = competitionMapper.queryByCid(team.getCID());
                                            captain = stuMapper.queryById(team.getCaptainID());

                                    %>
                                    <tr class="odd gradeX">
                                        <td><%= team.getTID() %>
                                        </td>
                                        <td><%= team.getTName() %>
                                        </td>
                                        <td><%= comp.getCName() %>
                                        </td>
                                        <td class="center"><%= captain.getStuName() %>
                                        </td>
                                        <td class="center"><%= team.getVacantPos() %>
                                        </td>

                                        <td>
                                            <%
                                                Map<String, Object> paramMap = new HashMap<>();
                                                paramMap.put("StuID", stu.getStuID());
                                                paramMap.put("TID", team.getTID());
                                                if (team.getVacantPos() > 0 && !stuTeamMapper.belongToTeam(paramMap)) {
                                            %>

                                            <input type="button" value="加入" id="join" name="join"
                                                   onclick="apply(<%=team.getTID()%>, '<%=stu.getStuID()%>')">
                                        </td>

                                    </tr>
                                    <%
                                            }
                                        }
                                    %>


                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <!--End Advanced Tables -->
                </div>
            </div>
            <a href="<%=stuMainPath %>create_team" class="btn btn-primary btn-lg" role="button"
               style="float:right">创建团队</a>
            <!-- /. ROW  -->
        </div>
        <footer><p>版权所有 ©2020-2021 团队比赛报名系统 保留所有权利</p></footer>
    </div>
    <!-- /. PAGE INNER  -->
</div>
<!-- /. PAGE WRAPPER  -->
<!-- /. WRAPPER  -->
</body>
</html>
