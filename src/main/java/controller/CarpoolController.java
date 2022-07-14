package controller;

import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.CarpoolDao;
import vo.CarpoolVo;

@Controller
public class CarpoolController {
	
	@Autowired
	ServletContext applicaton;
	
	@Autowired
	HttpServletRequest request;
	
	@Autowired
	HttpSession session;
	
	
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
	
	@RequestMapping("/")
	public String main(Model model) {
		
		List<CarpoolVo> list = carpool_dao.selectList();
		
		model.addAttribute("list",list);
		
		return "homepage/main";
	}
	
	@RequestMapping("/homepage/carpool.do")
	public String carpool(Model model) {
		
		List<CarpoolVo> list = carpool_dao.selectList();
		
		model.addAttribute("list",list);
		
		return "homepage/carpool_market";
	}
	
	/*
	 * @ResponseBody
	 * 
	 * @RequestMapping(value ="/carpool_insertlike.do", method = RequestMethod.POST)
	 * public Map carpool_insertlike(@RequestParam Map map) {
	 * 
	 * Map map = new Map;
	 * 
	 * int res = carpool_dao.carpool_insertlike(map);
	 * 
	 * return "redirect:carpool_list.do"; }
	 */

}
