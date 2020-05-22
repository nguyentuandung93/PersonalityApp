package dao;

import model.LoginModel;
import model.UserModel;

public interface LoginDAO {
	// ユーザーIDを取得
	boolean checkUser(LoginModel loginModel);
	// ユーザー名存在をチェック
	boolean issetUsername(String userName);
	//　ユーザーを登録
	int registUser(LoginModel loginModel);
//	// ユーザーログイン情報を更新
//	int updateUserLogin(UserModel userModel);
//	// ユーザー情報を取得
//	UserModel getUserInfo(UserModel userModel);
//	// ユーザー情報を更新
//	int updateUserInfo(UserModel userModel);
}
