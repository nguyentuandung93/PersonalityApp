package controller;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

public class LogoutAction extends ActionSupport implements SessionAware  {
	private static final long serialVersionUID = 1L;
	private Map<String, Object> session;
	
	public String logout() {
		this.session = getSession();
		session.remove("user_id");
		session.remove("username");
		session.remove("image_real_name");
		session.remove("login_flg");
		return "success";
	}
//	@Override
//	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		HttpSession session = req.getSession();
//		if (session != null) {
//			session.invalidate();
//		}
//		resp.sendRedirect(req.getContextPath() + "/login");
//	}

	public Map<String, Object> getSession() {
		return session;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
}
