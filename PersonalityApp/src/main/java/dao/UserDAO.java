package dao;

import model.UserModel;

public interface UserDAO {
	// ユーザー情報を取得
	UserModel selectUser(String username, String password);
	// ユーザー情報を取得
	UserModel selectUser(UserModel userModel);
	// ユーザーログイン情報を更新
	int updateUserLogin(UserModel userModel);
	// ユーザー情報を更新
	int updateUserInfo(UserModel userModel);
}
