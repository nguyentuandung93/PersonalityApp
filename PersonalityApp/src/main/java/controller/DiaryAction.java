package controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;
import dao.DiaryDAO;
import dao.DiaryDAOImpl;
import model.DiaryModel;

public class DiaryAction extends ActionSupport implements SessionAware {
	private static final long serialVersionUID = 1L;
	private DiaryModel diaryModel = new DiaryModel();
	private DiaryDAO diaryDAO = new DiaryDAOImpl();
	private List<DiaryModel> diaryList = new ArrayList<DiaryModel>();
	
	private Map<String, Object> session;
	

	public String list() {
		session = getSession();
		String login_flg = (String) session.get("login_flg");
		if (session != null && login_flg != null && login_flg == "1") {
			int user_id = (Integer) session.get("user_id");
			this.diaryList = diaryDAO.listDiary(user_id);
			return SUCCESS;
		} else {
			return INPUT;
		}
	}

	public String add_form() {
		session = getSession();
		String login_flg = (String) session.get("login_flg");
		if (session != null && login_flg != null && login_flg == "1") {
			int user_id = (Integer) session.get("user_id");
			diaryModel.setUser_id(user_id);
			return SUCCESS;
		} else {
			return INPUT;
		}
	}
	
	public String create() {
		diaryModel.setRegist_date(CommonController.getNow());
		if (diaryDAO.createDiary(diaryModel) > 0) {
			return SUCCESS;
		} else {
			return ERROR;
		}
	}
	
	public String edit_form() {
		diaryModel = diaryDAO.selectDiary(diaryModel);
		return SUCCESS;
	}
	public String update() {
		diaryModel.setUpdate_date(CommonController.getNow());
		if (diaryDAO.updateDiary(diaryModel) > 0) {
			return SUCCESS;
		} else {
			return ERROR;
		}
	}
	public String delete() {
		if (diaryDAO.deleteDiary(diaryModel) > 0) {
			return SUCCESS;
		} else {
			return ERROR;
		}
	}
	
	public DiaryModel getDiaryModel() {
		return diaryModel;
	}
	public void setDiaryModel(DiaryModel diaryModel) {
		this.diaryModel = diaryModel;
	}
	public DiaryDAO getDiaryDAO() {
		return diaryDAO;
	}
	public void setDiaryDAO(DiaryDAO diaryDAO) {
		this.diaryDAO = diaryDAO;
	}
	public List<DiaryModel> getDiaryList() {
		return diaryList;
	}
	public void setDiaryList(List<DiaryModel> diaryList) {
		this.diaryList = diaryList;
	}
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
	public Map<String, Object> getSession() {
		return session;
	}
}
