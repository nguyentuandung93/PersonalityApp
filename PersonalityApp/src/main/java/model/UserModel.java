package model;

import lombok.Data;

@Data
public class UserModel {
	private int id;
	private String username;
	private String password;
	private String name;
	private String email;
	private String image_real_name;
	private String image_name;
	private String regist_date;
	private int update_user_id;
	private String update_date;
	private String last_login;
	private String this_login;
	private String facebook;
	private String twitter;
	private String instagram;
	private String introduction;
	public UserModel() {
	}
}
