<%@taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/diary.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/common.js"></script>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="robots" content="noindex, nofollow"/>
	<title>日記リスト</title>
</head>
<body>
	<div class="container">
		<h2>登録した日記リスト</h2>
		<a href="./add">日記を追加</a>
		<table class="table table-striped table-custom">
		  <thead>
		    <tr>
		      <th scope="col" style="width: 15%">タイトル</th>
		      <th scope="col" style="width: 60%">内容</th>
		      <th scope="col" style="width: 10%">保存日</th>
		      <th scope="col" style="width: 15%">動作</th>
		    </tr>
		  </thead>
		  <tbody>
		  	<c:forEach var="diary" items="${diaryList}">
		    <tr>
		      <td>${diary.title}</td>
		      <td>${diary.content}</td>
		      <td>${diary.save_date}</td>
		      <td>
		      	<a href="javascript:edit_diary(${diary.diary_id})" type="button" class="btn btn-info">編集</a>
		      	<a href="javascript:delete_diary(${diary.diary_id})" type="button" class="btn btn-danger">削除</a>
	      	</td>
		    </tr>
		    </c:forEach>
		  </tbody>
		</table>
		<form id="frm_edit_delete" method="post">
			<input id="diaryModel_diary_id" name="diaryModel.diary_id" type="hidden"/>
		</form>
	</div>
</body>
<script>
	function edit_diary(diary_id) {
		$("#diaryModel_diary_id").val(diary_id);
		$("#frm_edit_delete").attr("method", "post");
		$("#frm_edit_delete").attr("action", "edit");
		$("#frm_edit_delete").submit();
	}
	function delete_diary(diary_id) {
		if (confirm("日記を削除してもよろしいでしょうか？")) {
			$("#diaryModel_diary_id").val(diary_id);
			$("#frm_edit_delete").attr("method", "post");
			$("#frm_edit_delete").attr("action", "delete");
			$("#frm_edit_delete").submit();
		}
	}
</script>
</html>