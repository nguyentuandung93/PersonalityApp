<%@taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/common.css">

	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/diary.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/all.min.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/css/bootstrap-datepicker.min.css">
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/common.js"></script>
	
	<!-- Bootstrap-datepicker -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/js/bootstrap-datepicker.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/locales/bootstrap-datepicker.ja.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/all.min.js"></script>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="robots" content="noindex, nofollow"/>
	<title>日記編集</title>
</head>
<body>
	<%@ include file="../common/header.jsp" %>
	<div id="content">
		<div class="fm-center"><h2>日記編集フォーム</h2></div>
		<form id="frm_update" action="update" method="post">
		  <div class="form-group"><s:textfield name="diaryModel.title" class="form-control" label="タイトル"></s:textfield></div>
		  <div class="form-group"><s:textarea name="diaryModel.content" class="form-control" label="内容" oninput="auto_grow(this)"></s:textarea></div>
		  <div class="form-group"><s:textfield name="diaryModel.place" class="form-control" label="場所"></s:textfield></div>
		  <div class="form-group">
		  	<s:textfield name="diaryModel.emotion" type="hidden" label="感情"></s:textfield>
		  	<a href="javascript:select_emoji(0)" id="a_emoji_0" class="a_emoji"><i class="far fa-smile fa-2x" title="笑い"></i></a>
		  	<a href="javascript:select_emoji(1)" id="a_emoji_1" class="a_emoji"><i class="far fa-sad-cry fa-2x" title="悲しい"></i></a>
		  	<a href="javascript:select_emoji(2)" id="a_emoji_2" class="a_emoji"><i class="far fa-tired fa-2x" title="疲れた"></i></a>
		  	<a href="javascript:select_emoji(3)" id="a_emoji_3" class="a_emoji"><i class="far fa-angry fa-2x" title="怒り"></i></a>
		  </div>
		  <div class="form-group">
		  	<s:textfield name="diaryModel.save_date" class="datepicker" label="保存日" autocomplete="off"></s:textfield>
		  </div>
		  <s:textfield name="diaryModel.diary_id" type="hidden"></s:textfield>
		  <s:textfield name="diaryModel.user_id" type="hidden"></s:textfield>
		  <s:textfield name="diaryModel.regist_date" type="hidden"></s:textfield>
		  <a href="javascript:diary_update()" type="button" class="btn btn-primary">登録</a>
		</form>
	</div>
	<%@ include file="../common/footer.jsp" %>
</body>
<script type="text/javascript">
    $('.datepicker').datepicker({
    	format: "yyyy-mm-dd",
    	language: 'ja',
    	autoclose: true,
    	todayHighlight: true
    });
   	var far = ['<i class="far fa-smile fa-2x" title="笑い"></i>', '<i class="far fa-sad-cry fa-2x" title="悲しい"></i>', '<i class="far fa-tired fa-2x" title="疲れた"></i>', '<i class="far fa-angry fa-2x" title="怒り"></i>'];
   	var fas = ['<i class="fas fa-smile fa-2x" title="笑い"></i>', '<i class="fas fa-sad-cry fa-2x" title="悲しい"></i>', '<i class="fas fa-tired fa-2x" title="疲れた"></i>', '<i class="fas fa-angry fa-2x" title="怒り"></i>'];
    $(document).ready(function() {
    	var i = $("#diaryModel_emotion").val();
    	$("#a_emoji_" + i).addClass("check");
    	$("#a_emoji_" + i).html(fas[i]);
    });
    
    function select_emoji(i) {
    	if ($("#a_emoji_" + i).hasClass("check")) {
    		/* $("#a_emoji_" + i).html(far[i]);
    		$("#a_emoji_" + i).removeClass("check"); */
    	} else {
    		$("#a_emoji_" + i).addClass("check");
    		$("#a_emoji_" + i).html(fas[i]);
    		$("#diaryModel_emotion").val(i);
    		for (j = 0; j < 4; j++) {
    			if (j != i) {
    				$("#a_emoji_" + j).removeClass("check");
    				$("#a_emoji_" + j).html(far[j]);
    			}
    		}
    	}
    }
    function diary_update() {
    	if (input_check() == 0) {
    		$("#frm_update").submit();
    	}
    }
    
    function input_check() {
    	var err_flg = 0;
    	var title = $("#diaryModel_title").val();
    	var content = $("#diaryModel_content").val();
    	var place = $("#diaryModel_place").val();
    	var emoji = $("#diaryModel_emoji").val();
    	var save_date = $("#diaryModel_save_date").val();
    	if (title == '') {
    		alert("タイトルを入力してください");
    		err_flg++;
    		return err_flg;
    	}
    	if (content == '') {
    		alert("内容を入力してください");
    		err_flg++;
    		return err_flg;
    	}
    	if (place == '') {
    		alert("場所を入力してください");
    		err_flg++;
    		return err_flg;
    	}
    	if (emoji == '') {
    		alert("感情を選択してください");
    		err_flg++;
    		return err_flg;
    	}
    	if (save_date == '') {
    		alert("保存日を入力してください");
    		err_flg++;
    		return err_flg;
    	}
    	return err_flg;
    }
    
    function auto_grow(element) {
        element.style.height = "5px";
        element.style.height = (element.scrollHeight)+"px";
    }
</script>
</html>