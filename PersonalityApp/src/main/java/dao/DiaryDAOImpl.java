package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.DiaryModel;
import utils.DBConnection;

public class DiaryDAOImpl implements DiaryDAO {

	public List<DiaryModel> listDiary(int user_id) {
		List<DiaryModel> diaryList = new ArrayList<DiaryModel>();
		String sql = "SELECT * FROM t_diary WHERE user_id = ? AND del_flg = 0 ORDER BY save_date DESC;";
		Connection connection = DBConnection.getConnection();
		try {
			PreparedStatement preparedStatement;
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, Integer.toString(user_id));
//			System.out.println(preparedStatement);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				DiaryModel diaryModel = new DiaryModel();
				diaryModel.setDiary_id(rs.getInt("diary_id"));
				diaryModel.setUser_id(rs.getInt("user_id"));
				diaryModel.setTitle(rs.getString("title"));
				diaryModel.setContent(rs.getString("content"));
				diaryModel.setSave_date(rs.getString("save_date"));
				diaryModel.setPlace(rs.getString("place"));
				diaryModel.setEmotion(rs.getString("emotion"));
				diaryModel.setDel_flg(rs.getInt("del_flg"));
				diaryModel.setRegist_date(rs.getString("regist_date"));
				diaryModel.setUpdate_date(rs.getString("update_date"));
				diaryList.add(diaryModel);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return diaryList;
	}

	public int createDiary(DiaryModel diaryModel) {
		int result = 0;
		String sql = "INSERT INTO t_diary(user_id, title, content, save_date, place, emotion, regist_date) VALUES (?, ?, ?, ?, ?, ?, ?);";
		Connection connection = DBConnection.getConnection();
		
		try {
			PreparedStatement preparedStatement;
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, diaryModel.getUser_id());
			preparedStatement.setString(2, diaryModel.getTitle());
			preparedStatement.setString(3, diaryModel.getContent());
			preparedStatement.setString(4, diaryModel.getSave_date());
			preparedStatement.setString(5, diaryModel.getPlace());
			preparedStatement.setString(6, diaryModel.getEmotion());
			preparedStatement.setString(7, diaryModel.getRegist_date());

//			System.out.println(preparedStatement);
			result = preparedStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public DiaryModel selectDiary(DiaryModel diaryModel) {
		String sql = "SELECT * FROM t_diary WHERE diary_id = ?";
		Connection connection = DBConnection.getConnection();
		try {
			PreparedStatement preparedStatement;
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, Integer.toString(diaryModel.getDiary_id()));
//			System.out.println(preparedStatement);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				diaryModel.setUser_id(rs.getInt("user_id"));
				diaryModel.setTitle(rs.getString("title"));
				diaryModel.setContent(rs.getString("content"));
				diaryModel.setSave_date(rs.getString("save_date"));
				diaryModel.setPlace(rs.getString("place"));
				diaryModel.setEmotion(rs.getString("emotion"));
				diaryModel.setDel_flg(rs.getInt("del_flg"));
				diaryModel.setRegist_date(rs.getString("regist_date"));
				diaryModel.setUpdate_date(rs.getString("update_date"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return diaryModel;
	}
	
	public int updateDiary(DiaryModel diaryModel) {
		int result = 0;
		String sql = "UPDATE t_diary SET title = ?, content = ?, save_date = ?, place = ?, emotion = ?, update_date = ? WHERE diary_id = ?;";
		Connection connection = DBConnection.getConnection();
		try {
			
			PreparedStatement preparedStatement;
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, diaryModel.getTitle());
			preparedStatement.setString(2, diaryModel.getContent());
			preparedStatement.setString(3, diaryModel.getSave_date());
			preparedStatement.setString(4, diaryModel.getPlace());
			preparedStatement.setString(5, diaryModel.getEmotion());
			preparedStatement.setString(6, diaryModel.getUpdate_date());
			preparedStatement.setString(7, Integer.toString(diaryModel.getDiary_id()));
//			System.out.println(preparedStatement);

			result = preparedStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	public int deleteDiary(DiaryModel diaryModel) {
		int result = 0;
		String sql = "UPDATE t_diary SET del_flg = 1 WHERE diary_id = ?;";
		Connection connection = DBConnection.getConnection();
		try {
			
			PreparedStatement preparedStatement;
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, Integer.toString(diaryModel.getDiary_id()));
//			System.out.println(preparedStatement);

			result = preparedStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
}
