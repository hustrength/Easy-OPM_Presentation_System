<%@ page language="java" import="java.util.*,com.pss.user.*,com.pss.dao.*" pageEncoding="utf-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    String stuMainPath = path + "/stu/";
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <base href="<%=basePath%>">
    <meta charset="utf-8"/>
    
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>团队比赛报名管理系统——学生界面</title>
    <!-- Bootstrap Styles-->
    <link href="<%=path %>/assets/css/bootstrap.css" rel="stylesheet"/>
    <!-- FontAwesome Styles-->
    <link href="<%=path %>/assets/css/font-awesome.css" rel="stylesheet"/>
    <!-- Custom Styles-->
    <link href="<%=path %>/assets/css/custom-styles.css" rel="stylesheet"/>
    <!-- Google Fonts-->
    <link href='http://fonts.useso.com/css?family=Open+Sans' rel='stylesheet' type='text/css'/>
</head>
<body>
<!-- /. WRAPPER  -->
<!-- JS Scripts-->
<!-- -- PagingManage Js -- -->
<script type="text/javascript" src="<%=path %>/js/PagingManage.js"></script>
<!-- jQuery Js -->
<script src="<%=path %>/assets/js/jquery-1.10.2.js"></script>
<!-- Bootstrap Js -->
<script src="<%=path %>/assets/js/bootstrap.min.js"></script>
<!-- Metis Menu Js -->
<script src="<%=path %>/assets/js/jquery.metisMenu.js"></script>
<!-- Custom Js -->
<script src="<%=path %>/assets/js/custom-scripts.js"></script>
<script type="text/javascript" src="<%=path %>/js/msg.js"></script>
<div id="wrapper">
    <nav class="navbar navbar-default top-navbar" role="navigation">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                <span class="sr-only"></span>
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
                    <a class="active-menu" href="<%=stuMainPath %>project_info.jsp"><i class="fa fa-desktop"></i> 比赛信息</a>
                </li>
                <li>
                    <a href="<%=stuMainPath %>all_team.jsp"><i class="fa fa-users"></i> 所有团队</a>
                </li>
                <li>
                    <a href="<%=stuMainPath %>competition_team.jsp"><i class="fa fa-edit"></i> 比赛与团队</a>
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
            <div class="row">
                <div class="col-md-12">
                    <h1 class="page-header">
                        可选比赛 <small></small>
                    </h1>
                </div>
            </div>
            <!-- /. ROW  -->
            <div class="row">
                <%
                	Competition comp = null;
                    DaoComp daocomp = new DaoComp();
                    List<Competition> list_comp = daocomp.listAllComp();
                    Iterator<Competition> it_comp = list_comp.iterator();
                    int i = 0;

                    while (it_comp.hasNext()) {
                        ++i;
                        comp = it_comp.next();
                        String intro=comp.getIntroduction();
                        intro=intro.replace("\r\n","<br>");
                %>
                <div class="col-md-6 col-sm-6">
                    <form>
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <%=comp.getCName()%>
                            </div>
                            <div class="panel-body">
                                <ul class="nav nav-tabs">
                                    <li class="active"><a href="#home1" data-toggle="tab">简介</a>
                                    </li>
                                    <li class=""><a href="#profile1" data-toggle="tab">背景</a>
                                    </li>
                                    <li class=""><a href="#messages1" data-toggle="tab">详情</a>
                                    </li>
                                    <li class=""><a href="#settings1" data-toggle="tab">其他要求</a>
                                    </li>
                                </ul>
                                <div class="tab-content">
                                    <div class="tab-pane fade active in" id="home1" style="height:240px">
                                        <p class="col-sm-12"
                                           style="overflow-y:scroll;height:240px;font-size:21px;font-weight:200;line-height:25px;margin-top:15px">
                                            <%=intro%>
                                        </p>
                                    </div>
                                    <div class="tab-pane fade" id="profile1" style="height:240px">
                                        <p class="col-sm-12"
                                           style="overflow-y:scroll;height:240px;font-size:21px;font-weight:200;line-height:25px;margin-top:15px">
                                            test1
                                        </p>
                                    </div>
                                    <div class="tab-pane fade" id="messages1" style="height:240px">
                                        <p class="col-sm-12"
                                           style="overflow-y:scroll;height:240px;font-size:21px;font-weight:200;line-height:25px;margin-top:15px">
                                            test2
                                        </p>
                                    </div>
                                    <div class="tab-pane fade" id="settings1" style="height:240px">
                                        <p class="col-sm-12" readonly="readonly"
                                           style="overflow-y:scroll;height:240px;font-size:21px;font-weight:200;line-height:25px;margin-top:15px">
                                            test3
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <%
                    if (i % 2 == 0) {
                %>
                <hr style="border:1px solid  #e5ebf2">
                <%
                        }
                    }
                %>
            </div>
            <!-- /. ROW  -->
            <footer><p>版权所有 ©2020-2021 团队比赛报名系统 保留所有权利</p></footer>
        </div>
        <!-- /. PAGE INNER  -->
    </div>
    <!-- /. PAGE WRAPPER  -->
</div>


</body>
</html>
