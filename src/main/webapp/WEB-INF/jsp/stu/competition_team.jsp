<%@ page language="java" import="java.util.*,com.pss.user.*,com.pss.dao.*" pageEncoding="utf-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    String stuMainPath = path + "/stu/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

    <meta charset="utf-8"/>
    <base href="<%=basePath%>">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>团队比赛报名管理系统——学生界面</title>
    <!-- Bootstrap Styles-->
    <link href="<%=path %>/assets/css/bootstrap.css" rel="stylesheet"/>
    <!-- FontAwesome Styles-->
    <link href="<%=path %>/assets/css/font-awesome.css" rel="stylesheet"/>
    <!-- Morris Chart Styles-->
    <link href="<%=path %>/assets/js/morris/morris-0.4.3.min.css" rel="stylesheet"/>
    <!-- Custom Styles-->
    <link href="<%=path %>/assets/css/custom-styles.css" rel="stylesheet"/>
</head>

<body>
<!-- /. WRAPPER  -->
<!-- JS Scripts-->
<!-- jQuery Js -->
<div>
</div>
<script src="<%=path%>/assets/js/jquery-1.10.2.js"></script>
<!-- Bootstrap Js -->
<script src="<%=path %>/assets/js/bootstrap.min.js"></script>
<!-- Metis Menu Js -->
<script src="<%=path %>/assets/js/jquery.metisMenu.js"></script>
<!-- Morris Chart Js -->
<script src="<%=path %>/assets/js/morris/raphael-2.1.0.min.js"></script>
<script src="<%=path %>/assets/js/morris/morris.js"></script>
<!-- Custom Js -->
<script src="<%=path %>/assets/js/custom-scripts.js"></script>

