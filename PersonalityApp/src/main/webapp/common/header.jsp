<%@taglib prefix="s" uri="/struts-tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@ page import="model.UserModel"%> --%>
<%-- <%
UserModel userModel = (UserModel) session.getAttribute("userModel");
%> --%>
<div class="bg-light navbar-menu">
	<div class="col-md-10">
		<a class="navbar-logo" href="<%=request.getContextPath()%>/main">PersonalityApp<span class="dotcom">.co.jp</span></a>
		個人アプリサイト
	</div>
	<div class="col-md-2">
		<img alt="<%=session.getAttribute("username")%>" src="<%=request.getContextPath()%>/upload/user/<%=session.getAttribute("image_real_name")%>" class="avatar-user">
		<ul class="navbar-ul">
			<li><a class="navbar-a" href="#">友達</a></li>
			<li><a class="navbar-a" href="#">外部連携</a></li>
		</ul>
	</div>
</div>
<div class="sidebar">
	<a id="a_main" class="active" href="javascript:open_sidebar('main')">ホーム</a>
	<a id="a_profile" href="javascript:open_sidebar('profile')">プロフィール</a>
	<a id="a_todo" href="javascript:open_sidebar('todo')">Todoアプリ</a>
	<a id="a_diary" href="javascript:open_sidebar('diary')">日記アプリ</a>
	<a id="a_logout" href="javascript:open_sidebar('logout')">ログアウト</a>
</div>
<script>
	$(document).ready(function() {
		$(".sidebar").find("a").removeClass("active");
		if (window.location.href.search("main") > -1) {
			$("#a_main").addClass("active");
		} else if (window.location.href.search("profile") > -1) {
			$("#a_profile").addClass("active");
		} else if (window.location.href.search("todo") > -1) {
			$("#a_todo").addClass("active");
		} else if (window.location.href.search("diary") > -1) {
			$("#a_diary").addClass("active");
		}
	});
	
	function open_sidebar(menu) {
		var link = "<%=request.getContextPath()%>/" + menu;
		window.location.href = link;
	}
</script>