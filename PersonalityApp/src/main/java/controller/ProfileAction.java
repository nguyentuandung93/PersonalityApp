package controller;

import java.io.File;
import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletContext;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;
import com.opensymphony.xwork2.ActionSupport;

import dao.UserDAO;
import dao.UserDAOImpl;
import model.UserModel;

public class ProfileAction extends ActionSupport implements SessionAware {
	private static final long serialVersionUID = 1L;
	private UserDAO userDAO = new UserDAOImpl();
	private UserModel userModel = new UserModel();
	private Map<String, Object> session;
	
	private File fileUpload;
    private String fileUploadContentType;
    private String fileUploadFileName;
    private String uploadUserPath;
	private String ret = "false";
	
	public ProfileAction() {
		ServletContext context = ServletActionContext.getServletContext();
		String uploadPath = context.getRealPath("/upload");
		File uploadDir = new File(uploadPath);
		String uploadTempPath = uploadPath + "/temp/"; 
		File uploadTempDir = new File(uploadTempPath);
		uploadUserPath = uploadPath + "/user/";
		File uploadUserDir = new File(uploadUserPath);
		
        if (!uploadDir.exists()) {
        	uploadDir.mkdir();
        }
        if (!uploadTempDir.exists()) {
        	uploadTempDir.mkdir();
        }
        if (!uploadUserDir.exists()) {
        	uploadUserDir.mkdir();
        }
	}
	
	public String profile() {
		session = getSession();
		String login_flg = (String) session.get("login_flg");
		if (session != null && login_flg != null && login_flg == "1") {
			int user_id = (Integer) session.get("user_id");
			userModel.setId(user_id);
			userModel = userDAO.selectUser(userModel);
			return SUCCESS;
		} else {
			return INPUT;
		}
	}
	
	public String update() {
		userModel.setUpdate_date(CommonController.getNow());
		userModel.setUpdate_user_id(userModel.getId());
		if (fileUpload == null) {
			if (userDAO.updateUser(userModel) > 0) {
				session = getSession();
				session.put("username", userModel.getUsername());
				ret = "true";
			}
		} else {
			int i = fileUploadFileName.lastIndexOf('.');
            String image_real_name = fileUploadFileName.substring(0, i) + "_" + CommonController.getNow("yyyyMMddHHmmss") + "." + fileUploadFileName.substring(i + 1);
			File desFile = new File(uploadUserPath, image_real_name);
			try {
                FileUtils.copyFile(fileUpload, desFile);
                userModel.setImage_real_name(image_real_name);
                userModel.setImage_name(fileUploadFileName);
                if (userDAO.updateUser(userModel, "image") > 0) {
    				session = getSession();
    				session.put("username", userModel.getUsername());
    				session.put("image_real_name", userModel.getImage_real_name());
    				ret = "true";
    			}
            } catch (IOException ex) {
                System.out.println("「" + fileUploadFileName + "」ファイルのコピーが出来ませんでした。");
                ex.printStackTrace();
            }
		}
		return SUCCESS;
	}
	public File getFileUpload() {
		return fileUpload;
	}

	public void setFileUpload(File fileUpload) {
		this.fileUpload = fileUpload;
	}

	public String getFileUploadContentType() {
		return fileUploadContentType;
	}

	public void setFileUploadContentType(String fileUploadContentType) {
		this.fileUploadContentType = fileUploadContentType;
	}

	public String getFileUploadFileName() {
		return fileUploadFileName;
	}

	public void setFileUploadFileName(String fileUploadFileName) {
		this.fileUploadFileName = fileUploadFileName;
	}
	public String getRet() {
		return ret;
	}

	public void setRet(String ret) {
		this.ret = ret;
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
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
	public Map<String, Object> getSession() {
		return session;
	}
}
