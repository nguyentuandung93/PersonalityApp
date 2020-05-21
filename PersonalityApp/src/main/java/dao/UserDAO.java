package dao;

import model.UserModel;

public interface UserDAO {
	// ユーザーIDを取得
	int getUserId(UserModel userModel);
	// ユーザー名存在をチェック
	boolean issetUser(String userName);
	//
	int addUser(UserModel userModel);
	// ユーザーログイン情報を更新
	int updateUserLogin(UserModel userModel);
	// ユーザー情報を取得
	UserModel getUserInfo(UserModel userModel);
	// ユーザー情報を更新
	int updateUserInfo(UserModel userModel);
}
