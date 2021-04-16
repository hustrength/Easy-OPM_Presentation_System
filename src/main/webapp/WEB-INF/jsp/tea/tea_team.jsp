<%@ page import="com.rsh.model.Team" %>
<%@ page import="com.rsh.model.Competition" %>
<%@ page import="com.rsh.model.Student" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="com.rsh.mapper.StuTeamMapper" %>
<%@ page import="com.rsh.mapper.EasyOpmMapper" %>
<%@ page import="com.rsh.mapper.CompetitionMapper" %>
<%@ page import="com.rsh.mapper.StuMapper" %>
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
     
            <!-- /.dropdown -->
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
                    <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                </a>
                <ul class="dropdown-menu dropdown-user">
                    <li><a href="<%=teaPath %>tea_info"><i class="fa fa-user fa-fw"></i> 个人信息</a>
                    <li class="divider"></li>
                    <li><a href="/logout"><i class="fa fa-sign-out fa-fw"></i> 注销</a>
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
                    <a><i class="fa fa-sitemap"></i> 比赛信息<span class="fa arrow"/></a>
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
                    <a class="active-menu" href="<%=teaPath %>tea_team"><i class="fa fa-users"></i> 学生组队信息</a>
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

                                        StuTeamMapper stuTeamMapper = EasyOpmMapper.getStuTeamMapper();
                                        List<Team> list = stuTeamMapper.queryAllTeam();
                                        Iterator<Team> it = list.iterator();

                                        CompetitionMapper competitionMapper = EasyOpmMapper.getCompetitionMapper();
                                        StuMapper stuMapper = EasyOpmMapper.getStuMapper();

                                        Competition comp;
                                        Team team;
                                        Student captain;
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
                                         </tr>
                                            <%   
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
