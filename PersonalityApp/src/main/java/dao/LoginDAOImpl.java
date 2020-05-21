package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.LoginModel;
import utils.DBConnection;

public class LoginDAOImpl implements LoginDAO {
	public boolean checkUser(LoginModel loginModel) {
		boolean status = false;
		String sql = "SELECT * FROM m_user WHERE username = ? and password = ? ";
		Connection connection = DBConnection.getConnection();
		System.out.println(connection);
		try {
			PreparedStatement preparedStatement;
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, loginModel.getUsername());
			preparedStatement.setString(2, loginModel.getPassword());
			System.out.println(preparedStatement);

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
}
