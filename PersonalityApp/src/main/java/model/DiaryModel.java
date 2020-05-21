package model;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
public class DiaryModel {
	private int diary_id;
	private int user_id;
	private String title;
	private String content;
	private String save_date;
	private String place;
	private String emotion;
	private int del_flg;
	private String regist_date;
	private String update_date;
	
	public DiaryModel() {
	}
	
}
