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
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="robots" content="noindex, nofollow"/>
	<title>ユーザー登録画面</title>
</head>
<body>
	<form class="form-signin" id="frm_register" action="<%=request.getContextPath()%>/register" method="post" enctype="multipart/form-data">
      <div class="text-center mb-4">
        <img class="mb-4" src="" alt="" width="72" height="72">
        <h1 class="h3 mb-3 font-weight-normal">ユーザー登録</h1>
        <p>個人アプリを始めましょう!</p>
      </div>
      <div class="form-group">
      	<s:textfield name="loginModel.username" class="form-control" label="ユーザー名" autocomplete="off"></s:textfield>
      </div>
      <div class="form-group">
        <s:password name="loginModel.password" class="form-control" label="パスワード" autocomplete="off"></s:password>
      </div>
      <div class="form-group">
      	<s:password name="re_password" class="form-control" label="パスワード確認" autocomplete="off"></s:password>
      </div>
      <div class="form-group">
      	<s:file name="fileUpload" class="form-control" autocomplete="off" accept="image/*" label="アップロード画像"></s:file>
        <!-- <label for="image_file">アップロード画像</label>
        <input type="file" id="image_file" name="image_file" class="form-control" autocomplete="off" accept="image/*"> -->
      </div>
      <a href="javascript:register()" type="button" class="btn btn-lg btn-primary btn-block">登録</a>
      <p class="mt-4 mb-3 text-muted text-center">既に登録した方はこちらから<a href="javascript:login_form()">ログイン</a></p>
    </form>
	<%@ include file="../common/footer.jsp" %>
</body>
<script>
	$(document).ready(function() {
		$("#loginModel_username").on('blur', function() {
			var val = $("#loginModel_username").val();
			val = val.replace(/[Ａ-Ｚａ-ｚ０-９]/g,function(s){return String.fromCharCode(s.charCodeAt(0)-0xFEE0)});
			val = val.replace(/[ぁ-んァ-ンｧ-ﾝﾞﾟ一-龥]/g, '');
			val = $.trim(val);
			$("#loginModel_username").val(val);
		});
		$("#loginModel_password").on('blur', function() {
			var val = $("#loginModel_password").val();
			val = val.replace(/[Ａ-Ｚａ-ｚ０-９]/g,function(s){return String.fromCharCode(s.charCodeAt(0)-0xFEE0)});
			val = val.replace(/[ぁ-んァ-ンｧ-ﾝﾞﾟ一-龥]/g, '');
			val = $.trim(val);
			$("#password").val(val);
		});
		$("#re_password").on('blur', function() {
			var val = $("#re_password").val();
			val = val.replace(/[Ａ-Ｚａ-ｚ０-９]/g,function(s){return String.fromCharCode(s.charCodeAt(0)-0xFEE0)});
			val = val.replace(/[ぁ-んァ-ンｧ-ﾝﾞﾟ一-龥]/g, '');
			val = $.trim(val);
			$("#re_password").val(val);
		});
	});
	function register() {
		if (check_input() == 0) {
			$("#frm_register").submit();
		}
	}
	
	function check_input() {
		var err_flg = 0;
		var username = $("#loginModel_username").val();
		var password = $("#loginModel_password").val();
		var re_password = $("#re_password").val();
		var image_file = $("#fileUpload").val();
		if (username == '') {
			alert('ユーザー名を入力してください。');
			err_flg++;
			return err_flg;
		}
		if (password == '') {
			alert('パスワードを入力してください。');
			err_flg++;
			return err_flg;
		}
		if (password.length < 6) {
			alert('パスワードの６文字以上を入力してください。');
			err_flg++;
			return err_flg;
		}
		if (re_password != password) {
			alert('パスワード確認を再度に入力してください。');
			err_flg++;
			return err_flg;
		}
		if (image_file == '') {
			alert('画像ファイルをインポートしてください。');
			err_flg++;
			return err_flg;
		}
		return err_flg;
	}
	
	function login_form() {
		window.location.replace("<%=request.getContextPath()%>/");
	}
</script>
</html>