package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.LoginModel;
import model.UserModel;
import utils.DBConnection;

public class LoginDAOImpl implements LoginDAO {
	public boolean checkUser(LoginModel loginModel) {
		boolean status = false;
		String sql = "SELECT * FROM m_user WHERE username = ? and password = ? ";
		Connection connection = DBConnection.getConnection();
		try {
			PreparedStatement preparedStatement;
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, loginModel.getUsername());
			preparedStatement.setString(2, loginModel.getPassword());
//			System.out.println(preparedStatement);

			ResultSet rs = preparedStatement.executeQuery();
			if (rs.next()) {
				status = true;
			} else {
				status = false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return status;
	}
	
	public boolean issetUsername(String userName) {
		boolean status = false;
		String sql = "SELECT * from m_user where username = ?";
		Connection connection = DBConnection.getConnection();
		try {
			PreparedStatement preparedStatement;
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, userName);
//			System.out.println(preparedStatement);

			ResultSet rs = preparedStatement.executeQuery();
			status = rs.next();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return status;
	}
	
	public int registUser(LoginModel loginModel) {
		int result = 0;
		String sql = "INSERT INTO m_user(username, password, image_real_name, image_name, regist_date) VALUES (?, ?, ?, ?, ?);";
		Connection connection = DBConnection.getConnection();
		
		try {
			PreparedStatement preparedStatement;
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, loginModel.getUsername());
			preparedStatement.setString(2, loginModel.getPassword());
			preparedStatement.setString(3, loginModel.getImage_real_name());
			preparedStatement.setString(4, loginModel.getImage_name());
			preparedStatement.setString(5, loginModel.getRegist_date());

//			System.out.println(preparedStatement);
			result = preparedStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
}
