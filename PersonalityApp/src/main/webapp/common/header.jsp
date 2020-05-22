<%@taglib prefix="s" uri="/struts-tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@ page import="model.UserModel"%> --%>
<%-- <%
UserModel userModel = (UserModel) session.getAttribute("userModel");
%> --%>
<div class="row navbar-expand-lg navbar-light bg-light navbar-menu">
	<a class="navbar-logo" href="<%=request.getContextPath()%>/main">PersonalityApp<span
		class="dotcom">.co.jp</span></a>
	<div class="col-lg-7">個人アプリサイト</div>
	<ul class="navbar-ul">
		<li><a class="navbar-a" href="<%=request.getContextPath()%>/profile">プロフィール<span class="sr-only">(current)</span></a></li>
		<li><a class="navbar-a" href="<%=request.getContextPath()%>/friend">友達</a></li>
		<li><a class="navbar-a" href="<%=request.getContextPath()%>/link">外部連携</a></li>
	</ul>
	<img alt="<%=session.getAttribute("username")%>"
		src="C:\Users\グエン トゥアン ズン\Desktop\mywork\eclipse-workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\PersonalityApp\upload\user/<%=session.getAttribute("image_real_name") %>"
		class="avatar-user">
</div>
<div class="sidebar">
	<a class="active" href="<%=request.getContextPath()%>/main">ホーム</a>
	<a href="<%=request.getContextPath()%>/todo">Todoアプリ</a>
	<a href="<%=request.getContextPath()%>/diary">日記アプリ</a>
	<a href="<%=request.getContextPath()%>/logout">ログアウト</a>
</div>