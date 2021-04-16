<%@ page import="com.rsh.model.Competition" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="com.rsh.mapper.CompetitionMapper" %>
<%@ page import="com.rsh.mapper.EasyOpmMapper" %>
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
    <!-- Google Fonts-->
    <link href='http://fonts.useso.com/css?family=Open+Sans' rel='stylesheet' type='text/css'/>
</head>
<body>
<!-- /. WRAPPER  -->
<!-- JS Scripts-->
<!-- -- PagingManage Js -- -->
<script type="text/javascript" src="/js/PagingManage.js"></script>
<!-- jQuery Js -->
<script src="/assets/js/jquery-1.10.2.js"></script>
<!-- Bootstrap Js -->
<script src="/assets/js/bootstrap.min.js"></script>
<!-- Metis Menu Js -->
<script src="/assets/js/jquery.metisMenu.js"></script>
<!-- Custom Js -->
<script src="/assets/js/custom-scripts.js"></script>
<script type="text/javascript" src="/js/project_info_tea.js"></script>
<script type="text/javascript">
    function GetActiveTab(i) {
        var nav_id = "#nav-tabs" + i.toString() + " li.active";
        var id = $(nav_id).children('a').attr('href').substring(1);
        var div = document.getElementById(id);
        return div.getElementsByTagName("textarea")[0];
    }

    function edit_input(i, name, intro, bg, info, other) {
        var tab = GetActiveTab(i);
        var content_old = tab.value;
        var btn_id = "edit" + i.toString();
        var btn = document.getElementById(btn_id);
        var group_num_id = "max_group_num" + i.toString();
        var pname_id = "Pname" + i.toString();
        var pname = document.getElementById(pname_id);
        if (btn.value === "编辑") {
            btn.value = "复原";
            tab.removeAttribute("readOnly");
            tab.style.border = "0.5px solid #808080";
            pname.style.border = "0.5px solid #808080";
            pname.removeAttribute("readOnly");
        } else {
            if (tab.id == "Intro") tab.value = intro.replace(/<br>/g, '\r\n');
            else if (tab.id == "Bg") tab.value = bg.replace(/<br>/g, '\r\n');
            else if (tab.id == "Info") tab.value = info.replace(/<br>/g, '\r\n');
            else if (tab.id == "Other") tab.value = other.replace(/<br>/g, '\r\n');
            pname.value = name;
            btn.setAttribute("value", "编辑");
            tab.setAttribute("readOnly", 'true');
            tab.style.border = "0.5px solid #ffffff";
            pname.setAttribute("readOnly", 'true');
            pname.style.border = "0.5px solid #ffffff";
        }
    }

    function ResetBtn(i) {
        var btn_id = "edit" + i.toString();
        var btn = document.getElementById(btn_id);
        var group_num_id = "max_group_num" + i.toString();
        var tab = GetActiveTab(i);
        btn.setAttribute("value", "编辑");
        tab.setAttribute("readOnly", 'true');
        tab.style.border = "0.5px solid #ffffff";
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

            <!-- /.dropdown -->
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
                    <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                </a>
                <ul class="dropdown-menu dropdown-user">
                    <li><a href="<%=teaPath %>tea_infojsp"><i class="fa fa-user fa-fw"></i> 个人信息</a>
                    <li class="divider"></li>
                    <li><a href="/logout"><i class="fa fa-sign-out fa-fw"></i> 注销</a>
                    </li>
                </ul>
                <!-- /.dropdown-user -->
            </li>
        </ul>
    </nav>
    <!--/. NAV TOP  -->
    <nav class="navbar-default navbar-side" role="navigation">
        <div class="sidebar-collapse">
            <ul class="nav" id="main-menu">
                <li>
                    <a href="<%=teaPath %>tea_mainjsp"><i class="fa fa-desktop"></i> 参赛须知</a>
                </li>
                <li>
                    <a class="active-menu"><i class="fa fa-sitemap"></i> 比赛信息<span class="fa arrow"/></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="<%=teaPath %>project_releasejsp">发布比赛</a><!--连接到发布比赛信息jsp，自动创建一个新的比赛信息数据结构  -->
                        </li>
                        <li>
                            <a href="<%=teaPath %>project_info_teajsp">查看比赛</a><!--连接到查看比赛信息jsp，自动创建一个新的比赛信息数据结构  -->
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="<%=teaPath %>tea_teamjsp"><i class="fa fa-users"></i> 学生组队信息</a>
                </li>
                <li>
                    <a href="<%=teaPath %>tea_infojsp"><i class="fa fa-user"></i> 教师个人信息</a>
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
                        已发布比赛 <small></small>
                    </h1>
                </div>
            </div>
            <div class="row">
                <%
                    CompetitionMapper competitionMapper = EasyOpmMapper.getCompetitionMapper();
                    List<Competition> list_comp = competitionMapper.queryAllCompetition();
                    int i = 0;

                    for (Competition competition : list_comp) {
                        ++i;
                        String intro = competition.getIntroduction();
                        intro = intro.replace("\r\n", "<br>");
                %>
                <div class="col-md-6 col-sm-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <input id="PNo<%=i%>" name="PNo" value=<%=competition.getCID()%> style="display:none">
                            <input id="Pname<%=i%>" name="Pname" value="<%=competition.getCName()%>" readonly="readonly"
                                   style="border:0.5px solid #ffffff;">
                        </div>
                        <div class="panel-body">
                            <ul id="nav-tabs<%=i%>" class="nav nav-tabs">
                                <li class="active"><a href="#home<%=i%>" data-toggle="tab"
                                                      onclick="ResetBtn(<%=i%>)">简介</a>
                                </li>
                                <li class=""><a href="#profile<%=i%>" data-toggle="tab"
                                                onclick="ResetBtn(<%=i%>)">背景</a>
                                </li>
                                <li class=""><a href="#messages<%=i%>" data-toggle="tab"
                                                onclick="ResetBtn(<%=i%>)">详情</a>
                                </li>
                                <li class=""><a href="#settings<%=i%>" data-toggle="tab"
                                                onclick="ResetBtn(<%=i%>)">其他要求</a>
                                </li>
                            </ul>
                            <button type="button" class="close" aria-hidden="true" style="margin:-95px -5px"
                                    data-toggle="modal" data-target="#remove_project<%=i%>">
                                &times;
                            </button>
                            <div class="modal fade" id="remove_project<%=i%>" tabindex="-1" role="dialog"
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
                                            确认删除比赛？
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default"
                                                    data-dismiss="modal">取消
                                            </button>
                                            <input id="pro_edit<%=i%>" type="button" class="btn btn-primary" value="确认"
                                                   data-dismiss="modal"
                                                   onclick="remove_pro(<%=competition.getCID()%>)">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <form id="form_pro<%=i%>" name="form_pro">
                                <div class="tab-content">
                                    <div class="tab-pane fade active in" id="home<%=i%>" style="height:240px">
                                                    <textarea class="col-sm-12" id="Intro" name="Intro"
                                                              readonly="readonly"
                                                              style="border:0.5px solid #ffffff;overflow-y:scroll;height:240px;font-size:21px;
                                                              font-weight:200;line-height:25px;margin-top:15px"><%=competition.getIntroduction() %></textarea>
                                    </div>
                                    <div class="tab-pane fade" id="profile<%=i%>" style="height:240px">
													<textarea class="col-sm-12" id="Bg" name="Bg" readonly="readonly"
                                                              style="border:0.5px solid #ffffff;overflow-y:scroll;height:240px;font-size:21px;
                                                              font-weight:200;line-height:25px;margin-top:15px">test</textarea>
                                    </div>
                                    <div class="tab-pane fade" id="messages<%=i%>" style="height:240px">
													<textarea class="col-sm-12" id="Info" name="Info"
                                                              readonly="readonly"
                                                              style="border:0.5px solid #ffffff;overflow-y:scroll;height:240px;font-size:21px;
                                                              font-weight:200;line-height:25px;margin-top:15px">test</textarea>
                                    </div>
                                    <div class="tab-pane fade" id="settings<%=i%>" style="height:240px">
                                                    <textarea class="col-sm-12" id="Other" name="Other"
                                                              readonly="readonly"
                                                              style="border:0.5px solid #ffffff;overflow-y:scroll;height:240px;font-size:21px;
                                                              font-weight:200;line-height:25px;margin-top:15px">test</textarea>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>

                    <div style="display:inline">
                        <input id="submit" type="button" value="提交" class="btn btn-primary"
                               style="margin-right:18px;float:right"
                               data-toggle="modal" data-target="#dismiss<%=i%>">
                        <input id="edit<%=i%>" type="button" value="编辑" class="btn btn-default"
                               style="margin-right:18px;float:right"
                               onclick="edit_input(<%=i%>,'<%=competition.getCName()%>','<%=intro%>','test','test','test')">
                        <div class="modal fade" id="dismiss<%=i%>" tabindex="-1" role="dialog"
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
                                        <button type="button" class="btn btn-default"
                                                data-dismiss="modal">取消
                                        </button>
                                        <input id="pro_edit<%=i%>" type="button" class="btn btn-primary" value="确认"
                                               data-dismiss="modal"
                                               onclick="pro_edit(<%=i%>,<%=competition.getCID()%>)">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

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
