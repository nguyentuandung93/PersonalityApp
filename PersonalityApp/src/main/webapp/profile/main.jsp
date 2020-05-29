<%@taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/common.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/profile.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/all.min.css">
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/all.min.js"></script>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="robots" content="noindex, nofollow"/>
	<title>プロフィール画面</title>
</head>
<body>
	<%@ include file="../common/header.jsp" %>
	<div id="content">
		<ul class="nav nav-tabs" id="tab_list">
		    <li class="nav-item">
		        <a href="javascript:open_tab('profile')" id="tab_profile" class="nav-link active">プロフィール</a>
		    </li>
		    <li class="nav-item">
		        <a href="javascript:open_tab('edit')" id="tab_edit" class="nav-link">プロフィールを編集</a>
		    </li>
		</ul><!-- tab_list -->
		<div class="main-content my-2">
			<div class="tab-pane active" id="profile">
				<div class="col-xs-12 col-sm-12 col-md-2 col-lg-2 float-left">
		            <img src="<%=request.getContextPath()%>/upload/user/${userModel.getImage_real_name()}" class="mx-auto img-fluid img-circle d-block" alt="avatar">
					<div class="custom-file d-none" id="custom_image">
					  <input type="file" class="custom-file-input" id="customFile" name="custom[file][]" multiple>
					  <label class="custom-file-label" for="customFile" data-browse="参照"></label>
					</div>
		        </div>
		        <div class="col-xs-12 col-sm-12 col-md-10 col-lg-10 tab-content py-4 float-right" id="tab_content">
	                <div class="col-xs-12 col-sm-12 col-md-6 float-left">
	                	<s:if test="%{#userModel.username != null}">
						<h6>ユーザー名：</h6>
	                	<p>${userModel.getUsername()}</p>
						</s:if>
	                	<h6>自己紹介</h6>
	                    <p style="white-space: pre-line">${userModel.getIntroduction()}</p>
	                   </div>
	                <div class="col-xs-12 col-sm-12 col-md-6 float-right">
	                	<h6>基本</h6>
	                	<div class="profile-user-info">
							<div class="profile-info-row">
								<div class="profile-info-name">名前</div>
								<div class="profile-info-value">
									<span>${userModel.getName()}</span>
								</div>
							</div>
							<div class="profile-info-row">
								<div class="profile-info-name">メール</div>
								<div class="profile-info-value">
									<span>${userModel.getEmail()}</span>
								</div>
							</div>
							<div class="profile-info-row">
								<div class="profile-info-name">登録期間</div>
								<div class="profile-info-value">
									<span>${userModel.getRegist_date()}</span>
								</div>
							</div>
							<div class="profile-info-row">
								<div class="profile-info-name">Last login</div>
								<div class="profile-info-value">
									<span>${userModel.getLast_login()}</span>
								</div>
							</div>
	                	</div>
	                    <h6>ウェブサイト</h6>
	                    <ul class="profile-web-row">
	                    	<li><a href="${userModel.getFacebook()}" class="web-row-a"><i class="fab fa-facebook-square"></i><span class="web-row-span">Facebook</span></a></li>
	                    	<li><a href="${userModel.getTwitter()}" class="web-row-a"><i class="fab fa-twitter-square"></i><span class="web-row-span">Twitter</span></a></li>
	                    	<li><a href="${userModel.getInstagram()}" class="web-row-a"><i class="fab fa-instagram-square"></i><span class="web-row-span">Instagram</span></a></li>
	                    </ul>
	                </div>
		        </div>
			</div><!-- profile -->
			<div class="tab-pane d-none" id="edit">
				<form id="frm_profile_edit" method="post" enctype="multipart/form-data">
					<div class="col-xs-12 col-sm-2 col-md-2 col-lg-2 float-left">
		            	<img src="<%=request.getContextPath()%>/upload/user/${userModel.getImage_real_name()}" class="mx-auto img-fluid img-circle d-block" alt="avatar">
				    	<s:file name="fileUpload" class="form-control" autocomplete="off" accept="image/*" label="アップロード画像"></s:file>
			        </div>
			        <div class="col-xs-12 col-sm-10 col-md-10 col-lg-10 float-right" id="tab_content">
	                	<div class="form-group">
	                		<s:textarea name="userModel.introduction" label="自己紹介" class="form-control" rows="8"></s:textarea>
	                   	</div>
                   </div>
	                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
	                	<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 float-left">
		                	<h6>基本</h6>
		                	<div class="profile-user-info">
								<div class="profile-info-row">
									<div class="profile-info-name">名前</div>
									<div class="profile-info-value"><s:textfield name="userModel.name" class="form-control"></s:textfield></div>
								</div>
								<div class="profile-info-row">
									<div class="profile-info-name">メール</div>
									<div class="profile-info-value"><s:textfield name="userModel.email" class="form-control"></s:textfield></div>
								</div>
								<div class="profile-info-row">
									<div class="profile-info-name">フェイスブック</div>
									<div class="profile-info-value"><s:textfield name="userModel.facebook" class="form-control"></s:textfield></div>
								</div>
								<div class="profile-info-row">
									<div class="profile-info-name">ツイッター</div>
									<div class="profile-info-value"><s:textfield name="userModel.twitter" class="form-control"></s:textfield></div>
								</div>
								<div class="profile-info-row">
									<div class="profile-info-name">インスタグラム</div>
									<div class="profile-info-value"><s:textfield name="userModel.instagram" class="form-control"></s:textfield></div>
								</div>
		                	</div>
	                	</div>
	                	<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 float-right">
		                    <h6>ログイン情報</h6>
		                    <div class="profile-info-row">
								<div class="profile-info-name">ユーザー名</div>
								<div class="profile-info-value"><s:textfield name="userModel.username" class="form-control"></s:textfield></div>
							</div>
							<div class="profile-info-row">
								<div class="profile-info-name">パスワード</div>
								<div class="profile-info-value"><s:textfield name="userModel.password" class="form-control" type="password"></s:textfield></div>
							</div>
							<div class="profile-info-row">
								<div class="profile-info-name">パスワード確認</div>
								<div class="profile-info-value"><s:textfield name="re_password" class="form-control" type="password"></s:textfield></div>
							</div>
							<div class="profile-info-row float-right">
								<a href="javascript:edit_profile()" type="button" class="btn btn-primary">保存</a>
							</div>
						</div>
	                </div>
	                <input type="hidden" name="userModel.id" id="userModel_id" value="${userModel.id}"/>
		        </form>
			</div><!-- profile -->
		</div>
	</div>
	<%@ include file="../common/footer.jsp" %>
