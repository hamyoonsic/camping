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

import dao.MarketDao;
import vo.CarpoolVo;
import vo.MarketVo;
import vo.MemberVo;

@Controller
public class MarketController {
	
	@Autowired
	ServletContext applicaton;
	
	@Autowired
	HttpServletRequest request;
	
	@Autowired
	HttpSession session;
	
	
	MarketDao market_dao;

	public void setMarket_dao(MarketDao market_dao) {
		this.market_dao = market_dao;
	}
	
	@RequestMapping("/homepage/market.do")
	public String market(Model model) {
		
		int m_idx = 0;
		MemberVo user = (MemberVo) session.getAttribute("user");
		
		if(user!=null)m_idx=user.getMem_idx();
		
		List<MarketVo> list1 = market_dao.selectList(m_idx);
		
		model.addAttribute("list1",list1);
		
		return "homepage/carpool_market";
	}
	
	
	//전체조회
		@RequestMapping("/board/market_list.do")
		public String list (Model model) {
		
		int m_idx = 0;
		MemberVo user = (MemberVo) session.getAttribute("user");
		
		if(user!=null)m_idx=user.getMem_idx();
		
		List<MarketVo> list1 = market_dao.selectList(m_idx);
		
		model.addAttribute("list1",list1);
		
		return "board/market_board";
		}
	
		@ResponseBody
		@RequestMapping(value ="/market_insertlike.do", method = RequestMethod.POST)
		public Map market_insertlike(@RequestParam int mem_idx,int market_idx,Model model,MarketVo vo) {
			
			Map map = new HashMap();
			map.put("m_idx", mem_idx);
			map.put("market_idx", market_idx);
		
			int res = market_dao.market_insertlike(vo);
			
			return map;
		}
		
		@ResponseBody
		@RequestMapping(value ="/market_deletelike.do", method = RequestMethod.POST)
		public int market_deletelike(@RequestParam int mem_idx,int market_idx,Model model,MarketVo vo) {
			
			Map map = new HashMap();
			map.put("m_idx", mem_idx);
			map.put("market_idx", market_idx);
		
			int res = market_dao.market_deletelike(vo);
			
			return 1;
		}
	
	
	
}