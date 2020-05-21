package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import dao.UserDAO;
import dao.UserDAOImpl;
import model.UserModel;

public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDAO userDao;

	public void init() {
		userDao = new UserDAOImpl();
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession(false);
		UserModel userModel = (session != null) ? (UserModel)session.getAttribute("userModel") : null;
		if (userModel == null) {
			resp.sendRedirect(req.getContextPath() + "/login");
		} else {
			userModel = userDao.getUserInfo(userModel);
			req.setAttribute("userModel", userModel);
			req.getRequestDispatcher("/user/main.jsp").forward(req, resp);
		}
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		UserModel userModel = new UserModel();
		userModel.setId(Integer.parseInt(req.getParameter("user_id")));
		userModel.setUsername(req.getParameter("username"));
		userModel.setPassword(req.getParameter("password"));
		userModel.setName(req.getParameter("name"));
		userModel.setEmail(req.getParameter("email"));
		userModel.setUpdate_user_id(req.getParameter("user_id"));
		userModel.setUpdate_date(CommonController.getNow());
		userModel.setFacebook(req.getParameter("facebook"));
		userModel.setTwitter(req.getParameter("twitter"));
		userModel.setInstagram(req.getParameter("instagram"));
		
		boolean status = false;
		if (userDao.updateUserInfo(userModel) > 0) {
			HttpSession session = req.getSession(false);
			session.setAttribute("userModel", userModel);
			status = true;
		} else {
			status = false;
		}
		
		PrintWriter out = resp.getWriter();
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        Gson gson = new Gson();
        out.print(gson.toJson(status));
        System.out.println(status);
        out.flush();		
	}
}
