<%@taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/common.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/user.css">
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
		<div class="col-lg-12 order-lg-12">
			<ul class="nav nav-tabs col-lg-12 order-lg-12" id="tab_list">
                <li class="nav-item">
                    <a href="javascript:open_tab('profile')" id="profile_a" class="nav-link active">プロフィール</a>
                </li>
                <li class="nav-item">
                    <a href="javascript:open_tab('edit')" id="edit_a" class="nav-link">プロフィールを編集</a>
                </li>
                <li class="nav-item">
                    <a href="javascript:open_tab('info')" id="info_a" class="nav-link">お知らせ</a>
                </li>
                <li class="nav-item">
                    <a href="javascript:open_tab('activity')" id="activity_a" class="nav-link">アクティビティ</a>
                </li>
            </ul>
		</div>
           <div class="main-content row my-2">
           	<div class="col-md-2 col-lg-2 text-center">
	            <img src="<%=request.getContextPath()%>/upload/user/${userModel.getImage_real_name()}" class="mx-auto img-fluid img-circle d-block" alt="avatar">
				<a href="javascript:edit_image()" class="button edit-image d-none" id="edit_image">画像を変更<i class="far fa-edit"></i></a>
				<div class="custom-file d-none" id="custom_image">
				  <input type="file" class="custom-file-input" id="customFile" name="custom[file][]" multiple>
				  <label class="custom-file-label" for="customFile" data-browse="参照"></label>
				</div>
	        </div>
            <div class="col-md-10 col-lg-10 tab-content py-4" id="tab_content">
                <div class="tab-pane row active" id="profile">
                    <div class="row">
                        <div class="col-md-6">
                        	<h2>${userModel.getUsername()}</h2>
                        	<h6>自己紹介</h6>
                            <%-- <p><% if (userModel.getIntroduction() != null) { %><%=userModel.getIntroduction()%><% }%></p> --%>
                           	<p>${userModel.getIntroduction()}</p>
                           </div>
                        <div class="col-md-6">
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
                </div><!-- profile tab -->
                <div class="tab-pane" id="edit">
                <%-- <% 
                String[] nameArr = {"username", "password", "re_password", "name", "email", "facebook", "twitter", "instagram", "introduction"};
                String[] realNameArr = {"ユーザー名", "パスワード", "パスワード確認", "名前", "メール", "フェイスブック", "ツイッター", "インスタグラム", "自己紹介"};
                String[] valueArr = {"" + ${userModel.getUsername()}, userModel.getPassword(), userModel.getPassword(), userModel.getName(), userModel.getEmail(), userModel.getFacebook(), userModel.getTwitter(), userModel.getInstagram(), userModel.getIntroduction()}; 
                %> --%>
                    <%-- <form id="frm_user_edit" name="frm_user_edit" method="post">
                    	<% int i = 0; for (i = 0; i < nameArr.length; i++) { %>
                   		<div class="form-group row">
                            <label class="col-lg-3 col-form-label form-control-label"><%=realNameArr[i]%></label>
                            <div class="col-lg-9">
                            	<% if (nameArr[i] != "introduction") { %>
                                <input class="form-control" id="<%=nameArr[i]%>" name="<%=nameArr[i]%>" <% if (nameArr[i] == "password" || nameArr[i] == "re_password"){ %>type="password"<% } else { %>type="text"<% } %> 
                                <% if (valueArr[i] != null) { %>value="<%=valueArr[i]%>"<% } %>>
                                <% } else { %>
                                <textarea class="form-control" id="<%=nameArr[i]%>" name="<%=nameArr[i]%>"><% if (valueArr[i] != null) { %><%=valueArr[i]%><% } %></textarea>
                                <% } %>
                            </div>
                        </div>
                    	<% } %>
                    	<input type="hidden" name="user_id" value="${userModel.getId()}"/>
                        <div class="form-group row">
                            <label class="col-lg-3 col-form-label form-control-label"></label>
                            <div class="col-lg-9">
                                <a href="#" type="button" class="btn btn-secondary">キャンセル</a>
                                <a href="javascript:user_save()" type="button" class="btn btn-primary">保存</a>
                            </div>
                        </div>
                    </form> --%>
                </div><!-- edit tab -->
                <div class="tab-pane" id="info">お知らせ
                    <div class="alert alert-info alert-dismissable">
                        <a class="panel-close close" data-dismiss="alert">×</a> This is an <strong>.alert</strong>. Use this to show important messages to the user.
                    </div>
                    <table class="table table-hover table-striped">
                        <tbody>                                    
                            <tr>
                                <td>
                                   <span class="float-right font-weight-bold">3 hrs ago</span> Here is your a link to the latest summary report from the..
                                </td>
                            </tr>
                            <tr>
                                <td>
                                   <span class="float-right font-weight-bold">Yesterday</span> There has been a request on your account since that was..
                                </td>
                            </tr>
                            <tr>
                                <td>
                                   <span class="float-right font-weight-bold">9/10</span> Porttitor vitae ultrices quis, dapibus id dolor. Morbi venenatis lacinia rhoncus. 
                                </td>
                            </tr>
                            <tr>
                                <td>
                                   <span class="float-right font-weight-bold">9/4</span> Vestibulum tincidunt ullamcorper eros eget luctus. 
                                </td>
                            </tr>
                            <tr>
                                <td>
                                   <span class="float-right font-weight-bold">9/4</span> Maxamillion ais the fix for tibulum tincidunt ullamcorper eros. 
                                </td>
                            </tr>
                        </tbody> 
                    </table>
                </div>
                <div class="tab-pane" id="activity">アクティビティ
                   	<div class="col-md-12">
                           <h5 class="mt-2"><span class="fa fa-clock-o ion-clock float-right"></span>活動履歴</h5>
                           <table class="table table-sm table-hover table-striped">
                               <tbody>                                    
                                   <tr>
                                       <td>
                                           <strong>Abby</strong> joined ACME Project Team in <strong>`Collaboration`</strong>
                                       </td>
                                   </tr>
                                   <tr>
                                       <td>
                                           <strong>Gary</strong> deleted My Board1 in <strong>`Discussions`</strong>
                                       </td>
                                   </tr>
                                   <tr>
                                       <td>
                                           <strong>Kensington</strong> deleted MyBoard3 in <strong>`Discussions`</strong>
                                       </td>
                                   </tr>
                                   <tr>
                                       <td>
                                           <strong>John</strong> deleted My Board1 in <strong>`Discussions`</strong>
                                       </td>
                                   </tr>
                                   <tr>
                                       <td>
                                           <strong>Skell</strong> deleted his post Look at Why this is.. in <strong>`Discussions`</strong>
                                       </td>
                                   </tr>
                               </tbody>
                           </table>
                       </div>
                </div>
            </div>
        </div>
	</div>
	<%@ include file="../common/footer.jsp" %>
