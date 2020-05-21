package controller;

import java.util.ArrayList;
import java.util.List;
import com.opensymphony.xwork2.ActionSupport;
import dao.DiaryDAO;
import dao.DiaryDAOImpl;
import model.DiaryModel;

public class DiaryAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	private DiaryModel diaryModel = new DiaryModel();
	private DiaryDAO diaryDAO = new DiaryDAOImpl();
	private List<DiaryModel> diaryList = new ArrayList<DiaryModel>();

	public String list() {
		int user_id = 1;
		this.diaryList = diaryDAO.listDiary(user_id);
		return "success";
	}

	public String add_form() {
		int user_id = 1;
		diaryModel.setUser_id(user_id);
		return "success";
	}
	
	public String create() {
		diaryModel.setRegist_date(CommonController.getNow());
		if (diaryDAO.createDiary(diaryModel) > 0) {
			return "success";
		} else {
			return "error";
		}
	}
	
	public String edit_form() {
		diaryModel = diaryDAO.selectDiary(diaryModel);
		return "success";
	}
	public String update() {
		diaryModel.setUpdate_date(CommonController.getNow());
		if (diaryDAO.updateDiary(diaryModel) > 0) {
			return "success";
		} else {
			return "error";
		}
	}
	public String delete() {
		if (diaryDAO.deleteDiary(diaryModel) > 0) {
			return "success";
		} else {
			return "error";
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
}
