package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import dao.CarpoolDao;
import vo.CarpoolVo;

@Controller
public class CarpoolController {
	
	CarpoolDao carpool_dao;

	public void setCarpool_dao(CarpoolDao carpool_dao) {
		this.carpool_dao = carpool_dao;
	}
	
	@RequestMapping("/board/carpool_list.do")
	public String list(Model model) {
		
		List<CarpoolVo> list = carpool_dao.selectList();
		
		model.addAttribute("list",list);
		
		return "board/carpool_board";
	}
	
	@RequestMapping("/homepage/main.do")
	public String main() {
		
		return "homepage/main";
	}
	
	
	
	 
	

}
