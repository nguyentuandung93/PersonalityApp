package controller;

import java.io.File;
import java.io.IOException;
import java.util.Base64;
import java.util.List;

import javax.activation.MimetypesFileTypeMap;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FileUtils;

import dao.UserDAO;
import dao.UserDAOImpl;
import model.UserModel;

public class RegistController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDAO userDao;
	private String uploadPath = "";
	private String uploadTempPath = "";
	private String uploadUserPath = "";
	public void init() {
		userDao = new UserDAOImpl();
		uploadPath = getServletContext().getRealPath(getServletContext().getInitParameter("upload-path"));
		uploadTempPath = uploadPath + "/" + "temp";
		uploadUserPath = uploadPath + "/"+ "user";
		File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
        	uploadDir.mkdir();
        }
        File uploadTempDir = new File(uploadTempPath);
        if (!uploadTempDir.exists()) {
        	uploadTempDir.mkdir();
        }
        File uploadUserDir = new File(uploadUserPath);
        if (!uploadUserDir.exists()) {
        	uploadUserDir.mkdir();
        }
	}
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		request.getRequestDispatcher("register/register.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String msg = "";
		boolean status = true;
		
		String userName = "";
		String passWord = "";
		String fileName = "";
		String fileRealName = "";
		try {
	        List<FileItem> fileItems = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
	        if (fileItems != null && fileItems.size() > 0) {
	        	for (FileItem item : fileItems) {
		            if (item.isFormField()) { // 繝ｦ繝ｼ繧ｶ繝ｼ蜷阪�√ヱ繧ｹ繝ｯ繝ｼ繝�
		            	if (item.getFieldName().equals("username")) {
		                	userName = item.getString();
		                }
						if (item.getFieldName().equals("password")) {
							passWord = item.getString();           	
		                }
		            } else { // 繝輔ぃ繧､繝ｫ
		            	fileName = new File(item.getName()).getName();
		                // 繝輔ぃ繧､繝ｫ繧ｿ繧､繝励ｒ繝√ぉ繝�繧ｯ
		                String mimetype= new MimetypesFileTypeMap().getContentType(new File(fileName));
		                String type = mimetype.split("/")[0];
		                if (type == null || !type.equals("image")) {
		                	status = false;
		        	    	msg = "逕ｻ蜒上ヵ繧｡繧､繝ｫ縺ｧ縺ｯ縺ゅｊ縺ｾ縺帙ｓ縲�";
		                } else {
		                	fileName = CommonController.getNow("yyyyMMddHHmmss") + "_" + fileName;
		                	int i = fileName.lastIndexOf('.');
		                    String fileE = fileName.substring(i+1);
		                    String fileN = fileName.substring(0, i);
			                fileRealName = Base64.getUrlEncoder().encodeToString(fileN.getBytes());
			                fileRealName = fileRealName + '.' + fileE;
			                item.write(new File(uploadTempPath + "/" + fileRealName));
		                }
		            }
		        }
	        }
	    } catch (Exception e) {
	    	status = false;
	    	msg = e.toString() + "縺ｮ繧ｨ繝ｩ繝ｼ縺檎匱逕溘＠縺ｾ縺励◆縲�";
	    }
		if (status) {
			try {
				if (userDao.issetUser(userName)) {
					status = false;
			    	msg = "縺薙�ｮ繝ｦ繝ｼ繧ｶ繝ｼ蜷阪′譌｢縺ｫ逋ｻ骭ｲ縺励∪縺励◆縲�";
				} else {
					UserModel userModel = new UserModel();
					userModel.setUsername(userName);
					userModel.setPassword(passWord);
					userModel.setImage_real_name(fileRealName);
					userModel.setImage_name(fileName);
					userModel.setRegist_date(CommonController.getNow());
					if (userDao.addUser(userModel) <= 0) {
						status = false;
				    	msg = "DB縺ｫ逋ｻ骭ｲ縺ｧ縺阪∪縺帙ｓ縺ｧ縺励◆縲�";
					} else {
						//縲�繝輔ぃ繧､繝ｫ繧堤ｧｻ蜍輔☆繧�
						File source = new File(uploadTempPath + "/" + fileRealName);
						File dest = new File(uploadUserPath + "/" + fileRealName);
						FileUtils.copyFile(source, dest);
					    source.delete();
					}
				}
			} catch (Exception e) {
				status = false;
		    	msg = e.toString() + "縺ｮ繧ｨ繝ｩ繝ｼ縺檎匱逕溘＠縺ｾ縺励◆縲�";
			}
		}
		if (status) {
			response.setContentType("text/html");
			request.getRequestDispatcher("register/success.jsp").forward(request, response);
		} else {
			response.setContentType("text/html");
			request.setAttribute("msg", msg);
			request.getRequestDispatcher("register/fail.jsp").forward(request, response);
		}
	}
}
