package dao;

import java.util.List;

import model.DiaryModel;

public interface DiaryDAO {
	// 日記リストを取得
	List<DiaryModel> listDiary(int user_id);
	// 日記を追加
	int createDiary(DiaryModel diaryModel);
	// 日記の詳細情報を取得
	DiaryModel selectDiary(DiaryModel diaryModel);
	// 日記を編集
	int updateDiary(DiaryModel diaryModel);
	// 日記を削除
	int deleteDiary(DiaryModel diaryModel);
}
