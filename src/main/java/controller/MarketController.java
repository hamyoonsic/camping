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
		
		//세션에 저장되어있는 Show정보를 삭제한다.
		session.removeAttribute("show");
		
		return "board/market_board";
		}
	
		@ResponseBody
		@RequestMapping(value ="/market_insertlike.do", method = RequestMethod.POST)
		public int market_insertlike(MarketVo vo) {
	
			int res = market_dao.market_insertlike(vo);
			
			return 1;
		}
		
		@ResponseBody
		@RequestMapping(value ="/market_deletelike.do", method = RequestMethod.POST)
		public int market_deletelike(MarketVo vo) {
			
			int res = market_dao.market_deletelike(vo);
			
			return 1;
		}
	
		@RequestMapping("board/market_view.do")
		public String market_view(int market_idx,Model model) {
			
			//b_idx에 해당되는 게시물 정보 얻어온다 
			MarketVo vo = market_dao.selectOne(market_idx);
			
			//게시물을 안봤으면 조회수 증가. 게시물 본지 안본지는 세션에 쇼라는 정보 넣어.
			if(session.getAttribute("show")==null) {
				
				//조회수 증가
				int res = market_dao.update_readhit(market_idx);
				
				//Show정보를 세션에 넣는다
				session.setAttribute("show", true);
				
			}
			//결과적으로 request binding
			model.addAttribute("vo", vo);
			return "board/market_view";
		}
	
}