</body>
<script>
	
	
	$('.custom-file-input').on('change', handleFileSelect);
	function handleFileSelect(evt) {
	        $('#preview').remove();// 繰り返し実行時の処理
	        $(this).parents('.input-group').after('<div id="preview"></div>');

	    var files = evt.target.files;

	    for (var i = 0, f; f = files[i]; i++) {

	        var reader = new FileReader();

	        reader.onload = (function(theFile) {
	            return function(e) {
	                if (theFile.type.match('image.*')) {
	                    var $html = ['<div class="d-inline-block mr-1 mt-1"><img class="img-thumbnail" src="', e.target.result,'" title="', escape(theFile.name), '" style="height:100px;" /><div class="small text-muted text-center">', escape(theFile.name),'</div></div>'].join('');// 画像では画像のプレビューとファイル名の表示
	                } else {
	                    var $html = ['<div class="d-inline-block mr-1"><span class="small">', escape(theFile.name),'</span></div>'].join('');//画像以外はファイル名のみの表示
	                }

	                $('#preview').append($html);
	            };
	        })(f);

	        reader.readAsDataURL(f);
	    }
	    $(this).next('.custom-file-label').html(+ files.length + '個のファイルを選択しました');
	}
</script>
<script>
	function edit_image() {
		$("#edit_image").addClass('d-none');
		$("#custom_image").removeClass('d-none');
	}
	function user_save() {
		if (input_check() == 0) {
			$.ajax({
		      type: "POST",
		      url: "<%=request.getContextPath()%>/user",
		      data: $("#frm_user_edit").serialize(),
		      success: function (ret) {
		        if (ret == true) {
		        	alert("ユーザー情報を更新しました。");
		        	window.location.href = "<%=request.getContextPath()%>/user";
		        } else {
		        	alert("ユーザー情報が更新できませんでした");
		        }
		      },
		      error: function (e) {
		        alert('エラーが発生しました。');
		      }
		    })
		}
	}
	function input_check() {
		var err_flg = 0;
		var username = $("#username").val();
		var password = $("#password").val();
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
	
	function open_tab(tab_name) {
		$("#tab_list").find('li > a').removeClass('active');
		$("#" + tab_name + "_a").addClass('active');
		$("#tab_content").find('.tab-pane').removeClass('active');
		$("#" + tab_name).addClass('active');
		if (tab_name == 'edit') {
			$("#edit_image").addClass('d-none');
			$("#custom_image").removeClass('d-none');
		} else {
			$("#edit_image").removeClass('d-none');
			$("#custom_image").addClass('d-none');
		}
	}
</script>
</html>