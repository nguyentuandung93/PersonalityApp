package dao;

import model.UserModel;

public interface UserDAO {
	// ユーザー情報を取得
	UserModel selectUser(String username, String password);
	// ユーザー情報を取得
	UserModel selectUser(UserModel userModel);
	// ユーザー情報を更新
	int updateUser(UserModel userModel);
	int updateUser(UserModel userModel, String image);
	// ユーザーログイン情報を更新
	int updateUserLogin(UserModel userModel);
}
