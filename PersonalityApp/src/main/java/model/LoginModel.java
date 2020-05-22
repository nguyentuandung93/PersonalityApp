package model;

import lombok.Data;

@Data
public class LoginModel {
	private String username;
	private String password;
	private String image_name;
	private String image_real_name;
	private String regist_date;
}
