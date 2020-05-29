package controller;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;
import dao.LoginDAO;
import dao.LoginDAOImpl;
import dao.UserDAO;
import dao.UserDAOImpl;
import model.LoginModel;
import model.UserModel;

public class LoginAction extends ActionSupport implements SessionAware {
	private static final long serialVersionUID = 1L;
	private LoginDAO loginDAO = new LoginDAOImpl();
	private LoginModel loginModel = new LoginModel();
	private UserDAO userDAO = new UserDAOImpl();
	private UserModel userModel = new UserModel();

	private Map<String, Object> session;
	private String ret = "false";

	public String login() {
		session = getSession();
		String login_flg = (String) session.get("login_flg");
		if (session != null && login_flg != null && login_flg == "1") {
			int user_id = (Integer) session.get("user_id");
			userModel.setId(user_id);
			userModel = userDAO.selectUser(userModel);
			ret = "true";
			return SUCCESS;
		}
		return INPUT;
	}
	public String check_login() {
		if (loginDAO.checkUser(loginModel) == true) {
			userModel = userDAO.selectUser(loginModel.getUsername(), loginModel.getPassword());
			session.put("user_id", userModel.getId());
			session.put("username", loginModel.getUsername());
			session.put("image_real_name", userModel.getImage_real_name());
        	session.put("login_flg", "1");
        	ret = "true";
		}
		return SUCCESS;
	}
	
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
	public Map<String, Object> getSession() {
		return session;
	}
	public LoginDAO getLoginDAO() {
		return loginDAO;
	}

	public void setLoginDAO(LoginDAO loginDAO) {
		this.loginDAO = loginDAO;
	}

	public LoginModel getLoginModel() {
		return loginModel;
	}

	public void setLoginModel(LoginModel loginModel) {
		this.loginModel = loginModel;
	}
	public UserDAO getUserDAO() {
		return userDAO;
	}
	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
	}
	public UserModel getUserModel() {
		return userModel;
	}
	public void setUserModel(UserModel userModel) {
		this.userModel = userModel;
	}

	public String getRet() {
		return ret;
	}

	public void setRet(String ret) {
		this.ret = ret;
	}
}
