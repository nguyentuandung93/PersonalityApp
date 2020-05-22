<%@taglib prefix="s" uri="/struts-tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ユーザー登録成功画面</title>
</head>
<body>
	<h2>ユーザー登録出来ました。</h2>
	<%-- <p>こちらは<a href="<%=request.getContextPath()%>login">ログイン画面に戻る</a></p> --%>
	<p>こちらは<s:a action="login" namespace="/">ログイン画面に戻る</s:a></p>
</body>
</html>