<%@taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="org.apache.commons.fileupload.RequestContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/common.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/login.css">
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/common.js"></script>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="robots" content="noindex, nofollow"/>
	<title>ログイン画面</title>
</head>
<body>
	<form class="form-signin" id="frm_login" action="login" namespace="/" method="post">
      <div class="text-center mb-4">
        <img class="mb-4" src="" alt="" width="72" height="72">
        <h1 class="h3 mb-3 font-weight-normal">ログイン</h1>
        <p>個人アプリへようこそ</p>
      </div>
      <div class="form-group">
      	<s:textfield name="loginModel.username" class="form-control" label="ユーザー名" autocomplete="off"></s:textfield>
      </div>
      <div class="form-group">
      	<s:password name="loginModel.password" class="form-control" label="パスワード" autocomplete="off"></s:password>
      </div>
      <div class="checkbox mb-3">
        <label><input type="checkbox" value="remember-me">ログイン情報を保存</label>
      </div>
      <a href="javascript:login()" type="button" class="btn btn-lg btn-primary btn-block">ログイン</a>
      <p class="mt-4 mb-3 text-muted text-center">登録してない方はこちらから<a href="javascript:register_form()">ユーザー登録</a></p>
    </form>
	<%@ include file="../common/footer.jsp" %>
</body>
<script>
	$(document).ready(function() {
		$("#loginModel_username").focus();
	});
	function login() {
		var username = $("#loginModel_username").val();
		var password = $("#loginModel_password").val();
		if (username == '') {
			alert('ユーザー名を入力してください。');
		} else {
			if (password == '') {
				alert('パスワードを入力してください。');
			} else {
				$("#frm_login").submit();
			}
		}
	}
	
	function register_form() {
		window.location.replace("<%=request.getContextPath()%>/register");
	}
</script>
</html>