<script type="text/javascript" src="<%=path %>/js/competition_team.js"></script>
<script type="text/javascript" src="<%=path %>/js/msg.js"></script>
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
                    	Student stu=null;
                        stu = (Student) session.getAttribute("student");
                        if(stu==null){
                     	   response.sendRedirect(basePath+"llogin.jsp");
                        }
                        
                        DaoStu stu_query=new DaoStu();
                        ArrayList<Integer> TID_list = stu_query.query_captainTID(stu.getStuID());
                        Iterator<Integer> it_TID = TID_list.iterator();
                        
                    
                        while (it_TID.hasNext()){
                     	   int TID = it_TID.next();
     	                   String applicantID=null;
     	                   Apply apply = null;
     	                   DaoApply list_all_apply = new DaoApply();
     	                   List<Apply> list_apply = list_all_apply.listApplybyTID(TID);
     	                   Iterator<Apply> it_apply = list_apply.iterator();
     	                   
     	                   while (it_apply.hasNext()) {
     	                	   
     	                       apply = it_apply.next();
     	                       int status = apply.getStatus();
     	                       if (status== 0) {
     	                    	   applicantID=apply.getApplicantID();
     	                    	   Student applicant = stu_query.querybyid(applicantID);
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
     	                   DaoApply list_all_apply = new DaoApply();
                		   DaoStu daostu = new DaoStu();
                		   DaoStu_Team daostu_team = new DaoStu_Team();
     	                   List<Apply> list_apply = list_all_apply.listApplybySID(stu.getStuID());
     	                   Iterator<Apply> it_apply = list_apply.iterator();
     	                   Student captain = null;
     	                   Team team = null;
     	                   Apply apply = null;
     	                   
     	                   while (it_apply.hasNext()) {
     	                	   
     	                       apply = it_apply.next();
     	                       team = daostu_team.querybyTID(apply.getTID());
     	                       captain = daostu.querybyid(team.getCaptainID());
     	                       
     	                       int status = apply.getStatus();
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
	                            	if (status == 1){
	                            %>
	                                <div style="margin-top:5px">同意你加入团队<%=team.getTName() %></div>
	                            <%
	                            	}else if (status == 2){
	                            %>
	                           		<div style="margin-top:5px">拒绝你加入团队<%=team.getTName() %></div>
	                            <%
	                            	}
	                            %>
	                            	<input type="button" value="确定" class="btn btn-info btn-sm" style="margin-left:10px"
	                                   onclick="confirm('<%=apply.getApplicantID()%>', '<%=apply.getTID() %>')">
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
                    <li><a href="<%=stuMainPath %>my_info.jsp"><i class="fa fa-user fa-fw"></i> 个人信息</a>
                    <li class="divider"></li>
                    <li><a href="<%=basePath%>login.jsp"><i class="fa fa-sign-out fa-fw"></i> 注销</a>
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
                    <a href="<%=stuMainPath %>main.jsp"><i class="fa fa-bell"></i> 参赛须知</a>
                </li>
                <li>
                    <a href="<%=stuMainPath %>project_info.jsp"><i class="fa fa-desktop"></i> 比赛信息</a>
                </li>
                <li>
                    <a href="<%=stuMainPath %>all_team.jsp"><i class="fa fa-users"></i> 所有团队</a>
                </li>
                <li>
                    <a class="active-menu" href="<%=stuMainPath %>competition_team.jsp"><i class="fa fa-edit"></i>
                        比赛与团队</a>
                </li>

                <li>
                    <a href="<%=stuMainPath %>my_info.jsp"><i class="fa fa-user"></i> 我的信息</a>
                </li>

            </ul>
        </div>
    </nav>
    <!-- /. NAV SIDE  -->
    <div id="page-wrapper">
        <div id="page-inner">
            <%
            	DaoStu_Team stu_team = new DaoStu_Team();
            	
                if (!stu_team.hasJoinedTeam(stu.getStuID())) {
            %>
            <div class="row">
                <div class="col-md-12">
                    <div class="jumbotron">
                        <h1>你还未参加比赛！</h1>
                        <p>请选择加入团队或创建团队</p>
                        <hr>
                        <p>
                            <a href="<%=stuMainPath %>all_team.jsp" class="btn btn-primary btn-lg" role="button"
                               style="margin-right:50px">加入团队</a>
                            <a href="<%=stuMainPath %>create_team.jsp" class="btn btn-primary btn-lg" role="button">创建团队</a>
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
              	daostu = new DaoStu();
              	DaoComp daocomp = new DaoComp();
              	
              	ArrayList<Team> allJoinedTeam = daostu.query_teamInfo(stu.getStuID());
              	Iterator<Team> it_team = allJoinedTeam.iterator();
              	Competition comp = null;
              	team = null;
              	String intro="";
              	int counter = 0;
              	
              	while (it_team.hasNext()){
	              		
	              	team = it_team.next();
	              	comp = daocomp.querybycid(team.getCID());
	              	intro = comp.getIntroduction();
	              	
	                intro=intro.replace("\r\n","<br/>");
                  
            %>
            <h3 style="margin-bottom:10px; margin-top:10px" >
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
                        	<h4>所属团队：<%=team.getTName()%>
                        	</h4>
                        </div>
                        <div style="clear:both;"> </div>
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
                                    <p><%=intro %></p>
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
                <h3 style="padding:20px 0px 10px 29px"><%=team.getTName() %>
                </h3>
                <div class="panel-body">
                    <div class="row" style="margin-left:0px">
                        <div class="col-md-3">
                            <img src="<%=path%>/img/profile.png" style="max-width:80%; max-height:80%">
                        </div>
                        <%
			            	captain = daostu.querybyid(team.getCaptainID());
                        	int isCaptain = 0;
			            %>
                        <div class="col-md-5">
                            <div>
                                <h3>队长</h3>
                                <div style="margin-top:10px">
                                    <p><span>姓名：<%=captain.getStuName() %></span></p>
                                    <p><span>性别：<%=captain.isSex()==false?"男":"女" %></span></p>
                                </div>
                            </div>
                        </div>

                        <%
                            if (stu.getStuID().equals(team.getCaptainID())) {
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
                                                <input id="quit_team<%=counter %>" type="button" class="btn btn-primary" value="确认"
                                                       onclick="break_group(<%=team.getTID()%>,'<%=stu.getStuID()%>')">
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
	                    ArrayList<Student> allMembers = stu_team.listAllMembers(team.getTID());
	                	Iterator<Student> it_members = allMembers.iterator();
	                	Student member = null;
	                	int num = 0;
	                	
	                	while (it_members.hasNext()){
	                	member = it_members.next();

                    %>
                    <hr>
                    <div class="row" style="margin-left:0px">
                        <div class="col-md-3">
                            <img src="<%=path%>/img/profile.png" style="max-width:80%; max-height:80%">
                        </div>
                        <div class="col-md-5">
                            <div>
                                <h3>队员<%=++num %></h3>

                                <div style="margin-top:10px">
                                    <p><span>姓名：<%=member.getStuName() %></span></p>
                                    <p><span>性别：<%=member.isSex()==false?"男":"女" %></span></p>
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
                                                onclick="remove_member(<%=team.getTID()%>,'<%=member.getStuID()%>')">确认</button>
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
                                                onclick="transfer_leader(<%=team.getTID()%>,'<%=member.getStuID()%>','<%=stu.getStuID()%>')">确认</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%
                            }
                            else{
                            if(member.getStuID().equals(stu.getStuID())){
                            	
                            
                        %>
                        <div class="row">
                                <button class="btn btn-primary btn-lg" style="margin-top:50px;" data-toggle="modal"
                                        data-target="#remove1">退出团队
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
                                                确认退出？
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-default" data-dismiss="modal">取消
                                                </button>
                                                <button type="button" class="btn btn-primary" onclick="quit_group(<%=team.getTID()%>,'<%=stu.getStuID()%>')">确认</button>
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