</body>
<script>
	function open_tab(tab_name) {
		// tab list
		$(".nav-link").removeClass('active');
		$("#tab_" + tab_name).addClass('active');
		// tab content
		$(".tab-pane").removeClass('active');
		$(".tab-pane").addClass('d-none');
		$("#" + tab_name).addClass('active');
		$("#" + tab_name).removeClass('d-none');
	}
	function edit_profile() {
		if (input_check() == 0) {
			var file_data = $('#fileUpload').prop('files')[0];   
		    var form_data = new FormData();
		    form_data.append('fileUpload', file_data);
		    /* $("#frm_profile_edit").serialize() */
		    form_data.append('userModel.id', $("#userModel_id").val());
		    form_data.append('userModel.username', $("#userModel_username").val());
		    form_data.append('userModel.password', $("#userModel_password").val());
		    form_data.append('userModel.introduction', $("#userModel_introduction").val());
		    form_data.append('userModel.name', $("#userModel_name").val());
		    form_data.append('userModel.email', $("#userModel_email").val());
		    form_data.append('userModel.facebook', $("#userModel_facebook").val());
		    form_data.append('userModel.twitter', $("#userModel_twitter").val());
		    form_data.append('userModel.instagram', $("#userModel_instagram").val());
			$.ajax({
		      type: "POST",
		      contentType: false,
	          processData: false,
		      url: "profile_update",
		      dataType: 'json',
		      data: form_data,
		      success: function (ret) {
		        if (ret == "true") {
		        	alert("プロフィールを更新しました。");
		        	window.location.href = "<%=request.getContextPath()%>/profile";
		        } else {
		        	alert("更新できませんでした");
		        }
		      },
		      error: function (e) {
		        alert('エラーが発生しました。');
		      }
		    });
		}
	}
	function input_check() {
		var err_flg = 0;
		var username = $("#userModel_username").val();
		var password = $("#userModel_password").val();
		var re_password = $("#re_password").val();
		if (username == "") {
			alert("ユーザー名を入力してください");
			err_flg++;
			return err_flg;
		}
		if (password == "") {
			alert("パスワードを入力してください");
			err_flg++;
			return err_flg;
		}
		if (re_password == "") {
			alert("パスワード確認を入力してください");
			err_flg++;
			return err_flg;
		}
		if (password != re_password) {
			alert("パスワードとパスワード確認が一致していません");
			err_flg++;
			return err_flg;
		}
		return err_flg;
	}
</script>
</html>