package controller;

import com.opensymphony.xwork2.ActionSupport;
import dao.LoginDAO;
import dao.LoginDAOImpl;
import model.LoginModel;

public class LoginAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	private LoginDAO loginDAO = new LoginDAOImpl();
	private LoginModel loginModel = new LoginModel();

	public String login() {
		return "success";
	}
	public String check_login() {
		if (loginDAO.checkUser(loginModel) == true) {
			return "success";
		} else {
			return "error";
		}
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
