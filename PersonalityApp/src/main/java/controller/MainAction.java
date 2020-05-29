package controller;

import java.util.Map;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;
import com.opensymphony.xwork2.ActionSupport;

public class MainAction extends ActionSupport implements SessionAware {
	private static final long serialVersionUID = 1L;
	private Map<String, Object> session;
	private String imagePath = "";

	public String main() {
		session = getSession();
		String login_flg = (String) session.get("login_flg");
		if (session != null && login_flg != null && login_flg == "1") {
			imagePath = ServletActionContext.getServletContext().getRealPath("/upload/user");
			return SUCCESS;
		} else {
			return INPUT;
		}
	}
		
	public Map<String, Object> getSession() {
		return session;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
	
	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
}
