package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.UserModel;
import utils.DBConnection;

public class UserDAOImpl implements UserDAO {
	
	public UserModel selectUser(String username, String password) {
		UserModel userModel = new UserModel();
		String sql = "SELECT * FROM m_user WHERE username = ? and password = ? ";
		Connection connection = DBConnection.getConnection();
		try {
			PreparedStatement preparedStatement;
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, username);
			preparedStatement.setString(2, password);
//			System.out.println(preparedStatement);

			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				userModel.setId(rs.getInt("id"));
				userModel.setName(rs.getString("name"));
				userModel.setEmail(rs.getString("email"));
				userModel.setImage_real_name(rs.getString("image_real_name"));
				userModel.setImage_name(rs.getString("image_name"));
				userModel.setRegist_date(rs.getString("regist_date"));
				userModel.setUpdate_date(rs.getString("update_date"));
				userModel.setLast_login(rs.getString("last_login"));
				userModel.setThis_login(rs.getString("this_login"));
				userModel.setFacebook(rs.getString("facebook"));
				userModel.setTwitter(rs.getString("twitter"));
				userModel.setInstagram(rs.getString("instagram"));
				userModel.setIntroduction(rs.getString("introduction"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return userModel;
	}
	
	// ユーザー情報を取得
	public UserModel selectUser(UserModel userModel) {
		String sql = "SELECT * FROM m_user WHERE id = ?;";
		Connection connection = DBConnection.getConnection();
		try {
			PreparedStatement preparedStatement;
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, Integer.toString(userModel.getId()));
			System.out.println(preparedStatement);

			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				userModel.setId(rs.getInt("id"));
				userModel.setName(rs.getString("name"));
				userModel.setEmail(rs.getString("email"));
				userModel.setImage_real_name(rs.getString("image_real_name"));
				userModel.setImage_name(rs.getString("image_name"));
				userModel.setRegist_date(rs.getString("regist_date"));
				userModel.setUpdate_date(rs.getString("update_date"));
				userModel.setLast_login(rs.getString("last_login"));
				userModel.setThis_login(rs.getString("this_login"));
				userModel.setFacebook(rs.getString("facebook"));
				userModel.setTwitter(rs.getString("twitter"));
				userModel.setInstagram(rs.getString("instagram"));
				userModel.setIntroduction(rs.getString("introduction"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return userModel;
	}
	
	public int updateUserLogin(UserModel userModel) {
		int result = 0;
		String sql = "UPDATE m_user SET last_login = ?, this_login = ? WHERE id = ?;";
		Connection connection = DBConnection.getConnection();
		try {
			
			PreparedStatement preparedStatement;
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, userModel.getLast_login());
			preparedStatement.setString(2, userModel.getThis_login());
			preparedStatement.setString(3, Integer.toString(userModel.getId()));
			System.out.println(preparedStatement);

			result = preparedStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	// ユーザー情報を更新
	public int updateUserInfo(UserModel userModel) {
		int result = 0;
		String sql = "UPDATE m_user SET username = ?, password = ?, name = ?, email = ?, "
				+ "update_user_id = ?, update_date = ?, facebook = ?, twitter = ?, instagram = ?, introduction = ?"
				+ "WHERE id = ?;";
		Connection connection = DBConnection.getConnection();
		try {
			
			PreparedStatement preparedStatement;
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, userModel.getUsername());
			preparedStatement.setString(2, userModel.getPassword());
			preparedStatement.setString(3, userModel.getName());
			preparedStatement.setString(4, userModel.getEmail());
			preparedStatement.setString(5, userModel.getUpdate_user_id());
			preparedStatement.setString(6, userModel.getUpdate_date());
			preparedStatement.setString(7, userModel.getFacebook());
			preparedStatement.setString(8, userModel.getTwitter());
			preparedStatement.setString(9, userModel.getInstagram());
			preparedStatement.setString(10, userModel.getIntroduction());
			preparedStatement.setString(11, Integer.toString(userModel.getId()));
			System.out.println(preparedStatement);

			result = preparedStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
}
