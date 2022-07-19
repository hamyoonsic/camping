package controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.GradeDao;
@Controller
@RequestMapping("/grade/")
public class GradeController {
	
	@Autowired
	HttpSession session;
	
	GradeDao grade_dao;

	public void setGrade_dao(GradeDao grade_dao) {
		this.grade_dao = grade_dao;
	}
	
	
	/*
	 * @RequestMapping("list.do") public String list(Model model) {
	 * 
	 * List<GradeVo>list = grade_dao.selectList(); model.addAttribute("list", list);
	 * 
	 * return "";
	 * 
	 * }
	 */
	
	
	

}
