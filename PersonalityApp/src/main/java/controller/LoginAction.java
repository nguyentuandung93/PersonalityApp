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

	public String login() {
		session = getSession();
		String login_flg = (String) session.get("login_flg");
		if (session != null && login_flg != null && login_flg == "1") {
			int user_id = (Integer) session.get("user_id");
			userModel.setId(user_id);
			userModel = userDAO.selectUser(userModel);
			return SUCCESS;
		} else {
			if (loginModel.getUsername() != null) {
				if (loginDAO.checkUser(loginModel) == true) {
					userModel = userDAO.selectUser(loginModel.getUsername(), loginModel.getPassword());
					session.put("user_id", userModel.getId());
					session.put("username", loginModel.getUsername());
					session.put("image_real_name", userModel.getImage_real_name());
		        	session.put("login_flg", "1");
					return SUCCESS;
				} else {
					return ERROR;
				}
			} else {
				return INPUT;
			}
		}
	}
	
//	public String check_login() {
//		if (loginDAO.checkUser(loginModel) == true) {
//			int user_id = userDAO.getUserId(loginModel.getUsername(), loginModel.getPassword());
//			session.put("user_id", user_id);
//        	session.put("logined", "1");
//			return SUCCESS;
//		} else {
//			return ERROR;
//		}
//	}
	
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

//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		HttpSession session = request.getSession(false);
//		UserModel userModel = (session != null) ? (UserModel)session.getAttribute("userModel") : null;
//		if (userModel == null) {  
//			request.getRequestDispatcher("login/login.jsp").forward(request, response);
//	    } else { 
//	    	response.sendRedirect(request.getContextPath() + "/main");
//	    } 
//	}
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		String username = request.getParameter("username");
//		String password = request.getParameter("password");
//		
//		UserModel userModel = new UserModel();
//		userModel.setUsername(username);
//		userModel.setPassword(password);
//
//		int id = userDao.getUserId(userModel);
//		if (id > 0) {
//			userModel.setId(id);
//			userModel = userDao.getUserInfo(userModel);
//			if (userModel.getThis_login() == null) {
//				userModel.setLast_login(CommonController.getNow());
//			} else {
//				userModel.setLast_login(userModel.getThis_login());
//			}
//			userModel.setThis_login(CommonController.getNow());
//			userDao.updateUserLogin(userModel);
//			HttpSession session = request.getSession(false);
//			if (session == null) {
//				session = request.getSession(true);
//			}
//			session.setAttribute("userModel", userModel);
//			response.sendRedirect(request.getContextPath() + "/main");
//		} else {
//			request.setAttribute("msg", "ログインできませんでした。");
//			request.getRequestDispatcher("login/fail.jsp").forward(request, response);
//		}
//	}

}
