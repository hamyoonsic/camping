package controller;

import java.util.HashMap;
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
import dao.MarketDao;
import vo.CarpoolVo;
import vo.MarketVo;
import vo.MemberVo;

@Controller
public class CarpoolController {
	
	@Autowired
	ServletContext applicaton;
	
	@Autowired
	HttpServletRequest request;
	
	@Autowired
	HttpSession session;
	
	CarpoolDao carpool_dao;
	
	MarketDao market_dao;

	public void setMarket_dao(MarketDao market_dao) {
		this.market_dao = market_dao;
	}

	public void setCarpool_dao(CarpoolDao carpool_dao) {
		this.carpool_dao = carpool_dao;
	}
	
	@RequestMapping("/board/carpool_list.do")
	public String list(Model model) {
		
		int m_idx = 0;
		MemberVo user = (MemberVo) session.getAttribute("user");
		
		if(user!=null)m_idx=user.getMem_idx();
		
		List<CarpoolVo> list = carpool_dao.selectList(m_idx);
		
		model.addAttribute("list",list);
		
		return "board/carpool_board";
	}
	
	@RequestMapping("/")
	public String main(Model model) {
		
		int m_idx = 0;
		MemberVo user = (MemberVo) session.getAttribute("user");
		
		if(user!=null)m_idx=user.getMem_idx();
		
		List<CarpoolVo> list = carpool_dao.selectList(m_idx);
		List<MarketVo> list1 = market_dao.selectList(m_idx);
		
		model.addAttribute("list",list);
		model.addAttribute("list1",list1);
		
		return "homepage/main";
	}
	
	@RequestMapping("/homepage/carpool.do")
	public String carpool(Model model) {
		
		int m_idx = 0;
		MemberVo user = (MemberVo) session.getAttribute("user");
		
		if(user!=null)m_idx=user.getMem_idx();
		
		List<CarpoolVo> list = carpool_dao.selectList(m_idx);
		
		model.addAttribute("list",list);
		
		return "homepage/carpool_market";
	}
	
	@ResponseBody
	@RequestMapping(value ="/carpool_insertlike.do", method = RequestMethod.POST)
	public Map carpool_insertlike(@RequestParam int mem_idx,int carpool_idx,Model model,CarpoolVo vo) {
		
		Map map = new HashMap();
		map.put("m_idx", mem_idx);
		map.put("carpool_idx", carpool_idx);
	
		int res = carpool_dao.carpool_insertlike(vo);
		
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value ="/carpool_deletelike.do", method = RequestMethod.POST)
	public int carpool_deletelike(@RequestParam int mem_idx,int carpool_idx,Model model,CarpoolVo vo) {
		
		Map map = new HashMap();
		map.put("m_idx", mem_idx);
		map.put("carpool_idx", carpool_idx);
	
		int res = carpool_dao.carpool_deletelike(vo);
		
		return 1;
	}

}
