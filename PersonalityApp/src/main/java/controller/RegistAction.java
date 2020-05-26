package controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletContext;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.interceptor.ValidationAware;

import dao.LoginDAO;
import dao.LoginDAOImpl;
import model.LoginModel;

public class RegistAction extends ActionSupport implements ValidationAware {
	private static final long serialVersionUID = 1L;
	private LoginDAO loginDAO = new LoginDAOImpl();
	private LoginModel loginModel = new LoginModel();
	
	private File fileUpload;
    private String fileUploadContentType;
    private String fileUploadFileName;
    
	private String uploadUserPath;
	public RegistAction() {
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

	public String regist() {
		if (loginModel.getUsername() != null) {
			if (!loginDAO.issetUsername(loginModel.getUsername())) {
				int i = fileUploadFileName.lastIndexOf('.');
	            String image_real_name = fileUploadFileName.substring(0, i) + "_" + CommonController.getNow("yyyyMMddHHmmss") + "." + fileUploadFileName.substring(i + 1);
				File desFile = new File(uploadUserPath, image_real_name);
				try {
	                FileUtils.copyFile(fileUpload, desFile);
	                loginModel.setImage_real_name(image_real_name);
	                loginModel.setImage_name(fileUploadFileName);
	                loginModel.setRegist_date(CommonController.getNow());
	                if (loginDAO.registUser(loginModel) > 0) {
	                	FileUtils.forceDelete(fileUpload);
		                return SUCCESS;
	                } else {
	                	return ERROR;
	                }
	            } catch (IOException ex) {
	                System.out.println("「" + fileUploadFileName + "」ファイルのコピーが出来ませんでした。");
	                ex.printStackTrace();
	                return ERROR;
	            }
			} else {
				return ERROR;
			}
		} else {
			return INPUT;
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
}
