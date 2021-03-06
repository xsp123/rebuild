<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.rebuild.server.service.bizz.privileges.User"%>
<%@ page import="com.rebuild.server.Application"%>
<%@ page import="cn.devezhao.bizz.security.member.Team" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/_include/Head.jsp"%>
<link rel="stylesheet" type="text/css" href="${baseUrl}/assets/lib/widget/cropper.min.css">
<title>个人设置</title>
<style type="text/css">
.avatar-wrap {
	height: 256px;
	padding-top: 55px;
	background-color: #eee;
	border-radius: 4px;
	margin-bottom: 10px;
    margin-top: 10px;
}
.avatar {
	position: relative;
	width: 140px;
	height: 140px;
	line-height: 1;
	font-size: 0;
	background-color: #ccc;
	border-radius: 50%;
	overflow: hidden;
	margin: 0 auto;
}
.avatar > img {
	width: 100%;
}
.avatar > label {
	position: absolute;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.4);
	display: none;
	font-size: 14px;
	text-align: center;
	padding-top: 46px;
	color: #fff !important;
	line-height: 1.5
}
.avatar:hover > label {
	display: block;
	cursor: pointer;
}
.avatar > label i.zmdi {
	font-size: 28px
}
.avatar > label input {
	display: none;
}
.form-group.row {
    margin-left: 5px;
    margin-right: 5px;
    padding: 8px 0;
    border-bottom: 1px dotted #e6e9f0;
}
.split-span>span+span::before {
    content: ' / ';
    color: #aaa;
}
#logs thead th {
    font-weight: normal;
    color: #777;
}
</style>
</head>
<body>
<% final User theUser = Application.getUserStore().getUser(AppUtils.getRequestUser(request)); %>
<div class="rb-wrapper rb-fixed-sidebar rb-collapsible-sidebar rb-collapsible-sidebar-hide-logo rb-offcanvas-menu">
<jsp:include page="/_include/NavTop.jsp">
    <jsp:param value="个人设置" name="pageTitle"/>
</jsp:include>
<jsp:include page="/_include/NavLeft.jsp">
    <jsp:param value="user-account" name="activeNav"/>
</jsp:include>
<div class="rb-content">
    <div class="main-content container">
        <div class="card">
            <div class="card-body">
                <div class="tab-container">
                    <ul class="nav nav-tabs">
                        <li class="nav-item"><a class="nav-link active" href="#base" data-toggle="tab">个人信息</a></li>
                        <li class="nav-item"><a class="nav-link" href="#secure" data-toggle="tab">安全设置</a></li>
                        <li class="nav-item"><a class="nav-link" href="#logs" data-toggle="tab">登录日志</a></li>
                    </ul>
                    <div class="tab-content m-0">
                        <div class="tab-pane active" id="base">
                            <div class="row">
                                <div class="col-md-4 col-12">
                                    <div class="avatar-wrap">
                                    <div class="avatar text-center">
                                        <img alt="Avatar" id="avatar-img" src="${baseUrl}/account/user-avatar?w=200">
                                        <label>
                                            <i class="zmdi zmdi-camera"></i><br>更改头像
                                            <input type="file" id="avatar-input" accept="image/png,image/jpeg,image/gif" data-temp="true">
                                        </label>
                                    </div>
                                    </div>
                                </div>
                                <div class="col-md-8 col-12">
                                    <form>
                                        <div class="form-group row">
                                            <label class="col-sm-4 col-form-label text-left">账号 (登录名)</label>
                                            <div class="col-sm-8">
                                                <div class="form-control-plaintext"><%=theUser.getName()%></div>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-4 col-form-label text-left">所在部门</label>
                                            <div class="col-sm-8">
                                                <div class="form-control-plaintext">
                                                    <%=theUser.getOwningBizUnit() == null ? "<em>未设置</em>" : theUser.getOwningBizUnit().getName()%>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-4 col-form-label text-left">系统角色</label>
                                            <div class="col-sm-8">
                                                <div class="form-control-plaintext">
                                                    <%=theUser.getOwningRole() == null ? "<em>未设置</em>" : theUser.getOwningRole().getName()%>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-4 col-form-label text-left">加入团队</label>
                                            <div class="col-sm-8">
                                                <div class="form-control-plaintext split-span">
                                                    <%
                                                    for (Team team : theUser.getOwningTeams()) {
                                                        out.print("<span>" + team.getName() + "</span>");
                                                    }
                                                    %>
                                                    <%=theUser.getOwningTeams().isEmpty() ? "<em>暂未加入任何团队</em>" : ""%>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-4 col-form-label text-left">姓名</label>
                                            <div class="col-sm-8">
                                                <input class="form-control form-control-sm" type="text" id="fullName" value="<%=theUser.getFullName()%>" data-o="<%=theUser.getFullName()%>">
                                            </div>
                                        </div>
                                        <div class="form-group row border-none">
                                            <div class="col-sm-8 offset-sm-4">
                                                <button class="btn btn-primary J_save" type="button">确定</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane" id="secure">
                            <form>
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label text-left">更改邮箱</label>
                                    <div class="col-sm-7 pl-0">
                                        <div class="form-control-plaintext text-muted J_email-account"><%=theUser.getEmail() == null ? "你当前未绑定邮箱" : ("当前绑定邮箱 <b>" + theUser.getEmail() + "</b>")%></div>
                                    </div>
                                    <div class="col-sm-3 text-right">
                                        <button class="btn btn-primary bordered J_email" type="button">更改</button>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label text-left">更改密码</label>
                                    <div class="col-sm-7 pl-0">
                                        <div class="form-control-plaintext text-muted">建议90天更改一次密码</div>
                                    </div>
                                    <div class="col-sm-3 text-right">
                                        <button class="btn btn-primary bordered J_passwd" type="button">更改</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="tab-pane" id="logs">
                            <table class="table table-fixed">
                                <thead>
                                    <tr>
                                        <th width="50">#</th>
                                        <th>登录时间</th>
                                        <th>客户端</th>
                                        <th>IP地址</th>
                                        <th>退出时间</th>
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
<%@ include file="/_include/Foot.jsp"%>
<script>
window.__PageConfig = { userid: '<%=theUser.getId()%>' }
</script>
<script src="${baseUrl}/assets/lib/widget/cropper.min.js"></script>
<script src="${baseUrl}/assets/js/user-settings.jsx" type="text/babel"></script>
</body>
</html>
